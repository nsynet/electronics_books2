#include "ir_send.h"
#include "extern.h"





void delay(void)   //��� 0us
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
		ir_send(0x55);					//�ڵ�
	}	
	if(!P02)
	{
		while(!P02);	
		ir_send(0xaa);					//��Դ
	}
	if(!P03)
	{
		while(!P03);	
		ir_send(0x00);					//��ϴ
	}
	if(!P04)
	{
		while(!P04);	
		ir_send(0xff);					//���
	}
	if(!P05)
	{
		while(!P05);	
		ir_send(0xbb);					//����
	}
	if(!P06)
	{
		while(!P06);	
		ir_send(0x5a);					//Ů��
	}
	if(!P07)
	{
		while(!P07);	
		ir_send(0xa5);					//����
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




