
.external _sum;


.include hardware.inc;
.include key.inc;

.public R_SpeechType;
.RAM
.VAR R_SpeechType;

.CODE
.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
  		//push	BP,BP to [SP];				//add if some parameters in
  		//BP = SP + 1;
		//r1 = [BP+3];
		//r2 = [BP+4];
		
		call	F_User_Init_IO;			// For keyboard scan
		 
		// Add other general initialization here
		
		//r1 =0x0001;						// return value
		//pop		BP,BP from [SP];		
		retf;
		.ENDP;

///////////////////////////////////////////////
F_User_Init_IO:
		R1 = 0x0000;
        [P_IOA_Dir] = R1;                    // 
        [P_IOA_Data] = R1;                   // 
        R1 = 0x0000;                             
        [P_IOA_Attrib] = R1;                 // 
        retf; 
.public _System_ServiceLoop;
.public	F_System_ServiceLoop;
_System_ServiceLoop: .PROC                  
F_System_ServiceLoop:
		call	F_Key_DebounceCnt_Down;		// 
		call    F_Key_Scan_ServiceLoop;		// 			
		R1=0x0001;                      	// 
		[P_Watchdog_Clear]=R1;       		//
        retf;
        .ENDP;
        

.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;   
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

