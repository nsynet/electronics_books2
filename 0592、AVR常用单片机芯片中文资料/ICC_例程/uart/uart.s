	.module uart.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\uart\uart.c
	.dbfunc s main _main fI
;           temp -> R20
	.even
_main::
	.dbline 15{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----RS232通信演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、使用ICCAVR的终端调试窗口，进行通信调试。
; 		  2、在AVR的UART工作之前，应当先对ICCAVR的终
; 		     端调试窗口进行设置，设置串口为com1或com2，
; 			 通信波特率为19200。
; 		  3、接线：PORTD.0(RXD)----R(D232)
; 		           PORTD.1(TXD)----T(D232)
; **********************************************/
; #include <io8515.h>
; #include <stdio.h>
; void main(void)
; 	{
	.dbline 17
;      unsigned char temp;
;      UBRR = 12;
	ldi R24,12
	out 0x9,R24
	.dbline 18
;      UCR=0x18;    
	ldi R24,24
	out 0xa,R24
	.dbline 19
; 	 puts("Hello World!\n");
	ldi R16,<L2
	ldi R17,>L2
	rcall _puts
	.dbline 20
; 	 putchar(0x0d);
	ldi R16,13
	rcall _putchar
	.dbline 21
; 	 putchar(0x0a);	 
	ldi R16,10
	rcall _putchar
	.dbline 22
;      printf("请使用PC机键盘输入数字、字母或汉字!");
	ldi R16,<L3
	ldi R17,>L3
	rcall _printf
	.dbline 23
;      putchar(0x0a);
	ldi R16,10
	rcall _putchar
	.dbline 24
; 	 putchar(0x0d);
	ldi R16,13
	rcall _putchar
	rjmp L5
L4:
	.dbline 26
;      while (1)
;            { 		   
	.dbline 27
;           	temp=getchar();
	rcall _getchar
	mov R2,R16
	mov R3,R17
	mov R20,R2
	.dbline 28
; 			if (temp!=0)
	tst R20
	breq L7
	.dbline 29
;                 {
	.dbline 30
; 				 putchar(temp);
	mov R16,R20
	rcall _putchar
	.dbline 31
; 				 if(temp==0x0d)
	cpi R20,13
	brne L9
	.dbline 32
; 				    putchar(0x0a);
	ldi R16,10
	rcall _putchar
L9:
	.dbline 33
; 				 temp=0;
	clr R20
	.dbline 34
; 				}  	    			   		
L7:
	.dbline 35
L5:
	.dbline 25
	rjmp L4
X0:
	.dbline 36}
;        	   }
;      }
L1:
	ret
	.dbsym r temp 20 c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\uart\uart.c
L3:
	.blkb 36
	.area idata
	.byte 199,235,202,185,211,195,'P,'C,187,250,188,252,197,204,202,228
	.byte 200,235,202,253,215,214,161,162,215,214,196,184,187,242,186,186
	.byte 215,214,33,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\uart\uart.c
L2:
	.blkb 14
	.area idata
	.byte 'H,'e,'l,'l,'o,32,'W,'o,'r,'l,'d,33,10,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\uart\uart.c
