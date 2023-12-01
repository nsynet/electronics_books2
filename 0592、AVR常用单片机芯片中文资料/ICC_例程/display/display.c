/*********************************************
               HTTP://WWW.SL.COM.CN
          	        双龙电子
               六路动态扫描显示程序		 
**********************************************/
#include <io8515.h>
extern void delay_ms(unsigned int n);//引用外部函数
extern void delay_1ms(void); 
          /*   七段译码字形表     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
          /*     显示缓冲区       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
void port_init(void)//端口初始化
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
 }
void display(void)//六路动态扫描显示电路
{
 unsigned char i;
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
   PORTD=~(1<<i);   //开始显示
   delay_1ms();     //每一位显示保持一定时间
   PORTD|=(1<<i);   //关闭显示
  }
}
/*主程序功能：演示了一个多路动态扫描程序的工作过程*/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 port_init(); //端口初始化
 while(1)
  {
   for(i=0;i<0x10;i++)  
     {
	  for(j=0;j<6;j++)
	      ledbuff[j]=tabel[i] ;//更换显示字形
      for (j=0;j<200;j++)	 
          display();	      //循环显示200次
	 } 
  }
}