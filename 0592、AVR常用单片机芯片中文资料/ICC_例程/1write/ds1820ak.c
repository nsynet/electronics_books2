#include<io8515.h> 
/*********************************************
          ���DS1820�Ƿ���ڣ�
	���DS1820�����ڷ���1�����򷵻�0
*********************************************/
unsigned char ds1820_ack(void)
{
 unsigned char ack;
 DDRA|=0x01;//PORTA.0���
 PORTA&=0xfe;//���LOW
 delay_us(500);
 PORTA|=0x01;//���HIGH
 DDRA&=0xfe;//PORTA.0����
 delay_us(45);
 ack=PINA;
 ack&=0x01;
 delay_us(500);
 return ack;
}