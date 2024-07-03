//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//               (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                             ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� wakeup_externInterrupt.scs
//  ��������:  ͨ��Ϩ��ͬ�������������ʾB������Ĳ�ͬ��ֵ��
//     Ŀ�ģ�ͨ���˷�����ͬѧ�Ǳ������û����жϿ�������ⲿ�жϵĹ��ܣ��˷�������8���൱���ⲿ�жϵĹ���
//  Ӳ�����ӣ�1�����̽�A�ڵͰ�λ
//	          2��LED��B�ڵͰ�λ
//	    
//  
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//      isr.asm
//     
//  ����:          2003-8-7
//===============================================

//============================================================
// �ļ����ƣ�main.asm// 
// ʵ�ֹ���: ͨ���ж�Ϩ���Ӧ��������ܱ������������жϵĽ���
//	     1�����̽�A�ڵͰ�λ
//	     2��LED��B�ڵͰ�λ
// ���ڣ� 2003-8-7
//============================================================


.INCLUDE hardware.inc;					        
.CODE

//============================================================= 
// ��������:    _main	
// �﷨��ʽ:   ��
//��ڲ���:     ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
.DEFINE  P_IOA_RL                  0x7004;
.DEFINE  C_WakeUp_IRQ3             0x0080   
.dEFINE  C_ClearWatchDog           0x0001
.PUBLIC _main;						
_main:
		CALL L_User_Init_IO;		    //��ʼ��IO��	
	    r1 = C_WakeUp_IRQ3;             //�����жϳ�ʼ��
	    [P_INT_Ctrl] = r1;              
	    int irq;                        //���ж�ָ��
	    r1 = [P_IOA_RL];                //����IOA0--7��״̬
L_MainLoop:       
   		r1=C_ClearWatchDog;             //�忴�Ź�
	   	[P_Watchdog_Clear]=r1;		       				
	    jmp	L_MainLoop;	                
	
L_User_Init_IO:
		r1 = 0x0000;			        //��A��Ϊ���������������
        [P_IOA_Dir] = r1;			
        [P_IOA_Attrib] = r1;
        r1 = 0xffff
        [P_IOA_Data] = r1;
        r1 = 0xffff;				    //��B��Ϊͬ��ߵ�ƽ���
        [P_IOB_Dir] = r1;			  
        [P_IOB_Attrib] = r1;			
        r1 = 0xffff;
        [P_IOB_Data] = r1; 
		RETF;	

.END

     