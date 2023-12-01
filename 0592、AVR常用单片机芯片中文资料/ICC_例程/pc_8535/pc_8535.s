	.module pc_8535.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\pc_8535.c
	.dbfunc s uart0_init _uart0_init fI
	.even
_uart0_init::
	.dbline -1
	.dbline 20
; /*******************************************/
; /*             PC机键盘演示程序            */
; /*           广州双龙电子有限公司          */
; /*           http://www.sl.com.cn          */
; /*               作者：詹卫前              */
; /*          MCU:AT90S8535 晶振:8MHZ        */
; /*  使用ICCAVR的终端调试窗口观察PC键盘数据 */
; /*          连线说明: SL-AVRAD             */
; /*			1、PC键盘clock--PD.2		   */
; /*			2、PC键盘data---PD.3		   */
; /*			3、D232.T-------PD.1		   */
; /*			4、D232.R-------PD.0		   */
; /*******************************************/
; #include<io8535.h>
; #include<stdio.h>
; extern unsigned char get_char(void);
; extern void init_kb(void);
; //UART初始化
; void uart0_init(void)
; 	 {
	.dbline 21
;  	  UCR  = 0x00;
	clr R2
	out 0xa,R2
	.dbline 22
;  	  UBRR = 0x19;//BAUD=19200
	ldi R24,25
	out 0x9,R24
	.dbline 23
;  	  UCR|=(1<<TXEN) ;//使能发送
	sbi 0xa,3
	.dbline -2
	.dbline 24
;  	 }
L1:
	.dbline 0 ; func end
	ret
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline -1
	.dbline 27
; //端口初始化	 
; void port_init(void)
; 	 {
	.dbline 28
; 	  DDRD=0x02;
	ldi R24,2
	out 0x11,R24
	.dbline 29
; 	  PORTD=0xff;
	ldi R24,255
	out 0x12,R24
	.dbline -2
	.dbline 30
; 	 }
L2:
	.dbline 0 ; func end
	ret
	.dbfunc s main _main fI
;            key -> R20
	.even
_main::
	.dbline -1
	.dbline 33
; //PC键盘演示程序,SHIFT键和按键同时按下时为大写 
; void main(void)
; 	 {
	.dbline 35
; 	  unsigned char key;
; 	  port_init();
	rcall _port_init
	.dbline 36
; 	  uart0_init();
	rcall _uart0_init
	.dbline 37
; 	  init_kb();
	rcall _init_kb
	.dbline 38
; 	  puts("PC键盘演示程序");
	ldi R16,<L4
	ldi R17,>L4
	rcall _puts
	.dbline 39
; 	  putchar(0x0d);
	ldi R16,13
	rcall _putchar
	rjmp L6
L5:
	.dbline 41
; 	  while(1)
; 	  		 {
	.dbline 42
; 			  key=get_char();
	rcall _get_char
	mov R20,R16
	.dbline 43
; 			  if(key!=0) 
	tst R16
	breq L8
	.dbline 44
; 			      {
	.dbline 45
; 				   if (key==0x0d)//回车键处理
	cpi R16,13
	brne L10
	.dbline 46
; 				      {					   
	.dbline 47
; 					   putchar('\n');
	ldi R16,10
	rcall _putchar
	.dbline 48
; 					   putchar(key);					   
	mov R16,R20
	rcall _putchar
	.dbline 49
; 					  }
	rjmp L11
L10:
	.dbline 51
; 				   else				   	  
; 				   	  putchar(key);
	mov R16,R20
	rcall _putchar
L11:
	.dbline 52
; 				  }
L8:
	.dbline 53
L6:
	.dbline 40
	rjmp L5
X0:
	.dbline -2
	.dbline 54
; 			 }	  
; 	 }	 	 
L3:
	.dbline 0 ; func end
	ret
	.dbsym r key 20 c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\pc_8535.c
L4:
	.blkb 15
	.area idata
	.byte 'P,'C,188,252,197,204,209,221,202,190,179,204,208,242,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\pc_8535.c
