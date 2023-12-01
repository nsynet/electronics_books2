#include <io8535.h>
#include <macros.h>
#include "pindefs.h"
#include "scancodes.h"
#define BUFF_SIZE 64
//const ascii[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,
//                 0x39,0x41,0x42,0x43,0x44,0x45,0x46};
unsigned char bitcount;//PC�������ݳ��ȼ��� 
unsigned char kb_buffer[BUFF_SIZE];//���̻�����
unsigned char input=0;//��������ָ��
unsigned char output=0;//������дָ��
//�ͼ��̰���ASCII�뵽���̻�����
void put_kbbuff(unsigned char c)
 {
  kb_buffer[input]=c;
  if (input<(BUFF_SIZE-1))
     input++; 
  else
     input=0;	 
 }
//�Ӽ��̻�������ȡ������ASCII�� 
unsigned char get_char(void)
  {
   unsigned char temp;
   if(output==input)
       return 0;
   else
      {
	   temp=kb_buffer[output];
	   if(output<(BUFF_SIZE-1))
	     {
		  output++;
		 }
	   else
	     output=0;
	   return temp;	  
	  }	     
  }
//Ϊ���ж�ȡPC���̳�����г�ʼ��  
void init_kb(void)
    {
	 MCUCR=0x02;//����8515��INT0Ϊ�½��ش����ж� 
     GIMSK|=(1<<INT0);//ʹ��INT0�ж�
     SEI(); //���ж�
     bitcount = 11;
    }
//��PC���̵�ɨ������н���	
void decode(unsigned char sc)
    {
      static unsigned char shift,up,shiftup;
	  unsigned char i;
	  if (sc==0xf0)//�����ͷ�
	      {
		   up=1;
		   return;
		  }
	  if (up==1)//SHIF������
	  	  {
		   up=0;
		   if ((sc==0x12)|(sc==0x59)) shift=0;
		   return;
		  }	  	   
	  switch (sc)
	    {
		 case 0x12:{//�����SHIF��
					shift=1;		
					shiftup=1;
		           }		           
		 case 0x59:{//�����SHIF��
				    shift=1;	
					shiftup=1;
		           }		           
		 default:{
		          if (shift==0)
					 {
					 for(i = 0;unshifted[i][0]!=sc && unshifted[i][0]; i++);
                     if (unshifted[i][0] == sc)
						  put_kbbuff(unshifted[i][1]);	 
					 }
				  else
				     {
					 for(i = 0;shifted[i][0]!=sc && shifted[i][0]; i++);
                     if (shifted[i][0] == sc)
                         {
						  put_kbbuff(shifted[i][1]);						  
						 }	 	 						 
					 } 
		         }		         
		} 	
    }
//�������ݶ�ȡ����	
#pragma interrupt_handler int0_isr:2
void int0_isr(void)
   {
    static unsigned char data;   	
    switch (bitcount)
	  {
	   case 11:{
	            if ((PIN_KB&(1<<DATAPIN))!=0)
				     return;
			    else		 
	   			    bitcount--;
	    		break;}
	   case 2:{
	   			bitcount--;	   		   
			    break;}
	   case 1:{
	   			bitcount--;	 
				if ((PIN_KB&(1<<DATAPIN))==0)
				    {
					 bitcount=11;
					 return;
					}
				else
				   {
				    bitcount=11;
		            decode(data);
				   }	  
	   	        break;}
	   default:{
	   	        data = (data >> 1);
                if((PIN_KB&(1<<DATAPIN))!=0)
                    data|=0x80;
				bitcount--;
	            }		
	  }		 		 	  	
    } 




