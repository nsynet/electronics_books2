	.module keyboard2.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard2.c
	.dbfunc s main _main fI
;         keyval -> R20
;              i -> R22
	.even
_main::
	.dbline 14{
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
; void main(void)
;     {
	.dbline 16
; 	 unsigned char keyval,i;
; 	 lcd_init();
	rcall _lcd_init
	.dbline 17
; 	 lcd_gotoxy(1,0);
	clr R18
	ldi R16,1
	rcall _lcd_gotoxy
	.dbline 18
; 	 lcd_puts("www.sl.com.cn");
	ldi R16,<L2
	ldi R17,>L2
	rcall _lcd_puts
	.dbline 19
; 	 lcd_gotoxy(0,1);	 
	ldi R18,1
	clr R16
	rcall _lcd_gotoxy
	.dbline 20
; 	 lcd_puts("INPUT: ");
	ldi R16,<L3
	ldi R17,>L3
	rcall _lcd_puts
	rjmp L5
L4:
	.dbline 22
; 	 while(1)
; 	  { 	     		
	.dbline 23
; 	   keyval=keypad();
	rcall _keypad
	mov R2,R16
	mov R3,R17
	mov R20,R2
	.dbline 24
; 	   if (keyval<16)//对应0~F的键盘输入
	cpi R20,16
	brsh L7
	.dbline 25
;     	  {
	.dbline 26
;     	   if (keyval<10)
	cpi R20,10
	brsh L9
	.dbline 27
;     	       keyval=0x30+keyval;
	subi R20,208	; addi 48
	rjmp L10
L9:
	.dbline 29
;     	   else
;     	       keyval=55 +keyval;	  
	subi R20,201	; addi 55
L10:
	.dbline 30
;     	   lcd_write_data(keyval);
	mov R16,R20
	rcall _lcd_write_data
	.dbline 31
;     	  }
L7:
	.dbline 32
; 	   if((keyval&0x80)==0x80)//对应SHIF的键盘输入
	mov R24,R20
	andi R24,128
	cpi R24,128
	brne L11
	.dbline 33
; 	      {		   
	.dbline 34
; 		   for(i=0;i<7;i++)
	clr R22
	rjmp L16
L13:
	.dbline 35
	.dbline 36
	ldi R18,114
	ldi R16,1
	rcall _lcd_shift
	.dbline 37
	ldi R16,500
	ldi R17,1
	rcall _delay_ms
	.dbline 38
L14:
	.dbline 34
	inc R22
L16:
	.dbline 34
	cpi R22,7
	brlo L13
	.dbline 39
; 		      {
; 			   lcd_shift(1,'r');
; 			   delay_ms(500);
; 			   }
;            for(i=0;i<7;i++)
	clr R22
	rjmp L20
L17:
	.dbline 40
	.dbline 41
	ldi R18,108
	ldi R16,1
	rcall _lcd_shift
	.dbline 42
	ldi R16,500
	ldi R17,1
	rcall _delay_ms
	.dbline 43
L18:
	.dbline 39
	inc R22
L20:
	.dbline 39
	cpi R22,7
	brlo L17
	.dbline 44
;               {
;                lcd_shift(1,'l');
;                delay_ms(500);
;               }   
; 		  }	   
L11:
	.dbline 45
L5:
	.dbline 21
	rjmp L4
X0:
	.dbline 46}
; 	  }		
;      }
L1:
	ret
	.dbsym r keyval 20 c
	.dbsym r i 22 c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard2.c
L3:
	.blkb 8
	.area idata
	.byte 'I,'N,'P,'U,'T,58,32,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard2.c
L2:
	.blkb 14
	.area idata
	.byte 'w,'w,'w,46,'s,'l,46,'c,'o,'m,46,'c,'n,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\KEYBOARD\keyboard2.c
