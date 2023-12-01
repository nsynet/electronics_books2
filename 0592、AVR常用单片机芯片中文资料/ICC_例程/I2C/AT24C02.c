/**********************************************
             http://www.sl.com.cn
      ˫�����ӹ�˾----I2C������ʾ����(ICCAVR)
	             ���ߣ�ղ��ǰ
		  1���Է���AT24C02Ϊ��
		  2��SDA ��PORTA.0
		  3��SCL : PORTA.1
	ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
              2���ڹ���ѡ���е�Additional Lib������slavr
		         ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
***********************************************/
#include <io8515.h>
#include <slavr.h>
          /*   �߶��������α�     */
#pragma data:code		          
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     ��ʾ������       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x00,0x00};
unsigned char at24_add,at24_data;
/******************************************
               �˿ڳ�ʼ��
*******************************************/
void port_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
 }
/******************************************
          ��·��̬ɨ����ʾ��·
*******************************************/
void display(void)
{
 unsigned char i;
  i=at24_data%16;
  ledbuff[0]=tabel[i];
  i=at24_data/16;
  ledbuff[1]=tabel[i];
  i=at24_add%16;
  ledbuff[2]=tabel[i];
  i=at24_add/16;
  ledbuff[3]=tabel[i];
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];//����ʾ������������PORTB��
   PORTD=~(1<<i);   //��ʼ��ʾ
   delay_1ms();     //ÿһλ��ʾ����һ��ʱ��
   PORTD|=(1<<i);   //�ر���ʾ
  }
}
/******************************************
    �������ܣ���ʾ�˶�дAT24C02�Ĺ���
	˵����1��������0~F�����������ַ�����ݣ�
	         SHIFT�������л�״̬
		  2���ϵ縴λ�󣬰����ּ�ֻ�����޸ĵ�
		     ַ,�����Զ���ʾAT24C02��Ԫ���ݡ�
		  3����һ��SHIFT�������λLEDС������
		     ��ʱ�����޸����֣��ٰ�һ��SHIFT��
			 �����޸ĺ������д��AT24C02��Ȼ
			 ��ص��ϵ縴λ���״̬		
*******************************************/
void main(void)
{
 unsigned char key1,key2;
 unsigned char index,flag;
 MCUCR=0;
 at24_add=0;
 at24_data=0;
 index=0;
 flag=0;
 port_init(); //�˿ڳ�ʼ��
 while(1)
  {  
     key1=scan_key();
  	 if (key1!=0x7f)
	    {
		 do 
		   {
		    key2=scan_key();//��鰴���ͷ�
	  	    display();
			}
		 while(key1==key2);
		 if (key1>=0x80)
		    {
			 if (flag!=0x00)//SHIFT���л����ݺ͵�ַ�޸�
			     { 
				   Write24c02(&at24_data,at24_add,1);
				   flag=0x00;
				  }			 
			 else flag=0x80;
			 ledbuff[5]=0x00^flag;
			 index=0;
			 }
		 else
		    {
			 switch (index)
			   {
			    case 0:{if (flag==0x00)
				           {key2=at24_add&0x0f;
						    at24_add=key2|(key1<<4);
						    }
				        else
						   {key2=at24_data&0x0f;
						    at24_data=key2|(key1<<4);
							}
						index=01;							
						break;	     
				       }
				case 1:{if (flag==0x00)
				           {key2=at24_add&0xf0;
						    at24_add=key2|(key1&0x0f);
						    }
				        else
						   {key2=at24_data&0xf0;
						    at24_data=key2|(key1&0x0f);
							}
						index=00;	
						break;	
				       }
			   }    			
			} 	
		 }	 	 		 		 			  
     if (flag==0x00)
	 Read24c02(&at24_data,at24_add,1);
	 display();	  
  }
}