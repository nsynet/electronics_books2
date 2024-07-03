
.define TIMER_DATA_FOR_8KHZ (0xffff - 1500)	 // ʱ��Ƶ��ΪFosc/2,������Ϊ8kHz

.define		P_TimerA_Ctrl	0x700b 
.define		P_TimerA_Data	0x700a 
.define		P_ADC			0x7014 
.define		P_ADC_Ctrl		0x7015 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define		P_DAC_Ctrl		0x702A 
.define		P_INT_Ctrl		0x7010 
.define		P_INT_Clear		0x7011 
.define     P_INT_Ctrl_NEW  0x702D;
.external ClearWatchDog
.CODE
.public _MicAD_DA;
_MicAD_DA: 
   		INT OFF;
		
		R1 = 0x003d;				// ����AGC 
		[P_ADC_Ctrl] = R1;			// �����Զ���ʽ����ͨ��MIC_INͨ������,
		R1 = 0x00A8;				//ͨ����ʱ��A������������ݣ�ADCΪ�Զ���ʽ
		[P_DAC_Ctrl] = R1;			
        R1=1000
   loop: 
           r2=8000  
      LOOP1:
         R3=936
      LOOP2:
         call ClearWatchDog
           	R1 = [P_ADC] 
		[P_DAC1] = R1 
		[P_DAC2] = R1 
		  R3-=1
          JNZ LOOP2
          R2-=1
          JNZ LOOP1
        JMP TurnoffTimerA;
          goto loop
    TurnoffTimerA:        
       nop
       	INT IRQ;
       	retf;
	
