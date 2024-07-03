/*
led数据和键盘扫描线共用IOA0-IOA7,led片选由IOB8-IOB15提供
LCD数据IOA8-IOA15，AOP:IOB4,R/W:IOB5,EP:IOB6
注意：拔掉usb的数据线
*/
#include "hardware.h"
#include "lab_parameter.h"
unsigned int uiDelay=0x0008;
extern mode2;
unsigned int value,ko,Record_Stard,Record_Stop,Record_Play;	
extern a,Last;
extern void ClearWatchDog();
#include "s480.h"

#define		SPEECH_1	    0
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_Up_On		1
#define		Ramp_Dn_On		2
#define		Ramp_UpDn_On	3
#define		Auto			1
#define		Full			1
#define		Empty			2

void playS480( unsigned char num)
{
	unsigned int i;
	 
	for(i = 0;i<1;i++){
		  
	       Turnoff_INT_64Hz();
	   	  
	       SACM_S480_Initial(Auto);     	   
		   SACM_S480_Play(num,DAC1+DAC2,Ramp_UpDn_On);//播放IO测试成功	              
	 	   
		    while(SACM_S480_Status()&0x01)             //判断第一首是否播完
		{   ClearWatchDog(); 
	           SACM_S480_ServiceLoop();	
	// ClearWatchDog(); 
}
    }
	SP_INT_64Hz();   
}

//===================sleep test===================//
//描述：睡眠测试
//定时唤醒
//================================================//
void WakeUpTest()
{
   while(! WakeUp())    //sleep test fail	
	{ 		
	playS480(6); 
	playS480(0);
	playS480(1);  
	return;  
    }
	
   playS480(4);                 //sleep test success
}

//=======================================//
//描述：串口传输的测试
//功能：自发自收一组数据比较
//硬件连接：将串口2、3脚短接RX、TX拨到ON端
//=======================================//
unsigned int  FailTimes;    //失败的次数
void UartTest()
{
	FailTimes = 0; 
	//SP_Init_IOA(0xffff,0xffff,0xffff);//高八位为输出端，低八位为输入端
	
    while ( !UART()){
	 //  playS480(5);      //uart fail 	  
	   FailTimes ++;    
		if(FailTimes == 2){			
		     F_Uart_Init_Restore_IO();
			 playS480(0);  //uart test fail	
			 playS480(3);	
	        return;
	    } 		
   } 
	//SP_Init_IOA(0xff00,0xff00,0xff00);//高八位为输出端，低八位为输入端
  
	playS480(0);  //uart  test success
	playS480(4);
   
}

extern void SP_SIOSendAWord(unsigned long int,unsigned int);
extern unsigned int SP_SIOReadAWord(unsigned long int);
#define Manual 0

#define	DAC1	1	
#define	DAC2	2

#define	Full	1
#define	Empty	2


unsigned int Key,Status;    //bug mixed (应该设为全局变量)
unsigned long int Addr=0;
/////////////////////////////////////////////////


 int main()
{
	
	int tm0,tm1,i,t,loada=0,loadb,Led_Test=0,iRf=0;
	int keyfirst=0,keylast,ttee=0,iLcd=0,iDiode=0;
	unsigned long int RfFlag=0;
	
	Init_sys();	
	FG_InitGraphic();
	FG_SetLineStyle(3);
	FG_PutStr("sunplus",3,100,60);
	FG_Ellipse(60,30,15,15);
	FG_PutStr("Technology for Easy ",1,120,30);
	FG_PutStr("living ! ",1,120,20);
	Status=0xffff;
    playS480(15);
    playS480(9);
    playS480(0);
   
    
    
loop:
    ClearWatchDog();
	keyfirst=key_asm();
	keylast=key_asm1();
	value=0x000f;
    keyfirst=value&keyfirst;
    value=0x00f0;
    keylast=value&keylast;
    keyfirst=keyfirst|keylast;
    value=0x00ff;
    keyfirst^=value;
    switch(keyfirst)
	{
		case 0x0000:
		   break;
		   
		case 0x00ee:   //lcd
		  value=0;
		  Init_sys();	
		  FG_InitGraphic();
		  FG_SetLineStyle(3);
		   ClearWatchDog();
		  if(ttee==0)
		{ 
			FG_PutStr("Key test---0",3,100,60);
			 break;
		}
		  else 
		{
		  if(iLcd==0)
		   { 			  
	           Init_sys();	
	           FG_InitGraphic();
	           FG_ClearScreen(1);
	           iLcd=1;
	           playS480(5);
	           playS480(0);
         	}
		  else
		   {
	           
	           Init_sys();	
		       FG_InitGraphic();
		       FG_SetLineStyle(3);
		       FG_PutStr("Lcd test over! ",3,100,60);
		       playS480(5);
	           playS480(0);
	           playS480(1);
	           iLcd=0;
	       }
        }
       	  break;
		  
		case 0x00de:     //发光二极管 高低电平发生按键
		   value=1;
		   Init_sys();	
		   FG_InitGraphic();
		   FG_SetLineStyle(3);
		    ClearWatchDog();
		   if(ttee==0)
		{ 
			FG_PutStr("Key test---1",3,100,60);
			 break;
		}
		   else
		{
		   if(iDiode==0)
		     { 
		      FG_PutStr("Give out light the ",3,100,60);
		      FG_PutStr(" diode test...",3,120,45);
		      FG_PutStr("J26----J16",2,100,30);
		     	  
		      playS480(12);
              playS480(0);
              iDiode=0;
              F_18LedTest();
           	}
		   else
			{
			//F_18LedTest_Return();
			FG_PutStr("1*8 LED test over! ",3,150,30);
			playS480(12);
            playS480(0);
            playS480(1);
            iDiode=0;
		    }
    	}  
	        break;				


		case 0x00be:    //高低电平发生按键
		   value=2;
		   Init_sys();	
	       FG_InitGraphic();
      	   FG_SetLineStyle(3);
	          ClearWatchDog();
	       if(ttee==0)
		{ 
			FG_PutStr("Key test---2",3,100,60);
			 break;
		}
		    else
		FG_PutStr("1*8 Key test",3,150,60);
		FG_PutStr("J16----J18",2,120,40);
		FG_PutStr("Press the key ",2,120,30);
		FG_PutStr("One by one",2,120,20);
		playS480(11);
        playS480(0);
        playS480(2);
           break;

		case 0x007e:     //8*8点阵检测
		  value=3;
		  Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---3",3,100,60);
			 break;
		}
		   else
		  FG_PutStr("8*8 Point tset...",3,125,60);
		  FG_PutStr("Technology for Easy ",1,120,30);
          FG_PutStr("Living ! ",1,120,20);
           ClearWatchDog();
           if(Led_Test==0) 
	     	{ 
			  playS480(7);
			  playS480(0);
			  Led_Test++;
			  TestLed(); 
		    }
           else if(Led_Test++<5)
		    { 
			   Led_Test++;
               TestLed();
	         } 
	       else
	        {
	           Led_Test=0;
               TestLed();
	         }
		  value=3;
		  Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
		  FG_PutStr("8*8 Point tset",3,125,60);
		  FG_PutStr("over!",3,120,45);
		  playS480(7);
		  playS480(0);
		  playS480(1);		  
		  break;
		case 0x00ed:                  //uart
		  value=4;
		  Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---4",3,100,60);
			 break;
		}
		   else
		  FG_PutStr("UART test...",3,100,60);
		  FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      playS480(17);       //语音提示硬件连接方法						
	      UartTest();        //串口
		  break;
		case 0x00dd:                  //sio
		  value=5;
		  Init_sys();	
          FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---5",3,100,60);
			 break;
		}
		   else
		  FG_PutStr("SPR4096 Test...",3,125,60);
		 
	      playS480(8);
	      playS480(0);   
	     Test_4096();
	     if(a==0x00ff) 
		{
	     playS480(4);
	     //Init_sys();	
          //FG_InitGraphic();
	     // FG_SetLineStyle(3);
	    
	      FG_PutStr(" succeeds.",1,120,45);
	}
	     else
		{
	    // Init_sys();	
         // FG_InitGraphic();
	     // FG_SetLineStyle(3);
	     
	     FG_PutStr(" fails.",1,120,45);
	      playS480(3);
	}
		  break;
		case 0x00bd:
		  value=6;
		  Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---6",3,100,60);
			 break;
		}
		   else
		  FG_PutStr("6 six",3,100,60);
		  FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
		  break;
		case 0x007d:
		  value=7;
		  Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---7",3,100,60);
			 break;
		}
		   else
		  FG_PutStr("7 seven",3,100,60);
		  FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
		  break;
	    case 0x00eb:                    //sleep测试             
	      value=8; 
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---8",3,100,60);
			 break;
		}
		   else
	       FG_PutStr("Sleep test...",3,100,60);
		   FG_PutStr("Technology for Easy ",1,120,30);
	       FG_PutStr("Living ! ",1,120,20);
	       playS480(6); 
	       playS480(0);
	       WakeUpTest();   
       	   playS480(6); 
	       playS480(0);
	       playS480(1);   
	      break;
	    case 0x00db:
	      value=9;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---9",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("9 nine",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      break;
	    case 0x00bb:
	      value=10;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
	FG_SetLineStyle(0);
	FG_PutPixel(30,29);
	FG_SetBMPMode(DG_BMP_COVER);
	FG_ClearScreen(1);
	FG_PutBitmap(&mode2,127,64);
	FG_ClearScreen(0);
	FG_PutBitmap(&mode2,127,64);
			FG_PutStr("Key test---10",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("A ten",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      break;
	    case 0x007b:
	      value=11;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---11",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("B eleven",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      break;
	    case 0x00e7:
	      value=12;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---12",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("C twelve",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      break;
	    case 0x00d7:                 //rf Rf_Received
	      value=13;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---13",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("Rf Received",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      iRf=1;
	      Rf_Received();
	      break;
	    case 0x00b7:        //麦克测试
	      value=14;
	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---14",3,100,60);
			 break;
		}
		   else
	      FG_PutStr("MIC Test",3,100,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
	      MicAD_DA();        
	      break;
	    case 0x0077:        //六位LED检测
	      value=15;
 	      Init_sys();	
	      FG_InitGraphic();
	      FG_SetLineStyle(3);
	       ClearWatchDog();
	      if(ttee==0)
		{ 
			FG_PutStr("Key test---15",3,100,60);
			ttee++;
			keyfirst=0x0000;
			playS480(9);
			playS480(0);
			playS480(1);
			 break;
		}
		  
		   else
		{	
	      FG_PutStr("The test passes!",3,120,60);
	      FG_PutStr("Technology for Easy ",1,120,30);
	      FG_PutStr("Living ! ",1,120,20);
		 
	while(1)
		{
		  ClearWatchDog();		
          F_SingleLed(0,8);
          ClearWatchDog();
          F_SingleLed(1,8);
          ClearWatchDog();
          F_SingleLed(2,8);
          ClearWatchDog();
          F_SingleLed(3,8);
          ClearWatchDog();
          F_SingleLed(4,8);
          ClearWatchDog();
          F_SingleLed(5,8);
          ClearWatchDog();
     	}
	}
	     break;
	
	     return ;
}
	if(value==255)  ko=ko;
    else   ko=value;
    if(iDiode==1) 
	{
//		F_18LedTest();

	    iDiode=2;
    }
    else  if(iRf==1) 
		{ 
			RfFlag++;
			if(Last==0xaaf8||Last==0xaae0) 
			{
				singleled(3,8);
				iRf=0;
				Last=0;
				playS480(16);
				ClearWatchDog();
				Init_sys();	
	            FG_InitGraphic();
	            FG_SetLineStyle(3);
	            FG_PutStr("Rf Received",3,100,60);
	   			FG_PutStr(" succeeds.",1,125,45);
			}
		  else  if(RfFlag==0xfffff)
			{
				iRf=0;
				RfFlag=0;
				playS480(3);
				ClearWatchDog();
				Init_sys();	
	            FG_InitGraphic();
	            FG_SetLineStyle(3);
	            FG_PutStr("Rf Received",3,100,60);
	        	FG_PutStr(" fails.",1,125,45);
	
		}
		
	     }
       else
		{ 
			if(iRf==0)
			{
			SP_Export(Port_IOB_Data,0x8080);	
  	        SP_Export(Port_IOA_Data,0x0000);
	        singleled(3,8);
	        for(i=1;i<=0x50;i++)
			{
			ClearWatchDog();
            delay();
		     }
		}
		else
		i=1;

    }
    goto loop;
     
}
