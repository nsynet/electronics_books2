//===============================================================
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
//==============================================================
//============================================================
//  工程名称：   KEY.spj
//  功能描述:    通过4*4键盘控制16档速度，通过外部中断进行速度步进调节
//  文件来源：   电子大赛支持
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0（or later）
//
//  涉及的库：	(a) C-Lib:  (CMacro.lib);
//
//  组成文件:
//    			 main.c
//				 Key.asm/IRQ.asm/PWM.asm    			 
//  日期:        2003-8-13
//===============================================
#define HaveKey  1
#define NoKey    0
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012  
#define		C_WDTCLR				0x0001			      //看门狗服务程序
unsigned int  KeyVal;
unsigned int  KeyDownTimes;                                //保存按键次数
unsigned int  KeyFlag;                                     //按键标识 

int main()
{	   
    SP_Init_IOA();                                        //初始化A口低字节的高四位带数据缓存器的高电平为输出口
    F_IRQ3_Init();                                        //外部中断初始化
    KeyDownTimes = 0;                                     //低四位为带下拉电阻的输入端
	KeyFlag = NoKey; 
  	while(1)
	  {	
	    *P_Watchdog_Clear=C_WDTCLR;                        //清看门狗
	    F_Key_Scan();                                      //键扫描，来自于Key.asm
	  	while(KeyFlag == HaveKey)
		{			
		  KeyVal=F_Get_Key();                              //取键值，来自于Key.asm
		  KeyFlag = NoKey;
		  switch(KeyVal)
		  {
	case 0x0:
    F_Pwm(0x0020,0x0130);                                  //PWM设置，来自于PWM.asm  
    break;
    case 0x1:
    F_Pwm(0x0020,0x00f0); 
    break;
    case 0x2:
    F_Pwm(0x0020,0x03b0);
    break;
    case 0x3:
    F_Pwm(0x0020,0x0230);
    break;
    case 0x4:
    F_Pwm(0x0028,0x0130);
    break;
    case 0x5:
    F_Pwm(0x0028,0x00f0); 
    break;
    case 0x6:
    F_Pwm(0x0028,0x01b0);
    break;
    case 0x7:
    F_Pwm(0x0028,0x03b0);
    break;
    case 0x8:
    F_Pwm(0x0010,0x0070);
    break;
    case 0x9:
    F_Pwm(0x0010,0x00f0);
    break;
    case 0xa:
    F_Pwm(0x0010,0x03b0);
    break;
    case 0xb:
    F_Pwm(0x0010,0x01b0); 
    break;
    case 0xc:
    F_Pwm(0x0008,0x0070);
    break;
    case 0xd:
    F_Pwm(0x0008,0x00f0);
    break;
    case 0xe:
    F_Pwm(0x0008,0x03b0);
    break;
    case 0xf:
    F_Pwm(0,0);
    break;
    default:
    break;
    }
	    
	  
	     }
	   
    	}
}