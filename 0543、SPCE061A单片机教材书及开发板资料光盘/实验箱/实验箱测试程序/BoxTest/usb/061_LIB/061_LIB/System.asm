//====================================================================================//
// �ļ���:    system.asm
// ��  ����   ���ļ��ĳ�����Ҫ���ڳ�ʼ��SPCE061A��PDIUSBD12���Լ���PDIUSBD12�Ķ�д����
// ��  �ڣ�   2003/04/03
//====================================================================================//
.include hardware.inc; 
//for led
.public _F_TurnOnFirstLed
.public _F_TurnOffFirstLed
.public _F_TurnOnSecondLed
.public _F_TurnOffSecondLed
//for d12
.public _F_InitWriteD12
.public _F_InitReadD12
.public _F_ReadD12 
.public _F_WriteCmdOrDataToD12
//for system
.public _F_System_Initial
.public _F_Interrupt_On
.public _F_Delay
.public _F_Interrupt_Off

.define Fosc_CLK_RATE 	FoscCLK_49      //ѡ��ͬFosc�ź�Ƶ��
.define CPU_CLK_RATE    CPUCLK_Fosc  	//�ı�CPUClkƵ��

.code 	
//====================================================================
// ��  ��:    F_System_Initial()
// ��  ��:    void F_System_Initial(void) (for c)
// ��  ��:    �ú������ڳ�ʼ��SPCE061A���жϡ�ʱ�ӡ�I/0����λPDIUSBD12
//			  ��ʼ��:
//			  IOB0,IOB1Ϊͬ��ߵ�ƽ���
//			  IOB2=INT_N��1Ϊ���������������
//			  IOB3=RESET_N=1Ϊͬ��ߵ�ƽ���
//            IOB8=CS_N=1ͬ��ߵ�ƽ���
//            IOB6=ALE=0ͬ��͵�ƽ���
//			  IOB5=WR_N=1Ϊͬ��ߵ�ƽ���
//			  IOB4=RD_N=1Ϊͬ��ߵ�ƽ���
// ��  ����   ��  
// ����ֵ��   ��
//=====================================================================
_F_System_Initial: .PROC
	    PUSH r1,r1 TO [sp];
	    INT OFF;
	    r1=0x0100; 				//���ж�IRQ3_EXT1
	    [P_INT_Ctrl]=r1; 
	    //[P_INT_Ctrl_New]=r1; 
	    r1=Fosc_CLK_RATE;       //
		r1|=CPU_CLK_RATE;       //����ϵͳʱ��      	
	    [P_SystemClock]=r1;	
	    
	    r1=0xFFFF;				//����IOAΪͬ��ߵ�ƽ���
	    [P_IOA_Dir]=r1;
	    [P_IOA_Attrib]=r1;
	    [P_IOA_Data]=r1;
	   	r1=0xFFF0;				//����IOB�ĸ�12λΪͬ��ߵ�ƽ���������λΪ��������
	    [P_IOB_Dir]=r1;
	    [P_IOB_Attrib]=r1;
	    r1=0xFFFF;
	    [P_IOB_Data]=r1;
	    CALL _F_USB_Io_Initial;   
	    POP r1,r1 FROM [sp];
	   	RETF; 
		.ENDP;
		
_F_USB_Io_Initial: .PROC

		PUSH r1,r1 TO [sp];
		
		r1 = [P_IOA_Dir];
		r1&=0x00FF; 
		[P_IOA_Dir]=r1;
		
		r1=[P_IOA_Attrib];
		r1&=0x00FF;				//����IOA8-IOA15Ϊ���������������
		[P_IOA_Attrib]=r1;
		
		r1=[P_IOA_Buffer];
		r1|=0xFF00;            
		[P_IOA_Buffer]=r1; 
	
		r1=[P_IOB_Dir];//IOB8�������IOB6�������IOB5��IOB4�����,IOB3�������IOB2�������롣
		r1|=0x0178;
		r1&=0xFFFD;
		[P_IOB_Dir]=r1;
		
		r1=[P_IOB_Attrib];
		r1|=0x0178;
		r1&=0xFFFD;
		[P_IOB_Attrib]=r1;
		
		r1=[P_IOB_Buffer];//IOB8=CS_N=0,IOB6=ALE=0,IOB5=WR_N=1,IOB4=RD_N=1,IOB3=RESET_N=0,IOB2=1
		r1|=0x0034; 
		R1&=0xFEF7;            
	    [P_IOB_Buffer]=r1;     

	    call F_Delay;//ϵͳ��λ��ʱ��
	    
	    r1=[P_IOB_Buffer];//IOB8=CS_N=0,IOB6=ALE=0,IOB5=WR_N=1,IOB4=RD_N=1,IOB3=RESET_N=0,IOB2=1
	    r1|=0x003C; 
		R1&=0xFEFF;            
	    [P_IOB_Buffer]=r1;

		POP  r1,r1 FROM [sp];
		RETF
		.ENDP
//====================================================================
// ��  ��:    	F_Interrupt_On()
// ��  ��:    	void F_Interrupt_On(void) (for c)
// ��  ��:    	���жϺ���
// ��  ����   	��  
// ����ֵ��		��
// ʹ�üĴ�����	��
//=====================================================================

_F_Interrupt_On: .PROC
F_Interrupt_On:
		int irq;
	    retf; 
		.endp; 
//====================================================================
// ��  ��:    	F_Interrupt_Off()
// ��  ��:    	void F_Interrupt_Off(void) (for c)
// ��  ��:   	���жϺ���
// ��  ����   	��
// ����ֵ��   	��
// ʹ�üĴ�����	��
//=====================================================================
_F_Interrupt_Off: .PROC
F_Interrupt_Off:
	    int off; 
	    retf;
		.endp; 

//====================================================================
// ��  ��:    	F_Delay()
// ��  ��:    	void F_Delay(void) (for c)
// ��  ��:   	��ʱ����
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_Delay: .proc
F_Delay: 
	    push r1,r2 to [sp];
	    r2=0x000f;
	Loop1:
	    r1=0xffff;
	Loop2:    
	    r1-=1;
	    jnz Loop2;
	    r2-=1;
	    jnz Loop1;
	    nop;
	    pop r1,r2 from [sp];
	    retf;
		.endp

//====================================================================
// ��  ��:    	F_TurnOffFirstLed()
// ��  ��:    	void F_TurnOffFirstLed(void) (for c)
// ��  ��:   	Ϩ����IOA0������LED
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_TurnOffFirstLed: .proc
		push r1 to [sp];
		r1=[P_IOA_Buffer];
		r1&=0xFFFE;
		[P_IOA_Buffer]=r1;
		pop r1 from [sp];
		retf
		.endp


//====================================================================
// ��  ��:    	F_TurnOffFirstLed()
// ��  ��:    	void F_TurnOffFirstLed(void)
// ��  ��:   	������IOA0������LED
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_TurnOnFirstLed: .proc
		push r1 to [sp];
		r1=[P_IOA_Buffer];
		r1|=0x0001;
		[P_IOA_Buffer]=r1;
		pop r1 from [sp];
		retf;
		.endp

//====================================================================
// ��  ��:    	SP_TurnOffFirstLed()
// ��  ��:    	void SP_TurnOffFirstLed(void)
// ��  ��:   	Ϩ����IOA1������LED
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_TurnOffSecondLed: .proc
		push r1 to [sp];
		r1=[P_IOA_Buffer];
		r1&=0xFFFD;
		[P_IOA_Buffer]=r1;
		pop r1 from [sp];
		retf;
		.endp


//====================================================================
// ��  ��:    	SP_TurnOffFirstLed()
// ��  ��:    	void SP_TurnOffFirstLed(void)
// ��  ��:   	������IOA1������LED
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_TurnOnSecondLed: .proc
		push r1 to [sp];
		r1=[P_IOA_Buffer];
		r1|=0x0002;
		[P_IOA_Buffer]=r1;
		pop r1 from [sp];
		retf;
		.endp
		 
//====================================================================
// ��  ��:    	F_InitWriteD12()
// ��  ��:    	void F_TurnOffFirstLed(void)
// ��  ��:   	��ʼ��дPDIUSBD12
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_InitWriteD12: .proc
		push r1,r1 to [sp];
		
		r1 = [P_IOA_Dir];
		r1|=0xFF00; 
		[P_IOA_Dir]=r1;
		
		r1=[P_IOA_Attrib];
		r1|=0xFF00;				//Port IOA15- IOA8: ͬ��ߵ�ƽ���
		[P_IOA_Attrib]=r1;
		
		r1=[P_IOA_Buffer];
		r1|=0xFF00;            
		[P_IOA_Buffer]=r1; 
		
		r1=[P_IOB_Buffer];//IOB8=CS_N=0,IOB6=ALE=0,IOB5=WR_N=1,IOB4=RD_N=1,IOB3=RESET_N=1,IOB2=1
		r1|=0x0034; 
		R1&=0xFEFF;            
	    [P_IOB_Buffer]=r1;  
   
        pop r1,r1 from [sp];
        retf ;
        .endp
//====================================================================
// ��  ��:    	F_InitReadD12()
// ��  ��:    	void F_InitReadD12(void)
// ��  ��:   	��ʼ����PDIUSBD12
// ��  ����   	��
// ����ֵ��   	��
//=====================================================================
_F_InitReadD12:          .PROC
		push r1,r1 to [sp];
 
 
 		r1 = [P_IOA_Dir];
		r1&=0x00FF; 
		[P_IOA_Dir]=r1;
		
		r1=[P_IOA_Attrib];
		r1|=0xFF00;				//Port IOA15- IOA8: ����Ϊ����ʽ����input(FL)
		[P_IOA_Attrib]=r1;
		
		r1=[P_IOA_Buffer];
		r1&=0x00FF;            
		[P_IOA_Buffer]=r1; 
		
		r1=[P_IOB_Buffer];//IOB8=CS_N=0,IOB6=ALE=0,IOB5=WR_N=1,IOB4=RD_N=1,IOB3=RESET_N=1,IOB2=1
		r1|=0x0034; 
		R1&=0xFEFF;            
	    [P_IOB_Buffer]=r1;   
        pop r1,r1 from [sp]; 
        retf 
        .ENDP

//====================================================================
// ��  ��:    	F_ReadD12()
// ��  ��:    	void F_ReadD12(unsigned int D_Addr)
// ��  ��:   	��PDIUSBD12������
// ��  ����   	D_Addr��Ϊż��ַ0xff02
// ����ֵ��   	r1
//=====================================================================
_F_ReadD12:      .PROC
        push bp to [sp]; 
        bp = sp + 1 ;
        r1 = [bp+3] ;            // D12 Address
        call	F_ReadD12;       // r1: return value
        pop bp from [sp] ;
        retf ;
        .ENDP
           
F_ReadD12:
        push r2,r3 to [sp];
        
        r1 = r1 lsl 4;           // move 02  to IOA8-IOA15
        r1 = r1 lsl 4;  
        r2 = [P_IOA_Data];
        r2&= 0x00FF;
        r1|=r2;
        [P_IOA_Data] = r1;       // ��ż��ַ��D12
        
        r3=[P_IOB_Buffer];
        r3&=0xFEFF;				// CS_N=0, ALE=1,WR_N=1,RD_N=1;RESET_N=1,INT_N=1
        r3|=0x007C;
        [P_IOB_Buffer] = r3;     
        
        r3=[P_IOB_Buffer];
        r3&=0xFEBF;				// CS_N=0, ALE=0,WR_N=1,RD_N=1;RESET_N=1,INT_N=1
        r3|=0x003C;
        [P_IOB_Buffer] = r3;   
        
        r3=[P_IOB_Buffer];
        r3&=0xFEAF;				// CS_N=0, ALE=0,WR_N=1,RD_N=0;RESET_N=1,INT_N=1
        r3|=0x002C;
        [P_IOB_Buffer] = r3;   
        nop;
        r1 = [P_IOA_Data];       // Get data
        r1 = r1 lsr 4;           // Prepare high 8 bits Addr. to low 8 bits
        r1 = r1 lsr 4;           // Get low byte data
       
        r2 = [P_IOB_Buffer];
        r2 &=0xFEBF
        r2 |= 0x003C;             // CS_N=0,ALE=0,WR_N=1,RD_N=1 ;RESET_N=1,INT_N=1
        [P_IOB_Buffer] = r2;     // 
        
		pop r2,r3 from [sp];     // don't pop r1(return value)   
        retf ;
//===================================================================================================
// ��  ��:    	F_WriteCmdOrDataToD12()
// ��  ��:    	void F_WriteCmdOrDataToD12(unsigned int D_or_C_Addr,unsigned int Data_or_Command)
// ��  ��:   	��PDIUSBD12д���ݻ�����
// ��  ����   	D_or_C_Addr:��ַ������Data_or_Command����������ݲ���
// ����ֵ��   	��
//===================================================================================================
_F_WriteCmdOrDataToD12: .PROC
        push bp to [sp] ;
        bp = sp + 1; 
        push r1,r2 to [sp];
        r1 = [bp+3];              // Address
        r2 = [bp+4] ;             // Data
        call	F_WriteCmdOrDataToD12;
        pop r1,r2 from [sp];
        pop bp from [sp] ;
        retf ;
        .ENDP
F_WriteCmdOrDataToD12:
        push r1,r3 to [sp];
        
        r1 = r1 lsl 4;
        r1 = r1 lsl 4; 
        r2 = r2 lsl 4;          // shift low 8 bits data to high 8 bits
        r2 = r2 lsl 4;          //       
        r3 = [P_IOA_Buffer];
        r3 &=0x00FF;
        r1 |=r3;
        [P_IOA_Buffer] = r1;      // move 02 or 03 Addr to IOA8-IOA15    
        
        r1 = [P_IOB_Buffer];
        r1&=0xFEFF;
        r1|=0x007C;              // CS_N=0,ALE=IOA7=1,WR_N=1,RD_N=1,RESET_N=1,INT_N=1
        [P_IOB_Buffer] = r1;      // ALE=1
        
        r1 = [P_IOB_Buffer];
        r1&=0xFEBF;
        r1|=0x003C;              // CS_N=0,ALE=0,WR_N=1,RD_N=1,RESET_N=1,INT_N=1
        [P_IOB_Buffer] = r1;      // ��ALE �½��ص�ʱ��D12������ַ;
        
		r1= [P_IOA_Buffer];
		r1&=0x00FF;
		r2|=r1;
        [P_IOA_Buffer] = r2;    // ׼������д��D12

        r1 = [P_IOB_Buffer];
        r1&=0xFE9F; 				// CS_N=0,ALE=0,WR_N=0,RD_N=1;RESET_N=1,INT_N=1
        r1|=0x001C
        [P_IOB_Buffer] = r1;      

		r1 = [P_IOB_Buffer];
		r1&=0xFEBF; 				// CS_N=0,ALE=0,WR_N=1,RD_N=1;RESET_N=1,INT_N=1
        r1|=0x003C
        [P_IOB_Buffer]=r1;


        pop r1,r3 from [sp];
        retf; 

.PUBLIC _F_Clear_WatchDog
_F_Clear_WatchDog:
		PUSH r1 TO [SP];
		r1=0x0001;
		[P_Watchdog_Clear]=r1;
		POP r1 FROM [SP];
		RETF;