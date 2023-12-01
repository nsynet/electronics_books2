	.module .8515intr.c
	.area vector(rom, abs)
	.org 12
	rjmp _timer
	.area data(ram, con, rel)
_led_image::
	.blkb 1
	.area idata
	.byte 255
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\interrupt\8515intr.c
	.dbsym s led_image _led_image c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\interrupt\8515intr.c
	.dbfunc s main _main fI
	.even
_main::
	.dbline 9{
; #include <io8515.h>
; #pragma interrupt_handler timer:TOV1
; 
; char led_image = 0xFF;  // 关闭全部LED
; /***************************************
;           主程序入口
; ***************************************/
; void main()
; {
	.dbline 13
; /***************************
;    初始化8515寄存器
; ***************************/
;         DDRB = 0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 14
;         PORTB = 0x00;
	clr R2
	out 0x18,R2
	.dbline 15
;         TCCR1A=0;
	out 0x2f,R2
	.dbline 16
;         TCCR1B = 0x00;          // 停止定时器1
	out 0x2e,R2
	.dbline 17
;         TCNT1H = 0x00;          // 清除定时器1
	out 0x2d,R2
	.dbline 18
;         TCNT1L = 0x00;
	out 0x2c,R2
	.dbline 19
;         TIMSK=0x80;           // 开放定时器1溢出中断
	ldi R24,128
	out 0x39,R24
	.dbline 20
;         SREG|=0x80;
	bset 7
	.dbline 21
;         TCCR1B =0x03;          // 启动定时器1 预分频比例64
	ldi R24,3
	out 0x2e,R24
L2:
	.dbline 23
L3:
	.dbline 22
;         while (1)
	rjmp L2
X0:
	.dbline 24}
; 	;
; }
L1:
	ret
	.dbfunc s timer _timer fI
	.even
_timer::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline 29{
; /*************************************
;    在定时器中断中改变LED的显示状态
; *************************************/
; void timer()
; {
	.dbline 30
;  PORTB = ++led_image;
	lds R24,_led_image
	subi R24,255	; addi 1
	mov R2,R24
	sts _led_image,R2
	out 0x18,R2
	.dbline 31
;  PORTC=~PORTC;
	in R2,0x15
	com R2
	out 0x15,R2
	.dbline 32}
; }
L5:
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R2,y+
	reti
