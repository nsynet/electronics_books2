//=======================================//
//函数名称：unsigned UART(char *Psend)
//出口参数：1.测试成功0、测试失败
//无入口参数
//硬件连接：A口B口短接
//=====================================// 
.include hardware.inc

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
   	r1=0xffff                 
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
//	r1=0x0000
//	[P_IOB_Data]=r1
    
    r1=0xffff                 
	[P_IOB_Data]=r1
  
    nop;
    nop;
    nop;
    nop;
    nop;  
   // r2 = [P_IOA_Data]
	  
    r2 = RecData;   
    
_UART_INIT:		
F_UART_INIT:
	
    int off;
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
    nop;
    nop;
    nop;
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
   //int irq
   //fiq on     
   r1 = 0x0001  //成功
   retf
 UartFail:
   r1 = 0x0000;   //失败
 retf;
