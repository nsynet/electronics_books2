
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
.define     TIMER_DATA_FOR_8KHZ (0xffff -2457)	 // 时钟频率为Fosc/2,采样率为5kHz

.define		P_TimerA_Ctrl	0x700b 
.define		P_TimerA_Data	0x700a 
.define		P_ADC			0x7014 
.define		P_ADC_Ctrl		0x7015 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define		P_DAC_Ctrl		0x702A 
.define		P_INT_Ctrl		0x7010 
.define		P_INT_Clear		0x7011 
.external   _RF_RT

.iram
.public  _One_Flag_T ,_Originally_Data_T,_Zero_Flag_T_T,_Step_T,_First_T
.var     _Originally_Data_T =0001111101010101b 
.var     _One_Flag_T = 0 
.var     _Zero_Flag_T_T = 16
.var     _Step_T = 0,_First_T=0  

.code
.public _Rf_Transmitter
_Rf_Transmitter:
	int off; 
//	r1=0xffff; 				//A口设置为同相高电平输出
//	[P_IOA_ATTRI]=r1; 
//	[P_IOA_DIR]=r1; 
//	//r1=0x0000 ;
//	[P_IOA_DATA]=r1; 
	
//	r1=0xffff; 				//B口设置为同相高电平输出  
//   [P_IOB_DIR]=r1; 
//	[P_IOB_ATTRI]=r1; 
	//r1=0x0000;
//	[P_IOB_DATA]=r1;
    r1=0xffff
    [_RF_RT]=r1
    r1=0000000001110000b
    [P_IOB_DIR]=r1; 
    r1=0000000001010000b
    [P_IOB_ATTRI]=r1;
    r1=0000000001000000b
    [P_IOB_DATA]=r1;
	

		R1 = 0x0030; 				// 时钟频率为CLKA的Fosc/2
		[P_TimerA_Ctrl] = R1;		//
		R1 = TIMER_DATA_FOR_8KHZ; 	// 采样率为 8kHz
		[P_TimerA_Data] = R1;		//
		R1 = 0x1000;				//
		[P_INT_Ctrl] = R1;			// 开中断IRQ1_TM
		
	
		INT IRQ;
		retf
	

		

        
	    
        