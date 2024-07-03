//========================================================================================//
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//======================================================================================//
//--------------------------------------------------------------------------------------//
//  �������ƣ�   usb061.scs
//  ��    ��:    abin    
//  ��ϵ��ʽ��   xiaobin@sunnorth.com.cn
//  ��ӦоƬ:    SPCE061A
//  ��������:    ʵ�����㹦�ܣ�
//			     1.ͨ��USBͨѶ��PC��Ӧ�ó����ܹ�����LED�Ƶ�����
//			     2.PC��Ӧ�ó�����С��65�ֽڵ��ַ�����SPCE061A,SPCE061A����PC���͵�
//                 С��65�ֽ��ַ����󽫽��յ����ַ������͸�PC��PC�����ַ�����ʾ�ڽ��档
//				 Ӳ������:���"usbģ���û��ֲ�.doc"
//  �漰�Ŀ⣺	
//				(a) C-Lib:  CMacro.lib
//            	(b) USB-Lib: Easyusb11.lib
//  ����ļ�:
//    			 usbmain.c/ExternInt.C/
//				 isr.asm/system.asm/hardware.asm 
//     			 isr.h/hardware.h/hardware.inc
//  �������:    2003-04-03
//--------------------------------------------------------------------------------------//
//======================================================================================//
//  �ļ�����:    usbmain.c
//  ��    ����   ���ļ����������ļ���������һ�����ѭ���壬����ɨ���־���������ݱ�
//               ־������ִֵ����Ӧ�Ķ���.
//  ������ڣ�   2003/04/03
//  �漰�Ŀ⣺   Easyusb11.lib
//=====================================================================================//
#include "main.h"
#include "chap9.h"
extern void F_System_Initial(void);
extern void F_Reconnect_USB(void);
extern void F_Interrupt_On(void); 
extern void F_Control_Handler(void);
extern unsigned int F_D12_WriteEndpoint(unsigned int endp, unsigned int len, unsigned int * buf);
extern unsigned int F_D12_ReadEndpointAndClrD12Int(unsigned int endp, unsigned int len, unsigned int * buf);

extern void F_TurnOnSecondLed(void);
extern void F_TurnOffSecondLed(void);
extern void F_TurnOnFirstLed(void);
extern void F_TurnOffFirstLed(void);
extern void F_Clear_WatchDog(void);

extern EPPFLAGS bEPPflags;
extern CONTROL_TRANSFERS ControlData;

unsigned int  EpBuf[EP2_PACKET_SIZE];
unsigned int  MainEpBuf[64];
main()
{
	unsigned int uiSendDataFlag=0;
	unsigned int uiReadEp2DataLength=0;
	unsigned int aIdFlag[2];
	F_System_Initial();
	F_Reconnect_USB();  //PDIUSBD12оƬ��������
	F_Interrupt_On();   
	while(1)
	{
	    if (bEPPflags.bits.bus_reset)    //���߸�λ����
		{
		 	bEPPflags.bits.bus_reset = 0;//���־
		}   
		if (bEPPflags.bits.suspend)//���߹�����
	    {
		    bEPPflags.bits.suspend= 0;//���־
		} 
		if (bEPPflags.bits.setup_packet)//Э�鴦��
		{
			bEPPflags.bits.setup_packet = 0;//���־
			F_Control_Handler();
		}
		if(bEPPflags.bits.Ep1_ReceiveDataFlag==1)
		{
			bEPPflags.bits.Ep1_ReceiveDataFlag=0;
			F_D12_ReadEndpointAndClrD12Int(2, 2,aIdFlag);
			if(aIdFlag[0]==ID0)
			{
				F_D12_WriteEndpoint(5,1,aIdFlag);
			}
			else if(aIdFlag[0]==ID1)
			{
				if(aIdFlag[1]==1)
					F_TurnOnFirstLed();//����LED��
				if(aIdFlag[1]==0)
					F_TurnOffFirstLed();//Ϩ��LED��
				if(aIdFlag[1]==3)
					F_TurnOnSecondLed();//����LED��
				if(aIdFlag[1]==2)
					F_TurnOffSecondLed();//Ϩ��LED��
			}
			else if(aIdFlag[0]==ID2)
			{
				if(aIdFlag[1]==1)
				{
					F_D12_WriteEndpoint(5,1,aIdFlag);//Ӧ��
				}
				else if(aIdFlag[1]==2)
				{
					F_D12_WriteEndpoint(5,uiReadEp2DataLength,MainEpBuf);//��������
				}
			}
		}
		if(bEPPflags.bits.Ep1_SendDataFlag==1)
		{
			bEPPflags.bits.Ep1_SendDataFlag=0;
		}
	    if(bEPPflags.bits.Ep2_ReceiveDataFlag==1)
		{
			bEPPflags.bits.Ep2_ReceiveDataFlag = 0;//���־
			uiReadEp2DataLength=F_D12_ReadEndpointAndClrD12Int(4, 64,MainEpBuf);
		}
		if(bEPPflags.bits.Ep2_SendDataFlag==1)
		{
			bEPPflags.bits.Ep2_SendDataFlag=0;
		}
		F_Clear_WatchDog();
	} // End while
}