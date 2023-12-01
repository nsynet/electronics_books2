/**********************************************
             http://www.sl.com.cn
      Ë«Áúµç×Ó¹«Ë¾----µ¥×ÜÏßÑİÊ¾³ÌĞò(ICCAVR)
	             ×÷Õß£ºÕ²ÎÀÇ°
		  1¡¢ÒÔDS18B20Êı×ÖÎÂ¶È¼ÆÎªÀı£¬DS18B20µÄDQÒı½ÅÁ¬
		     ½ÓAT90S8515µÄPORTA.0Òı½Å£¬¿É¼Ó4.7KÉÏÀ­µç×è
		  2¡¢ÏÔÊ¾Ê¹ÓÃSL-AVRËùÅä2*16LCDÏÔÊ¾ÆÁ¢ 
		  3¡¢Ó¦°üº¬Í·ÎÄ¼şslavr.h
          4¡¢ÔÚ¹¤³ÌÑ¡ÏîÖĞµÄAdditional LibÖĞÌîÈëslavr
		     Ê¹±àÒëÆ÷Ê¹ÓÃ¸½¼Ó¿âÎÄ¼şlibslavr.a
**********************************************/
#include<io8515.h> 
#include<slavr.h>
#pragma data:code
const unsigned char tabel[]="0123456789ABCDEF";
#pragma data:data 
/*********************************************
                Æ¥ÅäDS1820
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
   ½«Ê®Áù½øÖÆÊı×ª»»³ÉASC2Âë,²¢ËÍLCDÏÔÊ¾
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
     ÒÔDS1820ÎªÀı£¬ÑİÊ¾µ¥×ÜÏßÉè±¸¹¤×÷¹ı³Ì
*********************************************/    
void main(void)
{
 unsigned char i,crc;
 unsigned char ds1820[9];//´æ·Å´ÓDS18B20¶ÁÈ¡µÄ9×Ö½ÚÊı¾İ
 unsigned char rom_code[8];//´æ·ÅDS18B20µÄ64Î»ĞòÁĞºÅ
 unsigned char *asc2p;
 unsigned int ds1820_temp;//´æ·ÅÎÂ¶È¶ÁÊı
 MCUCR=0x00;
 lcd_init();//LCD³õÊ¼»¯
 lcd_clear();//LCDÇåÆÁ
 lcd_gotoxy(0,0);
 lcd_puts("SERIAL NUMBER IS");//ÔÚ(0,0)´¦Êä³ö×Ö·û´®
 do
  i=ds1820_ack();//¶ÔDS18B20½øĞĞ¸´Î»
 while (i==0x01); 
 ds1820_write(0x33);//Ğ´Èë0x33ROMÃüÁî
 for (i=0;i<8;i++)
  {
  rom_code[i]=ds1820_read();//¶Á³ö64Î»ĞòÁĞºÅ
  }
  asc2p=&rom_code[0];
  crc=crccheck(asc2p,8); //¼ÆËãCRCĞ£ÑéºÍ
 if (crc==0x00)    //CRCĞ£ÑéÕıÈ·£¬ÏÔÊ¾ĞòÁĞºÅ
     {lcd_gotoxy(0,1);
	 asc2p=&rom_code[0];	 
     asc2con(asc2p,8);  
     }
 delay_ms(2000); //ÑÓÊ±
 while (1)
     {
     asc2p=&rom_code[0];
     ds1820_match(asc2p);//Æ¥ÅäDS1820
     ds1820_write(0x44); //Æô¶¯DS1820×ª»»
     delay_ms(900);//ÑÓÊ±µÈ×ª»»½áÊø£¬12Î»¸ñÊ½Ô¼Ğè750ms
     asc2p=&rom_code[0];
     ds1820_match(asc2p);//Æ¥ÅäDS1820
     ds1820_write(0xbe); //¶Á×ª»»ºóÎÂ¶ÈÖµ
     for (i=0;i<9;i++)
         {
		  ds1820[i]=ds1820_read();
		 }	 
     lcd_clear();
     lcd_puts("Thermometer ");
     asc2p=&ds1820[0];
     crc=crccheck(asc2p,9); //¼ÆËãCRCĞ£ÑéºÍ
     if (crc==0x00)    //CRCĞ£ÑéÕıÈ·£¬Êä³öÎÂ¶È¶ÁÊı²¢ÏÔÊ¾HEXÊı
          {
		   ds1820_temp=ds1820[1];
		   ds1820_temp=ds1820_temp<<8;
		   ds1820_temp+=ds1820[0];
		   asc2p=&ds1820[0];
		   asc2con(asc2p,2);
          }
	 lcd_gotoxy(0,1);	  	
     if ((ds1820_temp&0xf800)!=0)//ÅĞ¶ÏÊÇ·ñĞ¡ÓÚ0¶È
      	{ds1820_temp=0-ds1820_temp;
		 lcd_puts("-");
		 }
	 else
	    lcd_puts("+");	 
	 crc=ds1820_temp/16;//ÎÂ¶È¶ÁÊı×ª»»
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
	for (i=0;i<7;i++)  //ÏÔÊ¾ÎÂ¶È
	 lcd_putc(ds1820[i]);
      }
}

