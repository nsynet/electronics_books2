/*****************************************************
            HTTP://WWW.SL.COM.CN
                   ˫������
 ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
           2���ڹ���ѡ���е�Additional Lib������slavr
		      ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
           3�������������������ͷż��ĺ�������������
              ʾ��·����Ƶ��ˢ�µĳ���,�羲̬��ʾ��LCD
              ģ���·�ȡ�	  
******************************************************/
#include <io8515.h>
#include <slavr.h>
void main(void)
    {
	 unsigned char keyval,i;
	 lcd_init();
	 lcd_gotoxy(1,0);
	 lcd_puts("www.sl.com.cn");
	 lcd_gotoxy(0,1);	 
	 lcd_puts("INPUT: ");
	 while(1)
	  { 	     		
	   keyval=keypad();
	   if (keyval<16)//��Ӧ0~F�ļ�������
    	  {
    	   if (keyval<10)
    	       keyval=0x30+keyval;
    	   else
    	       keyval=55 +keyval;	  
    	   lcd_write_data(keyval);
    	  }
	   if((keyval&0x80)==0x80)//��ӦSHIF�ļ�������
	      {		   
		   for(i=0;i<7;i++)
		      {
			   lcd_shift(1,'r');
			   delay_ms(500);
			   }
           for(i=0;i<7;i++)
              {
               lcd_shift(1,'l');
               delay_ms(500);
              }   
		  }	   
	  }		
     }