
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
.define		P_ADC_CTRL		0x7015 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define		P_DAC_Ctrl		0x702A 
.define		P_INT_CTRL		0x7010 
.define		P_INT_CLEAR		0x7011 


.iram
//.public  One_Flag 
.var     Originally_Data =0001111101010101b 
.var     One_Flag = 0 
.var     Zero_Flag = 16
.var     Step = 0,first=0  

.code
.public _main
_main:
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
    r1=0000000001110000b
    [P_IOB_DIR]=r1; 
    r1=0000000001010000b
    [P_IOB_ATTRI]=r1;
    r1=0000000001000000b
    [P_IOB_DATA]=r1;
	

	 R1 = 0x0040;				//开中断IRQ4_4KHz、IRQ4_2KHz和IRQ4_1KHz;
	[P_INT_CTRL] = R1;
	
		INT IRQ;
		
	
loop:
 
	nop;
	nop;
	nop;
	jmp loop;



.text
.PUBLIC _IRQ4
_IRQ4:       
	PUSH R1,R5 TO [sp]		//压栈保护；
	R1 = 0x0010;
	test R1,[P_INT_CTRL];	//比较是否为1KHz的中断源；
	JNZ L_irq4_1k;			//是，则转至对应程序段；
	R1 = 0x0020;				
	TEST R1,[P_INT_CTRL]    //否，则比较是否为2KHz的中断源；	 
	JNZ L_irq4_2k;			//是，则转至对应程序段；
L_irq4_4k:                  //否，则进入4KHz程序段；
	    r1=[Originally_Data]
       r1=r1 ror 1
       [Originally_Data]=r1
    
       r2=0000000000000001b
       r1=r1&R2
   
       test r1,0x0001
//       test r1,0000000000010000b
       jz _step0
       r1=0000000001010000b
       [P_IOB_DATA]=r1;
       
       
	
    R1 = 0x0040;	     
	[P_INT_CLEAR] = R1;
    POP R1,R5 FROM [sp]
    RETI;    	
L_irq4_2k:
   
    R1 = 0x0020;	     
	[P_INT_CLEAR] = R1;
    POP R1,R5 FROM [sp]
    RETI	
L_irq4_1k:

    R1 = 0x0010;	     
	[P_INT_CLEAR] = R1;
    POP R1,R5 FROM [sp]
    RETI
		
   
 
 
 _step0:
		r1=0000000001000000b
//	   r1=0x0000
	    [P_IOB_DATA]=r1;
    R1 = 0x0040;	     
	[P_INT_CLEAR] = R1;
    POP R1,R5 FROM [sp]
    RETI;    	
		

        
	    
        