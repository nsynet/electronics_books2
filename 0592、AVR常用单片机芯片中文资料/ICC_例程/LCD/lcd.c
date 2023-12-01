/******************************************************
             http://www.sl.com.cn
      双龙电子公司----2*16 LCD控制演示程序(ICCAVR)
	             作者：詹卫前		
	使用注意：1、应包含头文件slavr.h
              2、在工程选项中的Additional Lib中填入slavr
		         使用编译器使用附加库文件libslavr.a
*******************************************************/
#include <io8515.h>
#include <slavr.h>
void main(void)
{
 MCUCR=0;
 lcd_init();
 while(1)
    {
     lcd_gotoxy(2,0);
     lcd_puts("Hello World!");
     delay_ms(2000);
     lcd_clear();
     lcd_gotoxy(4,0);
     lcd_puts("HTTP://");
     lcd_gotoxy(1,1);
     lcd_puts("www.sl.com.cn");
	 delay_ms(2000);
	 lcd_clear();
     }
 }