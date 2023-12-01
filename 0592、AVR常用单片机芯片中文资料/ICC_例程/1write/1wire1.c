/**********************************************
             http://www.sl.com.cn
      双龙电子公司----单总线演示程序(ICCAVR)
	             作者：詹卫前
		  1、以DS18B20数字温度计为例，DS18B20的DQ引脚连
		     接AT90S8515的PORTA.0引脚，可加4.7K上拉电阻
		  2、显示使用SL-AVR所配2*16LCD显示屏� 
		  3、应包含头文件slavr.h
          4、在工程选项中的Additional Lib中填入slavr
		     使编译器使用附加库文件libslavr.a
**********************************************/
#include<io8515.h> 
#include<slavr.h>
#pragma data:code
const unsigned char tabel[]="0123456789ABCDEF";
#pragma data:data 
/*********************************************
                匹配DS1820
*********************************************/ 
void ds1820_match(unsigned char *p)
  {
   unsigned char i;
   do 
     i=ds1820_ack();
   while (i==0x01);
   ds1820_write(0x55);	 
   for(i=0;i<8;i++)
     ds1820_write(p[i]);
  }
/*********************************************
   将十六进制数转换成ASC2码,并送LCD显示
*********************************************/
void asc2con(unsigned char *p,unsigned char len)
{
  unsigned char i,temp;
  for (i=0;i<len;i++)
  {  
  temp=p[len-1-i]&0xf0;
  temp=temp>>4;
  lcd_putc(tabel[temp]);
  temp=p[len-1-i]&0x0f;
  lcd_putc(tabel[temp]);
  }
}
/*********************************************
     以DS1820为例，演示单总线设备工作过程
*********************************************/    
void main(void)
{
 unsigned char i,crc;
 unsigned char ds1820[9];//存放从DS18B20读取的9字节数据
 unsigned char rom_code[8];//存放DS18B20的64位序列号
 unsigned char *asc2p;
 unsigned int ds1820_temp;//存放温度读数
 MCUCR=0x00;
 lcd_init();//LCD初始化
 lcd_clear();//LCD清屏
 lcd_gotoxy(0,0);
 lcd_puts("SERIAL NUMBER IS");//在(0,0)处输出字符串
 do
  i=ds1820_ack();//对DS18B20进行复位
 while (i==0x01); 
 ds1820_write(0x33);//写入0x33ROM命令
 for (i=0;i<8;i++)
  {
  rom_code[i]=ds1820_read();//读出64位序列号
  }
  asc2p=&rom_code[0];
  crc=crccheck(asc2p,8); //计算CRC校验和
 if (crc==0x00)    //CRC校验正确，显示序列号
     {lcd_gotoxy(0,1);
	 asc2p=&rom_code[0];	 
     asc2con(asc2p,8);  
     }
 delay_ms(2000); //延时
 while (1)
     {
     asc2p=&rom_code[0];
     ds1820_match(asc2p);//匹配DS1820
     ds1820_write(0x44); //启动DS1820转换
     delay_ms(900);//延时等转换结束，12位格式约需750ms
     asc2p=&rom_code[0];
     ds1820_match(asc2p);//匹配DS1820
     ds1820_write(0xbe); //读转换后温度值
     for (i=0;i<9;i++)
         {
		  ds1820[i]=ds1820_read();
		 }	 
     lcd_clear();
     lcd_puts("Thermometer ");
     asc2p=&ds1820[0];
     crc=crccheck(asc2p,9); //计算CRC校验和
     if (crc==0x00)    //CRC校验正确，输出温度读数并显示HEX数
          {
		   ds1820_temp=ds1820[1];
		   ds1820_temp=ds1820_temp<<8;
		   ds1820_temp+=ds1820[0];
		   asc2p=&ds1820[0];
		   asc2con(asc2p,2);
          }
	 lcd_gotoxy(0,1);	  	
     if ((ds1820_temp&0xf800)!=0)//判断是否小于0度
      	{ds1820_temp=0-ds1820_temp;
		 lcd_puts("-");
		 }
	 else
	    lcd_puts("+");	 
	 crc=ds1820_temp/16;//温度读数转换
	 for(i=0;i<3;i++)
	     {
		  ds1820[2-i]=tabel[crc%10];
		  crc=crc/10;		 
		 }
	 ds1820[3]='.';	 
     crc=ds1820_temp%16;
	 crc=crc*10;
	 ds1820[4]=tabel[crc/16];		 
     ds1820[5]=0xdf;		 
     ds1820[6]='C';
	for (i=0;i<7;i++)  //显示温度
	 lcd_putc(ds1820[i]);
      }
}

