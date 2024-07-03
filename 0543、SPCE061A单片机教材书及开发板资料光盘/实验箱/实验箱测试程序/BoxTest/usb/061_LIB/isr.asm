//====================================================================================//
// �ļ���:    isr.asm
// ��  ����   ���ļ��ĳ�����Ҫ���ڴ���SPCE061A�������ж�
// ��  �ڣ�   2003/04/03
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
   		push R1,R5 to [sp];		//ѹջ���� 
   		R1=0x0100; 	    
   		test R1,[P_INT_Ctrl]; 	//�Ƚ��Ƿ�ΪIRQ3_EXT1	 
   		jnz  irq3_ext1;			//�ǣ���ת����Ӧ����Σ�
   		R1=0x0200; 	    
   		test R1,[P_INT_Ctrl]; 	//����Ƚ��Ƿ�ΪIRQ3_EXT2
   		jnz  irq3_ext2;			//�ǣ���ת����Ӧ����Σ�
 
irq3_key:		     			//�������������ж�
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
   		call _F_USB_Isr;       //����PDIUSBD12�жϴ�����
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
        
