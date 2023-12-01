/*****************************************************
            HTTP://WWW.SL.COM.CN
                   ˫������
 ʹ��ע�⣺1��Ӧ����ͷ�ļ�slavr.h
           2���ڹ���ѡ���е�Additional Lib������slavr
		      ʹ�ñ�����ʹ�ø��ӿ��ļ�libslavr.a
           3�������������������ͷż��ĺ�������������
              ʾ��·����Ƶ��ˢ�µĳ���,�羲̬��ʾ��LCD
              ģ���·�ȡ�	  
******************************************************/
#include <io8515.h>
#include <slavr.h>
//���α�
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
//��ʾ������
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};

void port_init(void)//�˿ڳ�ʼ��
     {
	  DDRC=0x0f;
	  DDRD=0x3f;
      DDRB=0xff;
      PORTD=0xff;
      PORTB=0xff;
	  PORTC=0xff;
	 }
void display(void)//��·��̬ɨ����ʾ
{
 unsigned char i;
 for (i=0;i<6;i++)
  {
   PORTB=ledbuff[i];
   PORTD=~(1<<i);
   delay_1ms();
   PORTD|=(1<<i);  
  }
}
/*������Ĺ��ܣ���ȡ����ɨ���룬ת������Ӧ���������*/
/*������ʾ������������ʾ����ʾ���ֲο�display.c     */
/*���shift�����£���ȫ����0                        */		 
void main(void)
{
 unsigned char keyval1; 
 unsigned char i=0;
 MCUCR=0;
 port_init();
  while(1)
    { 
	 keyval1=keypad();//����ɨ�躯�����������ͷż��
	 if (keyval1!=0x7f)
	    { 
         if ((keyval1&0x80)==0x80)
			 {
			  for(i=0;i<6;i++)
    			   ledbuff[i]=tabel[0];      		  
			  }
		  else
    		  {for (i=0;i<5;i++)
    		      {
    			   ledbuff[5-i]=ledbuff[4-i];//ÿ��һ�μ�������һλ
    		       }
			   ledbuff[0]=tabel[keyval1&0x7f];	   
    		  }	   				  
		}
	display();
	}
}		 