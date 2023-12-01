/**********************************************
             http://www.sl.com.cn
      ˫�����ӹ�˾----Ƶ�ʼ���ʾ����(ICCAVR)
	             ���ߣ�ղ��ǰ
		  1��ѧϰ��ʱ��T1��׽(����)�жϵ�ʹ��
		  2��ѧϰƵ�ʼƵ���Ʒ���
		  3��ͨ����timecount���޸ģ���ʵ�ֶ�����
		     Ƶ�ʼƱ�̡�
**********************************************/
#include <io8515.h>
#include <macros.h>
#pragma interrupt_handler timer0:8
#pragma interrupt_handler timer1:4
extern void delay_ms(unsigned int n);//�����ⲿ����
extern void delay_1ms(void); 
#pragma data:code
          /*   �߶��������α�     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     ��ʾ������       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned long count;//Ƶ�ʲ�����������
unsigned int timecount;//Ƶ�ʲ���բ�ſ��Ʊ���
/******************************
           ��ʼ��
******************************/
void port_init(void)
 {
  MCUCR=0x00;
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
  TIMSK=0x0a;//����T0����жϺ�T1��׽�ж�
  TCCR0=0x03;
  TCCR1A=0x00;
  TCCR1B=0xc0;
  TCNT0=0x83;
  timecount=1000;
 }
/******************************
     ��·��̬ɨ����ʾ��·
******************************/ 
void display(void)
{
 unsigned char i;
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];//����ʾ������������PORTB��
   PORTD=~(1<<i);   //��ʼ��ʾ
   delay_1ms();     //ÿһλ��ʾ����һ��ʱ��
   PORTD|=(1<<i);   //�ر���ʾ
  }
}
/************************************
  ��countʮ����������ת��ΪLED�߶���
************************************/
void hextobcd(void)
{
  unsigned char i,temp;
  for (i=0;i<6;i++)
  {temp=count%10;
   ledbuff[i]=tabel[temp];
   count=count/10;
  }  
}
/*****************************
        ������
******************************/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 port_init(); //�˿ڳ�ʼ��
 count=0;
 SEI();
 while(1)
  {
   display();
  }
}
/**************************************
 T0����жϣ���ɲ���բ�ſ��ƺ�����ת��
***************************************/
void timer0(void)
   {
    if (--timecount==0)
	 {
	  CLI();
	  hextobcd();
	  if (count>999999)
	    ledbuff[0]|=0x80;
	  count=0;
	  timecount=1000;
	  SEI();
	 }
	TCNT0=0x84; 
   }
/*****************************
  T1��׽�жϣ�����������
******************************/   
void timer1(void)
   {
    count++;
   }   