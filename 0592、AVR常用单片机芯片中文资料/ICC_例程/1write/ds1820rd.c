#include<io8515.h> 
/*********************************************
          ��DS1820��1�ֽ�����
*********************************************/ 
unsigned char ds1820_read(void)
{
  unsigned char i,byte,temp;
  byte=0x00;
  for (i=0;i<8;i++)
      {
       DDRA|=0x01;//PORTA.0���
	   PORTA&=0xfe;//���LOW
       delay_us(3);
       PORTA|=0x01;//���HIGH
       DDRA&=0xfe;//PORTA.0����
       delay_us(10);
	   temp=(PINA&0x01);
	   if (temp!=0x00)      	   
		   byte|=0x80;
	   if (i<7)	   
		   byte=byte>>1;
	   delay_us(100);
	   DDRA|=0x01;//PORTA.0���
	   delay_us(5);
       }
   return byte;
}