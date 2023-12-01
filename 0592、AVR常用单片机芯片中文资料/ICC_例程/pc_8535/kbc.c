#include <io8535.h>
#include <macros.h>
#include "pindefs.h"
#include "scancodes.h"
#define BUFF_SIZE 64
//const ascii[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,
//                 0x39,0x41,0x42,0x43,0x44,0x45,0x46};
unsigned char bitcount;//PC键盘数据长度计数 
unsigned char kb_buffer[BUFF_SIZE];//键盘缓冲区
unsigned char input=0;//缓冲区读指针
unsigned char output=0;//缓冲区写指针
//送键盘按键ASCII码到键盘缓冲区
void put_kbbuff(unsigned char c)
 {
  kb_buffer[input]=c;
  if (input<(BUFF_SIZE-1))
     input++; 
  else
     input=0;	 
 }
//从键盘缓冲区读取按键的ASCII码 
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
//为运行读取PC键盘程序进行初始化  
void init_kb(void)
    {
	 MCUCR=0x02;//设置8515的INT0为下降沿触发中断 
     GIMSK|=(1<<INT0);//使能INT0中断
     SEI(); //开中断
     bitcount = 11;
    }
//对PC键盘的扫描码进行解码	
void decode(unsigned char sc)
    {
      static unsigned char shift,up,shiftup;
	  unsigned char i;
	  if (sc==0xf0)//按键释放
	      {
		   up=1;
		   return;
		  }
	  if (up==1)//SHIF键开关
	  	  {
		   up=0;
		   if ((sc==0x12)|(sc==0x59)) shift=0;
		   return;
		  }	  	   
	  switch (sc)
	    {
		 case 0x12:{//检测左SHIF键
					shift=1;		
					shiftup=1;
		           }		           
		 case 0x59:{//检测右SHIF键
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
//键盘数据读取程序	
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




