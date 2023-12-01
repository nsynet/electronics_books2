#include<io8515.h> 
/*********************************************
          检查DS1820是否存在：
	如果DS1820不存在返回1，否则返回0
*********************************************/
unsigned char ds1820_ack(void)
{
 unsigned char ack;
 DDRA|=0x01;//PORTA.0输出
 PORTA&=0xfe;//输出LOW
 delay_us(500);
 PORTA|=0x01;//输出HIGH
 DDRA&=0xfe;//PORTA.0输入
 delay_us(45);
 ack=PINA;
 ack&=0x01;
 delay_us(500);
 return ack;
}