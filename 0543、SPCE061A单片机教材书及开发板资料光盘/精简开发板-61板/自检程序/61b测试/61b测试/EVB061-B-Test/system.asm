.include hardware.inc
.external _sum;
.code

.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//
		retf;
		.ENDP

//=========================================//
//函数名称：RunTime2Hz()
//=========================================//
.public _RunTime2Hz; //初始化中断为2HZ定时中断源
_RunTime2Hz:   .proc
	r1 = 0x0004;
    [P_INT_Ctrl] = r1; 
    INT IRQ;           //开中断
    retf
 .endp;
//=========================================//
//函数名称：OffTime2Hz（）
//========================================//

.public _OffTime2Hz;
_OffTime2Hz: .proc
   r1 = [P_INT_Ctrl]
   r1 &= 0xfffb;
   [P_INT_Ctrl] = r1;
   r1 = 0x0000
   [_sum] = r1;
   retf;
 .endp;
 
 
 //=======================================//
 //DataBusTest()
 //=======================================//
 .public _DataBusTest;
 _DataBusTest: .proc
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
    
    r1=0xffff                 
	[P_IOB_Data]=r1
  loop1:
    nop;
    nop;
    nop;
    nop;
    nop;  
    r2 = [P_IOA_Data]
    cmp r2,r1
    jne exit;
    jmp loop1;
exit:  
      retf;
      .endp

