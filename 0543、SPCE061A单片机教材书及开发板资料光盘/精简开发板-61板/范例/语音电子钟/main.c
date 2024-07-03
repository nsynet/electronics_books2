//*********************************************************//
//����:"�������ӱ�"
//����:���"61��"������������ɴ��������������ܵĵ�����:
//		1��KEY1������һ�²����ꡢ�¡��գ��ٰ�һ�²���ʱ����;
//		   		   ������3s����������״̬;����״̬�µ������ݵ��л�
//		2��KEY2�����ꡢ�¡��ա�ʱ���ֵ�����
//		3��KEY3�����ꡢ�¡��ա�ʱ���ֵļ���
//		ÿ�ε�����������������ų���
//����:2003/5/16
//*********************************************************//

#include "a2000.h"
#include "consist.h"
unsigned int SpeechAdjustTemp=0; //��ʱ���м����
unsigned int Key=0; 
unsigned int KeyPressFlag=0;     //�м����±�־
unsigned int TimeCount = 0;      //�����Ӽ�ʱ��Ԫ
unsigned int SleepFlag=0;        //˯�߱�־
unsigned int TimeChangeCount=0;  //Уʱ״̬�°�����ʱ

unsigned int KeyStatus=0;        //Уʱ״̬���Ǳ�ʱ״̬��1-----Уʱ
unsigned int KeyAdjust=0;        //0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
unsigned int YearOrTime=0;       //��ʱ  1----year   0----time
unsigned int TimeChangeKey = 0;  //Уʱ״̬�¼Ӽ���־
unsigned int KeyCount=0;		 //����������Ԫ
unsigned int SecondAddOne=0;    
unsigned int HourMinTemp=0;      //��ʱ����
unsigned int i=0;
unsigned int j=0;

//��Ϣʱ���                           
unsigned int gTimeVSShem[16]={0x0800,0x0832,0x0900,0x0932,0x0934,
                              0x0a05,0x0a0a,0x0b00,0x0b0a,0x0c00,
                              0x0d1e,0x0e14,0x0e1e,0x0f14,0x0f15,
                              0x0f32};                             


//************************������ʾ����*********************//
//input: �������
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

//***************��ʱ�ӳ���********************************//
//*********************************************************//
void  Delay3ms()
{
    int delaytemp=0;
	for(delaytemp=0;delaytemp<0xFFFF;delaytemp++)
	;
}

//***************������ʱ**********************************//
//����:PlayAdjustTime(AdjustTemp)
//����:�����Ӻ�����
//     ReadRealYear():		��---16����  ��14λ
//     ReadRealMonthDay():	��----��8λ  ��---��8λ 16���� 
//     ReadRealHourMin(): 	ʱ----��8λ  ��---��8λ  16���� 
//     ReadRealSecond():  	��  16���� 
//����:0---��;1---��;2--��;3--ʱ;4---��;5---��
//����:��
//*********************************************************//
 PlayAdjustTime(AdjustTemp)	  		//*************����ʱ�䲥��      
{   	
	switch(AdjustTemp)
	 {  
	   case 0:    //��               
		 SpeechAdjustTemp=ReadRealYear();
         PlaySpeakYear(SpeechAdjustTemp);
		 break;
	   case 1:    //�� 
		 SpeechAdjustTemp=ReadRealMonthDay();
         PlaySpeakMonth(SpeechAdjustTemp>>8);
		 break;
	   case 2:     //��
		 SpeechAdjustTemp=ReadRealMonthDay();
		 PlaySpeakDay(SpeechAdjustTemp & 0x00ff);
		 break;
	   case 3:     //ʱ
	     SpeechAdjustTemp=ReadRealHourMin();
         PlaySpeakHour(SpeechAdjustTemp>>8);
         break;
	   case 4:     //��
		 SpeechAdjustTemp=ReadRealHourMin();
		 PlaySpeakMinute(SpeechAdjustTemp & 0x00ff);
		 break;
//	   case 5:     //��
//	     SpeechAdjustTemp=ReadRealSecond();
//		 PlaySpeakSecond(SpeechAdjustTemp);
//	     break;
	   case 5: break;
	   default:  break;
	 } 
}
//***************������ʱ�Ӻ���****************************//
//����:PlayAdjustTime(AdjustTemp)
//����:�����Ӻ�����
//     PlaySpeakYear():		����
//     PlaySpeakMonth():	����
//     PlaySpeakDay(): 	    ����
//     PlaySpeakHour():  	��ʱ
//	   PlaySpeakMinute():   ����
//����:��;��;��;ʱ;��;���ݾ�Ϊ16����
//����:��
//*********************************************************//
//input: ��-----16����
//*********************************************************//
PlaySpeakYear(int YearTemp)   	//*************��
{  
   PlayRespond((YearTemp/1000)+C_T00);
   PlayRespond((YearTemp%1000)/100+C_T00);
   PlayRespond((YearTemp%100)/10+C_T00);
   PlayRespond((YearTemp%10)+C_T00);
   PlayRespond(C_YEAR);
}

//input:��------16����
//*********************************************************//
PlaySpeakMonth(int MonthTemp)   //*************��
{ 
	if(MonthTemp<10)  PlayRespond(MonthTemp+C_T00);
	else if(MonthTemp==10)  PlayRespond(C_T10);
	else if(MonthTemp==11)  PlayRespond(C_T11);
	else if(MonthTemp==12)  PlayRespond(C_T12);
    PlayRespond(C_MONTH);       
}

//input:�� ------16����
//*********************************************************//
PlaySpeakDay(int DayTemp)    	//*************��
{ 	 if((DayTemp/10)> 1)   PlayRespond(DayTemp/10+C_T00);		//ʮλ>1�� 
     if((DayTemp/10)>0)    PlayRespond(C_T10);   				//��ʮ,ʮλΪ1����1 
     if((DayTemp%10)!= 0)  PlayRespond(DayTemp%10+C_T00);
     PlayRespond(C_DAY);
}
 
//input: ʱ------16����
//*********************************************************//    
PlaySpeakHour(int DayTemp)     //*************ʱ
{	 	                
	 if(DayTemp>=1 && DayTemp<=7) 
	   	{ PlayRespond(C_LINGCHEN);      		 				//1��7 �賿
		  if(DayTemp==2)  PlayRespond(C_S02);    				//��
		  else  PlayRespond(DayTemp+C_T00);   
	     }
	     
	  else if(DayTemp>=8 && DayTemp<=12) 
		  {   PlayRespond(C_NOON);     							//8--12 ����
			  switch(DayTemp)
			  { case 10:PlayRespond(C_T10); break;  			//ʮ��
			    case 11:PlayRespond(C_T11); break;  			//ʮһ��
			    case 12:PlayRespond(C_T12); break;  			//ʮ����
			    default: PlayRespond(DayTemp+C_T00);break;
		      }
           }	           
	 else if(DayTemp>=13 && DayTemp<=19) 
		 { PlayRespond(C_AFTERNOON);       						//13--19 ����1--7
		   if(DayTemp==14)  PlayRespond(C_S02);  				//��
		   else  PlayRespond(DayTemp-12+C_T00); 
	     }
	   
	 else if(DayTemp>=20 && DayTemp<=24) 
	      {   PlayRespond(C_NIGHT);     						//20--24 ����8--12
		    switch(DayTemp)
			{  case 22:PlayRespond(C_T10); break;   			//ʮ��
			   case 23:PlayRespond(C_T11); break;  				//ʮһ��
			   case 24:PlayRespond(C_T12); break;   			//ʮ����
			   default: PlayRespond(DayTemp-12+C_T00);break;
		    }
	      }
	 PlayRespond(C_DIAN);      									//��
}
//input: �� ------16����
//*********************************************************//
PlaySpeakMinute(int MinTemp)      	//*************��
{
       if(MinTemp==0)  PlayRespond(C_ZHENG);     			   //����
       else  
       {   if((MinTemp/10)>1)   PlayRespond(MinTemp/10+C_T00); //�ֵ�ʮλ
           if((MinTemp/10) >0)  PlayRespond(C_T10);     	   //�ֵ�ʮλ����1��,Ϊ1����1
           if((MinTemp%10)!=0)  PlayRespond(MinTemp%10+C_T00); //�ֵĸ�λ��Ϊ0��    
           PlayRespond(C_MIN);     //��
        }       
} 
//input:��------16����
//*********************************************************//
PlaySpeakSecond(int SecondTemp)    //*************��
{ 	if(SecondTemp == 0)     PlayRespond(SecondTemp + C_T00);   //0��
	if((SecondTemp/10)>1)   PlayRespond(SecondTemp/10+C_T00);  //���ʮλ����1����Ϊ1ֻ��ʮ 
    if((SecondTemp/10)> 0)  PlayRespond(C_T10);    
    if((SecondTemp%10)!= 0) PlayRespond(SecondTemp%10+C_T00);
    PlayRespond(C_SECOND);
}
//********************��ʱ*********************************//
//input:1 ----- ���ꡢ�¡���
//      0 ----- ��ʱ���֡���
//*********************************************************//
void SpeakTime(TimeType)
{
  if(TimeType == 0x01)
   {
     PlayAdjustTime(CON_YEAR);   						//��
     PlayAdjustTime(CON_MONTH);  						//��
     PlayAdjustTime(CON_DAY);    						//��
   }   
  else
   {
	 PlayRespond(C_BELL);         						//��ʱ��  
     PlayRespond(C_NOW);          						//����ʱ��
     PlayAdjustTime(CON_HOUR);    						//ʱ
     PlayAdjustTime(CON_MINUTE);  						//��
   }
}

//*********************************************************//
//������main()
//������������
//*********************************************************//

int main()
{  
	System_Initial();
      
     while(1)
        {	  
		   Key_Scan_ServiceLoop();        				//����ɨ�� 		

//**********************TRIG/TIME**************************************************//								
           if(Key==1 && KeyStatus==0 )   				//keystate Уʱ״̬���Ǳ�ʱ״̬��1-----Уʱ
			{ 
              	KeyCount=1;                				//����������Ԫ
		      	Key=0;   
			 }
		   if(Key==0x8001 && KeyStatus==0 )             
		     { 
			    KeyCount++; 
			    Key=0;
		     }
		   
           if (KeyPressFlag==0 && KeyCount>0 )    
			{ 
			    if(KeyCount<20)      					//��ʱ
			   		{ 
				   		YearOrTime=YearOrTime ^ 0x01; 	//�������ջ�ʱ��:��ʱ  1----year   0----time
                 		SpeakTime(YearOrTime);
				 		KeyCount=0;
			    	}
               	else if(KeyCount>=20)   				//�������ʱ��״̬
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
		 
			if(KeyStatus==1)            				//keystate Уʱ״̬���Ǳ�ʱ״̬��1-----Уʱ
			{
		 	  switch(Key)
				{
				  case 1:
					    KeyAdjust++;
					    if(KeyAdjust == 5) 				//KeyAdjust:0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
						{ 
						  	KeyStatus=0; KeyAdjust=0; 
						  	PlayAdjustTime(CON_YEAR);   //��
		                  	PlayAdjustTime(CON_MONTH);  //��
		                  	PlayAdjustTime(CON_DAY);    //��
		                  	PlayAdjustTime(CON_HOUR);   //ʱ
				          	PlayAdjustTime(CON_MINUTE); //��
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
					   		TimeChangeCount = 0; 		//��Уʱ��״̬�£��м����£���ʱ����0
					   		TimeChangeKey=1;     		//��Уʱ��״̬�£��мӼ������±�־
					   		TimeCount = 0;       		//�����Ӽ�ʱ��Ԫ
					   		Key=0;
					   		break;
					   
			   	 case 4:
				       		Adjust_Time_Down(KeyAdjust);//KeyAdjust:0-YY 1-MM 2-DD 3-hh 4-mm 5-ss 6-exit
					   		TimeChangeCount = 0;
					   		TimeChangeKey=1;
					   		TimeCount = 0;       		//�����Ӽ�ʱ��Ԫ
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
	    Calendar_Counter();     						//����������
	    if(SecondAddOne==0xFFFF) 						//�ּ�1ʱ������Ϣʱ��Ƚ�
		{
			SecondAddOne=0;
			HourMinTemp=ReadRealHourMin();
			for(i=0;i<16;i++)        					//��Ϣʱ��
			 if(HourMinTemp==gTimeVSShem[i])  
			{ 
				for(j=0;j<15;j++)
				{
					LightOn();   						//LED��˸15��
					Delay3ms();
					LightOff();
					Delay3ms();
				}
			  break;
			}
		}	
	   
	   if(SleepFlag == 0x01 && KeyStatus == 0 ) 
	      SP_GoSleep();        							// ����˯��ģʽ               
    }
}
//*****************************���������******************************************//
//*********************************************************************************//


				