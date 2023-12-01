/**********************************************
             http://www.sl.com.cn
      ˫�����ӹ�˾----����ʱ����ʾ����(ICCAVR)
	             ���ߣ�ղ��ǰ
		  1��ѧϰ��ʱ��T1����жϵ�ʹ��
		  2��ѧϰ����ʱ�ӵı�̷���
		  3���ڳ�������ʱ��SHIFT����Уʱ
	ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
              2���ڹ���ѡ���е�Additional Lib������slavr
		         ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
***********************************************/
#include <io8515.h>
#include <macros.h>
#include <slavr.h>
#pragma interrupt_handler timer1:7
#pragma data:code
          /*   �߶��������α�     */        
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     ��ʾ������       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
unsigned char time[3]={0,0,0};
unsigned char flag=0;
/*****************************************
               ��ʼ��
*****************************************/
void port_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
  TIMSK=0x80;//����T1����ж�
  TCCR1A=0x00;
  TCCR1B=0x04;
  TCNT1=0x85ee;
  SEI();
 }
/*****************************************
             ˢ��LED��ʾ������
*****************************************/
void hextobcd (void)
   {
    unsigned char i,temp;
	for (i=0;i<3;i++)
    {
	temp=time[i]/10;
	temp=temp%10;
	ledbuff[5-2*i]=tabel[temp];
	temp=time[i]%10;
	ledbuff[4-2*i]=tabel[temp];
	}
   } 
/*****************************************
          ��·��̬ɨ����ʾ��·
*****************************************/   
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
/*****************************************
          �趨Уʱʱ��
*****************************************/  
void settime(void)
   { 
    unsigned char t1,t2,t3;
	for (t1=0;t1<3;t1++)
	{ 
	   ledbuff[5-2*t1]|=0x80;
       do
	     {
		 t2=scan_key();
	  	 display();
		 }
	   while(t2==0x7f);	 
	   do 
	     {
		 t3=scan_key();
	     display();	    
	     }
       while (t2==t3);
	   time[t1]=time[t1]%10+t2*10;
	   hextobcd();
	   ledbuff[5-2*t1]&=0x7f;
	   ledbuff[4-2*t1]|=0x80;
       do
	     {
		 t2=scan_key();
	  	 display();
		 }
	   while(t2==0x7f);	 
	   do 
	     {
		 t3=scan_key();
	     display();	    
	     }
       while (t2==t3);
	   t3=time[t1]/10;
	   time[t1]=t3*10+t2;
	   ledbuff[4-2*t1]&=0x7f;
	   hextobcd();	   		 	    
    }
    }
/*****************************************
�������ܣ���ʾ�˵���ʱ�ӳ���Ĺ�������
*****************************************/
void main(void)
{
 unsigned char i,j;
 MCUCR=0;
 flag=0;
 port_init(); //�˿ڳ�ʼ��
 i=scan_key();
 while(1)
  {
   i=scan_key(); 
   if (i!=0x7f)
     {
	  do 
	   {
	    j=scan_key();
	    display();	    
	   }
	  while (i==j); 
      if ((i&0x80)==0x80) 
	      settime();//�趨ʱ��
	 }
   if(flag==1)
    {
	 flag=0;
	 if (time[2]>=60) 
	    {
		 time[2]-=60;
		 time[1]++;
		 }
	if (time[1]>=60) 
    {
	 time[1]-=60;
	 time[0]++;
	 } 
	if (time[0]>=24) 
	    {
		 time[0]-=24;
		 }
	 hextobcd();
    }
   display();
  }
}
/*****************************************
          T1����ж�
*****************************************/  
void timer1(void)
   {
    flag=1;
	time[2]++;
	TCNT1=0x85ee;
    }