.include resource.inc;
.include hardware.inc;
.include key.inc;

//*********************************************************//
//函数:System_Initial()
//描述:键盘扫描初始化
//参数:无
//返回:无
//*********************************************************//
.CODE
.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
  		//push	BP,BP to [SP];					
  		//BP = SP + 1;
		//r1 = [BP+3];
		//r2 = [BP+4];
		call	F_User_Init_IO;				// 调用键盘扫描
		call	F_Key_Scan_Initial;			 
		// Add other general initialization here		
		//r1 =0x0001;						
		//pop		BP,BP from [SP];		
		retf;
	   .ENDP;
//*********I/O初始化为下拉输入*****************************//
//*********************************************************//
F_User_Init_IO:
		R1 = 0x0000;
        [P_IOA_Dir] = R1;                    //A口为输入口
        [P_IOA_Attrib] = R1;				 
        [P_IOA_Data] = R1;                   //下拉输入 
        R1 = 0x0000;                        
        retf; 

//*********************************************************//
//函数:System_ServiceLoop()
//描述:键盘去抖和键盘扫描
//参数:无
//返回:无
//*********************************************************//
.public _System_ServiceLoop;
_System_ServiceLoop: .PROC                  

		call	F_Key_DebounceCnt_Down;		//键盘去抖
		call    F_Key_Scan_ServiceLoop;		//键盘扫描		
		R1=0x0001;                      	// 
		[P_Watchdog_Clear]=R1;       		//
        retf;
        .ENDP;
//*********************************************************//
//函数:Clear_WatchDog()
//描述:看门狗清0
//参数:无
//返回:无
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	
		[P_Watchdog_Clear]=R1;       		
		retf;
		.ENDP
        