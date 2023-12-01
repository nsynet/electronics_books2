#include<io8515.h> 
/*********************************************
           写ROM或存贮器命令到DS1820
*********************************************/
void ds1820_write(unsigned char cmd)
{ 
 unsigned char i,j;
 DDRA|=0x01;//PORTA.0输出
 for (j=0;j<=7;j++)
     {
     i=cmd&0x01;
     if (i==0x01)
        {
        PORTA&=0xfe;//输出LOW
        delay_us(10);
        PORTA|=0x01;//输出HIGH
        delay_us(100);
        }
     else
    	 {
         PORTA&=0xfe;//输出LOW
         delay_us(100);
         PORTA|=0x01;//输出HIGH
         delay_us(10);
         }
     cmd=cmd>>1;
     }
}