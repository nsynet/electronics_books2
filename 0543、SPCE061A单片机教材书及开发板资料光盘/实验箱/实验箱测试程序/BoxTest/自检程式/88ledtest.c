#include "hardware.h"

//����ʱ��������ɨ����̴���
int delay1(unsigned int n)
{
   unsigned int i,j ;
	for(i=0;i<n;i++){
    ClearWatchDog(); 
    for(j = 0;j<100;j++); 
    ClearWatchDog();   
    }
	return(0);    

}
///////////////////////////////////////
//����LED���� �졢�̡��Ƚ�����ʾ
//1*8�����м������˳�����
//////////////////////////////////////
void TestLed(void)
{
	unsigned int delayFg;
	 SP_Init_IOA(0xff00,0xff00,0xffff);//�߰�λΪ����ˣ��Ͱ�λΪ��
	 SP_Init_IOB(0xffff,0xffff,0xffff);//�߰�λΪ����ˣ��Ͱ�λΪ��

	      SP_Export(Port_IOA_Data,0xff00);	// light Red led
	      SP_Export(Port_IOB_Data,0x00ff);	      			
	      delayFg = delay1(10000);
		  ClearWatchDog(); 
	      SP_Export(Port_IOA_Data,0xff00);	// light green led		
	      SP_Export(Port_IOB_Data,0xff00);	
       	  delayFg = delay1(10000);
		  ClearWatchDog(); 
	      SP_Export(Port_IOA_Data,0xff00);	 // light both Red and Green led		
	      SP_Export(Port_IOB_Data,0x00ff);
	      delayFg = delay1(10000);
	      ClearWatchDog(); 
		return;
       
  
}


