#include "ir_send.h"
#include "extern.h"





void delay(void)   //误差 0us
{
    unsigned char a,b,c;
    for(c=3;c>0;c--)
        for(b=116;b>0;b--)
            for(a=214;a>0;a--);
}

void key()
{
	if(!P01)
	{
		while(!P01);
		ir_send(0x55);					//节电
	}	
	if(!P02)
	{
		while(!P02);	
		ir_send(0xaa);					//电源
	}
	if(!P03)
	{
		while(!P03);	
		ir_send(0x00);					//冲洗
	}
	if(!P04)
	{
		while(!P04);	
		ir_send(0xff);					//烘干
	}
	if(!P05)
	{
		while(!P05);	
		ir_send(0xbb);					//下移
	}
	if(!P06)
	{
		while(!P06);	
		ir_send(0x5a);					//女性
	}
	if(!P07)
	{
		while(!P07);	
		ir_send(0xa5);					//上移
	}
}



void main(void)
{
	ir_init();

	P0 = 0xff;	
   	while(1)
	{
	 	delay();
  		key();
	}
}




