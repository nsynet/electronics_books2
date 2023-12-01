/**********************************************
             http://www.sl.com.cn
      双龙电子公司----RS232通信演示程序(ICCAVR)
	             作者：詹卫前
		  1、使用ICCAVR的终端调试窗口，进行通信调试。
		  2、在AVR的UART工作之前，应当先对ICCAVR的终
		     端调试窗口进行设置，设置串口为com1或com2，
			 通信波特率为19200。
		  3、接线：PORTD.0(RXD)----R(D232)
		           PORTD.1(TXD)----T(D232)
**********************************************/
#include <io8515.h>
#include <stdio.h>
void main(void)
	{
     unsigned char temp;
     UBRR = 12;
     UCR=0x18;    
	 puts("Hello World!\n");
	 putchar(0x0d);
	 putchar(0x0a);	 
     printf("请使用PC机键盘输入数字、字母或汉字!");
     putchar(0x0a);
	 putchar(0x0d);
     while (1)
           { 		   
          	temp=getchar();
			if (temp!=0)
                {
				 putchar(temp);
				 if(temp==0x0d)
				    putchar(0x0a);
				 temp=0;
				}  	    			   		
       	   }
     }
