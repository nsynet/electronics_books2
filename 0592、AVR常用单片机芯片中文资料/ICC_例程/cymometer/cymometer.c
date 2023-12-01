/**********************************************
             http://www.sl.com.cn
      双龙电子公司----频率计演示程序(ICCAVR)
	             作者：詹卫前
		  1、学习定时器T1捕捉(捕获)中断的使用
		  2、学习频率计的设计方法
		  3、通过对timecount的修改，可实现多量程
		     频率计编程。
**********************************************/
#include <io8515.h>
#include <macros.h>
#pragma interrupt_handler timer0:8
#pragma interrupt_handler timer1:4
extern void delay_ms(unsigned int n);//引用外部函数
extern void delay_1ms(void); 
#pragma data:code
          /*   七段译码字形表     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     显示缓冲区       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned long count;//频率测量计数变量
unsigned int timecount;//频率测量闸门控制变量
/******************************
           初始化
******************************/
void port_init(void)
 {
  MCUCR=0x00;
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
  TIMSK=0x0a;//开放T0溢出中断和T1捕捉中断
  TCCR0=0x03;
  TCCR1A=0x00;
  TCCR1B=0xc0;
  TCNT0=0x83;
  timecount=1000;
 }
/******************************
     六路动态扫描显示电路
******************************/ 
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
/************************************
  将count十六进制数据转换为LED七段码
************************************/
void hextobcd(void)
{
  unsigned char i,temp;
  for (i=0;i<6;i++)
  {temp=count%10;
   ledbuff[i]=tabel[temp];
   count=count/10;
  }  
}
/*****************************
        主程序
******************************/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 port_init(); //端口初始化
 count=0;
 SEI();
 while(1)
  {
   display();
  }
}
/**************************************
 T0溢出中断，完成测量闸门控制和数字转换
***************************************/
void timer0(void)
   {
    if (--timecount==0)
	 {
	  CLI();
	  hextobcd();
	  if (count>999999)
	    ledbuff[0]|=0x80;
	  count=0;
	  timecount=1000;
	  SEI();
	 }
	TCNT0=0x84; 
   }
/*****************************
  T1捕捉中断，完成脉冲计数
******************************/   
void timer1(void)
   {
    count++;
   }   