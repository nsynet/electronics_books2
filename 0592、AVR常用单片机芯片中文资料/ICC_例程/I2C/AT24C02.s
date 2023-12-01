	.module AT24C02.c
	.area code(ram, con, rel)
	.area lit(rom, con, rel)
_tabel::
	.byte 63,6
	.byte 91,'O
	.byte 'f,'m
	.byte 125,7
	.byte 127,'o
	.byte 'w,124
	.byte 57,94
	.byte 'y,'q
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline 22{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----I2C总线演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、以访问AT24C02为例
; 		  2、SDA ：PORTA.0
; 		  3、SCL : PORTA.1
; **********************************************/
; #include <io8515.h>
; #include <slavr.h>
;           /*   七段译码字形表     */
; #pragma data:code		          
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; #pragma data:data
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x00,0x00};
; unsigned char at24_add,at24_data;
; /******************************************
;                端口初始化
; *******************************************/
; void port_init(void)
;  {
	.dbline 23
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 24
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 25
;   PORTD=0xff;
	out 0x12,R24
	.dbline 26
;   PORTB=0xff;
	out 0x18,R24
	.dbline 27}
;  }
L1:
	ret
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 32{
; /******************************************
;           六路动态扫描显示电路
; *******************************************/
; void display(void)
; {
	.dbline 34
;  unsigned char i;
;   i=at24_data%16;
	ldi R17,16
	lds R16,_at24_data
	rcall mod8u
	mov R20,R16
	.dbline 35
;   ledbuff[0]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff,R0
	.dbline 36
;   i=at24_data/16;
	ldi R17,16
	lds R16,_at24_data
	rcall div8u
	mov R20,R16
	.dbline 37
;   ledbuff[1]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+1,R0
	.dbline 38
;   i=at24_add%16;
	ldi R17,16
	lds R16,_at24_add
	rcall mod8u
	mov R20,R16
	.dbline 39
;   ledbuff[2]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+2,R0
	.dbline 40
;   i=at24_add/16;
	ldi R17,16
	lds R16,_at24_add
	rcall div8u
	mov R20,R16
	.dbline 41
;   ledbuff[3]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+3,R0
	.dbline 42
;  for (i=0;i<6;i++)
	clr R20
	rjmp L9
L6:
	.dbline 43
	.dbline 44
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 45
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 46
	rcall _delay_1ms
	.dbline 47
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 48
L7:
	.dbline 42
	inc R20
L9:
	.dbline 42
	cpi R20,6
	brlo L6
	.dbline 49}
;   {
;    PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
;    PORTD=~(1<<i);   //开始显示
;    delay_1ms();     //每一位显示保持一定时间
;    PORTD|=(1<<i);   //关闭显示
;   }
; }
L2:
	rcall pop_gset1
	ret
	.dbsym r i 20 c
	.dbfunc s main _main fI
;          index -> R22
;           flag -> R10
;           key1 -> R12
;           key2 -> R14
	.even
_main::
	sbiw R28,1
	.dbline 62{
; /******************************************
;     主程序功能：演示了读写AT24C02的过程
; 	说明：1、键盘上0~F键用于输入地址或数据，
; 	         SHIFT键用于切换状态
; 		  2、上电复位后，按数字键只可以修改地
; 		     址,程序自动显示AT24C02单元内容。
; 		  3、按一次SHIFT键，最高位LED小数点亮
; 		     此时可以修改数字，再按一次SHIFT键
; 			 程序将修改后的数字写入AT24C02，然
; 			 后回到上电复位后的状态		
; *******************************************/
; void main(void)
; {
	.dbline 65
;  unsigned char key1,key2;
;  unsigned char index,flag;
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 66
;  at24_add=0;
	sts _at24_add,R2
	.dbline 67
;  at24_data=0;
	sts _at24_data,R2
	.dbline 68
;  index=0;
	clr R22
	.dbline 69
;  flag=0;
	clr R10
	.dbline 70
;  port_init(); //端口初始化
	rcall _port_init
	rjmp L12
L11:
	.dbline 72
;  while(1)
;   {  
	.dbline 73
;      key1=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R12,R2
	.dbline 74
;   	 if (key1!=0x7f)
	mov R24,R12
	cpi R24,127
	brne X2
	rjmp L14
X2:
	.dbline 75
; 	    {
L16:
	.dbline 77
; 		 do 
; 		   {
	.dbline 78
; 		    key2=scan_key();//检查按键释放
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R14,R2
	.dbline 79
; 	  	    display();
	rcall _display
	.dbline 80
; 			}
L17:
	.dbline 81
; 		 while(key1==key2);
	cp R12,R14
	breq L16
	.dbline 82
; 		 if (key1>=0x80)
	mov R24,R12
	cpi R24,128
	brlo L19
	.dbline 83
; 		    {
	.dbline 84
; 			 if (flag!=0x00)//SHIFT键切换数据和地址修改
	tst R10
	breq L21
	.dbline 85
; 			     { 
	.dbline 86
; 				   Write24c02(&at24_data,at24_add,1);
	ldi R24,1
	std y+0,R24
	lds R18,_at24_add
	ldi R16,<_at24_data
	ldi R17,>_at24_data
	rcall _Write24c02
	.dbline 87
; 				   flag=0x00;
	clr R10
	.dbline 88
; 				  }			 
	rjmp L22
L21:
	.dbline 89
; 			 else flag=0x80;
	ldi R24,128
	mov R10,R24
L22:
	.dbline 90
; 			 ledbuff[5]=0x00^flag;
	sts _ledbuff+5,R10
	.dbline 91
; 			 index=0;
	clr R22
	.dbline 92
; 			 }
	rjmp L20
L19:
	.dbline 94
; 		 else
; 		    {
	.dbline 95
; 			 switch (index)
	mov R20,R22
	clr R21
	cpi R20,0
	cpc R20,R21
	breq L27
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L30
	rjmp L24
X0:
	.dbline 96
; 			   {
L27:
	.dbline 97
; 			    case 0:{if (flag==0x00)
	.dbline 97
	tst R10
	brne L28
	.dbline 98
; 				           {key2=at24_add&0x0f;
	.dbline 98
	lds R24,_at24_add
	andi R24,15
	mov R14,R24
	.dbline 99
; 						    at24_add=key2|(key1<<4);
	mov R24,R12
	andi R24,#0x0F
	swap R24
	mov R2,R14
	or R2,R24
	sts _at24_add,R2
	.dbline 100
; 						    }
	rjmp L29
L28:
	.dbline 102
; 				        else
; 						   {key2=at24_data&0x0f;
	.dbline 102
	lds R24,_at24_data
	andi R24,15
	mov R14,R24
	.dbline 103
; 						    at24_data=key2|(key1<<4);
	mov R24,R12
	andi R24,#0x0F
	swap R24
	mov R2,R14
	or R2,R24
	sts _at24_data,R2
	.dbline 104
; 							}
L29:
	.dbline 105
; 						index=01;							
	ldi R22,1
	.dbline 106
; 						break;	     
	rjmp L25
L30:
	.dbline 108
; 				       }
; 				case 1:{if (flag==0x00)
	.dbline 108
	tst R10
	brne L31
	.dbline 109
; 				           {key2=at24_add&0xf0;
	.dbline 109
	lds R24,_at24_add
	andi R24,240
	mov R14,R24
	.dbline 110
; 						    at24_add=key2|(key1&0x0f);
	mov R24,R12
	andi R24,15
	mov R2,R14
	or R2,R24
	sts _at24_add,R2
	.dbline 111
; 						    }
	rjmp L32
L31:
	.dbline 113
; 				        else
; 						   {key2=at24_data&0xf0;
	.dbline 113
	lds R24,_at24_data
	andi R24,240
	mov R14,R24
	.dbline 114
; 						    at24_data=key2|(key1&0x0f);
	mov R24,R12
	andi R24,15
	mov R2,R14
	or R2,R24
	sts _at24_data,R2
	.dbline 115
; 							}
L32:
	.dbline 116
; 						index=00;	
	clr R22
	.dbline 117
; 						break;	
L24:
L25:
	.dbline 120
; 				       }
; 			   }    			
; 			} 	
L20:
	.dbline 121
; 		 }	 	 		 		 			  
L14:
	.dbline 122
;      if (flag==0x00)
	tst R10
	brne L33
	.dbline 123
; 	 Read24c02(&at24_data,at24_add,1);
	ldi R24,1
	std y+0,R24
	lds R18,_at24_add
	ldi R16,<_at24_data
	ldi R17,>_at24_data
	rcall _Read24c02
L33:
	.dbline 124
	rcall _display
	.dbline 125
L12:
	.dbline 71
	rjmp L11
X1:
	.dbline 126}
; 	 display();	  
;   }
; }
L10:
	adiw R28,1
	ret
	.dbsym r index 22 c
	.dbsym r flag 10 c
	.dbsym r key1 12 c
	.dbsym r key2 14 c
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\AT24C02.c
_at24_data::
	.blkb 1
	.dbsym s at24_data _at24_data c
_at24_add::
	.blkb 1
	.dbsym s at24_add _at24_add c
