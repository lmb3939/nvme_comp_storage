/*
 * dma_operation.h

 *
 *  Created on: Mar 24, 2020
 *      Author: giuseppezynq
 */

#ifndef DMA_OPERATION_H_
#define DMA_OPERATION_H_

#include "xaxidma.h"

void DMATransfer(XAxiDma *DMAInstance, u8 *Data_TxBufferPtr, u8 *Data_RxBufferPtr, u8 *Spare_TxBufferPtr, u8 *Spare_RxBufferPtr);
void DMATransferRaw(XAxiDma *DMAInstance, u8 *Data_TxBufferPtr, u8 *Data_RxBufferPtr);
void Void_operation();
#endif /* DMA_OPERATION_H_ */
