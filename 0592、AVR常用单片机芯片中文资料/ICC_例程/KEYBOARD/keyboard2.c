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
	   if (keyval<16)//对应0~F的键盘输入
    	  {
    	   if (keyval<10)
    	       keyval=0x30+keyval;
    	   else
    	       keyval=55 +keyval;	  
    	   lcd_write_data(keyval);
    	  }
	   if((keyval&0x80)==0x80)//对应SHIF的键盘输入
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