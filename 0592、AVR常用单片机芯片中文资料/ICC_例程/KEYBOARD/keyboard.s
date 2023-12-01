	.module keyboard.c
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
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline 19{
; /*****************************************************
;             HTTP://WWW.SL.COM.CN
;                    双龙电子
;  使用注意：1、应包含头文件slavr.h
;            2、在工程选项中的Additional Lib中填入slavr
; 		      使用编译器使用附加库文件libslavr.a
;            3、本例采用了作按键释放检查的函数，适用于显
;               示电路不需频繁刷新的程序,如静态显示、LCD
;               模块电路等。	  
; ******************************************************/
; #include <io8515.h>
; #include <slavr.h>
; //字形表
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; //显示缓冲区
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
; 
; void port_init(void)//端口初始化
;      {
	.dbline 20
; 	  DDRC=0x0f;
	ldi R24,15
	out 0x14,R24
	.dbline 21
; 	  DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 22
;       DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 23
;       PORTD=0xff;
	out 0x12,R24
	.dbline 24
;       PORTB=0xff;
	out 0x18,R24
	.dbline 25
; 	  PORTC=0xff;
	out 0x15,R24
	.dbline 26}
; 	 }
L1:
	ret
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 28{
; void display(void)//六路动态扫描显示
; {
	.dbline 30
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L6
L3:
	.dbline 31
	.dbline 32
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 33
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 34
	rcall _delay_1ms
	.dbline 35
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 36
L4:
	.dbline 30
	inc R20
L6:
	.dbline 30
	cpi R20,6
	brlo L3
	.dbline 37}
;   {
;    PORTB=ledbuff[i];
;    PORTD=~(1<<i);
;    delay_1ms();
;    PORTD|=(1<<i);  
;   }
; }
L2:
	rcall pop_gset1
	ret
	.dbsym r i 20 c
	.dbfunc s main _main fI
;        keyval1 -> R20
;              i -> R22
	.even
_main::
	.dbline 42{
; /*主程序的功能：读取键盘扫描码，转换成相应的字形码后*/
; /*送入显示缓冲区进行显示，显示部分参考display.c     */
; /*如果shift键按下，则全部清0                        */		 
; void main(void)
; {
	.dbline 44
;  unsigned char keyval1; 
;  unsigned char i=0;
	clr R22
	.dbline 45
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 46
;  port_init();
	rcall _port_init
	rjmp L9
L8:
	.dbline 48
;   while(1)
;     { 
	.dbline 49
; 	 keyval1=keypad();//键盘扫描函数，作按键释放检查
	rcall _keypad
	mov R2,R16
	mov R3,R17
	mov R20,R2
	.dbline 50
; 	 if (keyval1!=0x7f)
	cpi R20,127
	brne X1
	rjmp L11
X1:
	.dbline 51
; 	    { 
	.dbline 52
;          if ((keyval1&0x80)==0x80)
	mov R24,R20
	andi R24,128
	cpi R24,128
	brne L13
	.dbline 53
; 			 {
	.dbline 54
; 			  for(i=0;i<6;i++)
	clr R22
	rjmp L18
L15:
	.dbline 55
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R22
	clr R31
	add R30,R24
	adc R31,R25
	ldi R24,<_tabel
	ldi R25,>_tabel
	st -y,R31
	st -y,R30
	mov R30,R24
	mov R31,R25
	lpm
	ld R30,y+
	ld R31,y+
	std z+0,R0
L16:
	.dbline 54
	inc R22
L18:
	.dbline 54
	cpi R22,6
	brlo L15
	.dbline 56
;     			   ledbuff[i]=tabel[0];      		  
; 			  }
	rjmp L14
L13:
	.dbline 58
; 		  else
;     		  {for (i=0;i<5;i++)
	.dbline 58
	clr R22
	rjmp L22
L19:
	.dbline 59
	.dbline 60
	mov R2,R22
	clr R3
	ldi R30,4
	ldi R31,0
	sub R30,R2
	sbc R31,R3
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	mov R3,R22
	clr R4
	ldi R30,5
	ldi R31,0
	sub R30,R3
	sbc R31,R4
	add R30,R24
	adc R31,R25
	std z+0,R2
	.dbline 61
L20:
	.dbline 58
	inc R22
L22:
	.dbline 58
	cpi R22,5
	brlo L19
	.dbline 62
;     		      {
;     			   ledbuff[5-i]=ledbuff[4-i];//每按一次键，左移一位
;     		       }
; 			   ledbuff[0]=tabel[keyval1&0x7f];	   
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R30,R20
	clr R31
	andi R30,127
	andi R31,0
	add R30,R24
	adc R31,R25
	lpm
	sts _ledbuff,R0
	.dbline 63
;     		  }	   				  
L14:
	.dbline 64
; 		}
L11:
	.dbline 65
	rcall _display
	.dbline 66
L9:
	.dbline 47
	rjmp L8
X0:
	.dbline 67}
; 	display();
; 	}
; }		 
L7:
	ret
	.dbsym r keyval1 20 c
	.dbsym r i 22 c
