/**********************************************
             http://www.sl.com.cn
      双龙电子公司----占空比测量演示程序(ICCAVR)
	             作者：詹卫前
		  1、学习定时器T1捕捉(捕获)中断的使用		  
**********************************************/
#include <io8515.h>
#include <math.h>
#pragma interrupt_handler Icp_timer1:4   //   设置ICP中断
          /*   七段译码字形表     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
          /*     显示缓冲区       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned int count_l;
unsigned int count_h;
/******************************
         1ms延时程序
******************************/ 
void delay_1ms(void)
{ 
 unsigned int i;
 for(i=1;i<1142;i++)
    ;
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
void hextobcd(unsigned int count)
{
  unsigned char i,temp;
  for (i=0;i<6;i++)
  {temp=count%10;
   ledbuff[i]=tabel[temp];
   count=count/10;
  }
}
/******************************
          MCU初始化
******************************/ 
void mcu_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;//端口初始化
  TIMSK =0x08;//使能T1捕捉中断
  TCCR1A=0x00;
  TCCR1B=0xC2;//CK/8，捕捉周期的单位为1us
  ICR1=0;            
  TCNT1=0;          
 }
/************************************************
        主程序：测量ICP引脚上信号的占空比
************************************************/ 
void main()
{
 unsigned char n;
 unsigned long x,y;
 mcu_init();  
 SREG|=0x80;     //使能全局中断
 for(;;)
    { 
     x=count_h*100;
	 y=count_l+count_h;
	 n=x/y;       //计算占空比
	 hextobcd(n);	
	 display();  //显示测量值 
    }
}
/**************************************
             捕捉中断处理程序
**************************************/
void Icp_timer1(void)       
{
 if (TCCR1B&0x40)
   count_l=ICR1; //脉冲低电平宽度
 else
   count_h=ICR1; //脉冲高电平宽度
 ICR1=0;
 TCNT1=0; 
 TCCR1B^=0x40;
}
