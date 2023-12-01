/*******************************************/
/*             PC机键盘演示程序            */
/*           广州双龙电子有限公司          */
/*           http://www.sl.com.cn          */
/*               作者：詹卫前              */
/*          MCU:AT90S8515 晶振:8MHZ        */
/*  使用ICCAVR的终端调试窗口观察PC键盘数据 */
/*          连线说明:SL-AVR+               */
/*			1、PC键盘clock--PD.2		   */
/*			2、PC键盘data---PD.3		   */
/*			3、D232.T-------PD.1		   */
/*			4、D232.R-------PD.0		   */
/*******************************************/
#include<io8515.h>
#include<stdio.h>
extern unsigned char get_char(void);
extern void init_kb(void);
//UART初始化
void uart0_init(void)
	 {
 	  UCR  = 0x00;
 	  UBRR = 0x19;//BAUD=19200
 	  UCR|=(1<<TXEN) ;//使能发送
 	 }
//端口初始化	 
void port_init(void)
	 {
	  DDRD=0x02;
	  PORTD=0xff;
	 }
//PC键盘演示程序,SHIFT键和按键同时按下时为大写 
void main(void)
	 {
	  unsigned char key;
	  port_init();
	  uart0_init();
	  init_kb();
	  puts("PC键盘演示程序");
	  putchar(0x0d);
	  while(1)
	  		 {
			  key=get_char();
			  if(key!=0) 
			      {
				   if (key==0x0d)//回车键处理
				      {					   
					   putchar('\n');
					   putchar(key);					   
					  }
				   else				   	  
				   	  putchar(key);
				  }
			 }	  
	 }	 	 


