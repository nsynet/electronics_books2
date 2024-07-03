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
//  �������ƣ�   KEY.spj
//  ��������:    ͨ��4*4���̿���16���ٶȣ�ͨ���ⲿ�жϽ����ٶȲ�������
//  �ļ���Դ��   ���Ӵ���֧��
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0��or later��
//
//  �漰�Ŀ⣺	(a) C-Lib:  (CMacro.lib);
//
//  ����ļ�:
//    			 main.c
//				 Key.asm/IRQ.asm/PWM.asm    			 
//  ����:        2003-8-13
//===============================================
#define HaveKey  1
#define NoKey    0
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012  
#define		C_WDTCLR				0x0001			      //���Ź��������
unsigned int  KeyVal;
unsigned int  KeyDownTimes;                                //���水������
unsigned int  KeyFlag;                                     //������ʶ 

int main()
{	   
    SP_Init_IOA();                                        //��ʼ��A�ڵ��ֽڵĸ���λ�����ݻ������ĸߵ�ƽΪ�����
    F_IRQ3_Init();                                        //�ⲿ�жϳ�ʼ��
    KeyDownTimes = 0;                                     //����λΪ����������������
	KeyFlag = NoKey; 
  	while(1)
	  {	
	    *P_Watchdog_Clear=C_WDTCLR;                        //�忴�Ź�
	    F_Key_Scan();                                      //��ɨ�裬������Key.asm
	  	while(KeyFlag == HaveKey)
		{			
		  KeyVal=F_Get_Key();                              //ȡ��ֵ��������Key.asm
		  KeyFlag = NoKey;
		  switch(KeyVal)
		  {
	case 0x0:
    F_Pwm(0x0020,0x0130);                                  //PWM���ã�������PWM.asm  
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