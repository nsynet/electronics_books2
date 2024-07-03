.include resource.inc;
.include hardware.inc;
.include key.inc;

//*********************************************************//
//����:System_Initial()
//����:����ɨ���ʼ��
//����:��
//����:��
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
		call	F_User_Init_IO;				// ���ü���ɨ��
		call	F_Key_Scan_Initial;			 
		// Add other general initialization here		
		//r1 =0x0001;						
		//pop		BP,BP from [SP];		
		retf;
	   .ENDP;
//*********I/O��ʼ��Ϊ��������*****************************//
//*********************************************************//
F_User_Init_IO:
		R1 = 0x0000;
        [P_IOA_Dir] = R1;                    //A��Ϊ�����
        [P_IOA_Attrib] = R1;				 
        [P_IOA_Data] = R1;                   //�������� 
        R1 = 0x0000;                        
        retf; 

//*********************************************************//
//����:System_ServiceLoop()
//����:����ȥ���ͼ���ɨ��
//����:��
//����:��
//*********************************************************//
.public _System_ServiceLoop;
_System_ServiceLoop: .PROC                  

		call	F_Key_DebounceCnt_Down;		//����ȥ��
		call    F_Key_Scan_ServiceLoop;		//����ɨ��		
		R1=0x0001;                      	// 
		[P_Watchdog_Clear]=R1;       		//
        retf;
        .ENDP;
//*********************************************************//
//����:Clear_WatchDog()
//����:���Ź���0
//����:��
//����:��
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	
		[P_Watchdog_Clear]=R1;       		
		retf;
		.ENDP
        