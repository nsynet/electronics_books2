//====================================================================================//
// 文件名:    ExterInt.asm
// 描  述：   该文件的程序主要用于处理PDIUSBD12中断
// 日  期：   2003/04/03
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
// 函数：    F_USB_Isr
// 语法：    void F_USB_Isr(void)
// 描述：    PDIUSBD12中断的各个中断源的处理
// 参数：    无
// 返回：    无
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
// 函数：    F_DMA_Eot
// 语法：    void F_DMA_Eot(void)
// 描述：    PDIUSBD12的DMA处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_DMA_Eot(void)
{
}
//=====================================================================
// 函数：    F_Ep0_RxDone
// 语法：    void F_Ep0_RxDone(void)
// 描述：    端点0，接收数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Ep0_RxDone(void)
{
	ep_last = F_D12_ReadLastTransactionStatus(0); // Clear interrupt flag
	F_Ep0_RxDone_Detail();
}
//=====================================================================
// 函数：    F_Ep0_TxDone
// 语法：    void F_Ep0_TxDone(void)
// 描述：    端点0，发送数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Ep0_TxDone(void)
{
    
	F_D12_ReadLastTransactionStatus(1);
	F_Ep0_TxDone_Detail();

}
//=====================================================================
// 函数：    F_Ep1_TxDone
// 语法：    void F_Ep1_TxDone(void)
// 描述：    端点1，发送数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Ep1_TxDone(void)
{
	bEPPflags.bits.Ep1_SendDataFlag=1;
	F_D12_ReadLastTransactionStatus(3); //Clear interrupt flag
}
//=====================================================================
// 函数：    F_Ep1_RxDone
// 语法：    void F_Ep1_RxDone(void)
// 描述：    端点1，接收数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Ep1_RxDone(void)
{
	bEPPflags.bits.Ep1_ReceiveDataFlag=1;
	//F_D12_ReadLastTransactionStatus(2); // Clear interrupt flag 
}

//=====================================================================
// 函数：    F_Main_TxDone
// 语法：    void F_Main_TxDone(void)
// 描述：    端点1，发送数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Main_TxDone(void)
{
	bEPPflags.bits.Ep2_SendDataFlag=1;
	F_D12_ReadLastTransactionStatus(5); // Clear D12 interrupt flag 
}
//=====================================================================
// 函数：    F_Main_RxDone
// 语法：    void F_Main_RxDone(void)
// 描述：    端点2，接收数据处理
// 参数：    无
// 返回：    无
//=====================================================================
void F_Main_RxDone(void)
{
	//F_D12_ReadLastTransactionStatus(4); /* Clear interrupt flag */
	//len = F_D12_ReadEndpoint(4,sizeof(MainEpBuf),MainEpBuf);
	bEPPflags.bits.Ep2_ReceiveDataFlag=1;
}
