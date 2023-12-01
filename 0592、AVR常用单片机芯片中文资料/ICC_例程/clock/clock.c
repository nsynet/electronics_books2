/**********************************************
             http://www.sl.com.cn
      双龙电子公司----电脑时钟演示程序(ICCAVR)
	             作者：詹卫前
		  1、学习定时器T1溢出中断的使用
		  2、学习电脑时钟的编程方法
		  3、在程序运行时按SHIFT进行校时
	使用注意：1、应包含头文件slavr.h
              2、在工程选项中的Additional Lib中填入slavr
		         使用编译器使用附加库文件libslavr.a
***********************************************/
#include <io8515.h>
#include <macros.h>
#include <slavr.h>
#pragma interrupt_handler timer1:7
#pragma data:code
          /*   七段译码字形表     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     显示缓冲区       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned char time[3]={0,0,0};
unsigned char flag=0;
/*****************************************
               初始化
*****************************************/
void port_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
  TIMSK=0x80;//开放T1溢出中断
  TCCR1A=0x00;
  TCCR1B=0x04;
  TCNT1=0x85ee;
  SEI();
 }
/*****************************************
             刷新LED显示缓冲区
*****************************************/
void hextobcd (void)
   {
    unsigned char i,temp;
	for (i=0;i<3;i++)
    {
	temp=time[i]/10;
	temp=temp%10;
	ledbuff[5-2*i]=tabel[temp];
	temp=time[i]%10;
	ledbuff[4-2*i]=tabel[temp];
	}
   } 
/*****************************************
          六路动态扫描显示电路
*****************************************/   
void display(void)
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
/*****************************************
          设定校时时间
*****************************************/  
void settime(void)
   { 
    unsigned char t1,t2,t3;
	for (t1=0;t1<3;t1++)
	{ 
	   ledbuff[5-2*t1]|=0x80;
       do
	     {
		 t2=scan_key();
	  	 display();
		 }
	   while(t2==0x7f);	 
	   do 
	     {
		 t3=scan_key();
	     display();	    
	     }
       while (t2==t3);
	   time[t1]=time[t1]%10+t2*10;
	   hextobcd();
	   ledbuff[5-2*t1]&=0x7f;
	   ledbuff[4-2*t1]|=0x80;
       do
	     {
		 t2=scan_key();
	  	 display();
		 }
	   while(t2==0x7f);	 
	   do 
	     {
		 t3=scan_key();
	     display();	    
	     }
       while (t2==t3);
	   t3=time[t1]/10;
	   time[t1]=t3*10+t2;
	   ledbuff[4-2*t1]&=0x7f;
	   hextobcd();	   		 	    
    }
    }
/*****************************************
主程序功能：演示了电脑时钟程序的工作过程
*****************************************/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 flag=0;
 port_init(); //端口初始化
 i=scan_key();
 while(1)
  {
   i=scan_key(); 
   if (i!=0x7f)
     {
	  do 
	   {
	    j=scan_key();
	    display();	    
	   }
	  while (i==j); 
      if ((i&0x80)==0x80) 
	      settime();//设定时间
	 }
   if(flag==1)
    {
	 flag=0;
	 if (time[2]>=60) 
	    {
		 time[2]-=60;
		 time[1]++;
		 }
	if (time[1]>=60) 
    {
	 time[1]-=60;
	 time[0]++;
	 } 
	if (time[0]>=24) 
	    {
		 time[0]-=24;
		 }
	 hextobcd();
    }
   display();
  }
}
/*****************************************
          T1溢出中断
*****************************************/  
void timer1(void)
   {
    flag=1;
	time[2]++;
	TCNT1=0x85ee;
    }