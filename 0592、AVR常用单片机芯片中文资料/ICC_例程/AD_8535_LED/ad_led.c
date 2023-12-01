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
          /*   七段译码字形表     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,
	  	0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
          /*     显示缓冲区       */
unsigned char ledbuff[6];
void port_init(void)//端口初始化
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
 }
void display(void)//六路动态扫描显示电路
{
 unsigned char i;
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
   PORTD=~(1<<i);   //开始显示
   delay_1ms();     //每一位显示保持一定时间
   PORTD|=(1<<i);   //关闭显示
  }
} 
unsigned int ad_con;//存放PA0的AD转换结果
/*      将AD结果转换成电压     */
#define vref   497
void adctovol(unsigned int adc)
    {
	 unsigned int temp;
	 unsigned char i;
	 unsigned char *char_p;
     temp=(unsigned int)(((unsigned long)((unsigned long)adc*vref))/1024);
     for(i=0;i<3;i++)
	    {
		 ledbuff[i]=tabel[temp%10];
		 temp=temp/10;
		}
     ledbuff[5]=tabel[0x0a];
	 ledbuff[4]=tabel[0x0d];
	 ledbuff[3]=0x40;
	 ledbuff[2]|=0x80;		
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
 unsigned char i;
 port_init();
 MCUCR=0;
 ADMUX=0x00;//0通道
 ADCSR=(1<<ADEN)|(1<<ADSC)|(1<<ADIF)|(1<<ADIE)|0x06;
 SEI();
 for(i=0;i<6;i++)
    ledbuff[i]=tabel[0];
 i=0;
 while(1)
    {
     if((i==127)|(i==0))
	     adctovol(ad_con);//降低AD结果刷新速率
	 display();			  //使末位闪烁不太明显
	 i++; 
    }
 }   
