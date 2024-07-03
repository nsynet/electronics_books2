.include hardware.inc  
.external  _SecondAddOne
.public     Year; 
.public     MonDayHr; 
.public     MinSec; 
.public     Per500msSet; 
//*********************RAM¿Õ¼äÕ¼ÓÃ*************************//
.RAM
.var   Year          //Äê b15--if leap year
.var   MonDayHr      //ÔÂÈÕÊ±  b13--b10(month) b9--b5(day)  b4--b0(hour) 
.var   MinSec        //·ÖÃë    b12--b7(minute) b6--b1(second) b0--500ms
.var   Per500msSet   //500ms ±êÖ¾

.CODE
//*********************************************************//
//º¯Êý:System_Initial()
//ÃèÊö:¼üÅÌÉ¨Ãè³õÊ¼»¯
//²ÎÊý:ÎÞ
//·µ»Ø:ÎÞ
//*********************************************************//
.public _System_Initial;
_System_Initial: .PROC
//******************ÏµÍ³Ê±ÖÓ¡¢ÖÐ¶Ï*************************//

     r1=0
     [P_SystemClock]=r1

     r1=0
     [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1
     IRQ OFF
     FIQ OFF

//*********************I/O¿Ú*******************************//
	R1=0xff00
	[P_IOA_Attrib] = R1						//A7--A0  ÊäÈë
	[P_IOA_Dir] = R1						//A15--A8 Êä³ö
	R1 = 0x0000				
	[P_IOA_Data] = R1
     
//*********************ÍòÄêÀú******************************//
     R1=2001
     [Year]=R1     							//2001Äê  b15--not leap year
     R1=0x0420
     [MonDayHr]=R1  						//1ÔÂ1ÈÕ1Ê± 
                    						// b13--b10(month) b9--b5(day)  b4--b0(hour)
     R1=0x0000      
     [MinSec]=R1      						//0·Ö0Ãë    
                   							//b12--b7(minute) b6--b1(second) b0--500ms
     [Per500msSet]=R1   
  
//*******************ÖÐ¶Ï**********************************//
     r1 = C_IRQ5_2Hz+ C_IRQ3_KEY     		//2Hz+KeyUp
     r1|=[R_InterruptStatus] 
	 [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1
     IRQ ON 
     
     retf;
	.ENDP;
//*********************************************************//
//º¯Êý:Clear_WatchDog()
//ÃèÊö:¿´ÃÅ¹·Çå0
//²ÎÊý:ÎÞ
//·µ»Ø:ÎÞ
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	// Clear watch dog
		[P_Watchdog_Clear]=R1;       		//
		retf;
		.ENDP
//*********************************************************//
//º¯Êý:LightOn()
//ÃèÊö:µãÁÁ·Å¹â¶þ¼«¹Ü
//²ÎÊý:ÎÞ
//·µ»Ø:ÎÞ
//*********************************************************//
.public	_LightOn;
_LightOn:	.proc         					//µãÁÁIOA15 LED 	
			r1= 0x8000;
			r1 |= [P_IOA_Buffer];
			[P_IOA_Buffer] = r1;
			retf;
			.endp

.public	_LightOff;      					//Ï¨Ãð IOA15 LED
_LightOff:	.proc
			r1= 0x7FFF;
			r1&= [P_IOA_Buffer];
			[P_IOA_Buffer] = r1;
			retf;
			.endp
//*********************************************************//
//º¯Êý:Calendar_Counter()
//ÃèÊö:ÍòÄêÀúµ÷Õû
//²ÎÊý:500ms±êÖ¾  [Per500msSet]----0xFFFF£¬500msµ½
//·µ»Ø:ÎÞ
//*********************************************************//

.public _Calendar_Counter
 _Calendar_Counter: .proc
        R1 = [Per500msSet];   				//500ms±êÖ¾
        JNZ  Update_Time;
        RETF;
 Update_Time:
        R1 = 0;
        [Per500msSet] = R1;
               
//**************minute & second
        R1 = [MinSec];
        R1 += 1;            				//Ãë+1
        R2 = R1 AND 0x007E;  				//ÊÇ·ñµ½60Ãë£¿ 
        CMP     R2,60*2;
        JB      _2HzRtc_90;
        R1 &= 0x1F80;               
        R1 += 0x0080;               
        
        r4=0xFFFF            				//·Ö+1£¬ÖÃµ÷Õû±êÖ¾
        [_SecondAddOne]=r4
        
        CMP     R1,60*128;  				//ÊÇ·ñµ½60·Ö
        JB      _2HzRtc_90; 
        
        r1+=0x0003;      					//ÊÖ¹¤Ð£Õý 
        
//**************month, day, hour
        R2 = [MonDayHr];
        R2 += 1;                    		//Ê±+1
        R3 = R2 AND 0x001F;         
        CMP  R3,24;         				//ÊÇ·ñµ½24Ð¡Ê±
        JB      _2HzRtc_80;
        R2& = 0x3FE0;         				//Ð¡Ê±Çå0
        R3 = R2 LSR 4;
        R3 = R3 LSR 1;
        R3 &= 0x001F;
        
        CALL    F_GetDaysOfTheMonth;  		//¶Á±¾ÔÂÌìÊý
       
        CMP  R3,R1;         
        JB   _2HzRtc_75;
        R2 &= 0x3C00;
        R2 += 0x0400;             			//ÔÂ+1
        CMP  R2,13*1024;       				//ÔÂ³¬¹ý12£¿
        JB   _2HzRtc_75;
        R2 = 0x0400;                		//ÔÂÖÃ1
//**************year
        R3 = [Year];
        R3 += 1;                 			//Äê+1
        R3&=0x7FFF
        CMP     R3,3099;       				//3099Äê
        JBE     _2HzRtc_70;
        R3 = 2001;             				//2001Äê
_2HzRtc_70:
        CALL F_CalcLeapYear_or_NonLeapYear  //¼ÆËãÆ½ÈòÄê£¬R3---·µ»ØÖµ
                                            //ÈòÄê(b15=1) Æ½Äê(b15=0)
        [Year] = R3;

_2HzRtc_75:
        R2 += 0x0020;               		//Ìì+1
_2HzRtc_80:
        [MonDayHr] = R2;
_2HzRtc_85:
        R1 = 0x0000;          				//R1 = 0x0000;
_2HzRtc_90:
        [MinSec] = R1;
        
        RETF;
//**************Table
TB_DaysOfMonth:     						//¸ß×Ö½Ú---ÈòÄêÌìÊý, µÍ×Ö½Ú---- Æ½ÄêÌìÊý
        .DW     31*256+31;
        .DW     31*256+31;          		//1 month
        .DW     29*256+28;          		//2 month
        .DW     31*256+31;          		//3 month
        .DW     30*256+30;          		//4 month
        .DW     31*256+31;          		//5 month
        .DW     30*256+30;          		//6 month
        .DW     31*256+31;          		//7 month
        .DW     31*256+31;          		//8 month
        .DW     30*256+30;          		//9 month
        .DW     31*256+31;          		//10 month
        .DW     30*256+30;          		//11 month
        .DW     31*256+31;          		//12 month
        
//*********************************************************//
//º¯Êý:F_GetDaysOfTheMonth
//ÃèÊö:¼ÆËã±¾ÔÂÌìÊý
//²ÎÊý:ÎÞ
//·µ»Ø:R1£­£­ÌìÊý
//*********************************************************// 
F_GetDaysOfTheMonth:
        R1 = [MonDayHr];
        R1 = R1 LSR 4;
        R1 = R1 LSR 4;
        R1 = R1 LSR 2;

        R1 &= 0x000F;
        BP = R1 + TB_DaysOfMonth;
        R1 = [BP];

        R4 = 0x8000 
        TEST R4,[Year];        				//Æ½ÈòÄê£¿
        JNZ   GetDaysOfTheMonth_LeapYear;
        
GetDaysOfTheMonth_NonLeapYear:  			//Æ½Äê
        R1 &= 0x00FF;
        RETF;
        
GetDaysOfTheMonth_LeapYear:     			//ÈòÄê           
        R1 = R1 LSR 4;
        R1 = R1 LSR 4;
        RETF;        
//**************Æ½ÈòÄê¼ÆËã*********************************//
//ÃèÊö:ÈòÄêÌõ¼þ:
//		1¡¢ÄÜ±»400Õû³ý
//		2¡¢ÄÜ±»4Õû³ý£¬µ«²»ÄÜ±»100Õû³ý
//*********************************************************//         
F_CalcLeapYear_or_NonLeapYear:
        R4=R3;
        CMP     R4,0;
        JZ      GetDaysOfTheMonth_20;
GetDaysOfTheMonth_10:
        CMP     R4,400;            			//ÅÐ¶ÏÊÇ·ñÄÜ±»400Õû³ý
        JB      GetDaysOfTheMonth_30;     	//²»ÄÜ±»400Õû³ý
        R4 -= 400;
        JNZ     GetDaysOfTheMonth_10;
GetDaysOfTheMonth_20:       				//ÈòÄê£­£­ÄÜ±»400Õû³ý »ò ÄÜ±»4Õû³ýµ«²»ÄÜ±»100Õû³ýµ         
        R3| = 0x8000;       				//ÈòÄê [YEAR].15=1
        RETF;

GetDaysOfTheMonth_30:
        CMP     R4,100;       				//ÅÐ¶ÏÊÇ·ñÄÜ±»100Õû³ý
        JB      GetDaysOfTheMonth_40;  		//²»ÄÜ±»100Õû³ý£¬ÅÐ¶ÏÊÇ·ñÄÜ±»4Õû³ý 
        R4 -= 100;
        JNZ     GetDaysOfTheMonth_30;
        JMP     GetDaysOfTheMonth_50;     	//ÄÜ±»100Õû³ý£¬²»ÊÇÈòÄê  
GetDaysOfTheMonth_40:
        TEST    R4,0x0003;            
        JZ      GetDaysOfTheMonth_20;   	//ÄÜ±»4Õû³ý     

GetDaysOfTheMonth_50:                   	//Æ½Äê [YEAR].15=0
        R3 &= 0x7FFF;
        RETF;     
      .endp    

//***************µ÷ÕûÊ±¼ä**********************************// 
//**************Ôö¼Ó
.PUBLIC  _Adjust_Time_Up
_Adjust_Time_Up: .PROC
      	PUSH  BP,BP TO [SP];
	    BP=SP+1;
        R1=[BP+3];    
        
        CMP R1,0;
        JE  Adjust_Up_00
        CMP R1,1;
        JE  Adjust_Up_01
        CMP R1,2;
        JE  Adjust_Up_02
        CMP R1,3;
        JE  Adjust_Up_03
        CMP R1,4;
        JE  Adjust_Up_04
        CMP R1,5;
        JE  Adjust_Up_05
        POP BP,BP  FROM [SP];
        RETF
        
  Adjust_Up_00:  GOTO   Adjust_Up_Time_00;           
  Adjust_Up_01:  GOTO   Adjust_Up_Time_01;       
  Adjust_Up_02:  GOTO   Adjust_Up_Time_02;        
  Adjust_Up_03:  GOTO   Adjust_Up_Time_03;                 
  Adjust_Up_04:  GOTO   Adjust_Up_Time_04;       
  Adjust_Up_05:  GOTO   Adjust_Up_Time_05;             
              
  Adjust_Up_Time_00:    					//µ÷ÕûÄê
        R3=[Year];
        R3&=0x7FFF
        R3+=1;
        CMP     R3,3099;  					//2099Äê
        JBE  YearUp_NoOver
        R3=2001
  YearUp_NoOver:      
        CALL F_CalcLeapYear_or_NonLeapYear;
        [Year] = R3;
        POP BP,BP  FROM [SP];
        RETF       
        
  Adjust_Up_Time_01:   						//µ÷ÕûÔÂ
        R3=[MonDayHr];
        R2=0x3C00;
        R2&=R3;
        CMP R2,12*1024;
        JB  MonUp_NoOver;
        R3&=0x03FF;
   MonUp_NoOver:
        R3+=0x0400;
        [MonDayHr]=R3;     
        POP BP,BP FROM [SP];
        RETF       
         
  Adjust_Up_Time_02:   						//µ÷ÕûÈÕ
        R3=[MonDayHr];
        R2=0x03E0;
        R2&=R3;
        CMP R2,31*32;
        JB  DayUp_NoOver;
        R3&=0x3C1F;  
   DayUp_NoOver:
        R3+=0x0020;
        [MonDayHr]=R3;      
        POP BP,BP  FROM [SP];
        RETF       
  
  Adjust_Up_Time_03:    					//µ÷ÕûÊ±
        r3=0x0001
        R3+=[MonDayHr];
        R2=0x001F;
        R2&=R3;
        CMP R2,23;
        JBE  HourUp_NoOver;
        R3&=0x3FE0;  
        R3+=0x0000;  
   HourUp_NoOver:
        [MonDayHr]=R3;      
        POP BP,BP  FROM [SP];
        RETF       
        
  Adjust_Up_Time_04:    					//µ÷Õû·Ö
        R3=0x0080;
        R3+=[MinSec];
        R2=0x1F80;
        R2&=R3;
        CMP R2,59*128;
        JBE  MinUp_NoOver;
        R3&=0x007F;
        R3+=0x0000;
   MinUp_NoOver:
        [MinSec]=R3;      
        POP BP,BP  FROM [SP];
        RETF       
  
  Adjust_Up_Time_05:    					//µ÷ÕûÃë
        R3=0x0002;
        R3+=[MinSec];
        R2=0x007E;
        R2&=R3;
        CMP R2,59*2;
        JBE  SecUp_NoOver;
        R3&=0x1F80;
        R3+=0x0000;
   SecUp_NoOver:
        [MinSec]=R3;      
        POP BP,BP  FROM [SP];
        RETF       
       .ENDP          

//**************¼õÉÙ
.PUBLIC  _Adjust_Time_Down
_Adjust_Time_Down: .PROC
      	PUSH  BP,BP  TO [SP];
	    BP=SP+1;
        R1=[BP+3];    
        
        CMP R1,0;
        JE  Adjust_Down_00
        CMP R1,1;
        JE  Adjust_Down_01
        CMP R1,2;
        JE  Adjust_Down_02
        CMP R1,3;
        JE  Adjust_Down_03
        CMP R1,4;
        JE  Adjust_Down_04
        CMP R1,5;
        JE  Adjust_Down_05
        JMP Adjust_Down_Time_Ret

Adjust_Down_00: GOTO   Adjust_Down_Time_00; 
Adjust_Down_01: GOTO   Adjust_Down_Time_01; 
Adjust_Down_02: GOTO   Adjust_Down_Time_02; 
Adjust_Down_03: GOTO   Adjust_Down_Time_03; 
Adjust_Down_04: GOTO   Adjust_Down_Time_04; 
Adjust_Down_05: GOTO   Adjust_Down_Time_05; 
        
  Adjust_Down_Time_00:    					//µ÷ÕûÄê
        R3=[Year];
        R3&=0x7FFF
        R3-=1;
        CMP     R3,2001;  					//2099Äê
        JAE  YearDown_NoOver
        R3=3099
 YearDown_NoOver:    
        CALL F_CalcLeapYear_or_NonLeapYear;
        [Year] = R3;
        JMP Adjust_Down_Time_Ret;
        
  Adjust_Down_Time_01:   					//µ÷ÕûÔÂ
        R3=[MonDayHr];
        R2=0x3C00;
        R2&=R3;
        CMP R2,0x0400;
        JA  MonDown_NoOver;
        R3&=0x03FF;
        R3+=0x3400;     					//13,13-1=12£¨ÏÂÃæ-1£©
   MonDown_NoOver:
        R3-=0x0400;     					//-1 
        [MonDayHr]=R3;     
        JMP Adjust_Down_Time_Ret;
           
  
  Adjust_Down_Time_02:   					//µ÷ÕûÈÕ
        R3=[MonDayHr];
        R2=0x03E0;
        R2&=R3;
        CMP R2,0x0020;
        JA  DayDown_NoOver;
        R3&=0x3C1F;
        R3+=0x0400;    						//32  32-1=31
   DayDown_NoOver:
        R3-=0x0020;   
        [MonDayHr]=R3;     
        JMP Adjust_Down_Time_Ret; 
 
  Adjust_Down_Time_Ret:
        POP BP,BP FROM [SP];
        RETF  
 
  Adjust_Down_Time_03:    					//µ÷ÕûÊ±
        R3=[MonDayHr];
        R2=0x001F;
        R2&=R3;
        CMP R2,0;
        JA  HourDown_NoOver;
        R3&=0x3FE0;
        R3+=0x0018;
   HourDown_NoOver:
        R3-=0x001;
        [MonDayHr]=R3;     
        JMP Adjust_Down_Time_Ret;  
  
  Adjust_Down_Time_04:    					//µ÷Õû·Ö
        R3=[MinSec];
        R2=0x1F80;
        R2&=R3;
        CMP R2,0;
        JA  MinDown_NoOver;
        R3&=0x007F;
        R3+=0x1E00;    						//60   60-1=59
   MinDown_NoOver:
        R3-=0x0080;
        [MinSec]=R3;     
        JMP Adjust_Down_Time_Ret; 
  
  Adjust_Down_Time_05:    					//µ÷ÕûÃë
        R3=[MinSec];
        R2=0x007E;
        R2&=R3;
        CMP R2,0;
        JA  SecDown_NoOver;
        R3&=0x1F80;
        R3+=0x0078;     					//60    60-1=59
   SecDown_NoOver:
        R3-=0x0002;
        [MinSec]=R3;     
        JMP Adjust_Down_Time_Ret; 
  
      .ENDP   
 
 //=============================================== 
 //        ¶ÁÊ±¼ä
 //===============================================      
.public _ReadRealYear   //Äê£º16½øÖÆ
_ReadRealYear: .proc
      R1=0x7FFF;/////////////////////////////////
      R1&=[Year];
      RETF
      .ENDP
          
.public _ReadRealMonthDay   				//ÔÂ¡¢ÈÕ
_ReadRealMonthDay: .proc
      r4=[MonDayHr];
      R1=R4 LSR 2;    						// ÔÂ --¸ß°ËÎ»,16½øÖÆ///////////////////////
      R1&=0xFF00 
      R3=R4 LSR 4     						//ÈÕ----µÍ°ËÎ»,16½øÖÆ 
      R3=R3 LSR 1
      R3&=0x001F
      R1|=R3
      RETF
    .ENDP

.public _ReadRealHourMin    				//Ê±¡¢·Ö
 _ReadRealHourMin: .proc
        r4=[MonDayHr]  
        r4&=0x001F     						//Ê±´æÓÚ¸ß8Î»,16½øÖÆ
        R4+=1
        R4=R4 LSL 4
        R4=R4 LSL 4
        r2=[MinSec]   						//·Ö´æÓÚµÍ8Î»£¬16½øÖÆ
        r2&=0x1F80
        r1=r2 lsr 4
        r1=r1 lsr 3
        r1|=r4
        retf
        .endp
 
 .public _ReadRealSecond    				//Ãë  16½øÖÆ 
 _ReadRealSecond: .proc
     r4=0x007E;
     r4&=[MinSec];
     r1=r4 lsr 1;
     retf
     .ENDP
 
//=======================================================
 
      
.public _Start256HzRTC        				//´ò¿ª256HzÖÐ¶Ï
_Start256HzRTC: .proc
      r1=0
      [P_TimeBase_Clear]=r1
      r1=0x0040
      [P_TimeBase_Setup]=r1      			//TMB2 CLKsour=256Hz
    
      r1 = C_IRQ6_TMB2 ;  					//256Hz
      r1|=[R_InterruptStatus] 
	  [R_InterruptStatus] = R1
      [P_INT_Ctrl]=r1
      retf
    .endp
     
 .public _Stop256HzRTC           			//¹Ø±Õ256HzÖÐ¶Ï
_Stop256HzRTC: .proc
     r1 = C_IRQ6_TMB2 ;  					//256Hz
     r1^=0xFFFF        						//È¡·´ 
     r1&=[R_InterruptStatus] 
	 [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1  
     retf
     .endp    
 
.external  Key_Scan_Init
.public _SP_GoSleep
_SP_GoSleep: .PROC
	    R1=0x00ff;	           				//µÈ´ý¼üÊÍ·Å
        R1 &= [P_IOA_Data];	
        jnz    WaitKeyUp;
        call Key_Scan_Init
       
        r1 = [P_IOA_Latch];     			//Ëø´æÊý¾Ý
		r1 = [P_IOA_Latch];	 
		r1 = 0x0017;            			//ÈõÕñ¡¢Í£Ö¹Ë¯Ãß
		[P_SystemClock] = r1;
	      R1=32           					//ÑÓÊ±
  WakeUpWaitDelay:      
          r1-=1
          jnz WakeUpWaitDelay 	
          r1=0
          [P_SystemClock]=r1    			//¹Ø±Õ32768HÊ±ÖÓ¡¢CPUCLKÎªFosc
WaitKeyUp:   
		retf;  	              
		.ENDP
