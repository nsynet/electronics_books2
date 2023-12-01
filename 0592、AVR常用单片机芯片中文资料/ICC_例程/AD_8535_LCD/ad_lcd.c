/******************************************************
              ˫�����ӹ�˾http://www.sl.com.cn
              AT90S8535--ADת����ʾ����(ICCAVR)
	                  ���ߣ�ղ��ǰ		
	ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
              2���ڹ���ѡ���е�Additional Lib������slavr
		         ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
			  3��ʹ��SL-AVRADʵ���豸
    ����˵����1��PA.0(PIN40)���ӵ�ƽָʾLED�Ķ�·��Ͽ�
			  2��A/D��VX֮��Ķ�·��պ�
			  3��AREF(PIN32)��AVCC(PIN30)��VCC
			  4��AGND(PIN31)��GND												   			  
*******************************************************/
#include<io8535.h>
#include<slavr.h>
#include<macros.h>
unsigned int ad_con;//���PA0��ADת�����
unsigned char adcval[6];//��ŵ�ѹASCII��
/*      ��AD���ת���ɵ�ѹ     */
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
/*      ADת������     */
#pragma interrupt_handler adc_isr:IT_ADC
void adc_isr(void)
   {
    unsigned int temp=0;
	while(temp<6)
	    temp++;
	ad_con=ADC;    
   	ADCSR|=(1<<ADSC);//����ת�� 			 	 		 
   } 
//��ADת�����ת���ɵ�ѹ��ֵ��Ȼ����LCD����ʾ   
void main(void)
{
 MCUCR=0;
 ADMUX=0x00;//0ͨ��
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