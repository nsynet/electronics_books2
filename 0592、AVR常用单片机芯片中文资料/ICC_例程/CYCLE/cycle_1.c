/**********************************************
             http://www.sl.com.cn
      ˫�����ӹ�˾----ռ�ձȲ�����ʾ����(ICCAVR)
	             ���ߣ�ղ��ǰ
		  1��ѧϰ��ʱ��T1��׽(����)�жϵ�ʹ��		  
**********************************************/
#include <io8515.h>
#include <math.h>
#pragma interrupt_handler Icp_timer1:4   //   ����ICP�ж�
          /*   �߶��������α�     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
          /*     ��ʾ������       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned int count_l;
unsigned int count_h;
/******************************
         1ms��ʱ����
******************************/ 
void delay_1ms(void)
{ 
 unsigned int i;
 for(i=1;i<1142;i++)
    ;
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
void hextobcd(unsigned int count)
{
  unsigned char i,temp;
  for (i=0;i<6;i++)
  {temp=count%10;
   ledbuff[i]=tabel[temp];
   count=count/10;
  }
}
/******************************
          MCU��ʼ��
******************************/ 
void mcu_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;//�˿ڳ�ʼ��
  TIMSK =0x08;//ʹ��T1��׽�ж�
  TCCR1A=0x00;
  TCCR1B=0xC2;//CK/8����׽���ڵĵ�λΪ1us
  ICR1=0;            
  TCNT1=0;          
 }
/************************************************
        �����򣺲���ICP�������źŵ�ռ�ձ�
************************************************/ 
void main()
{
 unsigned char n;
 unsigned long x,y;
 mcu_init();  
 SREG|=0x80;     //ʹ��ȫ���ж�
 for(;;)
    { 
     x=count_h*100;
	 y=count_l+count_h;
	 n=x/y;       //����ռ�ձ�
	 hextobcd(n);	
	 display();  //��ʾ����ֵ 
    }
}
/**************************************
             ��׽�жϴ������
**************************************/
void Icp_timer1(void)       
{
 if (TCCR1B&0x40)
   count_l=ICR1; //����͵�ƽ���
 else
   count_h=ICR1; //����ߵ�ƽ���
 ICR1=0;
 TCNT1=0; 
 TCCR1B^=0x40;
}
