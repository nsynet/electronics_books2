//****************************************************************
// Function: Fast Interrupt Service routine Area                     
// 	Service for 	(1)PWM FIQ
//					(2)Timer A FIQ
//					(3)Timer B FIQ
// 	User's FIQ must hook on here                            
// 	_FIQ:									// Fast interrupt entrence
//  _IRQ1:									// interrupt entrence
//  _IRQ2:									// interrupt entrence
//  _IRQ3:									// interrupt entrence
//  _IRQ4:									// interrupt entrence
//  _IRQ5:									// interrupt entrence
//  _IRQ6:									// interrupt entrence     
//  _IRQ7:									// interrupt entrence
//****************************************************************
.TEXT
.include hardware.inc				// include io information

.include	S480.inc
.include	Resource.inc
.public _BREAK;
//.public _FIQ;
.public	_IRQ0;
//.public _IRQ1;
.public _IRQ2;
//.public _IRQ3;
.public _IRQ4;
.public _IRQ5;
.public _IRQ6;
.public _IRQ7;

   
.external _sum;
.external _INTflag;
          
.public	_FIQ;
_FIQ:
	PUSH	r1,r4 to [sp];
	r1=0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1=0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1=C_FIQ_PWM;
	[P_INT_Clear]=r1;
	POP R1,R4 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear]=r1;
	call F_FIQ_Service_SACM_S480;
	pop r1,r4 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear]=r1;
	pop r1,r4 from [sp];
	reti;
	 

/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area                     
// 	Service for 	IRQ1 - IRQ7
// 	User's IRQ must hook on here                                 
/////////////////////////////////////////////////////////////////////////////////////////  
_BREAK:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  
     
_IRQ0:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  

//_IRQ1:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  
        
_IRQ2:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;         
        
//_IRQ3:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;         
        
_IRQ4:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  
//////////////////////////////        
_IRQ5:                        //定时3秒的中断程序
	push r1,r4 to [sp];

	r1 =0x0008;						 
	test r1,[P_INT_Ctrl];				
	jnz	L_4Hz;				   // Timer A FIQ entrence 	

	r1 = 0x0004;
    [P_INT_Clear] = r1;        //清中断
    
    r1 = [_sum]                 //取时基信号量     
    r1 += 1;
    cmp r1,6;
    je loop0;
    
    [_sum]=r1              //保存时基信号量
    pop r1,r4 from [sp];
    reti; 

loop0: 
    r1 = 0x0001;
    [_INTflag] = r1;      //设置中断标识
    r1 = 0
    [_sum] = r1

	pop r1,r4 from [sp];
    reti;     

L_4Hz:  
 	r1 = 0x0008;
    [P_INT_Clear] = r1;   //清中断
    pop r1,r4 from [sp];
    reti; 

//////////////////////////////
_IRQ6:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;         
        
_IRQ7:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;

//========================================================================================        
// End of isr.asm
//========================================================================================
        