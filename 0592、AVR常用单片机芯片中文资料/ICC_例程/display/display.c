/*********************************************
               HTTP://WWW.SL.COM.CN
          	        ˫������
               ��·��̬ɨ����ʾ����		 
**********************************************/
#include <io8515.h>
extern void delay_ms(unsigned int n);//�����ⲿ����
extern void delay_1ms(void); 
          /*   �߶��������α�     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
          /*     ��ʾ������       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
void port_init(void)//�˿ڳ�ʼ��
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
 }
void display(void)//��·��̬ɨ����ʾ��·
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
/*�������ܣ���ʾ��һ����·��̬ɨ�����Ĺ�������*/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 port_init(); //�˿ڳ�ʼ��
 while(1)
  {
   for(i=0;i<0x10;i++)  
     {
	  for(j=0;j<6;j++)
	      ledbuff[j]=tabel[i] ;//������ʾ����
      for (j=0;j<200;j++)	 
          display();	      //ѭ����ʾ200��
	 } 
  }
}