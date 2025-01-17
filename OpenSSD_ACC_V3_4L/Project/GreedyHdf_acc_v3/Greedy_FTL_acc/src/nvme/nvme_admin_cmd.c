//////////////////////////////////////////////////////////////////////////////////
// nvme_admin_cmd.c for Cosmos+ OpenSSD
// Copyright (c) 2016 Hanyang University ENC Lab.
// Contributed by Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//				  Youngjin Jo <yjjo@enc.hanyang.ac.kr>
//				  Sangjin Lee <sjlee@enc.hanyang.ac.kr>
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
//
// Project Name: Cosmos+ OpenSSD
// Design Name: Cosmos+ Firmware
// Module Name: NVMe Admin Command Handler
// File Name: nvme_admin_cmd.c
//
// Version: v1.0.0
//
// Description:
//   - handles NVMe admin command
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.0
//   - First draft
//////////////////////////////////////////////////////////////////////////////////


#include "xil_printf.h"
#include "debug.h"
#include "string.h"
#include "io_access.h"

#include "nvme.h"
#include "host_lld.h"
#include "nvme_identify.h"
#include "nvme_admin_cmd.h"

extern NVME_CONTEXT g_nvmeTask;
u32 *configACC = (u32 *) XPAR_ACCELERATOR_0_S00_AXI_BASEADDR;				//address 0
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


unsigned int get_num_of_queue(unsigned int dword11)
{
	ADMIN_SET_FEATURES_NUMBER_OF_QUEUES_DW11 numOfQueue;

	xil_printf("num_of_queue %X\r\n", dword11);

	numOfQueue.dword = dword11;

	if(numOfQueue.NSQR >= MAX_NUM_OF_IO_SQ)
		numOfQueue.NSQR = MAX_NUM_OF_IO_SQ - 1;

	if(numOfQueue.NCQR >= MAX_NUM_OF_IO_CQ)
		numOfQueue.NCQR = MAX_NUM_OF_IO_CQ - 1;

	return numOfQueue.dword;
}

void handle_set_features(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_SET_FEATURES_DW10 features;

	features.dword = nvmeAdminCmd->dword10;

	switch(features.FID)
	{
		case NUMBER_OF_QUEUES:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = get_num_of_queue(nvmeAdminCmd->dword11);
			break;
		}
		case INTERRUPT_COALESCING:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ARBITRATION:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ASYNCHRONOUS_EVENT_CONFIGURATION:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case VOLATILE_WRITE_CACHE:
		{
			xil_printf("Set VWC: %X\r\n", nvmeAdminCmd->dword11);
			g_nvmeTask.cacheEn = (nvmeAdminCmd->dword11 & 0x1);
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case POWER_MANAGEMENT:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
//		aggiunte
		case HOST_BEHAVIOUR_SUPPORT:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_CONFIGURATION:					//set the type of acceleration
		{
			xil_printf("Set Accelerator Configuration: %X \r\n", nvmeAdminCmd->dword11);
			*configACC = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER1:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 1: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC1 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER2:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 2: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC2 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER3:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 3: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC3 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER4:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 4: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC4 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER5:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 5: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC5 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER6:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 6: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC6 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER7:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 7: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC7 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETER8:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter 8: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACC8 = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETERa:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter A: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACCa = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETERb:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter B: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACCb = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETERc:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter C: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACCc = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_PARAMETERd:						//set the parameter of the acceleration
		{
			xil_printf("Set Accelerator Parameter D: %X\r\n", nvmeAdminCmd->dword11);
			*parameterACCd = nvmeAdminCmd->dword11;
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		default:
		{
			xil_printf("Not Support FID (Set): %X\r\n", features.FID);
			ASSERT(0);
			break;
		}
	}
	xil_printf("Set Feature FID:%X\r\n", features.FID);
}

void handle_get_features(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_GET_FEATURES_DW10 features;
	NVME_COMPLETION cpl;

	features.dword = nvmeAdminCmd->dword10;

	switch(features.FID)
	{
		case LBA_RANGE_TYPE:
		{
			ASSERT(nvmeAdminCmd->NSID == 1);

			cpl.dword[0] = 0x0;
			cpl.statusField.SC = SC_INVALID_FIELD_IN_COMMAND;
			nvmeCPL->dword[0] = cpl.dword[0];
			nvmeCPL->specific = 0x0;
			break;
		}
		case TEMPERATURE_THRESHOLD:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = nvmeAdminCmd->dword11;
			break;
		}
		case VOLATILE_WRITE_CACHE:
		{
			
			xil_printf("Get VWC: %X\r\n", g_nvmeTask.cacheEn);
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = g_nvmeTask.cacheEn;
			break;
		}
		case POWER_MANAGEMENT:
		{
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = 0x0;
			break;
		}
		case ACC_CONFIGURATION:
		{
			xil_printf("Get Accelerator Configuration: %X\r\n", *configACC);
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *configACC;
			break;
		}
		case ACC_PARAMETER1:
		{
			xil_printf("Get Parameter 1: %X\r\n", *parameterACC1);		//[31:0]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC1;
			break;
		}
		case ACC_PARAMETER2:
		{
			xil_printf("Get Parameter 2: %X\r\n", *parameterACC2);		//[63:32]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC2;
			break;
		}
		case ACC_PARAMETER3:
		{
			xil_printf("Get Parameter 3: %X\r\n", *parameterACC3);		 //[95:64]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC3;
			break;
		}
		case ACC_PARAMETER4:
		{
			xil_printf("Get Parameter 4: %X\r\n", *parameterACC4);		 //[127:96]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC4;
			break;
		}
		case ACC_PARAMETER5:
		{
			xil_printf("Get Parameter 5: %X\r\n", *parameterACC5);		  //[159:128]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC5;
			break;
		}
		case ACC_PARAMETER6:
		{
			xil_printf("Get Parameter 6: %X\r\n", *parameterACC6);		  //[191:160]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC6;
			break;
		}
		case ACC_PARAMETER7:
		{
			xil_printf("Get Parameter 7: %X\r\n", *parameterACC7);		  //[223:192]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC7;
			break;
		}
		case ACC_PARAMETER8:
		{
			xil_printf("Get Parameter 8: %X\r\n", *parameterACC8);		  //[255:224]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACC8;
			break;
		}
		case ACC_PARAMETERa:
		{
			xil_printf("Get Parameter A: %X\r\n", *parameterACCa);		  //[31:0]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACCa;
			break;
		}
		case ACC_PARAMETERb:
		{
			xil_printf("Get Parameter B: %X\r\n", *parameterACCb);		  //[63:32]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACCb;
			break;
		}
		case ACC_PARAMETERc:
		{
			xil_printf("Get Parameter C: %X\r\n", *parameterACCc);		  //[95:64]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACCc;
			break;
		}
		case ACC_PARAMETERd:
		{
			xil_printf("Get Parameter D: %X\r\n", *parameterACCd);		  //[127:96]
			nvmeCPL->dword[0] = 0x0;
			nvmeCPL->specific = *parameterACCd;
			break;
		}
		default:
		{
			xil_printf("Not Support FID (Get): %X\r\n", features.FID);
			ASSERT(0);
			break;
		}
	}
	xil_printf("Get Feature FID:%X\r\n", features.FID);
}

void handle_create_io_sq(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_CREATE_IO_SQ_DW10 sqInfo10;
	ADMIN_CREATE_IO_SQ_DW11 sqInfo11;
	NVME_IO_SQ_STATUS *ioSqStatus;
	unsigned int ioSqIdx;

	sqInfo10.dword = nvmeAdminCmd->dword10;
	sqInfo11.dword = nvmeAdminCmd->dword11;

	xil_printf("create sq: 0x%08X, 0x%08X\r\n", sqInfo11.dword, sqInfo10.dword);

	ASSERT((nvmeAdminCmd->PRP1[0] & 0xF) == 0 && nvmeAdminCmd->PRP1[1] < 0x10);
	ASSERT(0 < sqInfo10.QID && sqInfo10.QID <= 8 && sqInfo10.QSIZE < 0x100 && 0 < sqInfo11.CQID && sqInfo11.CQID <= 8);

	ioSqIdx = sqInfo10.QID - 1;
	ioSqStatus = g_nvmeTask.ioSqInfo + ioSqIdx;

	ioSqStatus->valid = 1;
	ioSqStatus->qSzie = sqInfo10.QSIZE;
	ioSqStatus->cqVector = sqInfo11.CQID;
	ioSqStatus->pcieBaseAddrL = nvmeAdminCmd->PRP1[0];
	ioSqStatus->pcieBaseAddrH = nvmeAdminCmd->PRP1[1];

	set_io_sq(ioSqIdx, ioSqStatus->valid, ioSqStatus->cqVector, ioSqStatus->qSzie, ioSqStatus->pcieBaseAddrL, ioSqStatus->pcieBaseAddrH);

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x0;

}

void handle_delete_io_sq(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_DELETE_IO_SQ_DW10 sqInfo10;
	NVME_IO_SQ_STATUS *ioSqStatus;
	unsigned int ioSqIdx;

	sqInfo10.dword = nvmeAdminCmd->dword10;

	xil_printf("delete sq: 0x%08X\r\n", sqInfo10.dword);

	ioSqIdx = (unsigned int)sqInfo10.QID - 1;
	ioSqStatus = g_nvmeTask.ioSqInfo + ioSqIdx;

	ioSqStatus->valid = 0;
	ioSqStatus->cqVector = 0;
	ioSqStatus->qSzie = 0;
	ioSqStatus->pcieBaseAddrL = 0;
	ioSqStatus->pcieBaseAddrH = 0;

	set_io_sq(ioSqIdx, 0, 0, 0, 0, 0);

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x0;
}


void handle_create_io_cq(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_CREATE_IO_CQ_DW10 cqInfo10;
	ADMIN_CREATE_IO_CQ_DW11 cqInfo11;
	NVME_IO_CQ_STATUS *ioCqStatus;
	unsigned int ioCqIdx;

	cqInfo10.dword = nvmeAdminCmd->dword10;
	cqInfo11.dword = nvmeAdminCmd->dword11;

	xil_printf("create cq: 0x%08X, 0x%08X\r\n", cqInfo11.dword, cqInfo10.dword);

	ASSERT(((nvmeAdminCmd->PRP1[0] & 0xF) == 0) && (nvmeAdminCmd->PRP1[1] < 0x10));
	ASSERT(cqInfo11.IV < 8 && cqInfo10.QSIZE < 0x100 && 0 < cqInfo10.QID && cqInfo10.QID <= 8);

	ioCqIdx = cqInfo10.QID - 1;
	ioCqStatus = g_nvmeTask.ioCqInfo + ioCqIdx;

	ioCqStatus->valid = 1;
	ioCqStatus->qSzie = cqInfo10.QSIZE;
	ioCqStatus->irqEn = cqInfo11.IEN;
	ioCqStatus->irqVector = cqInfo11.IV;
	ioCqStatus->pcieBaseAddrL = nvmeAdminCmd->PRP1[0];
	ioCqStatus->pcieBaseAddrH = nvmeAdminCmd->PRP1[1];

	set_io_cq(ioCqIdx, ioCqStatus->valid, ioCqStatus->irqEn, ioCqStatus->irqVector, ioCqStatus->qSzie, ioCqStatus->pcieBaseAddrL, ioCqStatus->pcieBaseAddrH);

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x0;
}

void handle_delete_io_cq(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_DELETE_IO_CQ_DW10 cqInfo10;
	NVME_IO_CQ_STATUS *ioCqStatus;
	unsigned int ioCqIdx;

	cqInfo10.dword = nvmeAdminCmd->dword10;

	xil_printf("delete cq: 0x%08X\r\n", cqInfo10.dword);

	ioCqIdx = (unsigned int)cqInfo10.QID - 1;
	ioCqStatus = g_nvmeTask.ioCqInfo + ioCqIdx;

	ioCqStatus->valid = 0;
	ioCqStatus->irqVector = 0;
	ioCqStatus->qSzie = 0;
	ioCqStatus->pcieBaseAddrL = 0;
	ioCqStatus->pcieBaseAddrH = 0;
	
	set_io_cq(ioCqIdx, 0, 0, 0, 0, 0, 0);

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x0;
}

void handle_identify(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	ADMIN_IDENTIFY_COMMAND_DW10 identifyInfo;
	unsigned int pIdentifyData = ADMIN_CMD_DRAM_DATA_BUFFER;
	unsigned int prp[2];
	unsigned int prpLen;

	identifyInfo.dword = nvmeAdminCmd->dword10;

	if(identifyInfo.CNS == 1)
	{
		if((nvmeAdminCmd->PRP1[0] & 0xF) != 0 || (nvmeAdminCmd->PRP2[0] & 0xF) != 0)
			xil_printf("CI: %X, %X, %X, %X\r\n", nvmeAdminCmd->PRP1[1], nvmeAdminCmd->PRP1[0], nvmeAdminCmd->PRP2[1], nvmeAdminCmd->PRP2[0]);

		ASSERT((nvmeAdminCmd->PRP1[0] & 0xF) == 0 && (nvmeAdminCmd->PRP2[0] & 0xF) == 0);
		identify_controller(pIdentifyData);
	}
	else if(identifyInfo.CNS == 0)
	{
		if((nvmeAdminCmd->PRP1[0] & 0xF) != 0 || (nvmeAdminCmd->PRP2[0] & 0xF) != 0)
			xil_printf("NI: %X, %X, %X, %X\r\n", nvmeAdminCmd->PRP1[1], nvmeAdminCmd->PRP1[0], nvmeAdminCmd->PRP2[1], nvmeAdminCmd->PRP2[0]);

		//ASSERT(nvmeAdminCmd->NSID == 1);
		ASSERT((nvmeAdminCmd->PRP1[0] & 0xF) == 0 && (nvmeAdminCmd->PRP2[0] & 0xF) == 0);
		identify_namespace(pIdentifyData);
	}
	else
		ASSERT(0);
	
	prp[0] = nvmeAdminCmd->PRP1[0];
	prp[1] = nvmeAdminCmd->PRP1[1];

	prpLen = 0x1000 - (prp[0] & 0xFFF);

	set_direct_tx_dma(pIdentifyData, prp[1], prp[0], prpLen);

	if(prpLen != 0x1000)
	{
		pIdentifyData = pIdentifyData + prpLen;
		prpLen = 0x1000 - prpLen;
		prp[0] = nvmeAdminCmd->PRP2[0];
		prp[1] = nvmeAdminCmd->PRP2[1];

		ASSERT((prp[1] & 0xFFF) == 0);

		set_direct_tx_dma(pIdentifyData, prp[1], prp[0], prpLen);
	}

	check_direct_tx_dma_done();

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x0;
}

void handle_get_log_page(NVME_ADMIN_COMMAND *nvmeAdminCmd, NVME_COMPLETION *nvmeCPL)
{
	//ADMIN_GET_LOG_PAGE_DW10 getLogPageInfo;

	//unsigned int prp1[2];
	//unsigned int prp2[2];
	//unsigned int prpLen;

	//getLogPageInfo.dword = nvmeAdminCmd->dword10;

	//prp1[0] = nvmeAdminCmd->PRP1[0];
	//prp1[1] = nvmeAdminCmd->PRP1[1];
	//prpLen = 0x1000 - (prp1[0] & 0xFFF);

	//prp2[0] = nvmeAdminCmd->PRP2[0];
	//prp2[1] = nvmeAdminCmd->PRP2[1];

	//xil_printf("ADMIN GET LOG PAGE\n");

	//LID
	//Mandatory//1-Error information, 2-SMART/Health information, 3-Firmware Slot information
	//Optional//4-ChangedNamespaceList, 5-Command Effects Log
	//xil_printf("LID: 0x%X, NUMD: 0x%X \r\n", getLogPageInfo.LID, getLogPageInfo.NUMD);

	//xil_printf("PRP1[63:32] = 0x%X, PRP1[31:0] = 0x%X", prp1[1], prp1[0]);
	//xil_printf("PRP2[63:32] = 0x%X, PRP2[31:0] = 0x%X", prp2[1], prp2[0]);

	nvmeCPL->dword[0] = 0;
	nvmeCPL->specific = 0x9;//invalid log page
}

void handle_nvme_admin_cmd(NVME_COMMAND *nvmeCmd)
{
	NVME_ADMIN_COMMAND *nvmeAdminCmd;
	NVME_COMPLETION nvmeCPL;
	unsigned int opc;
	unsigned int needCpl;
	unsigned int needSlotRelease;

	nvmeAdminCmd = (NVME_ADMIN_COMMAND*)nvmeCmd->cmdDword;
	opc = (unsigned int)nvmeAdminCmd->OPC;
//	xil_printf("\r\n ADMIN Command OPC %X FUSE %X reserved0 %X PSDT %X CID %X NSID %X reserved1 %X %X MPTR %X %X PRP1 %X %X PRP2 %X %X "
//			"dword10 %X dword11 %X dword12 %X dword13 %X dword14 %X dword15 %X\r\n",nvmeAdminCmd->OPC,nvmeAdminCmd->FUSE,
//			nvmeAdminCmd->reserved0,nvmeAdminCmd->PSDT,nvmeAdminCmd->CID,nvmeAdminCmd->NSID,nvmeAdminCmd->reserved1[0],
//			nvmeAdminCmd->reserved1[1],nvmeAdminCmd->MPTR[0],nvmeAdminCmd->MPTR[1],nvmeAdminCmd->PRP1[0],nvmeAdminCmd->PRP1[1],
//			nvmeAdminCmd->PRP2[0],nvmeAdminCmd->PRP2[1],nvmeAdminCmd->dword10,nvmeAdminCmd->dword11,nvmeAdminCmd->dword12,
//			nvmeAdminCmd->dword13,nvmeAdminCmd->dword14,nvmeAdminCmd->dword15);

	needCpl = 1;
	needSlotRelease = 0;
	switch(opc)
	{
		case ADMIN_SET_FEATURES:
		{
//			xil_printf("SET_FEATURES Admin Command OPC: %X\r\n", opc);
			handle_set_features(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_CREATE_IO_CQ:
		{
//			xil_printf("CREATE_IO_CQ Admin Command OPC: %X\r\n", opc);
			handle_create_io_cq(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_CREATE_IO_SQ:
		{
//			xil_printf("CREATE_IO_SQ Admin Command OPC: %X\r\n", opc);
			handle_create_io_sq(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_IDENTIFY:
		{
//			xil_printf("IDENTIFY Admin Command OPC: %X\r\n", opc);
			handle_identify(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_GET_FEATURES:
		{
//			xil_printf("GET_FEATURES Admin Command OPC: %X\r\n", opc);
			handle_get_features(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_DELETE_IO_CQ:
		{
//			xil_printf("DELETE_IO_CQ Admin Command OPC: %X\r\n", opc);
			handle_delete_io_cq(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_DELETE_IO_SQ:
		{
//			xil_printf("DELETE_IO_SQ Admin Command OPC: %X\r\n", opc);
			handle_delete_io_sq(nvmeAdminCmd, &nvmeCPL);
			break;
		}
		case ADMIN_ASYNCHRONOUS_EVENT_REQUEST:
		{
//			xil_printf("ASYNCHRONOUS_EVENT_REQUEST Admin Command OPC: %X\r\n", opc);
			needCpl = 0;
			needSlotRelease = 1;
			nvmeCPL.dword[0] = 0;
			nvmeCPL.specific = 0x0;
			break;
		}
		case ADMIN_GET_LOG_PAGE:
		{
//			xil_printf("GET_LOG_PAGE Admin Command OPC: %X\r\n", opc);
			handle_get_log_page(nvmeAdminCmd, &nvmeCPL);
			break;
		}

		default:
		{
			xil_printf("Not Support Admin Command OPC: %X\r\n", opc);
			ASSERT(0);
			break;
		}
	}

	if(needCpl == 1)
		set_auto_nvme_cpl(nvmeCmd->cmdSlotTag, nvmeCPL.specific, nvmeCPL.statusFieldWord);
	else if(needSlotRelease == 1)
		set_nvme_slot_release(nvmeCmd->cmdSlotTag);
	else
		set_nvme_cpl(0, 0, nvmeCPL.specific, nvmeCPL.statusFieldWord);

	xil_printf("Done Admin Command OPC: %X\r\n", opc);
}

