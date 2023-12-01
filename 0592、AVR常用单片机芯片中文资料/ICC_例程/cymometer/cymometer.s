	.module cymometer.c
	.area vector(rom, abs)
	.org 14
	rjmp _timer0
	.org 6
	rjmp _timer1
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
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline 28{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----频率计演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、学习定时器T1捕捉(捕获)中断的使用
; 		  2、学习频率计的设计方法
; 		  3、通过对timecount的修改，可实现多量程
; 		     频率计编程。
; **********************************************/
; #include <io8515.h>
; #include <macros.h>
; #pragma interrupt_handler timer0:8
; #pragma interrupt_handler timer1:4
; extern void delay_ms(unsigned int n);//引用外部函数
; extern void delay_1ms(void); 
; #pragma data:code
;           /*   七段译码字形表     */        
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; #pragma data:data
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
; unsigned long count;//频率测量计数变量
; unsigned int timecount;//频率测量闸门控制变量
; /******************************
;            初始化
; ******************************/
; void port_init(void)
;  {
	.dbline 29
;   MCUCR=0x00;
	clr R2
	out 0x35,R2
	.dbline 30
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 31
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 32
;   PORTD=0xff;
	out 0x12,R24
	.dbline 33
;   PORTB=0xff;
	out 0x18,R24
	.dbline 34
;   TIMSK=0x0a;//开放T0溢出中断和T1捕捉中断
	ldi R24,10
	out 0x39,R24
	.dbline 35
;   TCCR0=0x03;
	ldi R24,3
	out 0x33,R24
	.dbline 36
;   TCCR1A=0x00;
	out 0x2f,R2
	.dbline 37
;   TCCR1B=0xc0;
	ldi R24,192
	out 0x2e,R24
	.dbline 38
;   TCNT0=0x83;
	ldi R24,131
	out 0x32,R24
	.dbline 39
;   timecount=1000;
	ldi R24,1000
	ldi R25,3
	sts _timecount+1,R25
	sts _timecount,R24
	.dbline 40}
;  }
L1:
	ret
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 45{
; /******************************
;      六路动态扫描显示电路
; ******************************/ 
; void display(void)
; {
	.dbline 47
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L6
L3:
	.dbline 48
	.dbline 49
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 50
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 51
	rcall _delay_1ms
	.dbline 52
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 53
L4:
	.dbline 47
	inc R20
L6:
	.dbline 47
	cpi R20,6
	brlo L3
	.dbline 54}
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
	.dbfunc s hextobcd _hextobcd fI
;           temp -> R10
;              i -> R12
	.even
_hextobcd::
	rcall push_gset4
	.dbline 59{
; /************************************
;   将count十六进制数据转换为LED七段码
; ************************************/
; void hextobcd(void)
; {
	.dbline 61
;   unsigned char i,temp;
;   for (i=0;i<6;i++)
	clr R12
	rjmp L11
L8:
	.dbline 62
	.dbline 62
	ldi R16,<L12
	ldi R17,>L12
	rcall lpm32
	lds R5,_count+2+1
	lds R4,_count+2
	lds R3,_count+1
	lds R2,_count
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	mov R16,R2
	mov R17,R3
	mov R18,R4
	mov R19,R5
	rcall mod32u
	mov R10,R16
	.dbline 63
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R10
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R12
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R0
	.dbline 64
	ldi R16,<L12
	ldi R17,>L12
	rcall lpm32
	lds R5,_count+2+1
	lds R4,_count+2
	lds R3,_count+1
	lds R2,_count
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	mov R16,R2
	mov R17,R3
	mov R18,R4
	mov R19,R5
	rcall div32u
	sts _count+1,R17
	sts _count,R16
	sts _count+2+1,R19
	sts _count+2,R18
	.dbline 65
L9:
	.dbline 61
	inc R12
L11:
	.dbline 61
	mov R24,R12
	cpi R24,6
	brsh X0
	rjmp L8
X0:
	.dbline 66}
;   {temp=count%10;
;    ledbuff[i]=tabel[temp];
;    count=count/10;
;   }  
; }
L7:
	rcall pop_gset4
	ret
	.dbsym r temp 10 c
	.dbsym r i 12 c
	.dbfunc s main _main fI
;              j -> <dead>
;              i -> <dead>
	.even
_main::
	.dbline 71{
; /*****************************
;         主程序
; ******************************/
; void main(void)
; {
	.dbline 73
;  unsigned char i,j;
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 74
;  port_init(); //端口初始化
	rcall _port_init
	.dbline 75
;  count=0;
	ldi R16,<L14
	ldi R17,>L14
	rcall lpm32
	sts _count+1,R17
	sts _count,R16
	sts _count+2+1,R19
	sts _count+2,R18
	.dbline 76
;  SEI();
	sei
	rjmp L16
L15:
	.dbline 78
	.dbline 79
	rcall _display
	.dbline 80
L16:
	.dbline 77
;  while(1)
	rjmp L15
X1:
	.dbline 81}
;   {
;    display();
;   }
; }
L13:
	ret
	.dbsym l j 1 c
	.dbsym l i 1 c
	.dbfunc s timer0 _timer0 fI
	.even
_timer0::
	rcall push_lset
	.dbline 86{
; /**************************************
;  T0溢出中断，完成测量闸门控制和数字转换
; ***************************************/
; void timer0(void)
;    {
	.dbline 87
;     if (--timecount==0)
	lds R25,_timecount+1
	lds R24,_timecount
	sbiw R24,1
	mov R2,R24
	mov R3,R25
	sts _timecount+1,R3
	sts _timecount,R2
	tst R2
	brne L19
	tst R3
	brne L19
	.dbline 88
; 	 {
	.dbline 89
; 	  CLI();
	cli
	.dbline 90
; 	  hextobcd();
	rcall _hextobcd
	.dbline 91
; 	  if (count>999999)
	ldi R16,<L23
	ldi R17,>L23
	rcall lpm32
	lds R5,_count+2+1
	lds R4,_count+2
	lds R3,_count+1
	lds R2,_count
	cp R16,R2
	cpc R17,R3
	cpc R18,R4
	cpc R19,R5
	brsh L21
	.dbline 92
; 	    ledbuff[0]|=0x80;
	lds R24,_ledbuff
	ori R24,128
	sts _ledbuff,R24
L21:
	.dbline 93
; 	  count=0;
	ldi R16,<L14
	ldi R17,>L14
	rcall lpm32
	sts _count+1,R17
	sts _count,R16
	sts _count+2+1,R19
	sts _count+2,R18
	.dbline 94
; 	  timecount=1000;
	ldi R24,1000
	ldi R25,3
	sts _timecount+1,R25
	sts _timecount,R24
	.dbline 95
; 	  SEI();
	sei
	.dbline 96
; 	 }
L19:
	.dbline 97
; 	TCNT0=0x84; 
	ldi R24,132
	out 0x32,R24
	.dbline 98}
;    }
L18:
	rcall pop_lset
	reti
	.dbfunc s timer1 _timer1 fI
	.even
_timer1::
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	in R2,0x3f
	st -y,R2
	.dbline 103{
; /*****************************
;   T1捕捉中断，完成脉冲计数
; ******************************/   
; void timer1(void)
;    {
	.dbline 104
;     count++;
	ldi R16,<L25
	ldi R17,>L25
	rcall lpm32
	lds R5,_count+2+1
	lds R4,_count+2
	lds R3,_count+1
	lds R2,_count
	add R2,R16
	adc R3,R17
	adc R4,R18
	adc R5,R19
	sts _count+1,R3
	sts _count,R2
	sts _count+2+1,R5
	sts _count+2,R4
	.dbline 105}
;    }   
L24:
	ld R2,y+
	out 0x3f,R2
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	reti
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\cymometer\cymometer.c
_timecount::
	.blkb 2
	.dbsym s timecount _timecount i
_count::
	.blkb 4
	.dbsym s count _count l
	.area lit(rom, con, rel)
L25:
	.word 1,0
L23:
	.word 16959,15
L14:
	.word 0,0
L12:
	.word 10,0
