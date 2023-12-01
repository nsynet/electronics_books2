	.module display.c
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
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
	.dbsym s tabel _tabel A[16:16]c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
	.dbsym s ledbuff _ledbuff A[6:6]c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\display.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline -1
	.dbline 14
; /*********************************************
;                HTTP://WWW.SL.COM.CN
;           	        双龙电子
;                六路动态扫描显示程序		 
; **********************************************/
; #include <io8515.h>
; extern void delay_ms(unsigned int n);//引用外部函数
; extern void delay_1ms(void); 
;           /*   七段译码字形表     */        
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
; void port_init(void)//端口初始化
;  {
	.dbline 15
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 16
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 17
;   PORTD=0xff;
	out 0x12,R24
	.dbline 18
;   PORTB=0xff;
	out 0x18,R24
	.dbline -2
	.dbline 19
;  }
L1:
	.dbline 0 ; func end
	ret
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline -1
	.dbline 21
; void display(void)//六路动态扫描显示电路
; {
	.dbline 23
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L6
L3:
	.dbline 24
	.dbline 25
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 26
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 27
	rcall _delay_1ms
	.dbline 28
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 29
L4:
	.dbline 23
	inc R20
L6:
	.dbline 23
	cpi R20,6
	brlo L3
	.dbline -2
	.dbline 30
;   {
;    PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
;    PORTD=~(1<<i);   //开始显示
;    delay_1ms();     //每一位显示保持一定时间
;    PORTD|=(1<<i);   //关闭显示
;   }
; }
L2:
	rcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbfunc s main _main fI
;              i -> R20
;              j -> R22
	.even
_main::
	.dbline -1
	.dbline 33
; /*主程序功能：演示了一个多路动态扫描程序的工作过程*/
; void main(void)
; {
	.dbline 35
;  unsigned char i,j;
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 36
;  port_init(); //端口初始化
	rcall _port_init
	rjmp L9
L8:
	.dbline 38
;  while(1)
;   {
	.dbline 39
;    for(i=0;i<0x10;i++)  
	clr R20
	rjmp L14
L11:
	.dbline 40
;      {
	.dbline 41
; 	  for(j=0;j<6;j++)
	clr R22
	rjmp L18
L15:
	.dbline 42
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R22
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R0
L16:
	.dbline 41
	inc R22
L18:
	.dbline 41
	cpi R22,6
	brlo L15
	.dbline 43
; 	      ledbuff[j]=tabel[i] ;//更换显示字形
;       for (j=0;j<200;j++)	 
	clr R22
	rjmp L22
L19:
	.dbline 44
	rcall _display
L20:
	.dbline 43
	inc R22
L22:
	.dbline 43
	cpi R22,200
	brlo L19
	.dbline 45
L12:
	.dbline 39
	inc R20
L14:
	.dbline 39
	cpi R20,16
	brlo L11
	.dbline 46
L9:
	.dbline 37
	rjmp L8
X0:
	.dbline -2
	.dbline 47
;           display();	      //循环显示200次
; 	 } 
;   }
; }
L7:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
