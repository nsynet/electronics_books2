//////////////////////////////////////////////////////////////////
// Function: System commander                     
// 	Service for H/W, keyboard scan
// Input: None
// Output: None

// Functions:
//	(In Assembly view)
// 	call F_System_Initial; 
//	(In C language view)
// 	System_Initial(); 
//////////////////////////////////////////////////////////////////

.include resource.inc;
.include hardware.inc;
//.include key.inc;

.public R_SpeechType;
.RAM
.VAR R_SpeechType;

.CODE
.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
	//push	BP to [SP];				//add if some parameters in
	//BP = SP + 1;
	//r1 = [BP+3];
	//r2 = [BP+4];

	//	call	F_Key_Scan_Initial;			// For keyboard scan
	// Add other general initialization here
		
	call	F_User_Init_IO;				//	
//	R1 = 0							// The interrupt is controlled by user
	R1=C_FIQ_TMA
	[R_InterruptStatus] = R1		//
	[P_INT_Ctrl] = R1				//
        
//	add by sls
//	r1=0x00CB;
// 	[P_SIO_Ctrl]=r1;
// 	r1=0x0000;
//  [P_SIO_Ctrl]=r1; 

//	r1 =0x0001;						// return value
//	pop		BP from [SP];		
	retf;
	.ENDP;

//****************************************************************
// Function: Main Loop of system                     
// Input: None
// Output: None
// Using:
// 	call F_System_ServiceLoop; (in assembly domain)
//  System_ServiceLoop(); (in C domain) 	
//****************************************************************
//.public _System_ServiceLoop;
//public	F_System_ServiceLoop;
//System_ServiceLoop: .PROC                  
//F/_System_ServiceLoop:
//		call	F_Key_DebounceCnt_Down;		// calling debounce subroutine for key scan subroutine
//		call    F_Key_Scan_ServiceLoop;		// calling key scan subroutine 
		// Add other general service functions here	
//		R1=0x0001;                      // Clear watch dog
//		[P_Watchdog_Clear]=R1;       	//	
 //       retf;
 //       .ENDP;
        
    
F_User_Init_IO:  //**
//	R1 = 0x00F0;
//  [P_IOA_Dir] = R1;                    // Port A15- A8: input(FL)/output(OL)
//  [P_IOA_Data] = R1;                   // Port A7 - A4: output(OL)
//  R1 = 0xFFF0;                                    // Port A3 - A0: input_PL
//  [P_IOA_Attrib] = R1;                 //      
R1=0xffff
	[P_IOB_Attrib]=R1
	R1=0xffff
	[P_IOB_Dir]=R1
	R1 = 0xFFFF;                         //
    
    [P_IOB_Attrib] = R1;                 //
 
//	Add by sls
          
    R1 = 0x00C3;
    [P_SIO_Ctrl] = R1;
 
//	R1 = 0x0060;                         //
//  [P_IOA_Buffer] = R1;                 // b7 reserved, *CS=1, *OE=1, *WE=0
    retf;  
    
.public _F_User_Init_Restore_IO;
_F_User_Init_Restore_IO: .PROC

//	R1 = 0x00F0;
//  [P_IOA_Dir] = R1;                    // Port A15- A8: input(FL)/output(OL)
//  [P_IOA_Data] = R1;                   // Port A7 - A4: output(OL)
//  R1 = 0xFFF0;                                    // Port A3 - A0: input_PL
//  [P_IOA_Attrib] = R1;                 //      
R1=0xffff
	[P_IOB_Attrib]=R1
	R1=0xffff
	[P_IOB_Dir]=R1
	R1 = 0xFFFF;                         //
    
    [P_IOB_Attrib] = R1;                 //
 
//	Add by sls
          
    R1 = 0x0000;
    [P_SIO_Ctrl] = R1;
 
//	R1 = 0x0060;                         //
//  [P_IOA_Buffer] = R1;                 // b7 reserved, *CS=1, *OE=1, *WE=0
  retf
  .endp      