/******************************************************
              双龙电子公司http://www.sl.com.cn
              AT90S8535--AD转换演示程序(ICCAVR)
	                  作者：詹卫前		
	使用注意：1、应包含头文件slavr.h
              2、在工程选项中的Additional Lib中填入slavr
		         使用编译器使用附加库文件libslavr.a
			  3、使用SL-AVRAD实验设备
    接线说明：1、PA.0(PIN40)处接电平指示LED的短路块断开
			  2、A/D和VX之间的短路块闭合
			  3、AREF(PIN32)和AVCC(PIN30)接VCC
			  4、AGND(PIN31)接GND												   			  
*******************************************************/
#include<io8535.h>
#include<slavr.h>
#include<macros.h>
unsigned int ad_con;//存放PA0的AD转换结果
unsigned char adcval[6];//存放电压ASCII码
/*      将AD结果转换成电压     */
#define vref   497
unsigned char * adctoasc(unsigned int adc)
    {
	 unsigned int temp;
	 unsigned char i;
	 unsigned char *char_p;
     temp=(unsigned int)(((unsigned long)((unsigned long)adc*vref))/1024);
     for(i=0;i<3;i++)
	    {
		 adcval[3-i]=temp%10+0x30;
		 temp=temp/10;
		}
	 adcval[0]=adcval[1];
	 adcval[1]='.';	
	 adcval[4]='V';	
	 adcval[5]=0;	
	 char_p=adcval;
	 return char_p;
	}
/*      AD转换程序     */
#pragma interrupt_handler adc_isr:IT_ADC
void adc_isr(void)
   {
    unsigned int temp=0;
	while(temp<6)
	    temp++;
	ad_con=ADC;    
   	ADCSR|=(1<<ADSC);//启动转换 			 	 		 
   } 
//将AD转换结果转换成电压数值，然后在LCD上显示   
void main(void)
{
 MCUCR=0;
 ADMUX=0x00;//0通道
 ADCSR=(1<<ADEN)|(1<<ADSC)|(1<<ADIF)|(1<<ADIE)|0x06;
 lcd_init();
 SEI();
 while(1)
    {
     lcd_gotoxy(2,0);
     lcd_puts("AD--Converter");
	 lcd_gotoxy(2,1); 
	 lcd_puts("Voltage:");   
     lcd_gotoxy(10,1);
     lcd_puts(adctoasc(ad_con));
	 delay_ms(500);
	 lcd_clear();
     }
 }   