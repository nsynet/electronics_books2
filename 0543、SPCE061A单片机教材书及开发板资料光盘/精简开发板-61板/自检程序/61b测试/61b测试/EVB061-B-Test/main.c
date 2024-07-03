#include "hardware.h"
#include "s480.h"
#include "A2000.h"
//s480
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
/////////////////////////////
#define SUCCESS  1;
#define FAIL     0;

void playS480( unsigned char num);
void delay3s(void);
 
unsigned char INTflag;     //��ʱ3��ı�ʶ
unsigned int  sum;         //2hz ������  ������Ϊ3��
unsigned int FailTimes;    //ʧ�ܵĴ���

int main()

 {	

	FailTimes = 0;	
	sum = 0;
	INTflag = 0;
	 Clear_WatchDog();	 
	SACM_S480_Initial(Auto);            //�Զ���ʽ���ų�ʼ��]	
	 Clear_WatchDog();
	playS480(0);                        //input testself	

   	
//////////////////////////////////IOTEST/////////////	
	while(!IOTest()){
		     Clear_WatchDog();
		    playS480(1);   //IO test fail		             
			FailTimes ++;
		    if(FailTimes ==3){
		         Clear_WatchDog();
		    	playS480(8);  //exit test
			    return(0);
		    } 
		}
	     Clear_WatchDog();
		playS480(2);      //IO test success
 //////////////////////////Keywakeup/////////////////////////

	 while(! KeyWakeUp()){ 
		       Clear_WatchDog();
	          playS480(4);   	 
	   	      playS480(8);  //exit test
			  return(0);
		    		
     }		
	 playS480(4);  //key wake up success	  
////////////////////AD_Line///////////////////
   
	while(!AD_Line()){
		  Clear_WatchDog();
 	      playS480(3);  //ad test fail	      
		  playS480(8);  //exit test			   
		  return(0);
	}
	playS480(9); //ad test success 	
  	 
 Clear_WatchDog();
  while(1){
 Clear_WatchDog();
  MICTEST();
  delay3s();
}
 
  }
   
void playS480( unsigned char num)
{
	unsigned int i;
	for(i = 0;i<1;i++){
		 Clear_WatchDog();
		SACM_S480_Play(num,DAC1+DAC2,Ramp_UpDn_On);//����IO���Գɹ�	              
	 	   while(SACM_S480_Status()&0x01)//�жϵ�һ���Ƿ���
	     {   Clear_WatchDog();
	       SACM_S480_ServiceLoop();}	
    }
}

void delay3s(void)
{  
	 RunTime2Hz();
     FailTimes = 0;
     while(!INTflag);
	 INTflag = 0;
	 OffTime2Hz();
}