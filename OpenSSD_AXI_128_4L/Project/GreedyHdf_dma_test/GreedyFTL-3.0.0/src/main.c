//////////////////////////////////////////////////////////////////////////////////
// main.c for Cosmos+ OpenSSD
// Copyright (c) 2016 Hanyang University ENC Lab.
// Contributed by Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//				  Youngjin Jo <yjjo@enc.hanyang.ac.kr>
//				  Sangjin Lee <sjlee@enc.hanyang.ac.kr>
//				  Jaewook Kwak <jwkwak@enc.hanyang.ac.kr>
//				  Kibin Park <kbpark@enc.hanyang.ac.kr>
//
// This file is part of Cosmos+ OpenSSD.
//
// Cosmos+ OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos+ OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos+ OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Sangjin Lee <sjlee@enc.hanyang.ac.kr>
//			 Jaewook Kwak <jwkwak@enc.hanyang.ac.kr>
//			 Kibin Park <kbpark@enc.hanyang.ac.kr>
//
// Project Name: Cosmos+ OpenSSD
// Design Name: Cosmos+ Firmware
// Module Name: Main
// File Name: main.c
//
// Version: v1.0.2
//
// Description:
//   - initializes caches, MMU, exception handler
//   - calls nvme_main function
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.2
//   - An address region (0x0020_0000 ~ 0x179F_FFFF) is used to uncached & nonbuffered region
//   - An address region (0x1800_0000 ~ 0x3FFF_FFFF) is used to cached & buffered region
//
// * v1.0.1
//   - Paging table setting is modified for QSPI or SD card boot mode
//     * An address region (0x0010_0000 ~ 0x001F_FFFF) is used to place code, data, heap and stack sections
//     * An address region (0x0010_0000 ~ 0x001F_FFFF) is setted a cached&bufferd region
//
// * v1.0.0
//   - First draft
//////////////////////////////////////////////////////////////////////////////////



#include "xil_cache.h"
#include "xil_exception.h"
#include "xil_mmu.h"
#include "xparameters_ps.h"
#include "xscugic_hw.h"
#include "xscugic.h"
#include "xil_printf.h"
#include "nvme/debug.h"

#include "nvme/nvme.h"
#include "nvme/nvme_main.h"
#include "nvme/host_lld.h"

u8 MemSpace[80*1024*1024] __attribute__ ((aligned (16)));
//char MemSpace[160*1024*1024];
#include "ftl_config.h"
#include "xaxidma.h"
#include "xparameters.h"
XAxiDma *DMAInstance;

XScuGic GicInstance;
#define MAX_PKT_LEN		0x40

int main()
{
	unsigned int u;

	XAxiDma_Config *DMAConfig;
	int transfer,status,i;
	u8 Value,diff;
	u8 *TxBufferPtr;
	u8 *RxBufferPtr;
	TxBufferPtr = (u8 *)&MemSpace[0];
	RxBufferPtr = (u8 *)&MemSpace[100000];
//	TxBufferPtr = (u8 *)(XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x00100000);
//    RxBufferPtr = (u8 *)(XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x00300000);
	XScuGic_Config *IntcConfig;
	xil_printf("address %X \r\n",TxBufferPtr);
	Xil_ICacheDisable();
	Xil_DCacheDisable();
	Xil_DisableMMU();

	// Paging table set
	#define MB (1024*1024)
	for (u = 0; u < 4096; u++)
	{
//		if (u < 0x2)
		if (u < 0x62) //96+2MB totali invece di 2
//		if (u < 0xA2) //160+2MB totali invece di 2
			Xil_SetTlbAttributes(u * MB, 0xC1E); // cached & buffered
		else if (u < 0x180)
			Xil_SetTlbAttributes(u * MB, 0xC12); // uncached & nonbuffered
		else if (u < 0x400)
			Xil_SetTlbAttributes(u * MB, 0xC1E); // cached & buffered
		else
			Xil_SetTlbAttributes(u * MB, 0xC12); // uncached & nonbuffered
	}

	Xil_EnableMMU();
	Xil_ICacheEnable();
	Xil_DCacheEnable();
	xil_printf("[!] MMU has been enabled.\r\n");


	xil_printf("\r\n Hello COSMOS+ OpenSSD !!! \r\n");


	Xil_ExceptionInit();

	IntcConfig = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	XScuGic_CfgInitialize(&GicInstance, IntcConfig, IntcConfig->CpuBaseAddress);
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
								(Xil_ExceptionHandler)XScuGic_InterruptHandler,
								&GicInstance);
//	ALERT: SCUGIC CONNECT HAS CONFLICTS WITH DMA

	XScuGic_Connect(&GicInstance, 61,
					(Xil_ExceptionHandler)dev_irq_handler,
					(void *)0);

	XScuGic_Enable(&GicInstance, 61);

	// Enable interrupts in the Processor.

	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
	Xil_ExceptionEnable();

	dev_irq_init();

	// Get pointer to DMA configuration
	DMAConfig = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if(!DMAConfig)
	{
	    print("Error looking for AXI DMA config \n\r");
	}
	// Initialize the DMA handle
	status = XAxiDma_CfgInitialize(DMAInstance, DMAConfig);
	if (status != XST_SUCCESS)
	{
		print("Error AXI DMA handle \n\r");
	}
	if(XAxiDma_HasSg(DMAInstance))
	{
		xil_printf("Device configured as SG mode \r\n");
	}
	//disable the interrupts, polling mode
	XAxiDma_IntrDisable(DMAInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(DMAInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	Value = 0xA;
	for(i = 0; i < MAX_PKT_LEN; i ++)
	{
		TxBufferPtr[i] = Value;
		Value = (Value + 1) & 0xFF;
	}

	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);
	#ifdef __aarch64__
		Xil_DCacheFlushRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	#endif

	xil_printf("Press 'X' to re-make the bad block table.\r\n");
	if (inbyte() == 'X')
	{	}

	transfer = XAxiDma_SimpleTransfer(DMAInstance,(UINTPTR) RxBufferPtr, MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
//	if (transfer1 != XST_SUCCESS)
//	{
		xil_printf("transfer1 = %d \r\n",transfer);
//	}
	transfer = XAxiDma_SimpleTransfer(DMAInstance,(UINTPTR) TxBufferPtr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
//	if (transfer != XST_SUCCESS)
//	{
		xil_printf("transfer2 = %d \r\n",transfer);
//	}
	while ((XAxiDma_Busy(DMAInstance,XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(DMAInstance,XAXIDMA_DMA_TO_DEVICE)))
	{
			/* Wait */
	}
	/* Invalidate the DestBuffer before receiving the data, in case the Data Cache is enabled */
	#ifndef __aarch64__
		Xil_DCacheInvalidateRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	#endif

	for(i=0;i<MAX_PKT_LEN;i++)
	{
		diff= RxBufferPtr[i] - TxBufferPtr[i];
		if (diff!=0)
		{
			xil_printf("diff[%d]= %x,Memspace[%d]:%x,Memspace[%d]:%x \r\n",i,diff,100+i,RxBufferPtr[i],i,TxBufferPtr[i]);
		}
	}

	xil_printf("done\r\n");

	return 0;
}
