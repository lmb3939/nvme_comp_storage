//////////////////////////////////////////////////////////////////////////////////
// nvme_main.c for Cosmos+ OpenSSD
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
// Module Name: NVMe Main
// File Name: nvme_main.c
//
// Version: v1.2.0
//
// Description:
//   - initializes FTL and NAND
//   - handles NVMe controller
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.2.0
//   - header file for buffer is changed from "ia_lru_buffer.h" to "lru_buffer.h"
//   - Low level scheduler execution is allowed when there is no i/o command
//
// * v1.1.0
//   - DMA status initialization is added
//
// * v1.0.0
//   - First draft
//////////////////////////////////////////////////////////////////////////////////
#include "xil_printf.h"
#include "debug.h"
#include "io_access.h"

#include "nvme.h"
#include "host_lld.h"
#include "nvme_main.h"
#include "nvme_admin_cmd.h"
#include "nvme_io_cmd.h"

#include "../memory_map.h"
#include "xuartps_hw.h"

volatile NVME_CONTEXT g_nvmeTask;

#include "xaxidma.h"
extern XAxiDma *DMAInstance;
extern XAxiDma_Config *DMAConfig;

#include "xtime_l.h"
#include <stdio.h>
double time_vector1[2*1024];
double time_vector2[2*1024];
double time_vector3[2*1024];
double *timer_pointer1 = time_vector1;
double *timer_pointer2 = time_vector2;
double *timer_pointer3 = time_vector3;
double *limit_pointer1 = &time_vector1[2*1024-1];
double *limit_pointer2 = &time_vector2[2*1024-1];
double *origin_pointer1 = time_vector1;
double *origin_pointer2 = time_vector2;
double *origin_pointer3 = time_vector3;
XTime timer1,timer2,timer3,timer4,timer5;
int kounter1 = 0;
int kounter2 = 0;

void nvme_main()
{
//	u32 busy1,busy2;
//	int transfer1,transfer2,i,j;
	unsigned int exeLlr,i;
	char c = 0;
	xil_printf("!!! Wait until FTL reset complete !!! \r\n");

	InitFTL();

	xil_printf("\r\nFTL reset complete!!! \r\n");
	xil_printf("Turn on the host PC \r\n");

	while(1)
	{

		exeLlr = 1;
		if(g_nvmeTask.status == NVME_TASK_WAIT_CC_EN)
		{
			unsigned int ccEn;
			ccEn = check_nvme_cc_en();
			if(ccEn == 1)
			{
				set_nvme_admin_queue(1, 1, 1);
				set_nvme_csts_rdy(1);
				g_nvmeTask.status = NVME_TASK_RUNNING;
				xil_printf("\r\nNVMe ready!!!\r\n");
			}
		}
		else if(g_nvmeTask.status == NVME_TASK_RUNNING)
		{
			NVME_COMMAND nvmeCmd;
			unsigned int cmdValid;
			cmdValid = get_nvme_cmd(&nvmeCmd.qID, &nvmeCmd.cmdSlotTag, &nvmeCmd.cmdSeqNum, nvmeCmd.cmdDword);

			if(cmdValid == 1)
			{
				XTime_GetTime(&timer1);
				if(nvmeCmd.qID == 0)
				{
//					xil_printf("\r\n handle_nvme_admin_cmd \r\n");
					handle_nvme_admin_cmd(&nvmeCmd);
				}
				else
				{
//					xil_printf("\r\n handle_nvme_io_cmd \r\n");
					handle_nvme_io_cmd(&nvmeCmd);
					ReqTransSliceToLowLevel();
					exeLlr=0;
				}
				XTime_GetTime(&timer2);
				if (timer_pointer1 <= limit_pointer1)
				{
					kounter1++;
	//				*timer_pointer1=((timer2-timer1)*10) / (COUNTS_PER_SECOND / 100000000); // 10/4=2.5
					*timer_pointer1=((timer2-timer1)*(10/4));
					timer_pointer1++;
				}
			}
//			aggiunta per write e read da keyboard
			if(XUartPs_IsReceiveData(STDIN_BASEADDRESS))
			{
				c = XUartPs_ReadReg(STDIN_BASEADDRESS, XUARTPS_FIFO_OFFSET);
				switch(c)
				{
				case 'b': //read dei risultati dei timer
				{
					double *temp1 = origin_pointer1;
					double *temp2 = origin_pointer2;
					double *temp3 = origin_pointer3;
					for (i=0;i < kounter1; i++)
					{
						printf("command_1 %.2lf ns \r\n",*temp1);
						temp1++;
					}
					xil_printf("kounter1: %d \r\n",kounter1);
					for (i=0;i < kounter2; i++)
					{
//						printf("check_2 %.2lf ns \r\n",*temp2);
						printf("check_2 %.2lf ns \r\n",*temp2);
						temp2++;
					}
					for (i=0;i < kounter2; i++)
					{
						printf("scheduling_3 %.2lf ns \r\n",*temp3);
						temp3++;
					}
					printf("kounter2: %d \r\n",kounter2);
					break;
				}
				case 'd': //reset timer (
				{
					timer_pointer1 = origin_pointer1;
					timer_pointer2 = origin_pointer2;
					timer_pointer3 = origin_pointer3;
					kounter1=0;
					kounter2=0;
					xil_printf("Reset Timer variables \r\n");
					break;
				}
				default:
					break;
				}
			}
		}
		else if(g_nvmeTask.status == NVME_TASK_SHUTDOWN)
		{
			NVME_STATUS_REG nvmeReg;
			nvmeReg.dword = IO_READ32(NVME_STATUS_REG_ADDR);
			if(nvmeReg.ccShn != 0)
			{
				unsigned int qID;
				set_nvme_csts_shst(1);

				for(qID = 0; qID < 8; qID++)
				{
					set_io_cq(qID, 0, 0, 0, 0, 0, 0);
					set_io_sq(qID, 0, 0, 0, 0, 0);
				}

				set_nvme_admin_queue(0, 0, 0);
				g_nvmeTask.cacheEn = 0;
				set_nvme_csts_shst(2);
				g_nvmeTask.status = NVME_TASK_WAIT_RESET;

				//flush grown bad block info
				UpdateBadBlockTableForGrownBadBlock(RESERVED_DATA_BUFFER_BASE_ADDR);

				xil_printf("\r\nNVMe shutdown!!!\r\n");
			}
		}
		else if(g_nvmeTask.status == NVME_TASK_WAIT_RESET)
		{
			unsigned int ccEn;
			ccEn = check_nvme_cc_en();
			if(ccEn == 0)
			{
				g_nvmeTask.cacheEn = 0;
				set_nvme_csts_shst(0);
				set_nvme_csts_rdy(0);
				g_nvmeTask.status = NVME_TASK_IDLE;
				xil_printf("\r\nNVMe disable!!!\r\n");
			}
		}
		else if(g_nvmeTask.status == NVME_TASK_RESET)
		{
			unsigned int qID;
			for(qID = 0; qID < 8; qID++)
			{
				set_io_cq(qID, 0, 0, 0, 0, 0, 0);
				set_io_sq(qID, 0, 0, 0, 0, 0);
			}
			g_nvmeTask.cacheEn = 0;
			set_nvme_admin_queue(0, 0, 0);
			set_nvme_csts_shst(0);
			set_nvme_csts_rdy(0);
			g_nvmeTask.status = NVME_TASK_IDLE;

			xil_printf("\r\nNVMe reset!!!\r\n");
		}

		if(exeLlr && ((nvmeDmaReqQ.headReq != REQ_SLOT_TAG_NONE) || notCompletedNandReqCnt || blockedReqCnt))
		{
//			xil_printf("reqSlotTag.reqCode: %x;  nvmeDmaReqQ.reqCnt: %d, nvmehead: %x, nvmetail: %x \r\n ", reqPoolPtr->reqPool[nvmeDmaReqQ.headReq].reqCode, nvmeDmaReqQ.reqCnt, nvmeDmaReqQ.headReq, nvmeDmaReqQ.tailReq);
			XTime_GetTime(&timer3);
			CheckDoneNvmeDmaReq();
			XTime_GetTime(&timer4);
			SchedulingNandReq();
			XTime_GetTime(&timer5);
			if (timer_pointer2 <= limit_pointer2)
			{
				kounter2++;
//				*timer_pointer2=((timer4-timer3)*10) / (COUNTS_PER_SECOND / 100000000);
				*timer_pointer2=((timer4-timer3)*(10/4));
				timer_pointer2++;
				*timer_pointer3=((timer5-timer4)*(10/4));
				timer_pointer3++;
			}
		}
	}
}


