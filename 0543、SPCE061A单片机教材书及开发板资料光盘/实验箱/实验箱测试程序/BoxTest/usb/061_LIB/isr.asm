//====================================================================================//
// 文件名:    isr.asm
// 描  述：   该文件的程序主要用于处理SPCE061A的所有中断
// 日  期：   2003/04/03
//====================================================================================//
.public _BREAK 
.public _FIQ 
.public _IRQ0 
.public _IRQ1 
.public _IRQ2 
.public _IRQ3 
.public _IRQ4 
.public _IRQ5 
.public _IRQ6 
.public _IRQ7 

.include hardware.inc   
.external _F_USB_Isr
.TEXT

_FIQ:                  
		push R1,R4 to [sp];                
        pop R1,R4 from [sp]; 
        reti;             
     
_BREAK:        
        push R1,R4 to [sp];
        pop R1,R4 from [sp];
        reti;          
// ---------------------------------------------------------------------------
_IRQ0:        
        push R1,R4 to [sp];
        pop R1,R4 from [sp]; 
        reti;          
// ---------------------------------------------------------------------------
_IRQ1:        
		push R1,R4 to [sp]; 
        pop R1,R4 from [sp]; 
        reti;   
// ---------------------------------------------------------------------------
_IRQ2:        
        push R1,R4 to [sp]; 
        pop R1,R4 from [sp]; 
        reti;         
// ---------------------------------------------------------------------------
_IRQ3:        
   		push R1,R5 to [sp];		//压栈保护 
   		R1=0x0100; 	    
   		test R1,[P_INT_Ctrl]; 	//比较是否为IRQ3_EXT1	 
   		jnz  irq3_ext1;			//是，则转至对应程序段；
   		R1=0x0200; 	    
   		test R1,[P_INT_Ctrl]; 	//否，则比较是否为IRQ3_EXT2
   		jnz  irq3_ext2;			//是，则转至对应程序段；
 
irq3_key:		     			//否，则进入键唤醒中断
		R1=0x0080;	     
		[P_INT_Clear]=R1; 
    	jmp ExitIrq3;
irq3_ext2:	
    	R1=0x0200; 	     
    	[P_INT_Clear]=R1; 
    	jmp ExitIrq3;
irq3_ext1:
   		int off;
   		R1=0x0100; 	     
   		[P_INT_Clear]=R1; 
		R1=0x0001;
		[P_Watchdog_Clear]=R1;
   		call _F_USB_Isr;       //调用PDIUSBD12中断处理函数
   		int irq;
ExitIrq3:
   		pop R1,R5 from [sp]; 
   		reti;          
// ---------------------------------------------------------------------------
_IRQ4:        
        push R1,R4 to [sp]; 
        pop R1,R4 from [sp]; 
        reti;   
// ---------------------------------------------------------------------------
_IRQ5:        
        push R1,R4 to [sp] 
        pop R1,R4 from [sp] 
        reti          
// ---------------------------------------------------------------------------
_IRQ6:        
        push R1,R4 to [sp]; 
        pop R1,R4 from [sp]; 
        reti;          
// ---------------------------------------------------------------------------
_IRQ7:        
        push R1,R4 to [sp]; 
        pop R1,R4 from [sp]; 
        reti;          
// ---------------------------------------------------------------------------
        
