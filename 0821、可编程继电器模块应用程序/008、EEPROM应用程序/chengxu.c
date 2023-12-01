/********************************************************************
                            汇诚科技

实现功能:EEPROM应用程序
使用芯片：STC15F104E
晶振：12MHZ
编译环境：Keil
作者：zhangxinchunleo
网站：www.ourhc.cn
淘宝店：汇诚科技 http://shop36330473.taobao.com
【声明】此程序仅用于学习与参考，引用请注明版权和作者信息！     

*********************************************************************/
/********************************************************************/
#include "reg52.h" 
#include <intrins.H>
#define uchar unsigned char //宏定义字符型变量
#define uint  unsigned int	//宏定义整型变量
/********************************************************************
                            寄存器设置
*********************************************************************/ 
sfr IAP_DATA  =0xc2;	 //数据寄存器
sfr IAP_ADDRH =0xc3;	 //地址寄存器
sfr IAP_ADDRL =0xc4;	 //地址寄存器
sfr IAP_CMD   =0xc5;     //命令寄存器
sfr IAP_TRIG  =0xc6; 	 //触发寄存器
sfr IAP_CONTR =0xc7;     //擦除寄存器

sbit  P33=P3^3; 		 //定义继电器控制输出脚
/********************************************************************
                            命令定义
*********************************************************************/
#define CMD_IDLE     0	 //EEPROM无操作
#define CMD_READ     1	 //读取字节
#define CMD_PROGRAM  2	 //写入字节
#define CMD_ERASE    3	 //擦除字节
/********************************************************************
                       编程周期由晶振决定
*********************************************************************/
//#define ENABLE_IAP 0X80	 //编程周期由晶振决定（如果<30MHZ选用此项）
//#define ENABLE_IAP 0X81	 //编程周期由晶振决定（如果<24MHZ选用此项）
//#define ENABLE_IAP 0X82	 //编程周期由晶振决定（如果<20MHZ选用此项）
  #define ENABLE_IAP 0X83	 //编程周期由晶振决定（如果<12MHZ选用此项）
//#define ENABLE_IAP 0X84	 //编程周期由晶振决定（如果<6MHZ选用此项）
//#define ENABLE_IAP 0X85	 //编程周期由晶振决定（如果<3MHZ选用此项）
//#define ENABLE_IAP 0X86	 //编程周期由晶振决定（如果<2MHZ选用此项）
//#define ENABLE_IAP 0X87	 //编程周期由晶振决定（如果<1MHZ选用此项）

#define IAP_ADDRESS 0X0000	 //内部EEPROM地址
/********************************************************************
                       函数初始化
*********************************************************************/
void Delay(uchar n);			 //延时函数
void IapIdle();				 //操作函数
uchar IapReadByte(uint addr); //读取函数
void IapProgramByte(uint addr,uchar dat); //写入函数
void IapEraseSector(uint addr);	//擦除函数
/********************************************************************
                            主函数
*********************************************************************/
void main()
{
 uint i; //定义整型变量i
 P33=0;
 Delay(10);//延时

 IapEraseSector(IAP_ADDRESS);  //擦除扇区
 for(i=0;i<512;i++)			   //擦除512个字节的扇区
 {
   if(IapReadByte(IAP_ADDRESS+i)!=0xff)//判断是否完全擦除
   goto Error;						   //如果没有擦除跳转到报错位置
  }


Delay(10); //延时
for(i=0;i<512;i++)//对512个字节进行数据写入
{
IapProgramByte(IAP_ADDRESS+i,(uchar)i);	 //写入数据
}

 Delay(10);//延时
 for(i=0;i<512;i++)//读取512个字节的数据
 {
   if(IapReadByte(IAP_ADDRESS+i)!=(uchar)i)//判断数据是否完整
   goto Error;							   //如果没有擦除跳转到报错位置
  }

while(1);  //循环一次
Error:	   //错误标志位
P33=1;	   //如果错误执行此操作
while(1);  //循环一次
}
/********************************************************************
                            延时函数
*********************************************************************/
void Delay(uchar n)
{
 uint x;
 while(n--)
 {
 x=0;
 while(++x);
 }
}
/********************************************************************
                            操作函数
*********************************************************************/
void IapIdle()
{
IAP_CONTR=0;
IAP_CMD=0;
IAP_TRIG=0;
IAP_ADDRH=0X80;
IAP_ADDRL=0;
}

/********************************************************************
                            读取一个字节函数
*********************************************************************/
uchar IapReadByte(uint addr)
{
uchar dat;  
IAP_CONTR=ENABLE_IAP;
IAP_CMD=CMD_READ;
IAP_ADDRL=addr;
IAP_ADDRH=addr>>8;
IAP_TRIG=0X5A;
IAP_TRIG=0XA5;
_nop_();
_nop_();
_nop_();
dat=IAP_DATA;
IapIdle();
return dat;
}

/********************************************************************
                            写入一个字节函数
*********************************************************************/
void IapProgramByte(uint addr,uchar dat)
{

IAP_CONTR=ENABLE_IAP;
IAP_CMD=CMD_PROGRAM;
IAP_ADDRL=addr;
IAP_ADDRH=addr>>8;
IAP_DATA=dat;
IAP_TRIG=0X5A;
IAP_TRIG=0XA5;
_nop_();
_nop_();
_nop_();
IapIdle();
}
/********************************************************************
                            擦除一个字节函数
*********************************************************************/
void IapEraseSector(uint addr)
{
IAP_CONTR=ENABLE_IAP;
IAP_CMD=CMD_ERASE;
IAP_ADDRL=addr;
IAP_ADDRH=addr>>8;
IAP_TRIG=0X5A;
IAP_TRIG=0XA5;
_nop_();
_nop_();
_nop_();
IapIdle();
}
 
/********************************************************************
                            结束
*********************************************************************/
