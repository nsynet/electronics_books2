//*********************************************************//
//名称:"语音电子表"
//描述:结合"61板"的三个按键完成带有语音播报功能的电子钟:
//		1、KEY1－－按一下播放年、月、日，再按一下播放时、分;
//		   		   连续按3s，则进入调整状态;调整状态下调整内容的切换
//		2、KEY2－－年、月、日、时、分的增加
//		3、KEY3－－年、月、日、时、分的减少
//		每次调整结果都会语音播放出来
//日期:2003/5/16
//*********************************************************//

#include "a2000.h"
#include "consist.h"
unsigned int SpeechAdjustTemp=0; //读时间中间变量
unsigned int Key=0; 
unsigned int KeyPressFlag=0;     //有键按下标志
unsigned int TimeCount = 0;      //两分钟计时单元
unsigned int SleepFlag=0;        //睡眠标志
unsigned int TimeChangeCount=0;  //校时状态下按键计时

unsigned int KeyStatus=0;        //校时状态还是报时状态，1-----校时
unsigned int KeyAdjust=0;        //0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
unsigned int YearOrTime=0;       //报时  1----year   0----time
unsigned int TimeChangeKey = 0;  //校时状态下加减标志
unsigned int KeyCount=0;		 //按键计数单元
unsigned int SecondAddOne=0;    
unsigned int HourMinTemp=0;      //读时、分
unsigned int i=0;
unsigned int j=0;

//作息时间表                           
unsigned int gTimeVSShem[16]={0x0800,0x0832,0x0900,0x0932,0x0934,
                              0x0a05,0x0a0a,0x0b00,0x0b0a,0x0c00,
                              0x0d1e,0x0e14,0x0e1e,0x0f14,0x0f15,
                              0x0f32};                             


//************************播放提示语音*********************//
//input: 播放序号
//*********************************************************//
void PlayRespond(unsigned int Result)      
{  SACM_A2000_Initial(1);
   SACM_A2000_Play(Result,3,3);
   while((SACM_A2000_Status()&0x0001) != 0)
    { Clear_WatchDog();
	  SACM_A2000_ServiceLoop(); 
    }
   SACM_A2000_Stop();
}

//***************延时子程序********************************//
//*********************************************************//
void  Delay3ms()
{
    int delaytemp=0;
	for(delaytemp=0;delaytemp<0xFFFF;delaytemp++)
	;
}

//***************语音报时**********************************//
//函数:PlayAdjustTime(AdjustTemp)
//描述:调用子函数：
//     ReadRealYear():		年---16进制  低14位
//     ReadRealMonthDay():	月----高8位  日---低8位 16进制 
//     ReadRealHourMin(): 	时----高8位  分---低8位  16进制 
//     ReadRealSecond():  	秒  16进制 
//参数:0---年;1---月;2--日;3--时;4---分;5---秒
//返回:无
//*********************************************************//
 PlayAdjustTime(AdjustTemp)	  		//*************调整时间播放      
{   	
	switch(AdjustTemp)
	 {  
	   case 0:    //年               
		 SpeechAdjustTemp=ReadRealYear();
         PlaySpeakYear(SpeechAdjustTemp);
		 break;
	   case 1:    //月 
		 SpeechAdjustTemp=ReadRealMonthDay();
         PlaySpeakMonth(SpeechAdjustTemp>>8);
		 break;
	   case 2:     //日
		 SpeechAdjustTemp=ReadRealMonthDay();
		 PlaySpeakDay(SpeechAdjustTemp & 0x00ff);
		 break;
	   case 3:     //时
	     SpeechAdjustTemp=ReadRealHourMin();
         PlaySpeakHour(SpeechAdjustTemp>>8);
         break;
	   case 4:     //分
		 SpeechAdjustTemp=ReadRealHourMin();
		 PlaySpeakMinute(SpeechAdjustTemp & 0x00ff);
		 break;
//	   case 5:     //秒
//	     SpeechAdjustTemp=ReadRealSecond();
//		 PlaySpeakSecond(SpeechAdjustTemp);
//	     break;
	   case 5: break;
	   default:  break;
	 } 
}
//***************语音报时子函数****************************//
//函数:PlayAdjustTime(AdjustTemp)
//描述:调用子函数：
//     PlaySpeakYear():		报年
//     PlaySpeakMonth():	报月
//     PlaySpeakDay(): 	    报日
//     PlaySpeakHour():  	报时
//	   PlaySpeakMinute():   报分
//参数:年;月;日;时;分;数据均为16进制
//返回:无
//*********************************************************//
//input: 年-----16进制
//*********************************************************//
PlaySpeakYear(int YearTemp)   	//*************年
{  
   PlayRespond((YearTemp/1000)+C_T00);
   PlayRespond((YearTemp%1000)/100+C_T00);
   PlayRespond((YearTemp%100)/10+C_T00);
   PlayRespond((YearTemp%10)+C_T00);
   PlayRespond(C_YEAR);
}

//input:月------16进制
//*********************************************************//
PlaySpeakMonth(int MonthTemp)   //*************月
{ 
	if(MonthTemp<10)  PlayRespond(MonthTemp+C_T00);
	else if(MonthTemp==10)  PlayRespond(C_T10);
	else if(MonthTemp==11)  PlayRespond(C_T11);
	else if(MonthTemp==12)  PlayRespond(C_T12);
    PlayRespond(C_MONTH);       
}

//input:日 ------16进制
//*********************************************************//
PlaySpeakDay(int DayTemp)    	//*************日
{ 	 if((DayTemp/10)> 1)   PlayRespond(DayTemp/10+C_T00);		//十位>1报 
     if((DayTemp/10)>0)    PlayRespond(C_T10);   				//报十,十位为1不报1 
     if((DayTemp%10)!= 0)  PlayRespond(DayTemp%10+C_T00);
     PlayRespond(C_DAY);
}
 
//input: 时------16进制
//*********************************************************//    
PlaySpeakHour(int DayTemp)     //*************时
{	 	                
	 if(DayTemp>=1 && DayTemp<=7) 
	   	{ PlayRespond(C_LINGCHEN);      		 				//1—7 凌晨
		  if(DayTemp==2)  PlayRespond(C_S02);    				//两
		  else  PlayRespond(DayTemp+C_T00);   
	     }
	     
	  else if(DayTemp>=8 && DayTemp<=12) 
		  {   PlayRespond(C_NOON);     							//8--12 上午
			  switch(DayTemp)
			  { case 10:PlayRespond(C_T10); break;  			//十点
			    case 11:PlayRespond(C_T11); break;  			//十一点
			    case 12:PlayRespond(C_T12); break;  			//十二点
			    default: PlayRespond(DayTemp+C_T00);break;
		      }
           }	           
	 else if(DayTemp>=13 && DayTemp<=19) 
		 { PlayRespond(C_AFTERNOON);       						//13--19 下午1--7
		   if(DayTemp==14)  PlayRespond(C_S02);  				//两
		   else  PlayRespond(DayTemp-12+C_T00); 
	     }
	   
	 else if(DayTemp>=20 && DayTemp<=24) 
	      {   PlayRespond(C_NIGHT);     						//20--24 晚上8--12
		    switch(DayTemp)
			{  case 22:PlayRespond(C_T10); break;   			//十点
			   case 23:PlayRespond(C_T11); break;  				//十一点
			   case 24:PlayRespond(C_T12); break;   			//十二点
			   default: PlayRespond(DayTemp-12+C_T00);break;
		    }
	      }
	 PlayRespond(C_DIAN);      									//点
}
//input: 分 ------16进制
//*********************************************************//
PlaySpeakMinute(int MinTemp)      	//*************分
{
       if(MinTemp==0)  PlayRespond(C_ZHENG);     			   //正点
       else  
       {   if((MinTemp/10)>1)   PlayRespond(MinTemp/10+C_T00); //分的十位
           if((MinTemp/10) >0)  PlayRespond(C_T10);     	   //分的十位大于1报,为1不报1
           if((MinTemp%10)!=0)  PlayRespond(MinTemp%10+C_T00); //分的个位不为0则报    
           PlayRespond(C_MIN);     //分
        }       
} 
//input:秒------16进制
//*********************************************************//
PlaySpeakSecond(int SecondTemp)    //*************秒
{ 	if(SecondTemp == 0)     PlayRespond(SecondTemp + C_T00);   //0秒
	if((SecondTemp/10)>1)   PlayRespond(SecondTemp/10+C_T00);  //秒的十位大于1报，为1只报十 
    if((SecondTemp/10)> 0)  PlayRespond(C_T10);    
    if((SecondTemp%10)!= 0) PlayRespond(SecondTemp%10+C_T00);
    PlayRespond(C_SECOND);
}
//********************报时*********************************//
//input:1 ----- 报年、月、日
//      0 ----- 报时、分、秒
//*********************************************************//
void SpeakTime(TimeType)
{
  if(TimeType == 0x01)
   {
     PlayAdjustTime(CON_YEAR);   						//年
     PlayAdjustTime(CON_MONTH);  						//月
     PlayAdjustTime(CON_DAY);    						//日
   }   
  else
   {
	 PlayRespond(C_BELL);         						//报时声  
     PlayRespond(C_NOW);          						//现在时刻
     PlayAdjustTime(CON_HOUR);    						//时
     PlayAdjustTime(CON_MINUTE);  						//分
   }
}

//*********************************************************//
//函数：main()
//描述：主函数
//*********************************************************//

int main()
{  
	System_Initial();
      
     while(1)
        {	  
		   Key_Scan_ServiceLoop();        				//键盘扫描 		

//**********************TRIG/TIME**************************************************//								
           if(Key==1 && KeyStatus==0 )   				//keystate 校时状态还是报时状态，1-----校时
			{ 
              	KeyCount=1;                				//按键计数单元
		      	Key=0;   
			 }
		   if(Key==0x8001 && KeyStatus==0 )             
		     { 
			    KeyCount++; 
			    Key=0;
		     }
		   
           if (KeyPressFlag==0 && KeyCount>0 )    
			{ 
			    if(KeyCount<20)      					//报时
			   		{ 
				   		YearOrTime=YearOrTime ^ 0x01; 	//报年月日或时分:报时  1----year   0----time
                 		SpeakTime(YearOrTime);
				 		KeyCount=0;
			    	}
               	else if(KeyCount>=20)   				//进入调整时间状态
			   		{	
						 KeyCount=0;
						 KeyStatus=1;
						 KeyAdjust=0;
						 TimeCount = 0;
						 Start256HzRTC(); 
				         PlayAdjustTime(KeyAdjust);
			   		}
		    }    
//*********************************************************************************//	 
		 
			if(KeyStatus==1)            				//keystate 校时状态还是报时状态，1-----校时
			{
		 	  switch(Key)
				{
				  case 1:
					    KeyAdjust++;
					    if(KeyAdjust == 5) 				//KeyAdjust:0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
						{ 
						  	KeyStatus=0; KeyAdjust=0; 
						  	PlayAdjustTime(CON_YEAR);   //年
		                  	PlayAdjustTime(CON_MONTH);  //月
		                  	PlayAdjustTime(CON_DAY);    //日
		                  	PlayAdjustTime(CON_HOUR);   //时
				          	PlayAdjustTime(CON_MINUTE); //分
					 	  	Stop256HzRTC(); 
						}
					        else
					        PlayAdjustTime(KeyAdjust);
					        Key=0;
					        TimeCount = 0;
					        TimeChangeKey=0;	
						    break;
					
				 case 2:
					   		Adjust_Time_Up(KeyAdjust);
					   		TimeChangeCount = 0; 		//调校时间状态下，有键按下，计时器清0
					   		TimeChangeKey=1;     		//调校时间状态下，有加减键按下标志
					   		TimeCount = 0;       		//两分钟计时单元
					   		Key=0;
					   		break;
					   
			   	 case 4:
				       		Adjust_Time_Down(KeyAdjust);//KeyAdjust:0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
					   		TimeChangeCount = 0;
					   		TimeChangeKey=1;
					   		TimeCount = 0;       		//两分钟计时单元
					   		Key=0;
					   		break;  	     
					    
			      			default:
					    	break;
			  }
			if(TimeChangeKey==1 && TimeChangeCount > 40) 
			  { 
				TimeChangeKey=0;
				PlayAdjustTime(KeyAdjust); 
			  }
					
			   if(TimeCount > 120) 
			  { 
				KeyStatus=0; 
				KeyAdjust=0; 
			  }	 
		  }       
//*********************************************************************************//		 
	    Calendar_Counter();     						//调整万年历
	    if(SecondAddOne==0xFFFF) 						//分加1时，与作息时间比较
		{
			SecondAddOne=0;
			HourMinTemp=ReadRealHourMin();
			for(i=0;i<16;i++)        					//作息时间
			 if(HourMinTemp==gTimeVSShem[i])  
			{ 
				for(j=0;j<15;j++)
				{
					LightOn();   						//LED闪烁15次
					Delay3ms();
					LightOff();
					Delay3ms();
				}
			  break;
			}
		}	
	   
	   if(SleepFlag == 0x01 && KeyStatus == 0 ) 
	      SP_GoSleep();        							// 进入睡眠模式               
    }
}
//*****************************主程序结束******************************************//
//*********************************************************************************//


				