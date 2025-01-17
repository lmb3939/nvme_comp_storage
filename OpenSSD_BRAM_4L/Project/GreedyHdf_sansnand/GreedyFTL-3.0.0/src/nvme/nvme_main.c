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

//#include "../minmaxavg.h"
#include <stdio.h>
//#include "xtime_l.h"
//
//double time_vector[1024*1024];
//double loop_value[100];
//double *timer_pointer = time_vector;
//double *limit_pointer = &time_vector[1024*1024-128];
//double *origin_pointer = time_vector;
//XTime timer1,timer2,timer3,timer4,timer5;
//int kounter = 0;
//int kounter2 = 0;

volatile NVME_CONTEXT g_nvmeTask;

void nvme_main()
{
	unsigned int exeLlr,i,j;
//	double dataout[3];
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
				if(nvmeCmd.qID == 0)
				{
//					xil_printf("\r\n handle_nvme_admin_cmd \r\n");
					handle_nvme_admin_cmd(&nvmeCmd);
				}
				else
				{
//					xil_printf("\r\n handle_nvme_io_cmd \r\n");
//					XTime_GetTime(&timer1);
					handle_nvme_io_cmd(&nvmeCmd);
//					XTime_GetTime(&timer2);
//					xil_printf("\r\n before req freeReqQ reqCnt: %d; nvmeDmaReqQ reqCnt: %d \r\n",freeReqQ.reqCnt,nvmeDmaReqQ.reqCnt);
//					ReqTransSliceToLowLevel();
					ReqTransSliceToLowLevelDDR();
//					xil_printf("\r\n after req freeReqQ reqCnt: %d; nvmeDmaReqQ reqCnt: %d \r\n",freeReqQ.reqCnt,nvmeDmaReqQ.reqCnt);
//					XTime_GetTime(&timer3);
//					if (timer_pointer <= limit_pointer)
//					{
//						kounter++;
//						*timer_pointer=(double)(timer2-timer1);
//						timer_pointer++;
//						*timer_pointer=(double)(timer3-timer2);
//						timer_pointer++;
//					}
//					exeLlr=0;
				}
			}
//			aggiunta per write e read da keyboard
			if(XUartPs_IsReceiveData(STDIN_BASEADDRESS))
			{
				c = XUartPs_ReadReg(STDIN_BASEADDRESS, XUARTPS_FIFO_OFFSET);
				switch(c)
				{//shift di 64 per tutte le operazioni (indirizzo base = 0x40h)
					case 'w': //scrivo i per 5MB alla volta
					{
						for (i=0;i<10;i++)
						{
							for (j=0; j < 5*1024*1024; j++)
							MemSpace[64 + i*5*1024*1024 + j] = i;
						}
						xil_printf("Write Done");
						break;
					}
					case 'r': //read delle prime 20 posizioni
					{
						for (i=0; i<20; i++)
							xil_printf("i= %d; MemSpace[%d]= %X \r\n ",i,(64 + i),MemSpace[64 + i]);
						for (i=0; i<20; i++)
							xil_printf("i= %d; MemSpace[%d]= %X \r\n ",i,(i),MemSpace[i]);
						break;
					}
					case 't': //read dei 10 numeri scritti con w
					{
						for (i=0; i<10; i+=(9*1024*1024))
							xil_printf("MemSpace[%d]= %X \r\n ",(64 + i),MemSpace[64 + i]);
						break;
					}
					case 'z': //read dei 10 numeri scritti con w
					{
						for (i=0; i<50; i++)
						{
							int *p = (int *) (NSC_0_BASEADDR+i);
							xil_printf("BRAM[%X]= %X;  ",p,*p);
						}
						break;
					}
					case 'p': //read dei counter delle fifo/funzioni
					{
						xil_printf("\r\n freeReqQ headReq: %X; tailReq: %X; reqCnt: %d \r\n",freeReqQ.headReq,freeReqQ.tailReq,freeReqQ.reqCnt);
						xil_printf("\r\n sliceReqQ headReq: %X; tailReq: %X; reqCnt: %d \r\n",sliceReqQ.headReq,sliceReqQ.tailReq,sliceReqQ.reqCnt);
						xil_printf("\r\n nvmeDmaReqQ headReq: %X; tailReq: %X; reqCnt: %d \r\n",nvmeDmaReqQ.headReq,nvmeDmaReqQ.tailReq,nvmeDmaReqQ.reqCnt);
						xil_printf("\r\n blockedByBufDepReqQ headReq: %X; tailReq: %X; reqCnt: %d \r\n",blockedByBufDepReqQ.headReq,blockedByBufDepReqQ.tailReq,blockedByBufDepReqQ.reqCnt);
						xil_printf("\r\n nandReqQ[0][0] headReq: %X; tailReq: %X; reqCnt: %d \r\n",nandReqQ[0][0].headReq,nandReqQ[0][0].tailReq,nandReqQ[0][0].reqCnt);
						xil_printf("\r\n blockedByRowAddrDepReqQ[0][0] headReq: %X; tailReq: %X; reqCnt: %d \r\n",blockedByRowAddrDepReqQ[0][0].headReq,blockedByRowAddrDepReqQ[0][0].tailReq,blockedByRowAddrDepReqQ[0][0].reqCnt);
						break;
					}
//					case 'b': //read dei risultati dei timer
//					{
//						double *temp = origin_pointer;
//						for (i=0;i < 2*kounter; i++)
//						{
//							if(i%2 == 0)
//							{
//								printf("timer 1 %.2lf ns \r\n",(*temp)*(10/ 4));
//							}
//							else
//								printf("timer 2 %.2lf ns \r\n",(*temp)*(10/ 4));
//							temp++;
//						}
//						for (i=0;i < 100; i++)
//						{
//							printf("final check %.2lf ns \r\n",(loop_value[i])*(10/ 4));
//						}
//						for (i=0;i < kounter; i++)
//						{
//							for (j=0;j<loop_value[i];j++)
//							{
//								printf("timer loop[%d,%d] %.2lf ns \r\n",i,j,*temp);
//								temp++;
//							}
//						}
//						printf("kounter: %d \r\n",kounter);
//						MinMaxAvg(origin_pointer, kounter, &dataout[0], &dataout[1], &dataout[2]);
//						printf("Tempo F1 min: %.2lf ns, max: %.2lf ns, avg: %.2lf ns \r\n",dataout[0]*(10/ 4),dataout[1]*(10/ 4),dataout[2]*(10/ 4));
//						MinMaxAvg((origin_pointer+1), kounter, &dataout[0], &dataout[1], &dataout[2]);
//						printf("Tempo F2 min: %.2lf ns, max: %.2lf ns, avg: %.2lf ns \r\n",dataout[0]*(10/ 4),dataout[1]*(10/ 4),dataout[2]*(10/ 4));
//						for (i=0;i < kounter; i++)
//						{
//							if (i == 0)
//							{
//								sum_loop = 0;
//							}
//							else
//							{
//								sum_loop += loop_value[i-1];
//							}
//							MinMaxAvg((origin_pointer + sum_loop), loop_value[i], &dataout[0], &dataout[1], &dataout[2]);
//							printf("Tempo loop[%d] min: %.2lf ns, max: %.2lf ns, avg: %.2lf ns; loop_cnt: %d \r\n",i,dataout[0],dataout[1],dataout[2],loop_value[i]);
//						}
//						break;
//					}
//					case 'd': //reset timer (
//					{
//						timer_pointer = origin_pointer;
//						kounter=0;
//						kounter2=0;
//						xil_printf("Reset Timer variables \r\n");
//						break;
//					}
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
//			XTime_GetTime(&timer4);
			CheckDoneNvmeDmaReq();
			SchedulingNandReq();
//			XTime_GetTime(&timer5);
//			if (kounter2<99)
//			{
//				loop_value[kounter2]=(double)(timer2-timer1);
//				kounter2++;
//			}
		}
	}
}


