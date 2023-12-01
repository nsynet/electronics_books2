/********************************************************************
                            汇诚科技

实现功能:秒延时2秒程序
使用芯片：STC15F104E
晶振：12MHZ
波特率：9600
编译环境：Keil
作者：zhangxinchunleo
网站：www.ourhc.cn
淘宝店：汇诚科技 http://shop36330473.taobao.com
【声明】此程序仅用于学习与参考，引用请注明版权和作者信息！     

*********************************************************************/
/********************************************************************/
#include<reg52.h>  	       //库文件
#define uchar unsigned char//宏定义无符号字符型
#define uint unsigned int  //宏定义无符号整型
/********************************************************************
                            I/O定义
*********************************************************************/
sbit JDQ=P3^3;	 //定义单片机P3口的第3位 （即P3.3）
/********************************************************************
                            延时函数
*********************************************************************/
void delay()//延时程序
{
uchar m,n,s;
for(m=20;m>0;m--)
for(n=200;n>0;n--)
for(s=248;s>0;s--);
}
/********************************************************************
                            主函数
*********************************************************************/
void main()
{
	while(1)   //无限循环
	{
	 JDQ=0;	   //点亮P3.3口灯
	 delay();  //延时
	 JDQ=1;	   //熄灭P3.3口灯
	 delay();  //延时
	}
}	
/********************************************************************
                              结束
*********************************************************************/