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
XAxiDma DMAInstance;

XScuGic GicInstance;
//#define MAX_PKT_LEN		16384
#define MAX_PKT_LEN		64	//for crypto

//REVERSE FUNCTION
unsigned char reverse(unsigned char b)
{
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

int main()
{

	u32 *configACC;
	configACC = (u32 *) XPAR_ACCELERATOR_0_S00_AXI_BASEADDR;			//address 0
	u32 *parameterACC1 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x4);	//address 1 = address 0 + 32bit
	u32 *parameterACC2 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x8);	//address 2 = address 0 + 2*32bit
	u32 *parameterACC3 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0xC);	//address 3 = address 0 + 3*32bit
	u32 *parameterACC4 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x10);	//address 4 = address 0 + 4*32bit
	u32 *parameterACC5 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x14);	//address 5 = address 0 + 5*32bit
	u32 *parameterACC6 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x18);	//address 6 = address 0 + 6*32bit
	u32 *parameterACC7 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x1C);	//address 7 = address 0 + 7*32bit
	u32 *parameterACC8 = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x20);	//address 8 = address 0 + 8*32bit
	u32 *parameterACCa = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x28);	//address a = address 0 + A*32bit
	u32 *parameterACCb = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x2C);	//address b = address 0 + B*32bit
	u32 *parameterACCc = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x30);	//address c = address 0 + C*32bit
	u32 *parameterACCd = (u32 *)(XPAR_ACCELERATOR_0_S00_AXI_BASEADDR + 0x34);	//address d = address 0 + D*32bit
	u32 config = 0x0;

	unsigned int u;
	XScuGic_Config *IntcConfig;
	XAxiDma_Config *DMAConfig;
	int transfer,status,i;
	int j = 0;
	u8 Value,diff;
	u8 *TxBufferPtr;
	u8 *RxBufferPtr;
	u8 *TestBufferPtr;
	TxBufferPtr = (u8 *)&MemSpace[0];
	RxBufferPtr = (u8 *)&MemSpace[100000];
	TestBufferPtr = (u8 *)&MemSpace[200000];

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

	XScuGic_Connect(&GicInstance, 61,
					(Xil_ExceptionHandler)dev_irq_handler,
					(void *)0);

	XScuGic_Enable(&GicInstance, 61);

	// Enable interrupts in the Processor.
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
	Xil_ExceptionEnable();

	// Get pointer to DMA configuration
	DMAConfig = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if(!DMAConfig)
	{
	    print("Error looking for AXI DMA config \n\r");
	}
	// Initialize the DMA handle
	status = XAxiDma_CfgInitialize(&DMAInstance, DMAConfig);
	if (status != XST_SUCCESS)
	{
		print("Error AXI DMA handle \n\r");
	}
	if(XAxiDma_HasSg(&DMAInstance)){
		xil_printf("Device configured as SG mode \r\n");
	}
	//disable the interrupts, polling mode
	XAxiDma_IntrDisable(&DMAInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&DMAInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	xil_printf("Configuration - Press 'X' to start \r\n");
		if (inbyte() == 'X')
		{	}
	//AXI ACCELERATOR CONFIGURATION
		//TEST VECTORS

	    uint8_t in_128[64]  = { 0x87, 0x4d, 0x61, 0x91, 0xb6, 0x20, 0xe3, 0x26, 0x1b, 0xef, 0x68, 0x64, 0x99, 0x0d, 0xb6, 0xce,
	                        0x98, 0x06, 0xf6, 0x6b, 0x79, 0x70, 0xfd, 0xff, 0x86, 0x17, 0x18, 0x7b, 0xb9, 0xff, 0xfd, 0xff,
	                        0x5a, 0xe4, 0xdf, 0x3e, 0xdb, 0xd5, 0xd3, 0x5e, 0x5b, 0x4f, 0x09, 0x02, 0x0d, 0xb0, 0x3e, 0xab,
	                        0x1e, 0x03, 0x1d, 0xda, 0x2f, 0xbe, 0x03, 0xd1, 0x79, 0x21, 0x70, 0xa0, 0xf3, 0x00, 0x9c, 0xee };

	    uint8_t out[64] = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
	                        0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
	                        0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, 0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
	                        0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, 0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10 };

	    uint8_t in_256[64]  = { 0x60, 0x1e, 0xc3, 0x13, 0x77, 0x57, 0x89, 0xa5, 0xb7, 0xa7, 0xf5, 0x04, 0xbb, 0xf3, 0xd2, 0x28,
	                        0xf4, 0x43, 0xe3, 0xca, 0x4d, 0x62, 0xb5, 0x9a, 0xca, 0x84, 0xe9, 0x90, 0xca, 0xca, 0xf5, 0xc5,
	                        0x2b, 0x09, 0x30, 0xda, 0xa2, 0x3d, 0xe9, 0x4c, 0xe8, 0x70, 0x17, 0xba, 0x2d, 0x84, 0x98, 0x8d,
	                        0xdf, 0xc9, 0xc5, 0x8d, 0xb6, 0x7a, 0xad, 0xa6, 0x13, 0xc2, 0xdd, 0x08, 0x45, 0x79, 0x41, 0xa6 };


	*configACC = 0x08;			//0/1 = adder		2 = crypto128		8 = crypto256
	config = *configACC;

//	*parameterACC1  = 0x0;

	if(config == 0x2)
	{
		*parameterACC1  = 0x09cf4f3c;		//key lower bits	(altrimenti (iv[0]<<24)|(iv[1]<<16)|(iv[2]<<8)|iv[3]...troppa fatica)
		*parameterACC2  = 0xabf71588;
		*parameterACC3  = 0x28aed2a6;
		*parameterACC4  = 0x2b7e1516;		//key higher bits for 128key

		*parameterACCa  = 0xfcfdfeff;		//IV
		*parameterACCb  = 0xf8f9fafb;
		*parameterACCc  = 0xf4f5f6f7;
		*parameterACCd  = 0xf0f1f2f3;

		u32 param1 = *parameterACC1;
		u32 param2 = *parameterACC2;
		u32 param3 = *parameterACC3;
		u32 param4 = *parameterACC4;

		u32 parama = *parameterACCa;
		u32 paramb = *parameterACCb;
		u32 paramc = *parameterACCc;
		u32 paramd = *parameterACCd;
		xil_printf("Configuration: %02x; Key 128bit = %02x-%02x-%02x-%02x; IV: %02x-%02x-%02x-%02x \r\n",config, param4,param3,param2,param1, paramd,paramc,paramb,parama);
	}
	else if(config == 0x8)
	{
		*parameterACC1  = 0x0914dff4;		//key lower bits	(altrimenti (iv[0]<<24)|(iv[1]<<16)|(iv[2]<<8)|iv[3]...troppa fatica)
		*parameterACC2  = 0x2d9810a3;
		*parameterACC3  = 0x3b6108d7;
		*parameterACC4  = 0x1f352c07;
		*parameterACC5  = 0x857d7781;
		*parameterACC6  = 0x2b73aef0;
		*parameterACC7  = 0x15ca71be;
		*parameterACC8  = 0x603deb10;		//key higher bits for 256key

		*parameterACCa  = 0xfcfdfeff;		//IV
		*parameterACCb  = 0xf8f9fafb;
		*parameterACCc  = 0xf4f5f6f7;
		*parameterACCd  = 0xf0f1f2f3;

		u32 param1 = *parameterACC1;
		u32 param2 = *parameterACC2;
		u32 param3 = *parameterACC3;
		u32 param4 = *parameterACC4;
		u32 param5 = *parameterACC5;
		u32 param6 = *parameterACC6;
		u32 param7 = *parameterACC7;
		u32 param8 = *parameterACC8;

		u32 parama = *parameterACCa;
		u32 paramb = *parameterACCb;
		u32 paramc = *parameterACCc;
		u32 paramd = *parameterACCd;

		xil_printf("Configuration: %02x; Key 256bit = -%02x-%02x-%002x-%002x-%002x-%002x-%002x-%002x; IV: %d-%002x-%002x-%002x \r\n",config, param8,param7,param6,param5,param4,param3,param2,param1, paramd,paramc,paramb,parama);
	}

	//END CONFIGURATION
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//START TRANSMISSION

	//ASSIGNATION TX

//	Value = 0xD;
//	for(i = 0; i < MAX_PKT_LEN; i ++)			//config = 0/1 (Adder)
//	{
//		TxBufferPtr[i] = Value;
//		Value = (Value + 1) & 0xFF;
//	}

	for(i = 0; i < MAX_PKT_LEN; i ++)
	{
		if(config == 2)
		{
			TxBufferPtr[i] = reverse(in_128[i]);
		}
		else if(config == 8)
		{
			TxBufferPtr[i] = reverse(in_256[i]);
		}
	}

	for(i = 0; i < MAX_PKT_LEN; i ++)
	{
		if(config == 2 || config == 8)
		{
			TestBufferPtr[i] = reverse(out[i]);
		}
	}

	Xil_DCacheFlushRange((UINTPTR) TxBufferPtr, MAX_PKT_LEN);
	Xil_DCacheFlushRange((UINTPTR) TestBufferPtr, MAX_PKT_LEN);
	#ifdef __aarch64__
		Xil_DCacheFlushRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	#endif

	//ENCRYPTION
//	xil_printf("Encryption - Press 'X' to start \r\n");
	xil_printf("Encryption-Decryption - Press 'X' to start \r\n");
	if (inbyte() == 'X')
	{	}

	transfer = XAxiDma_SimpleTransfer(&DMAInstance,(UINTPTR) RxBufferPtr, MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
	if (transfer == XST_SUCCESS)
	{
		xil_printf("transfer Dev-DMA successful \r\n");
	}
	transfer = XAxiDma_SimpleTransfer(&DMAInstance,(UINTPTR) TxBufferPtr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
	if (transfer == XST_SUCCESS)
	{
		xil_printf("transfer DMA-Dev successful \r\n");
	}
	while ((XAxiDma_Busy(&DMAInstance,XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(&DMAInstance,XAXIDMA_DMA_TO_DEVICE)))
	{
			/* Wait */
		xil_printf("Busy Dev-DMA = %d; Busy DMA-Dev = %d \r\n",XAxiDma_Busy(&DMAInstance,XAXIDMA_DEVICE_TO_DMA),XAxiDma_Busy(&DMAInstance,XAXIDMA_DMA_TO_DEVICE));
	}

	/* Invalidate the DestBuffer before receiving the data, in case the Data Cache is enabled */
	#ifndef __aarch64__
//		xil_printf("arch \r\n");
		Xil_DCacheInvalidateRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	#endif

//	for(i=0;i<MAX_PKT_LEN;i++)
//	{
//		diff= RxBufferPtr[i] - TxBufferPtr[i];
//		if (diff!=0)
//		{
//			xil_printf("diff[%d]= %x,MemspaceRx[%d]:%x,MemspaceTx[%d]:%x \r\n",i,diff,i,RxBufferPtr[i],i,TxBufferPtr[i]);
//		}
//	}

	for(i=0;i<MAX_PKT_LEN;i++)	//for encrypt
	{
		diff= RxBufferPtr[i] - TestBufferPtr[i];
		if (diff!=0)
		{
			j++;
			xil_printf("Difference[%d]= %x,RxBuffer[%d]:%002x,TestBuffer[%d]:%002x \r\n",i,diff,i,RxBufferPtr[i],i,TestBufferPtr[i]);
		}
	}
	if(j==0)
	{
		xil_printf("Encryption completed successfully \r\n");
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//DECRYPT

//	xil_printf("Decryption - Press 'X' to start \r\n");
//	if (inbyte() == 'X')
//	{	}

	transfer = XAxiDma_SimpleTransfer(&DMAInstance,(UINTPTR) RxBufferPtr, MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
	if (transfer == XST_SUCCESS)
	{
		xil_printf("transfer Dev-DMA successful \r\n");
	}
	transfer = XAxiDma_SimpleTransfer(&DMAInstance,(UINTPTR) TestBufferPtr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
	if (transfer == XST_SUCCESS)
	{
		xil_printf("transfer DMA-Dev successful \r\n");
	}
	while ((XAxiDma_Busy(&DMAInstance,XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(&DMAInstance,XAXIDMA_DMA_TO_DEVICE)))
	{
			/* Wait */
		xil_printf("Busy Dev-DMA = %d; Busy DMA-Dev = %d \r\n",XAxiDma_Busy(&DMAInstance,XAXIDMA_DEVICE_TO_DMA),XAxiDma_Busy(&DMAInstance,XAXIDMA_DMA_TO_DEVICE));
	}

	/* Invalidate the DestBuffer before receiving the data, in case the Data Cache is enabled */
	#ifndef __aarch64__
//		xil_printf("arch \r\n");
		Xil_DCacheInvalidateRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	#endif

		for(i=0;i<MAX_PKT_LEN;i++)	//for decrypt
		{
			diff= RxBufferPtr[i] - TxBufferPtr[i];
			if (diff!=0)
			{
				j++;
				xil_printf("Difference[%d]= %x,RxBuffer[%d]:%002x,TxBufferPtr[%d]:%002x \r\n",i,diff,i,RxBufferPtr[i],i,TxBufferPtr[i]);
			}
		}
		if(j==0)
		{
			xil_printf("Decryption completed successfully \r\n");
		}

	xil_printf("done\r\n");

	return 0;
}
