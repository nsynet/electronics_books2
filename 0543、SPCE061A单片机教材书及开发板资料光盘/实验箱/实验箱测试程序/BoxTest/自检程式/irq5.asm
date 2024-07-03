.define     P_System_Clock  0x7013
.define		P_INT_CTRL		0x7010;
.define 	P_INT_CTRL_NEW	0x702D;
.define		P_INT_CLEAR		0x7011;
.define		P_IOB_DATA  	0x7005;
.define		P_IOB_DIR   	0x7007;
.define		P_IOB_ATTRI		0x7008;
.external ClearWatchDog
.external _keyfind;
.external R_InterruptStatus
.include	S480.inc
.include	Resource.inc
.external   _RF_RT,Originally_Data,Originally_Data1,Originally_Data2,Originally_Data3
.external  One_Flag ,_Zero_Flag_R,_Step_R,_First_R,__Last_R,Step,first,_Last
.external  _Originally_Data_T,_One_Flag_T,_Zero_Flag_T_T,_Step_T,_First_T
.RAM

.code
.public _Initirq5
_Initirq5:
	int off 
//	r1=0x0098
 //   [P_System_Clock]=r1
//	r1=[R_InterruptStatus]
//	r1|=0x8			    //开中断IRQ5_4Hz和IRQ5_2Hz
    r1=0x0008
    [R_InterruptStatus]=r1
	[P_INT_CTRL]=r1 
	[P_INT_CTRL_NEW]=r1 
	R1=0 
	call ClearWatchDog
	int	irq 
    retf;
 .public _SP_INT_64Hz
.public F_SP_INT_64Hz;
 _SP_INT_64Hz:
 F_SP_INT_64Hz:
     irq off
     R1 = 0x0003;
     [P_TimeBase_Setup]=r1
     r1 = [P_INT_CTRL_NEW]
     r1 |= 0x0002 						//开中断IRQ6_TMB1和IRQ6_TMB2
	 [P_INT_CTRL_NEW]= r1 
     call ClearWatchDog
	 int IRQ
     irq on
     retf;
     
 .public _Turnoff_INT_64Hz;
 _Turnoff_INT_64Hz: 
    irq off
    r1 = [P_INT_CTRL_NEW]
	r1 &= 0xfffd;
	[P_INT_CTRL_NEW] = r1;
    call ClearWatchDog
    irq on
     retf;     
.public T_SACM_S480_SpeechTable;
T_SACM_S480_SpeechTable: 
.dw _RES_1_48K_SA //0  检测 
.dw _RES_2_48K_SA //1 完毕
.dw _RES_3_48K_SA //2 模式
.dw _RES_4_48K_SA //3 没通过
.dw _RES_5_48K_SA //4  成功
.dw _RES_6_48K_SA //5  LCD
.dw _RES_7_48K_SA //6  SLEEP
.dw _RES_8_48K_SA //7  8*8点阵
.dw _RES_9_48K_SA //8  SIO
.dw _RES_10_48K_SA //9  4*4键盘
.dw _RES_11_48K_SA //10 6位LED检测
.dw _RES_12_48K_SA //11 1*8案键
.dw _RES_13_48K_SA //12 
.dw _RES_14_48K_SA //13  发光二极管
.dw _RES_15_48K_SA //14  io
.dw _RES_01_48K_SA //15  欢迎进入自检模式  
.dw _RES_16_48K_SA //16  ok
.dw _RES_08_48K_SA //17  uart
//****************************************************************
// Function: Fast Interrupt Service routine Area                     
//      Service for     (1)PWM FIQ
//                      (2)Timer A FIQ
//                      (3)Timer B FIQ
//      User's FIQ must hook on here                            
//  _FIQ:                            // Fast interrupt entrence
//  _IRQ1:                           // interrupt entrence
//  _IRQ2:                           // interrupt entrence
//  _IRQ3:                           // interrupt entrence
//  _IRQ4:                           // interrupt entrence
//  _IRQ5:                           // interrupt entrence
//  _IRQ6:                           // interrupt entrence     
//  _IRQ7:                           // interrupt entrence
//****************************************************************
.public _BREAK 
.public _FIQ 
.public _IRQ0 
.public _IRQ1

.public _IRQ2 
//.public _IRQ3 
.public _IRQ4 
.public _IRQ5 
.public _IRQ6 
.public _IRQ7 

.include hardware.inc               // include hardware information
.include dvr.inc 

.TEXT
/////////////////////////////////////////////////////////////////////////////////////////
// Function: Fast Interrupt Service routine Area                     
////////////////////////////////////////////////////////////////////////////////////////

//_FIQ:                  
//		push r1,r5 to [sp]                
 //       call    F_FIQ_Service_SACM_DVR  // for playback
  //      r1 = C_FIQ_TMA
  //      [P_INT_Clear] = r1
  //      pop r1,r5 from [sp] 
  //      reti    
  _FIQ:
	PUSH	r1,r5 to [sp];
	r1=0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1=0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1=C_FIQ_PWM;
	[P_INT_Clear]=r1;
	POP R1,R5 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear]=r1;
   // call    F_FIQ_Service_SACM_DVR; //语音播放中断
	call F_FIQ_Service_SACM_S480;
	pop r1,r5 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear]=r1;
	pop r1,r5 from [sp];
	reti;         
/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area                     
//      Service for     IRQ1 - IRQ7
//      User's IRQ must hook on here                                 
/////////////////////////////////////////////////////////////////////////////////////////        
_BREAK:        
        push r1,r4 to [sp] 
        pop r1,r4 from [sp] 
        reti          
// ---------------------------------------------------------------------------
_IRQ0:        
        push r1,r4 to [sp] 
        pop r1,r4 from [sp] 
        reti          
// ---------------------------------------------------------------------------
_IRQ1:        
   		push R1 to [SP]
		pop R1 from [SP] 
		reti 	    
          
        
  
  
_IRQ2:        
        push r1,r4 to [sp] 
        pop r1,r4 from [sp] 
        reti          
// ---------------------------------------------------------------------------
//_IRQ3:        
//        push r1,r4 to [sp] 
        
//        pop r1,r4 from [sp] 
 //       reti          
// ---------------------------------------------------------------------------
_IRQ4:       
	PUSH R1,R5 TO [sp]		//压栈保护；
	R1 = 0x0010;
	test R1,[P_INT_CTRL];	//比较是否为1KHz的中断源；
	JNZ L_irq4_1k;			//是，则转至对应程序段；
	R1 = 0x0020;				
	TEST R1,[P_INT_CTRL]    //否，则比较是否为2KHz的中断源；	 
	JNZ L_irq4_2k;			//是，则转至对应程序段；
L_irq4_4k:                  //否，则进入4KHz程序段；
	   r1=[P_IOB_DATA];
       r2=0000000000100000b
       r2=r2&R1
       r2=r2 ror 4
       r2=r2 ror 2
       r1=[One_Flag]
       r1=r1 rol 1
       [One_Flag]=r1
        r1=r1&0xff00 
       call ClearWatchDog
       cmp r1,0xaa00
       je _step0
        R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
 _step0:
        call ClearWatchDog
        r1=[first]
        cmp r1,0
        je loop1
         cmp r1,1
        je loop2
         cmp r1,2
        je loop3
        cmp r1,3
        je loop4
L_irq4_2k:
     R1 = 0x0020;	     
	[P_INT_Clear] = R1;
    POP R1,R5 FROM [sp]
    RETI	
L_irq4_1k:
    
    R1 = 0x0010;	     
	[P_INT_Clear] = R1;
    POP R1,R5 FROM [sp]
    RETI   
        
  loop1:
       
       r1=[One_Flag]
        [Originally_Data]=r1
        r1=0xffff
         [One_Flag]=r1
         r1=1
        [first]=r1
        R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
   loop2:
    call ClearWatchDog
		r1=[One_Flag]
        [Originally_Data1]=r1
        r1=0xffff
         [One_Flag]=r1
         r1=2
         [first]=r1
   
        R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
	loop3:
 
		r1=[One_Flag]
        [Originally_Data2]=r1
        r1=0xffff
         [One_Flag]=r1
         r1=3
         [first]=r1
          R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
	loop4:
 call ClearWatchDog
		r1=[One_Flag]
        [Originally_Data3]=r1
        r1=[Originally_Data]
        r2=[Originally_Data1]
       
        cmp r1,r2
        je cmp2
   
        r1=0xffff
         [One_Flag]=r1
         r1=0
         [first]=r1
          R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
 cmp2:
  call ClearWatchDog
      r1=[Originally_Data1]
        r2=[Originally_Data2]
       cmp r1,r2
         je cmp3
         r1=0xffff
         [One_Flag]=r1
         r1=0
         [first]=r1
          R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
 
 cmp3: 
  call ClearWatchDog
      r1=[Originally_Data2]
        r2=[Originally_Data3]
       cmp r1,r2
         je  lasttt
        r1=0xffff
         [One_Flag]=r1
         r1=0
         [first]=r1
          R1 = 0x0040
		[P_INT_Clear] = R1 
		POP R1,R5 FROM [sp]
		reti 
lasttt:
 call ClearWatchDog
    r1=[Originally_Data2]
    [_Last]=r1
    R1 = 0x0040;	     
	[P_INT_Clear] = R1;
    POP R1,R5 FROM [sp]
    RETI;    	
        
// ---------------------------------------------------------------------------
_IRQ5:                        //定时3秒的中断程序
	push r1,r4 to [sp];

	r1 =0x0008;						 
	test r1,[P_INT_Ctrl];				
	jnz	L_4Hz;				   // Timer A FIQ entrence 	

	r1 = 0x0004;
    [P_INT_Clear] = r1;        //清中断
    
   
    
  
    pop r1,r4 from [sp];
    reti; 



L_4Hz:  
     
      R1 =  0x0008
	  [P_INT_Clear] = R1 	
 	  
    pop r1,r4 from [sp];
    reti; 

// ---------------------------------------------------------------------------
     
_IRQ6:        
	
		push r1,r4 to [sp];
		r1=0x0001;
		test r1,[P_INT_Ctrl];
		jnz  _IRQ6_TMB2;
		r1=0x0002;
		[P_INT_Clear]=r1;

		pop r1,r4 from [sp];
        reti;    
             
_IRQ6_TMB2:
		[P_INT_Clear]=r1;
	
		pop r1,r4 from [sp];
        reti;  
// ---------------------------------------------------------------------------
_IRQ7:        
        push r1,r4 to [sp] 
        pop r1,r4 from [sp] 
        reti          
// ---------------------------------------------------------------------------
        
