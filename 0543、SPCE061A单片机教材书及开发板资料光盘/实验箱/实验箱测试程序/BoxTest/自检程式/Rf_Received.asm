
.define		P_IOA_DATA  	0x7000;
.define		P_IOA_DIR   	0x7002;
.define		P_IOA_ATTRI 	0x7003;
.define		P_IOB_DATA  	0x7005;
.define		P_IOB_DIR   	0x7007;
.define		P_IOB_ATTRI		0x7008;


.define		P_TimerB_Data	0x700C;
.define		P_TimerB_Ctrl	0x700D;
.define		timea_clk		0x020d; 
.define		timeb_clk		0x0004;
.define     TIMER_DATA_FOR_8KHZ (0xffff - 2424)	 // 时钟频率为Fosc/2,采样率为5kHz

.define		P_TimerA_Ctrl	0x700b 
.define		P_TimerA_Data	0x700a 
.define		P_ADC			0x7014 
.define		P_ADC_Ctrl		0x7015 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define		P_DAC_Ctrl		0x702A 
.define		P_INT_Ctrl		0x7010 
.define		P_INT_Clear		0x7011 


.iram
.public  Originally_Data,Originally_Data1,Originally_Data2,Originally_Data3
.public  One_Flag,Step,first,_Last
.var     Originally_Data =0x0000,Originally_Data1,Originally_Data2,Originally_Data3
.var     One_Flag = 0x0000 
.var     Zero_Flag = 16
.var     Step = 0,first=0,_Last=0 
.external R_InterruptStatus
.code
.public _Rf_Received
_Rf_Received:
	
  int off; 

    r1=0000000001010000b
    [P_IOB_DIR]=r1; 
    r1=0000000001110000b
    [P_IOB_ATTRI]=r1;
    r1=0000000000010000b
    [P_IOB_DATA]=r1;
	

	R1 = 0x0040;			
	[P_INT_Ctrl] = R1;
		
	
		INT IRQ;
	
		retf
		
	
