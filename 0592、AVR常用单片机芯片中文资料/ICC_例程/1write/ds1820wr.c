#include<io8515.h> 
/*********************************************
           дROM����������DS1820
*********************************************/
void ds1820_write(unsigned char cmd)
{ 
 unsigned char i,j;
 DDRA|=0x01;//PORTA.0���
 for (j=0;j<=7;j++)
     {
     i=cmd&0x01;
     if (i==0x01)
        {
        PORTA&=0xfe;//���LOW
        delay_us(10);
        PORTA|=0x01;//���HIGH
        delay_us(100);
        }
     else
    	 {
         PORTA&=0xfe;//���LOW
         delay_us(100);
         PORTA|=0x01;//���HIGH
         delay_us(10);
         }
     cmd=cmd>>1;
     }
}