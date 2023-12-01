/*****************************************************
            HTTP://WWW.SL.COM.CN
                   双龙电子
 使用注意：1、应包含头文件slavr.h
           2、在工程选项中的Additional Lib中填入slavr
		      使用编译器使用附加库文件libslavr.a
           3、本例采用了作按键释放检查的函数，适用于显
              示电路不需频繁刷新的程序,如静态显示、LCD
              模块电路等。	  
******************************************************/
#include <io8515.h>
#include <slavr.h>
//字形表
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
//显示缓冲区
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};

void port_init(void)//端口初始化
     {
	  DDRC=0x0f;
	  DDRD=0x3f;
      DDRB=0xff;
      PORTD=0xff;
      PORTB=0xff;
	  PORTC=0xff;
	 }
void display(void)//六路动态扫描显示
{
 unsigned char i;
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];
   PORTD=~(1<<i);
   delay_1ms();
   PORTD|=(1<<i);  
  }
}
/*主程序的功能：读取键盘扫描码，转换成相应的字形码后*/
/*送入显示缓冲区进行显示，显示部分参考display.c     */
/*如果shift键按下，则全部清0                        */		 
void main(void)
{
 unsigned char keyval1; 
 unsigned char i=0;
 MCUCR=0;
 port_init();
  while(1)
    { 
	 keyval1=keypad();//键盘扫描函数，作按键释放检查
	 if (keyval1!=0x7f)
	    { 
         if ((keyval1&0x80)==0x80)
			 {
			  for(i=0;i<6;i++)
    			   ledbuff[i]=tabel[0];      		  
			  }
		  else
    		  {for (i=0;i<5;i++)
    		      {
    			   ledbuff[5-i]=ledbuff[4-i];//每按一次键，左移一位
    		       }
			   ledbuff[0]=tabel[keyval1&0x7f];	   
    		  }	   				  
		}
	display();
	}
}		 