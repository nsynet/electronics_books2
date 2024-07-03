#include "hardware.h"

//在延时函数中有扫描键盘处理
int delay(unsigned int n)
{
   unsigned int i,j ;
	for(i=0;i<n;i++){
	Key = SP_GetCh();
	if(Key != 0 && Key != 0xff) 
	   return (1) ;
    for(j = 0;j<100;j++);   
    }
	return(0);    

}
///////////////////////////////////////
//测试LED点阵 红、绿、橙交替显示
//1*8键盘有键按下退出测试
//////////////////////////////////////
void TestLed(void)
{
	unsigned int delayFg;
	 SP_Init_IOA(0xff00,0xff00,0xffff);//高八位为输出端，低八位为输
	 SP_Init_IOB(0xffff,0xffff,0xffff);//高八位为输出端，低八位为输

	      SP_Export(Port_IOA_Data,0xff00);	// light Red led
	      SP_Export(Port_IOB_Data,0x00ff);	      			
	      delayFg = delay(5000);
		
	      SP_Export(Port_IOA_Data,0xff00);	// light green led		
	      SP_Export(Port_IOB_Data,0xff00);	
       	  delayFg = delay(5000);
		
	      SP_Export(Port_IOA_Data,0xff00);	 // light both Red and Green led		
	      SP_Export(Port_IOB_Data,0x0000);
	      delayFg = delay(5000);
	
		return;
       
  
}


