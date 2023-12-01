#include"stc12c5a60s2.h"
#define uchar unsigned char
#define uint  unsigned int 	

uchar count=0;		 //计数变量
uchar time=0;		 //时间累积变量	
uchar bzw=0;		 //到达一秒没有
long fhz=0;		 //频率


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
	AUXR1 = 0x00;	 				 //1T工作方式
 	BRT   = 0XFD; 					 //设置波特率9600
 	AUXR  = 0x11;					 //启动波特率发生器		 
}

void time_init()
{
	TMOD=0x15;		     //一定时  零计数
	TH0=TL0=0x00;		     //清空计数
	TH1=0x4c;
	TL1=0x00;			     //定时50ms

	EA=1;
	ET0=1;
	ET1=1;				//开中断

	TR0=1;				//开始计数
	TR1=1;				//秒信号发生
}

void printf(uchar p)
{
	SBUF=p;
	while(!TI);
	TI=0;
}
			               

void count0() interrupt 1			 //频率计数
{
	TF0=0;
	count++;
}

void delay1s() interrupt 3			 //秒频率计算
{
	TF1=0;	
	TH1=0x4c;TL1=0x00;				 //50毫秒
	time++;						
	if(time==20)					  //20次为1秒
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


