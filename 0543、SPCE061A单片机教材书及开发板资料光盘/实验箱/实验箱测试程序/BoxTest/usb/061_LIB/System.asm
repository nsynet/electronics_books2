//====================================================================================//
// 文件名:    system.asm
// 描  述：   该文件的程序主要用于初始化SPCE061A和PDIUSBD12，以及对PDIUSBD12的读写操作
// 日  期：   2003/04/03
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

.define Fosc_CLK_RATE 	FoscCLK_49      //选择不同Fosc信号频率
.define CPU_CLK_RATE    CPUCLK_Fosc  	//改变CPUClk频率

.code 	
//====================================================================
// 函  数:    F_System_Initial()
// 语  法:    void F_System_Initial(void) (for c)
// 描  述:    该函数用于初始化SPCE061A的中断、时钟、I/0、复位PDIUSBD12
//			  初始化:
//			  IOB0,IOB1为同相高电平输出
//			  IOB2=INT_N＝1为带上拉电阻的输入
//			  IOB3=RESET_N=1为同相高电平输出
//            IOB8=CS_N=1同相高电平输出
//            IOB6=ALE=0同相低电平输出
//			  IOB5=WR_N=1为同相高电平输出
//			  IOB4=RD_N=1为同相高电平输出
// 参  数：   无  
// 返回值：   无
//=====================================================================
_F_System_Initial: .PROC
	    PUSH r1,r1 TO [sp];
	    INT OFF;
	    r1=0x0100; 				//开中断IRQ3_EXT1
	    [P_INT_Ctrl]=r1; 
	    //[P_INT_Ctrl_New]=r1; 
	    r1=Fosc_CLK_RATE;       //
		r1|=CPU_CLK_RATE;       //设置系统时钟      	
	    [P_SystemClock]=r1;	
	    
	    r1=0xFFFF;				//设置IOA为同相高电平输出
	    [P_IOA_Dir]=r1;
	    [P_IOA_Attrib]=r1;
	    [P_IOA_Data]=r1;
	   	r1=0xFFF0;				//设置IOB的高12位为同相高电平输出，低四位为上拉输入
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
		r1&=0x00FF;				//设置IOA8-IOA15为带上拉电阻地输入
		[P_IOA_Attrib]=r1;
		
		r1=[P_IOA_Buffer];
		r1|=0xFF00;            
		[P_IOA_Buffer]=r1; 
	
		r1=[P_IOB_Dir];//IOB8低输出，IOB6低输出，IOB5、IOB4高输出,IOB3高输出，IOB2上拉输入。
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

	    call F_Delay;//系统复位延时。
	    
	    r1=[P_IOB_Buffer];//IOB8=CS_N=0,IOB6=ALE=0,IOB5=WR_N=1,IOB4=RD_N=1,IOB3=RESET_N=0,IOB2=1
	    r1|=0x003C; 
		R1&=0xFEFF;            
	    [P_IOB_Buffer]=r1;

		POP  r1,r1 FROM [sp];
		RETF
		.ENDP
//====================================================================
// 函  数:    	F_Interrupt_On()
// 语  法:    	void F_Interrupt_On(void) (for c)
// 描  述:    	开中断函数
// 参  数：   	无  
// 返回值：		无
// 使用寄存器：	无
//=====================================================================

_F_Interrupt_On: .PROC
F_Interrupt_On:
		int irq;
	    retf; 
		.endp; 
//====================================================================
// 函  数:    	F_Interrupt_Off()
// 语  法:    	void F_Interrupt_Off(void) (for c)
// 描  述:   	开中断函数
// 参  数：   	无
// 返回值：   	无
// 使用寄存器：	无
//=====================================================================
_F_Interrupt_Off: .PROC
F_Interrupt_Off:
	    int off; 
	    retf;
		.endp; 

//====================================================================
// 函  数:    	F_Delay()
// 语  法:    	void F_Delay(void) (for c)
// 描  述:   	延时函数
// 参  数：   	无
// 返回值：   	无
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
// 函  数:    	F_TurnOffFirstLed()
// 语  法:    	void F_TurnOffFirstLed(void) (for c)
// 描  述:   	熄灭与IOA0相连的LED
// 参  数：   	无
// 返回值：   	无
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
// 函  数:    	F_TurnOffFirstLed()
// 语  法:    	void F_TurnOffFirstLed(void)
// 描  述:   	点亮与IOA0相连的LED
// 参  数：   	无
// 返回值：   	无
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
// 函  数:    	SP_TurnOffFirstLed()
// 语  法:    	void SP_TurnOffFirstLed(void)
// 描  述:   	熄灭与IOA1相连的LED
// 参  数：   	无
// 返回值：   	无
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
// 函  数:    	SP_TurnOffFirstLed()
// 语  法:    	void SP_TurnOffFirstLed(void)
// 描  述:   	点亮与IOA1相连的LED
// 参  数：   	无
// 返回值：   	无
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
// 函  数:    	F_InitWriteD12()
// 语  法:    	void F_TurnOffFirstLed(void)
// 描  述:   	初始化写PDIUSBD12
// 参  数：   	无
// 返回值：   	无
//=====================================================================
_F_InitWriteD12: .proc
		push r1,r1 to [sp];
		
		r1 = [P_IOA_Dir];
		r1|=0xFF00; 
		[P_IOA_Dir]=r1;
		
		r1=[P_IOA_Attrib];
		r1|=0xFF00;				//Port IOA15- IOA8: 同相高电平输出
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
// 函  数:    	F_InitReadD12()
// 语  法:    	void F_InitReadD12(void)
// 描  述:   	初始化读PDIUSBD12
// 参  数：   	无
// 返回值：   	无
//=====================================================================
_F_InitReadD12:          .PROC
		push r1,r1 to [sp];
 
 
 		r1 = [P_IOA_Dir];
		r1&=0x00FF; 
		[P_IOA_Dir]=r1;
		
		r1=[P_IOA_Attrib];
		r1|=0xFF00;				//Port IOA15- IOA8: 设置为悬浮式输入input(FL)
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
// 函  数:    	F_ReadD12()
// 语  法:    	void F_ReadD12(unsigned int D_Addr)
// 描  述:   	从PDIUSBD12读数据
// 参  数：   	D_Addr：为偶地址0xff02
// 返回值：   	r1
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
        [P_IOA_Data] = r1;       // 送偶地址到D12
        
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
// 函  数:    	F_WriteCmdOrDataToD12()
// 语  法:    	void F_WriteCmdOrDataToD12(unsigned int D_or_C_Addr,unsigned int Data_or_Command)
// 描  述:   	向PDIUSBD12写数据或命令
// 参  数：   	D_or_C_Addr:地址参数；Data_or_Command：命令或数据参数
// 返回值：   	无
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
        [P_IOB_Buffer] = r1;      // 在ALE 下降沿的时候，D12锁定地址;
        
		r1= [P_IOA_Buffer];
		r1&=0x00FF;
		r2|=r1;
        [P_IOA_Buffer] = r2;    // 准备数据写入D12

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