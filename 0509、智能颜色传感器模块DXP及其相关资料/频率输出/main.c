#include"stc12c5a60s2.h"
#define uchar unsigned char
#define uint  unsigned int 	

uchar count=0;		 //��������
uchar time=0;		 //ʱ���ۻ�����	
uchar bzw=0;		 //����һ��û��
long fhz=0;		 //Ƶ��


void delay(uint t)
{
  uint i,j;
   for(i=0;i<t;i++)
   {
   	 for(j=13;j>0;j--);
	 { ;
	 }
   }
}

void uart_init()
{
	SCON  = 0x50;
	AUXR1 = 0x00;	 				 //1T������ʽ
 	BRT   = 0XFD; 					 //���ò�����9600
 	AUXR  = 0x11;					 //���������ʷ�����		 
}

void time_init()
{
	TMOD=0x15;		     //һ��ʱ  �����
	TH0=TL0=0x00;		     //��ռ���
	TH1=0x4c;
	TL1=0x00;			     //��ʱ50ms

	EA=1;
	ET0=1;
	ET1=1;				//���ж�

	TR0=1;				//��ʼ����
	TR1=1;				//���źŷ���
}

void printf(uchar p)
{
	SBUF=p;
	while(!TI);
	TI=0;
}
			               

void count0() interrupt 1			 //Ƶ�ʼ���
{
	TF0=0;
	count++;
}

void delay1s() interrupt 3			 //��Ƶ�ʼ���
{
	TF1=0;	
	TH1=0x4c;TL1=0x00;				 //50����
	time++;						
	if(time==20)					  //20��Ϊ1��
	{
		time=0;
		fhz=(count*65535+TH0*255+TL0)*0.043965517;
		count=0;
		TH0=TL0=0;
		bzw=1;
	}				 
}

void main()
{
	time_init();
	uart_init();
	while(1)
	{
		printf(fhz);	
		delay(10000);		
	}
}


