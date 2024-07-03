//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//               (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                             ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： wakeup_externInterrupt.scs
//  功能描述:  通过熄灭不同发光二极管来显示B口输出的不同数值。
//     目的：通过此范例向同学们表明利用唤醒中断可以完成外部中断的功能，此范例给出8种相当于外部中断的功能
//  硬件连接：1）键盘接A口低八位
//	          2）LED接B口低八位
//	    
//  
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.asm
//      isr.asm
//     
//  日期:          2003-8-7
//===============================================

//============================================================
// 文件名称：main.asm// 
// 实现功能: 通过中断熄灭对应发光二极管表明触键唤醒中断的进入
//	     1）键盘接A口低八位
//	     2）LED接B口低八位
// 日期： 2003-8-7
//============================================================


.INCLUDE hardware.inc;					        
.CODE

//============================================================= 
// 函数名称:    _main	
// 语法格式:   无
//入口参数:     无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
.DEFINE  P_IOA_RL                  0x7004;
.DEFINE  C_WakeUp_IRQ3             0x0080   
.dEFINE  C_ClearWatchDog           0x0001
.PUBLIC _main;						
_main:
		CALL L_User_Init_IO;		    //初始化IO口	
	    r1 = C_WakeUp_IRQ3;             //唤醒中断初始化
	    [P_INT_Ctrl] = r1;              
	    int irq;                        //开中断指令
	    r1 = [P_IOA_RL];                //锁存IOA0--7的状态
L_MainLoop:       
   		r1=C_ClearWatchDog;             //清看门狗
	   	[P_Watchdog_Clear]=r1;		       				
	    jmp	L_MainLoop;	                
	
L_User_Init_IO:
		r1 = 0x0000;			        //设A口为带上拉电阻的输入
        [P_IOA_Dir] = r1;			
        [P_IOA_Attrib] = r1;
        r1 = 0xffff
        [P_IOA_Data] = r1;
        r1 = 0xffff;				    //设B口为同相高电平输出
        [P_IOB_Dir] = r1;			  
        [P_IOB_Attrib] = r1;			
        r1 = 0xffff;
        [P_IOB_Data] = r1; 
		RETF;	

.END

     