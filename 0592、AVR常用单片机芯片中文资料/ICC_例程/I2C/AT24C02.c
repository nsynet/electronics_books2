/**********************************************
             http://www.sl.com.cn
      双龙电子公司----I2C总线演示程序(ICCAVR)
	             作者：詹卫前
		  1、以访问AT24C02为例
		  2、SDA ：PORTA.0
		  3、SCL : PORTA.1
	使用注意：1、应包含头文件slavr.h
              2、在工程选项中的Additional Lib中填入slavr
		         使用编译器使用附加库文件libslavr.a
***********************************************/
#include <io8515.h>
#include <slavr.h>
          /*   七段译码字形表     */
#pragma data:code		          
const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
#pragma data:data
          /*     显示缓冲区       */
unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x00,0x00};
unsigned char at24_add,at24_data;
/******************************************
               端口初始化
*******************************************/
void port_init(void)
 {
  DDRD=0x3f;
  DDRB=0xff;
  PORTD=0xff;
  PORTB=0xff;
 }
/******************************************
          六路动态扫描显示电路
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
   PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
   PORTD=~(1<<i);   //开始显示
   delay_1ms();     //每一位显示保持一定时间
   PORTD|=(1<<i);   //关闭显示
  }
}
/******************************************
    主程序功能：演示了读写AT24C02的过程
	说明：1、键盘上0~F键用于输入地址或数据，
	         SHIFT键用于切换状态
		  2、上电复位后，按数字键只可以修改地
		     址,程序自动显示AT24C02单元内容。
		  3、按一次SHIFT键，最高位LED小数点亮
		     此时可以修改数字，再按一次SHIFT键
			 程序将修改后的数字写入AT24C02，然
			 后回到上电复位后的状态		
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
 port_init(); //端口初始化
 while(1)
  {  
     key1=scan_key();
  	 if (key1!=0x7f)
	    {
		 do 
		   {
		    key2=scan_key();//检查按键释放
	  	    display();
			}
		 while(key1==key2);
		 if (key1>=0x80)
		    {
			 if (flag!=0x00)//SHIFT键切换数据和地址修改
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