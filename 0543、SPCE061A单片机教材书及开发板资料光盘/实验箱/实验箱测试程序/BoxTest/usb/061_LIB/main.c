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
//  工程名称：   usb061.scs
//  作    者:    abin    
//  联系方式：   xiaobin@sunnorth.com.cn
//  适应芯片:    SPCE061A
//  功能描述:    实现两点功能：
//			     1.通过USB通讯，PC端应用程序能够控制LED灯的亮灭；
//			     2.PC端应用程序发送小于65字节的字符串给SPCE061A,SPCE061A接收PC发送的
//                 小于65字节字符串后将接收到的字符串发送给PC，PC接收字符并显示在界面。
//				 硬件连接:详见"usb模组用户手册.doc"
//  涉及的库：	
//				(a) C-Lib:  CMacro.lib
//            	(b) USB-Lib: Easyusb11.lib
//  组成文件:
//    			 usbmain.c/ExternInt.C/
//				 isr.asm/system.asm/hardware.asm 
//     			 isr.h/hardware.h/hardware.inc
//  完成日期:    2003-04-03
//--------------------------------------------------------------------------------------//
//======================================================================================//
//  文件名称:    usbmain.c
//  描    述：   该文件是主程序文件，程序是一个大的循环体，不断扫描标志变量，根据标
//               志变量的值执行相应的动作.
//  完成日期：   2003/04/03
//  涉及的库：   Easyusb11.lib
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
	F_Reconnect_USB();  //PDIUSBD12芯片的软连接
	F_Interrupt_On();   
	while(1)
	{
	    if (bEPPflags.bits.bus_reset)    //总线复位处理
		{
		 	bEPPflags.bits.bus_reset = 0;//清标志
		}   
		if (bEPPflags.bits.suspend)//总线挂起处理
	    {
		    bEPPflags.bits.suspend= 0;//清标志
		} 
		if (bEPPflags.bits.setup_packet)//协议处理
		{
			bEPPflags.bits.setup_packet = 0;//清标志
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
					F_TurnOnFirstLed();//点亮LED灯
				if(aIdFlag[1]==0)
					F_TurnOffFirstLed();//熄灭LED灯
				if(aIdFlag[1]==3)
					F_TurnOnSecondLed();//点亮LED灯
				if(aIdFlag[1]==2)
					F_TurnOffSecondLed();//熄灭LED灯
			}
			else if(aIdFlag[0]==ID2)
			{
				if(aIdFlag[1]==1)
				{
					F_D12_WriteEndpoint(5,1,aIdFlag);//应答
				}
				else if(aIdFlag[1]==2)
				{
					F_D12_WriteEndpoint(5,uiReadEp2DataLength,MainEpBuf);//回送数据
				}
			}
		}
		if(bEPPflags.bits.Ep1_SendDataFlag==1)
		{
			bEPPflags.bits.Ep1_SendDataFlag=0;
		}
	    if(bEPPflags.bits.Ep2_ReceiveDataFlag==1)
		{
			bEPPflags.bits.Ep2_ReceiveDataFlag = 0;//清标志
			uiReadEp2DataLength=F_D12_ReadEndpointAndClrD12Int(4, 64,MainEpBuf);
		}
		if(bEPPflags.bits.Ep2_SendDataFlag==1)
		{
			bEPPflags.bits.Ep2_SendDataFlag=0;
		}
		F_Clear_WatchDog();
	} // End while
}