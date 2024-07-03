//====================================================================================//
// �ļ���:    ExterInt.asm
// ��  ����   ���ļ��ĳ�����Ҫ���ڴ���PDIUSBD12�ж�
// ��  �ڣ�   2003/04/03
//====================================================================================//
#include "D12CI.h"
#include "chap9.h"
extern CONTROL_TRANSFERS ControlData;
extern void F_Ep0_RxDone_Detail(void);
extern void F_Ep0_TxDone_Detail(void);
extern EPPFLAGS bEPPflags;

void F_USB_Isr(void);
void F_Ep0_TxDone(void);
void F_Ep0_RxDone(void);
void F_Ep1_TxDone(void);
void F_Ep1_RxDone(void);
void F_Main_TxDone(void);
void F_Main_RxDone(void);
void F_DMA_Eot(void);
unsigned int  i_st;
unsigned int ep_last;
//=====================================================================
// ������    F_USB_Isr
// �﷨��    void F_USB_Isr(void)
// ������    PDIUSBD12�жϵĸ����ж�Դ�Ĵ���
// ������    ��
// ���أ�    ��
//=====================================================================

void F_USB_Isr(void)
{
	bEPPflags.bits.in_isr = 1;
	i_st = F_D12_ReadInterruptRegister();
	if(i_st != 0)
	{
		if(i_st & D12_INT_BUSRESET)      
		{
			bEPPflags.bits.bus_reset = 1;
		}
		if(i_st & D12_INT_EOT) 
		{
			F_DMA_Eot();
		}
		if(i_st & D12_INT_SUSPENDCHANGE)
		{
			bEPPflags.bits.suspend = 1;
		}
		if(i_st & D12_INT_ENDP0IN)   
		{
		 	F_Ep0_TxDone();
		}
		if(i_st & D12_INT_ENDP0OUT)    
		{
			F_Ep0_RxDone();
		}
			
		if(i_st & D12_INT_ENDP1IN)
		{
			F_Ep1_TxDone();
		}
		if(i_st & D12_INT_ENDP1OUT)
		{
			F_Ep1_RxDone();
		}
		if(i_st & D12_INT_ENDP2IN)
		{
			F_Main_TxDone();
		}
		
		if(i_st & D12_INT_ENDP2OUT)
		{
			F_Main_RxDone();
		}
	}
	bEPPflags.bits.in_isr = 0;
}
//=====================================================================
// ������    F_DMA_Eot
// �﷨��    void F_DMA_Eot(void)
// ������    PDIUSBD12��DMA����
// ������    ��
// ���أ�    ��
//=====================================================================
void F_DMA_Eot(void)
{
}
//=====================================================================
// ������    F_Ep0_RxDone
// �﷨��    void F_Ep0_RxDone(void)
// ������    �˵�0���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Ep0_RxDone(void)
{
	ep_last = F_D12_ReadLastTransactionStatus(0); // Clear interrupt flag
	F_Ep0_RxDone_Detail();
}
//=====================================================================
// ������    F_Ep0_TxDone
// �﷨��    void F_Ep0_TxDone(void)
// ������    �˵�0���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Ep0_TxDone(void)
{
    
	F_D12_ReadLastTransactionStatus(1);
	F_Ep0_TxDone_Detail();

}
//=====================================================================
// ������    F_Ep1_TxDone
// �﷨��    void F_Ep1_TxDone(void)
// ������    �˵�1���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Ep1_TxDone(void)
{
	bEPPflags.bits.Ep1_SendDataFlag=1;
	F_D12_ReadLastTransactionStatus(3); //Clear interrupt flag
}
//=====================================================================
// ������    F_Ep1_RxDone
// �﷨��    void F_Ep1_RxDone(void)
// ������    �˵�1���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Ep1_RxDone(void)
{
	bEPPflags.bits.Ep1_ReceiveDataFlag=1;
	//F_D12_ReadLastTransactionStatus(2); // Clear interrupt flag 
}

//=====================================================================
// ������    F_Main_TxDone
// �﷨��    void F_Main_TxDone(void)
// ������    �˵�1���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Main_TxDone(void)
{
	bEPPflags.bits.Ep2_SendDataFlag=1;
	F_D12_ReadLastTransactionStatus(5); // Clear D12 interrupt flag 
}
//=====================================================================
// ������    F_Main_RxDone
// �﷨��    void F_Main_RxDone(void)
// ������    �˵�2���������ݴ���
// ������    ��
// ���أ�    ��
//=====================================================================
void F_Main_RxDone(void)
{
	//F_D12_ReadLastTransactionStatus(4); /* Clear interrupt flag */
	//len = F_D12_ReadEndpoint(4,sizeof(MainEpBuf),MainEpBuf);
	bEPPflags.bits.Ep2_ReceiveDataFlag=1;
}
