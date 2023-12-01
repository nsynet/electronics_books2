/**********************************************
             http://www.sl.com.cn
      双龙电子公司----中断演示程序(ICCAVR)
**********************************************/
#include <io8515.h>
#pragma interrupt_handler timer:TOV1

char led_image = 0xFF;  // 关闭全部LED
/***************************************
          主程序入口
***************************************/
void main()
{
/***************************
   初始化8515寄存器
***************************/
        DDRB = 0xFF;
        PORTB = 0x00;
        TCCR1A=0;
        TCCR1B = 0x00;          // 停止定时器1
        TCNT1H = 0x00;          // 清除定时器1
        TCNT1L = 0x00;
        TIMSK=0x80;           // 开放定时器1溢出中断
        SREG|=0x80;
        TCCR1B =0x03;          // 启动定时器1 预分频比例64
        while (1)
	;
}
/*************************************
   在定时器中断中改变LED的显示状态
*************************************/
void timer()
{
 PORTB = ++led_image;
 PORTC=~PORTC;
}

