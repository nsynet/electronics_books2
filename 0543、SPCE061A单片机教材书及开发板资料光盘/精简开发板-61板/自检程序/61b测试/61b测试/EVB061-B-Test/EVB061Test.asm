.define  Write_Port_Data     0xffff;
.define  Write_Port_Data0    0xaaaa;
.define  TIMER_DATA_FOR_8KHZ 0xfa23
.include hardware.inc
.code
//=====================================//
//函数名称：unsigned IOTest（）
//出口参数：1.测试成功0、测试失败
//无入口参数
//硬件连接：A口B口短接
//=====================================//

.public _IOTest;
_IOTest:    .proc

InitPortAinput_Boutput:
    r1=0x0000                 //初始化A口为输入端
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	[P_IOA_Data]=r1
	                          //初始化B口为输出端
	r1=0xffff                 
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	r1=0x0000
	[P_IOB_Data]=r1

WritePortB:
    r1 = Write_Port_Data;    //向B口写数据0xaaaa   
LoopWrite:   // 
    r1 = r1-1;
    jz  InitPortBinput_Aoutput;//
    [P_IOB_Data]=r1
ReadPortA: 
                             //使数据稳定
    nop;
    nop;
    nop;
    nop;
    nop;      
    r2 = [P_IOA_Data];       //读A口数据    
    cmp r1,r2;               //比较读写数据是否相同
    je  LoopWrite;
    //je  InitPortBinput_Aoutput;
    nop;
    nop;
    nop;
    r1 = 0x0000;             //测试失败
    nop;
    nop;
    retf;
    
InitPortBinput_Aoutput:
   
     r1=0x0000                 //初始化B口为输入
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	[P_IOB_Data]=r1
	                          //初始化A口为输出
	r1=0xffff                 
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	r1=0x0000
	[P_IOA_Data]=r1
	
WritePortA:                  //向A口写数据
    r1 = Write_Port_Data
LoopWrite0:
    r1 = r1 - 1;
    jz  TestSuc;    
    [P_IOA_Data]=r1    
ReadPortB:
                             //使数据稳定
    nop;
    nop;
    nop;
    nop;
    nop;    
    r2 = [P_IOB_Data];       //读B口数据    
    cmp r1,r2;               //比较读写数据是否相同
    je  LoopWrite0;

    r1 = 0x0000;             //测试失败
    retf;
 TestSuc:
    r1 = 0x0001;
    retf;
    .endp
//===========================================//
//函数名称：unsigned KeyWakeUp()
//出口参数：1.测试成功0、测试失败
//无入口参数
//硬件连接：A口B口短接
//=====================================//
.public _KeyWakeUp;
_KeyWakeUp:    .proc
.define P_IOA_RL   0x7004
//InitPortA_input_B_output0:
    r1=0x0000                 //初始化A口为输入端
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	[P_IOA_Data]=r1


	                          //初始化B口为输出端
	r1=0xffff                 
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	r1=0x0000
	[P_IOB_Data]=r1
    r1 = [P_INT_Ctrl]
    r1 |= 0x0004                //中断初始化
    [P_INT_Ctrl] = r1;  
    r1=[P_IOA_RL] 
    INT IRQ                  //开中断   
    r1=0x0017;               //on 32768   
    [P_SystemClock]=r1       //进入睡眠状态
    
    
    
    r1 = 0x0000
    [P_SystemClock]=r1 
    r1 = 0x0001;             //测试成功
    retf;
.endp    
//********************************//
//键唤醒中断    
//*******************************//
.text  
.public _IRQ3
_IRQ3:
    push r1,r4 to [sp]
  
    r1=0x0080
    test r1,[P_INT_Ctrl]   //是否为键唤醒中断
    jz L_notKeyArouse      //否，退出中断程序
    r1=0x0080
    [P_INT_Clear]=r1       //是，清中断 
L_notKeyArouse: 
    pop r1,r4 from [sp] 
    reti
//=======================================//
//函数名称：unsigned UART(char *Psend)
//出口参数：1.测试成功0、测试失败
//无入口参数
//硬件连接：A口B口短接
//=====================================// 


.data   //发送的数据
    SendData:.dw 0x00aa,0x0055,0x00a5,0x005a,0x00aa
.isram
.public  RecData    //接收数据缓冲区
 RecData: .dw  5 dup(0);
 
 .var recNum        //接收数据个数

 .var sendNum       //发送数据个数
 
.code
.public _UART;
_UART:

    r1 = 0xffff;      //设置A口为输出
    [P_IOA_Attrib] = r1;    
    [P_IOA_Dir] = r1;
    r1 = 0xffff;    
    [P_IOA_Data] = r1; 
       
    r2 = RecData;   
    
_UART_INIT:		
F_UART_INIT:
	INT OFF;
	R1 = 0x0000;		    //关闭中断	
	[P_INT_Ctrl] = R1;   

	R1 = 0x0480;		    //设置IOB7为输入IOB10为输出
	[P_IOB_Attrib] = R1;
	R1 = 0x0400;
	[P_IOB_Dir] = R1;
	R1 = 0x0000;	
	[P_IOB_Data] = R1;

	R1 = 0x006b;		    //设置波特率 114.84KHz(~=115.2KHz)
	[P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
	[P_UART_BaudScalarHigh] = R1;
	
	
	R1 = 0x0000;
	R4 = 0x00C0;	      //使能RX和TX
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;
	


	
	R3 = 0x00;
	bp = 0x0000
	[sendNum] = bp
    [recNum] = bp
	
L_sendData:
	
L_Check_TxRDY:
    R4 = SendData;				//准备发送数据
    bp = [sendNum] 
	
	R3 -= 1;
	jz	L_TxRDY_TimeOut;

    cmp bp,5                    //发送是否结束
    je L_Check_RxRDY;           
    
	R1 = [P_UART_Command2];    
	R1 &= 0x0040;			      //检测 TxRDY = 1;
	JZ L_Check_RxRDY;
    r4 = r4 + bp
	r4 = [r4]
	[P_UART_Data] = R4;	          //发送数据
    
    bp += 1     
    [sendNum] = bp                //发送数据的个数      
    
L_recData:      
	R3 = 0x00;
L_Check_RxRDY:
	
	R3 -= 1;
	jz	L_RxRDY_TimeOut;
    
    bp = [recNum]
    r2 =  bp + RecData            
    
	R1 = [P_UART_Command2];			//检测是否有数据接收
	R1 &= 0x0080;
	JZ L_Check_TxRDY;
	                                //接收自己发送的8位十六进制数
	r1 = 0x0000;
	//... Get data .................
	R1 = [P_UART_Data];				//取接收的数据
    
    [r2] = r1;    
    bp += 1
    [recNum] = bp                   //数据是否全部接收
    cmp bp ,5
    jne L_Check_RxRDY
    
    R1 = 0x0000;
    [P_UART_Command2] = R1;        //禁止接收
    jmp L_TxRDY_TimeOut

	
L_TxRDY_TimeOut:
L_RxRDY_TimeOut:		
    call CmpRecSend;
	retf;

//==============================//
//函数名称：CmpRecSend:

//比较发送数据与接收数据是否相等
//==============================//
CmpRecSend:
   bp = [recNum] 
   bp -= 1
loopCmp:   
   r3 = bp + RecData
   r4 = bp + SendData
  // r3 -= 1 
   r3 = [r3] 
   r4 = [r4]
   cmp r3,r4;
   jne UartFail;
   bp -= 1 
   cmp bp,0xffff
   jne loopCmp;      
   r1 = 0x0001  //成功
   retf
 UartFail:
   r1 = 0x0000;   //失败
 retf;
//==============================//
// MIC测试部分
//==============================//
.CODE
_InitAD_DA: 
		INT OFF;	
	
		R1 = 0x0030; 				// 时钟频率为CLKA的Fosc/2
		[P_TimerA_Ctrl] = R1;		//
		R1 = TIMER_DATA_FOR_8KHZ; 	// 采样率为 8kHz
		[P_TimerA_Data] = R1;		//
		
		R1 = 0x0015;				// 设置AGC 
		//R1 = 0x0011				// 取消AGC 
		[P_ADC_Ctrl] = R1;			// 采用自动方式、且通过MIC_IN通道输入,
		
		
		R1 = 0x00A8;				//通过定时器A的溢出锁存数据，ADC为自动方式
		[P_DAC_Ctrl] = R1;			
		R1 = 0x1000;				//
		[P_INT_Ctrl] = R1;			// 开中断IRQ1_TM
		
		INT IRQ;
		retf; 

//主程序
.PUBLIC _MICTEST	
_MICTEST: .PROC 
		call _InitAD_DA				// 调用AD 初始化子程序 
	.ENDP
loop:
	nop 
	nop 
	nop 
	nop 
	jmp loop 
.text
.PUBLIC _IRQ1 
_IRQ1:       
		push R1 to [SP]
	
		R1 = [P_ADC] 
		[P_DAC1] = R1 
		[P_DAC2] = R1 
		R1 = 0x1000 
		[P_INT_Clear] = R1 
		pop R1 from [SP] 
		reti 
