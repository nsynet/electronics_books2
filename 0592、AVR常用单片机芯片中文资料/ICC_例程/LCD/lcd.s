	.module lcd.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LCD\lcd.c
	.dbfunc s main _main fI
	.even
_main::
	.dbline 12{
; /******************************************************
;              http://www.sl.com.cn
;       双龙电子公司----2*16 LCD控制演示程序(ICCAVR)
; 	             作者：詹卫前		
; 	使用注意：1、应包含头文件slavr.h
;               2、在工程选项中的Additional Lib中填入slavr
; 		         使用编译器使用附加库文件libslavr.a
; *******************************************************/
; #include <io8515.h>
; #include <slavr.h>
; void main(void)
; {
	.dbline 13
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 14
;  lcd_init();
	rcall _lcd_init
	rjmp L3
L2:
	.dbline 16
	.dbline 17
	clr R18
	ldi R16,2
	rcall _lcd_gotoxy
	.dbline 18
	ldi R16,<L5
	ldi R17,>L5
	rcall _lcd_puts
	.dbline 19
	ldi R16,2000
	ldi R17,7
	rcall _delay_ms
	.dbline 20
	rcall _lcd_clear
	.dbline 21
	clr R18
	ldi R16,4
	rcall _lcd_gotoxy
	.dbline 22
	ldi R16,<L6
	ldi R17,>L6
	rcall _lcd_puts
	.dbline 23
	ldi R18,1
	ldi R16,1
	rcall _lcd_gotoxy
	.dbline 24
	ldi R16,<L7
	ldi R17,>L7
	rcall _lcd_puts
	.dbline 25
	ldi R16,2000
	ldi R17,7
	rcall _delay_ms
	.dbline 26
	rcall _lcd_clear
	.dbline 27
L3:
	.dbline 15
;  while(1)
	rjmp L2
X0:
	.dbline 28}
;     {
;      lcd_gotoxy(2,0);
;      lcd_puts("Hello World!");
;      delay_ms(2000);
;      lcd_clear();
;      lcd_gotoxy(4,0);
;      lcd_puts("HTTP://");
;      lcd_gotoxy(1,1);
;      lcd_puts("www.sl.com.cn");
; 	 delay_ms(2000);
; 	 lcd_clear();
;      }
;  }
L1:
	ret
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LCD\lcd.c
L7:
	.blkb 14
	.area idata
	.byte 'w,'w,'w,46,'s,'l,46,'c,'o,'m,46,'c,'n,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LCD\lcd.c
L6:
	.blkb 8
	.area idata
	.byte 'H,'T,'T,'P,58,47,47,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LCD\lcd.c
L5:
	.blkb 13
	.area idata
	.byte 'H,'e,'l,'l,'o,32,'W,'o,'r,'l,'d,33,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LCD\lcd.c
