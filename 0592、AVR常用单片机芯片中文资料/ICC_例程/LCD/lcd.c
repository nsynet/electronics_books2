/******************************************************
             http://www.sl.com.cn
      ˫�����ӹ�˾----2*16 LCD������ʾ����(ICCAVR)
	             ���ߣ�ղ��ǰ		
	ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
              2���ڹ���ѡ���е�Additional Lib������slavr
		         ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
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