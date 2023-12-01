	.module .1wire1.c
	.area code(ram, con, rel)
	.area lit(rom, con, rel)
_tabel::
	.byte 48,49,50,51,52,53,54,55,56,57,'A,'B,'C,'D,'E,'F
	.byte 0
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
	.dbsym s tabel _tabel A[17:17]c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
	.dbfunc s ds1820_match _ds1820_match fI
;              i -> R20
;              p -> R22,R23
	.even
_ds1820_match::
	rcall push_gset2
	mov R22,R16
	mov R23,R17
	.dbline -1
	.dbline 21
; /**********************************************
;              http://www.sl.com.cn
;       Ë«Áúµç×Ó¹«Ë¾----µ¥×ÜÏßÑÝÊ¾³ÌÐò(ICCAVR)
; 	             ×÷Õß£ºÕ²ÎÀÇ°
; 		  1¡¢ÒÔDS18B20Êý×ÖÎÂ¶È¼ÆÎªÀý£¬DS18B20µÄDQÒý½ÅÁ¬
; 		     ½ÓAT90S8515µÄPORTA.0Òý½Å£¬¿É¼Ó4.7KÉÏÀ­µç×è
; 		  2¡¢ÏÔÊ¾Ê¹ÓÃSL-AVRËùÅä2*16LCDÏÔÊ¾ÆÁ¢ 
; 		  3¡¢Ó¦°üº¬Í·ÎÄ¼þslavr.h
;           4¡¢ÔÚ¹¤³ÌÑ¡ÏîÖÐµÄAdditional LibÖÐÌîÈëslavr
; 		     Ê¹±àÒëÆ÷Ê¹ÓÃ¸½¼Ó¿âÎÄ¼þlibslavr.a
; **********************************************/
; #include<io8515.h> 
; #include<slavr.h>
; #pragma data:code
; const unsigned char tabel[]="0123456789ABCDEF";
; #pragma data:data 
; /*********************************************
;                 Æ¥ÅäDS1820
; *********************************************/ 
; void ds1820_match(unsigned char *p)
;   {
L2:
	.dbline 24
;    unsigned char i;
;    do 
;      i=ds1820_ack();
	rcall _ds1820_ack
	mov R2,R16
	mov R3,R17
	mov R20,R2
L3:
	.dbline 25
;    while (i==0x01);
	cpi R20,1
	breq L2
	.dbline 26
;    ds1820_write(0x55);	 
	ldi R16,85
	rcall _ds1820_write
	.dbline 27
;    for(i=0;i<8;i++)
	clr R20
	rjmp L8
L5:
	.dbline 28
	mov R30,R20
	clr R31
	add R30,R22
	adc R31,R23
	ldd R16,z+0
	rcall _ds1820_write
L6:
	.dbline 27
	inc R20
L8:
	.dbline 27
	cpi R20,8
	brlo L5
	.dbline -2
	.dbline 29
;      ds1820_write(p[i]);
;   }
L1:
	rcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r p 22 pc
	.dbfunc s asc2con _asc2con fI
;              i -> R20
;           temp -> R22
;            len -> R10
;              p -> R12,R13
	.even
_asc2con::
	rcall push_gset4
	mov R10,R18
	mov R12,R16
	mov R13,R17
	.dbline -1
	.dbline 34
; /*********************************************
;    ½«Ê®Áù½øÖÆÊý×ª»»³ÉASC2Âë,²¢ËÍLCDÏÔÊ¾
; *********************************************/
; void asc2con(unsigned char *p,unsigned char len)
; {
	.dbline 36
;   unsigned char i,temp;
;   for (i=0;i<len;i++)
	clr R20
	rjmp L13
L10:
	.dbline 37
	.dbline 38
	mov R2,R20
	clr R3
	mov R30,R10
	clr R31
	sbiw R30,1
	sub R30,R2
	sbc R31,R3
	add R30,R12
	adc R31,R13
	ldd R22,z+0
	andi R22,240
	.dbline 39
	mov R24,R22
	swap R24
	andi R24,#0x0F
	mov R22,R24
	.dbline 40
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R22
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R16,R0
	rcall _lcd_putc
	.dbline 41
	mov R2,R20
	clr R3
	mov R30,R10
	clr R31
	sbiw R30,1
	sub R30,R2
	sbc R31,R3
	add R30,R12
	adc R31,R13
	ldd R22,z+0
	andi R22,15
	.dbline 42
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R22
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R16,R0
	rcall _lcd_putc
	.dbline 43
L11:
	.dbline 36
	inc R20
L13:
	.dbline 36
	cp R20,R10
	brsh X0
	rjmp L10
X0:
	.dbline -2
	.dbline 44
;   {  
;   temp=p[len-1-i]&0xf0;
;   temp=temp>>4;
;   lcd_putc(tabel[temp]);
;   temp=p[len-1-i]&0x0f;
;   lcd_putc(tabel[temp]);
;   }
; }
L9:
	rcall pop_gset4
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r temp 22 c
	.dbsym r len 10 c
	.dbsym r p 12 pc
	.dbfunc s main _main fI
;       rom_code -> y+9
;    ds1820_temp -> R10,R11
;          asc2p -> R12,R13
;         ds1820 -> y+0
;            crc -> R22
;              i -> R20
	.even
_main::
	sbiw R28,17
	.dbline -1
	.dbline 49
; /*********************************************
;      ÒÔDS1820ÎªÀý£¬ÑÝÊ¾µ¥×ÜÏßÉè±¸¹¤×÷¹ý³Ì
; *********************************************/    
; void main(void)
; {
	.dbline 55
;  unsigned char i,crc;
;  unsigned char ds1820[9];//´æ·Å´ÓDS18B20¶ÁÈ¡µÄ9×Ö½ÚÊý¾Ý
;  unsigned char rom_code[8];//´æ·ÅDS18B20µÄ64Î»ÐòÁÐºÅ
;  unsigned char *asc2p;
;  unsigned int ds1820_temp;//´æ·ÅÎÂ¶È¶ÁÊý
;  MCUCR=0x00;
	clr R2
	out 0x35,R2
	.dbline 56
;  lcd_init();//LCD³õÊ¼»¯
	rcall _lcd_init
	.dbline 57
;  lcd_clear();//LCDÇåÆÁ
	rcall _lcd_clear
	.dbline 58
;  lcd_gotoxy(0,0);
	clr R18
	clr R16
	rcall _lcd_gotoxy
	.dbline 59
;  lcd_puts("SERIAL NUMBER IS");//ÔÚ(0,0)´¦Êä³ö×Ö·û´®
	ldi R16,<L15
	ldi R17,>L15
	rcall _lcd_puts
L16:
	.dbline 61
;  do
;   i=ds1820_ack();//¶ÔDS18B20½øÐÐ¸´Î»
	rcall _ds1820_ack
	mov R2,R16
	mov R3,R17
	mov R20,R2
L17:
	.dbline 62
;  while (i==0x01); 
	cpi R20,1
	breq L16
	.dbline 63
;  ds1820_write(0x33);//Ð´Èë0x33ROMÃüÁî
	ldi R16,51
	rcall _ds1820_write
	.dbline 64
;  for (i=0;i<8;i++)
	clr R20
	rjmp L22
L19:
	.dbline 65
	.dbline 66
	rcall _ds1820_read
	mov R2,R16
	mov R3,R17
	mov R24,R28
	mov R25,R29
	adiw R24,9
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
	.dbline 67
L20:
	.dbline 64
	inc R20
L22:
	.dbline 64
	cpi R20,8
	brlo L19
	.dbline 68
;   {
;   rom_code[i]=ds1820_read();//¶Á³ö64Î»ÐòÁÐºÅ
;   }
;   asc2p=&rom_code[0];
	mov R24,R28
	mov R25,R29
	adiw R24,9
	mov R12,R24
	mov R13,R25
	.dbline 69
;   crc=crccheck(asc2p,8); //¼ÆËãCRCÐ£ÑéºÍ
	ldi R18,8
	mov R16,R12
	mov R17,R13
	rcall _crccheck
	mov R2,R16
	mov R3,R17
	mov R22,R2
	.dbline 70
;  if (crc==0x00)    //CRCÐ£ÑéÕýÈ·£¬ÏÔÊ¾ÐòÁÐºÅ
	tst R22
	brne L23
	.dbline 71
;      {lcd_gotoxy(0,1);
	.dbline 71
	ldi R18,1
	clr R16
	rcall _lcd_gotoxy
	.dbline 72
; 	 asc2p=&rom_code[0];	 
	mov R24,R28
	mov R25,R29
	adiw R24,9
	mov R12,R24
	mov R13,R25
	.dbline 73
;      asc2con(asc2p,8);  
	ldi R18,8
	mov R16,R12
	mov R17,R13
	rcall _asc2con
	.dbline 74
;      }
L23:
	.dbline 75
;  delay_ms(2000); //ÑÓÊ±
	ldi R16,2000
	ldi R17,7
	rcall _delay_ms
	rjmp L26
L25:
	.dbline 77
;  while (1)
;      {
	.dbline 78
;      asc2p=&rom_code[0];
	mov R24,R28
	mov R25,R29
	adiw R24,9
	mov R12,R24
	mov R13,R25
	.dbline 79
;      ds1820_match(asc2p);//Æ¥ÅäDS1820
	mov R16,R12
	mov R17,R13
	rcall _ds1820_match
	.dbline 80
;      ds1820_write(0x44); //Æô¶¯DS1820×ª»»
	ldi R16,68
	rcall _ds1820_write
	.dbline 81
;      delay_ms(900);//ÑÓÊ±µÈ×ª»»½áÊø£¬12Î»¸ñÊ½Ô¼Ðè750ms
	ldi R16,900
	ldi R17,3
	rcall _delay_ms
	.dbline 82
;      asc2p=&rom_code[0];
	mov R24,R28
	mov R25,R29
	adiw R24,9
	mov R12,R24
	mov R13,R25
	.dbline 83
;      ds1820_match(asc2p);//Æ¥ÅäDS1820
	mov R16,R12
	mov R17,R13
	rcall _ds1820_match
	.dbline 84
;      ds1820_write(0xbe); //¶Á×ª»»ºóÎÂ¶ÈÖµ
	ldi R16,190
	rcall _ds1820_write
	.dbline 85
;      for (i=0;i<9;i++)
	clr R20
	rjmp L31
L28:
	.dbline 86
	.dbline 87
	rcall _ds1820_read
	mov R2,R16
	mov R3,R17
	mov R24,R28
	mov R25,R29
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
	.dbline 88
L29:
	.dbline 85
	inc R20
L31:
	.dbline 85
	cpi R20,9
	brlo L28
	.dbline 89
;          {
; 		  ds1820[i]=ds1820_read();
; 		 }	 
;      lcd_clear();
	rcall _lcd_clear
	.dbline 90
;      lcd_puts("Thermometer ");
	ldi R16,<L32
	ldi R17,>L32
	rcall _lcd_puts
	.dbline 91
;      asc2p=&ds1820[0];
	mov R24,R28
	mov R25,R29
	mov R12,R24
	mov R13,R25
	.dbline 92
;      crc=crccheck(asc2p,9); //¼ÆËãCRCÐ£ÑéºÍ
	ldi R18,9
	mov R16,R12
	mov R17,R13
	rcall _crccheck
	mov R2,R16
	mov R3,R17
	mov R22,R2
	.dbline 93
;      if (crc==0x00)    //CRCÐ£ÑéÕýÈ·£¬Êä³öÎÂ¶È¶ÁÊý²¢ÏÔÊ¾HEXÊý
	tst R22
	brne L33
	.dbline 94
;           {
	.dbline 95
; 		   ds1820_temp=ds1820[1];
	ldd R10,y+1
	clr R11
	.dbline 96
; 		   ds1820_temp=ds1820_temp<<8;
	mov R11,R10
	clr R10
	.dbline 97
; 		   ds1820_temp+=ds1820[0];
	ldd R2,y+0
	clr R3
	add R10,R2
	adc R11,R3
	.dbline 98
; 		   asc2p=&ds1820[0];
	mov R24,R28
	mov R25,R29
	mov R12,R24
	mov R13,R25
	.dbline 99
; 		   asc2con(asc2p,2);
	ldi R18,2
	mov R16,R12
	mov R17,R13
	rcall _asc2con
	.dbline 100
;           }
L33:
	.dbline 101
; 	 lcd_gotoxy(0,1);	  	
	ldi R18,1
	clr R16
	rcall _lcd_gotoxy
	.dbline 102
;      if ((ds1820_temp&0xf800)!=0)//ÅÐ¶ÏÊÇ·ñÐ¡ÓÚ0¶È
	mov R24,R10
	mov R25,R11
	andi R24,0
	andi R25,248
	cpi R24,0
	cpc R24,R25
	breq L36
	.dbline 103
;       	{ds1820_temp=0-ds1820_temp;
	.dbline 103
	clr R2
	clr R3
	sub R2,R10
	sbc R3,R11
	mov R10,R2
	mov R11,R3
	.dbline 104
; 		 lcd_puts("-");
	ldi R16,<L38
	ldi R17,>L38
	rcall _lcd_puts
	.dbline 105
; 		 }
	rjmp L37
L36:
	.dbline 107
; 	 else
; 	    lcd_puts("+");	 
	ldi R16,<L39
	ldi R17,>L39
	rcall _lcd_puts
L37:
	.dbline 108
; 	 crc=ds1820_temp/16;//ÎÂ¶È¶ÁÊý×ª»»
	mov R22,R10
	mov R23,R11
	lsr R23
	ror R22
	lsr R23
	ror R22
	lsr R23
	ror R22
	lsr R23
	ror R22
	.dbline 109
; 	 for(i=0;i<3;i++)
	clr R20
	rjmp L43
L40:
	.dbline 110
	.dbline 111
	ldi R18,10
	ldi R19,0
	mov R16,R22
	clr R17
	rcall mod16s
	mov R2,R16
	mov R3,R17
	ldi R24,<_tabel
	ldi R25,>_tabel
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R2,R20
	clr R3
	ldi R30,2
	ldi R31,0
	sub R30,R2
	sbc R31,R3
	mov R24,R28
	mov R25,R29
	add R30,R24
	adc R31,R25
	std z+0,R0
	.dbline 112
	ldi R17,10
	mov R16,R22
	rcall div8u
	mov R22,R16
	.dbline 113
L41:
	.dbline 109
	inc R20
L43:
	.dbline 109
	cpi R20,3
	brlo L40
	.dbline 114
; 	     {
; 		  ds1820[2-i]=tabel[crc%10];
; 		  crc=crc/10;		 
; 		 }
; 	 ds1820[3]='.';	 
	ldi R24,46
	std y+3,R24
	.dbline 115
;      crc=ds1820_temp%16;
	mov R22,R10
	mov R23,R11
	andi R22,15
	andi R23,0
	.dbline 116
; 	 crc=crc*10;
	ldi R16,10
	mov R17,R22
	rcall mpy8s
	mov R22,R16
	.dbline 117
; 	 ds1820[4]=tabel[crc/16];		 
	ldi R18,16
	ldi R19,0
	clr R17
	rcall div16s
	mov R2,R16
	mov R3,R17
	ldi R24,<_tabel
	ldi R25,>_tabel
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	std y+4,R0
	.dbline 118
;      ds1820[5]=0xdf;		 
	ldi R24,223
	std y+5,R24
	.dbline 119
;      ds1820[6]='C';
	ldi R24,67
	std y+6,R24
	.dbline 120
; 	for (i=0;i<7;i++)  //ÏÔÊ¾ÎÂ¶È
	clr R20
	rjmp L51
L48:
	.dbline 121
	mov R24,R28
	mov R25,R29
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R16,z+0
	rcall _lcd_putc
L49:
	.dbline 120
	inc R20
L51:
	.dbline 120
	cpi R20,7
	brlo L48
	.dbline 122
L26:
	.dbline 76
	rjmp L25
X1:
	.dbline -2
	.dbline 123
; 	 lcd_putc(ds1820[i]);
;       }
; }
L14:
	adiw R28,17
	.dbline 0 ; func end
	ret
	.dbsym l rom_code 9 A[8:8]c
	.dbsym r ds1820_temp 10 i
	.dbsym r asc2p 12 pc
	.dbsym l ds1820 0 A[9:9]c
	.dbsym r crc 22 c
	.dbsym r i 20 c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
L39:
	.blkb 2
	.area idata
	.byte 43,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
L38:
	.blkb 2
	.area idata
	.byte 45,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
L32:
	.blkb 13
	.area idata
	.byte 'T,'h,'e,'r,'m,'o,'m,'e,'t,'e,'r,32,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
L15:
	.blkb 17
	.area idata
	.byte 'S,'E,'R,'I,'A,'L,32,'N,'U,'M,'B,'E,'R,32,'I,'S
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\1write\1wire1.c
