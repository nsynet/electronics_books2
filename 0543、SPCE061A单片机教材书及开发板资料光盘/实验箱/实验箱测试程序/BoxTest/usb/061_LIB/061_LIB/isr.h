#ifndef	__ISR_H__
#define	__ISR_H__
//	write your header here
void F_Bus_Reset(void);
void F_Ep0_TxDone(void);
void F_Ep0_RxDone(void);
void F_Ep1_TxDone(void);
void F_Ep1_RxDone(void);
void F_Main_TxDone(void);
void F_Main_RxDone(void);
void F_DMA_Eot(void);
#endif
