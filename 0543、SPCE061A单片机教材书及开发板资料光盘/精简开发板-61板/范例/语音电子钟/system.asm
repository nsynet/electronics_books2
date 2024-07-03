.include hardware.inc  
.external  _SecondAddOne
.public     Year; 
.public     MonDayHr; 
.public     MinSec; 
.public     Per500msSet; 
//*********************RAM�ռ�ռ��*************************//
.RAM
.var   Year          //�� b15--if leap year
.var   MonDayHr      //����ʱ  b13--b10(month) b9--b5(day)  b4--b0(hour) 
.var   MinSec        //����    b12--b7(minute) b6--b1(second) b0--500ms
.var   Per500msSet   //500ms ��־

.CODE
//*********************************************************//
//����:System_Initial()
//����:����ɨ���ʼ��
//����:��
//����:��
//*********************************************************//
.public _System_Initial;
_System_Initial: .PROC
//******************ϵͳʱ�ӡ��ж�*************************//

     r1=0
     [P_SystemClock]=r1

     r1=0
     [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1
     IRQ OFF
     FIQ OFF

//*********************I/O��*******************************//
	R1=0xff00
	[P_IOA_Attrib] = R1						//A7--A0  ����
	[P_IOA_Dir] = R1						//A15--A8 ���
	R1 = 0x0000				
	[P_IOA_Data] = R1
     
//*********************������******************************//
     R1=2001
     [Year]=R1     							//2001��  b15--not leap year
     R1=0x0420
     [MonDayHr]=R1  						//1��1��1ʱ 
                    						// b13--b10(month) b9--b5(day)  b4--b0(hour)
     R1=0x0000      
     [MinSec]=R1      						//0��0��    
                   							//b12--b7(minute) b6--b1(second) b0--500ms
     [Per500msSet]=R1   
  
//*******************�ж�**********************************//
     r1 = C_IRQ5_2Hz+ C_IRQ3_KEY     		//2Hz+KeyUp
     r1|=[R_InterruptStatus] 
	 [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1
     IRQ ON 
     
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
		R1=0x0001;                      	// Clear watch dog
		[P_Watchdog_Clear]=R1;       		//
		retf;
		.ENDP
//*********************************************************//
//����:LightOn()
//����:�����Ź������
//����:��
//����:��
//*********************************************************//
.public	_LightOn;
_LightOn:	.proc         					//����IOA15 LED 	
			r1= 0x8000;
			r1 |= [P_IOA_Buffer];
			[P_IOA_Buffer] = r1;
			retf;
			.endp

.public	_LightOff;      					//Ϩ�� IOA15 LED
_LightOff:	.proc
			r1= 0x7FFF;
			r1&= [P_IOA_Buffer];
			[P_IOA_Buffer] = r1;
			retf;
			.endp
//*********************************************************//
//����:Calendar_Counter()
//����:����������
//����:500ms��־  [Per500msSet]----0xFFFF��500ms��
//����:��
//*********************************************************//

.public _Calendar_Counter
 _Calendar_Counter: .proc
        R1 = [Per500msSet];   				//500ms��־
        JNZ  Update_Time;
        RETF;
 Update_Time:
        R1 = 0;
        [Per500msSet] = R1;
               
//**************minute & second
        R1 = [MinSec];
        R1 += 1;            				//��+1
        R2 = R1 AND 0x007E;  				//�Ƿ�60�룿 
        CMP     R2,60*2;
        JB      _2HzRtc_90;
        R1 &= 0x1F80;               
        R1 += 0x0080;               
        
        r4=0xFFFF            				//��+1���õ�����־
        [_SecondAddOne]=r4
        
        CMP     R1,60*128;  				//�Ƿ�60��
        JB      _2HzRtc_90; 
        
        r1+=0x0003;      					//�ֹ�У�� 
        
//**************month, day, hour
        R2 = [MonDayHr];
        R2 += 1;                    		//ʱ+1
        R3 = R2 AND 0x001F;         
        CMP  R3,24;         				//�Ƿ�24Сʱ
        JB      _2HzRtc_80;
        R2& = 0x3FE0;         				//Сʱ��0
        R3 = R2 LSR 4;
        R3 = R3 LSR 1;
        R3 &= 0x001F;
        
        CALL    F_GetDaysOfTheMonth;  		//����������
       
        CMP  R3,R1;         
        JB   _2HzRtc_75;
        R2 &= 0x3C00;
        R2 += 0x0400;             			//��+1
        CMP  R2,13*1024;       				//�³���12��
        JB   _2HzRtc_75;
        R2 = 0x0400;                		//����1
//**************year
        R3 = [Year];
        R3 += 1;                 			//��+1
        R3&=0x7FFF
        CMP     R3,3099;       				//3099��
        JBE     _2HzRtc_70;
        R3 = 2001;             				//2001��
_2HzRtc_70:
        CALL F_CalcLeapYear_or_NonLeapYear  //����ƽ���꣬R3---����ֵ
                                            //����(b15=1) ƽ��(b15=0)
        [Year] = R3;

_2HzRtc_75:
        R2 += 0x0020;               		//��+1
_2HzRtc_80:
        [MonDayHr] = R2;
_2HzRtc_85:
        R1 = 0x0000;          				//R1 = 0x0000;
_2HzRtc_90:
        [MinSec] = R1;
        
        RETF;
//**************Table
TB_DaysOfMonth:     						//���ֽ�---��������, ���ֽ�---- ƽ������
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
//����:F_GetDaysOfTheMonth
//����:���㱾������
//����:��
//����:R1��������
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
        TEST R4,[Year];        				//ƽ���ꣿ
        JNZ   GetDaysOfTheMonth_LeapYear;
        
GetDaysOfTheMonth_NonLeapYear:  			//ƽ��
        R1 &= 0x00FF;
        RETF;
        
GetDaysOfTheMonth_LeapYear:     			//����           
        R1 = R1 LSR 4;
        R1 = R1 LSR 4;
        RETF;        
//**************ƽ�������*********************************//
//����:��������:
//		1���ܱ�400����
//		2���ܱ�4�����������ܱ�100����
//*********************************************************//         
F_CalcLeapYear_or_NonLeapYear:
        R4=R3;
        CMP     R4,0;
        JZ      GetDaysOfTheMonth_20;
GetDaysOfTheMonth_10:
        CMP     R4,400;            			//�ж��Ƿ��ܱ�400����
        JB      GetDaysOfTheMonth_30;     	//���ܱ�400����
        R4 -= 400;
        JNZ     GetDaysOfTheMonth_10;
GetDaysOfTheMonth_20:       				//���꣭���ܱ�400���� �� �ܱ�4���������ܱ�100�����         
        R3| = 0x8000;       				//���� [YEAR].15=1
        RETF;

GetDaysOfTheMonth_30:
        CMP     R4,100;       				//�ж��Ƿ��ܱ�100����
        JB      GetDaysOfTheMonth_40;  		//���ܱ�100�������ж��Ƿ��ܱ�4���� 
        R4 -= 100;
        JNZ     GetDaysOfTheMonth_30;
        JMP     GetDaysOfTheMonth_50;     	//�ܱ�100��������������  
GetDaysOfTheMonth_40:
        TEST    R4,0x0003;            
        JZ      GetDaysOfTheMonth_20;   	//�ܱ�4����     

GetDaysOfTheMonth_50:                   	//ƽ�� [YEAR].15=0
        R3 &= 0x7FFF;
        RETF;     
      .endp    

//***************����ʱ��**********************************// 
//**************����
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
              
  Adjust_Up_Time_00:    					//������
        R3=[Year];
        R3&=0x7FFF
        R3+=1;
        CMP     R3,3099;  					//2099��
        JBE  YearUp_NoOver
        R3=2001
  YearUp_NoOver:      
        CALL F_CalcLeapYear_or_NonLeapYear;
        [Year] = R3;
        POP BP,BP  FROM [SP];
        RETF       
        
  Adjust_Up_Time_01:   						//������
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
         
  Adjust_Up_Time_02:   						//������
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
  
  Adjust_Up_Time_03:    					//����ʱ
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
        
  Adjust_Up_Time_04:    					//������
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
  
  Adjust_Up_Time_05:    					//������
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

//**************����
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
        
  Adjust_Down_Time_00:    					//������
        R3=[Year];
        R3&=0x7FFF
        R3-=1;
        CMP     R3,2001;  					//2099��
        JAE  YearDown_NoOver
        R3=3099
 YearDown_NoOver:    
        CALL F_CalcLeapYear_or_NonLeapYear;
        [Year] = R3;
        JMP Adjust_Down_Time_Ret;
        
  Adjust_Down_Time_01:   					//������
        R3=[MonDayHr];
        R2=0x3C00;
        R2&=R3;
        CMP R2,0x0400;
        JA  MonDown_NoOver;
        R3&=0x03FF;
        R3+=0x3400;     					//13,13-1=12������-1��
   MonDown_NoOver:
        R3-=0x0400;     					//-1 
        [MonDayHr]=R3;     
        JMP Adjust_Down_Time_Ret;
           
  
  Adjust_Down_Time_02:   					//������
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
 
  Adjust_Down_Time_03:    					//����ʱ
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
  
  Adjust_Down_Time_04:    					//������
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
  
  Adjust_Down_Time_05:    					//������
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
 //        ��ʱ��
 //===============================================      
.public _ReadRealYear   //�꣺16����
_ReadRealYear: .proc
      R1=0x7FFF;/////////////////////////////////
      R1&=[Year];
      RETF
      .ENDP
          
.public _ReadRealMonthDay   				//�¡���
_ReadRealMonthDay: .proc
      r4=[MonDayHr];
      R1=R4 LSR 2;    						// �� --�߰�λ,16����///////////////////////
      R1&=0xFF00 
      R3=R4 LSR 4     						//��----�Ͱ�λ,16���� 
      R3=R3 LSR 1
      R3&=0x001F
      R1|=R3
      RETF
    .ENDP

.public _ReadRealHourMin    				//ʱ����
 _ReadRealHourMin: .proc
        r4=[MonDayHr]  
        r4&=0x001F     						//ʱ���ڸ�8λ,16����
        R4+=1
        R4=R4 LSL 4
        R4=R4 LSL 4
        r2=[MinSec]   						//�ִ��ڵ�8λ��16����
        r2&=0x1F80
        r1=r2 lsr 4
        r1=r1 lsr 3
        r1|=r4
        retf
        .endp
 
 .public _ReadRealSecond    				//��  16���� 
 _ReadRealSecond: .proc
     r4=0x007E;
     r4&=[MinSec];
     r1=r4 lsr 1;
     retf
     .ENDP
 
//=======================================================
 
      
.public _Start256HzRTC        				//��256Hz�ж�
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
     
 .public _Stop256HzRTC           			//�ر�256Hz�ж�
_Stop256HzRTC: .proc
     r1 = C_IRQ6_TMB2 ;  					//256Hz
     r1^=0xFFFF        						//ȡ�� 
     r1&=[R_InterruptStatus] 
	 [R_InterruptStatus] = R1
     [P_INT_Ctrl]=r1  
     retf
     .endp    
 
.external  Key_Scan_Init
.public _SP_GoSleep
_SP_GoSleep: .PROC
	    R1=0x00ff;	           				//�ȴ����ͷ�
        R1 &= [P_IOA_Data];	
        jnz    WaitKeyUp;
        call Key_Scan_Init
       
        r1 = [P_IOA_Latch];     			//��������
		r1 = [P_IOA_Latch];	 
		r1 = 0x0017;            			//����ֹͣ˯��
		[P_SystemClock] = r1;
	      R1=32           					//��ʱ
  WakeUpWaitDelay:      
          r1-=1
          jnz WakeUpWaitDelay 	
          r1=0
          [P_SystemClock]=r1    			//�ر�32768Hʱ�ӡ�CPUCLKΪFosc
WaitKeyUp:   
		retf;  	              
		.ENDP
