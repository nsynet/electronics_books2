	.module cycle_1.c
	.area vector(rom, abs)
	.org 6
	rjmp _Icp_timer1
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
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	.dbfunc s delay_1ms _delay_1ms fI
;              i -> R16,R17
	.even
_delay_1ms::
	.dbline 20{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----占空比测量演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、学习定时器T1捕捉(捕获)中断的使用		  
; **********************************************/
; #include <io8515.h>
; #include <math.h>
; #pragma interrupt_handler Icp_timer1:4   //   设置ICP中断
;           /*   七段译码字形表     */        
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
; unsigned int count_l;
; unsigned int count_h;
; /******************************
;          1ms延时程序
; ******************************/ 
; void delay_1ms(void)
; { 
	.dbline 22
;  unsigned int i;
;  for(i=1;i<1142;i++)
	ldi R16,1
	ldi R17,0
	rjmp L5
L2:
	.dbline 23
L3:
	.dbline 22
	subi R16,255  ; offset = 1
	sbci R17,255
L5:
	.dbline 22
	cpi R16,118
	ldi R30,4
	cpc R17,R30
	brlo L2
	.dbline 24}
;     ;
; }
L1:
	ret
	.dbsym r i 16 i
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 29{
; /******************************
;       六路动态扫描显示电路
; ******************************/ 
; void display(void)
; {
	.dbline 31
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L10
L7:
	.dbline 32
	.dbline 33
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 34
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 35
	rcall _delay_1ms
	.dbline 36
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 37
L8:
	.dbline 31
	inc R20
L10:
	.dbline 31
	cpi R20,6
	brlo L7
	.dbline 38}
;   {
;    PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
;    PORTD=~(1<<i);   //开始显示
;    delay_1ms();     //每一位显示保持一定时间
;    PORTD|=(1<<i);   //关闭显示
;   }
; }
L6:
	rcall pop_gset1
	ret
	.dbsym r i 20 c
	.dbfunc s hextobcd _hextobcd fI
;           temp -> R20
;              i -> R22
;          count -> R10,R11
	.even
_hextobcd::
	rcall push_gset3
	mov R10,R16
	mov R11,R17
	.dbline 43{
; /************************************
;   将count十六进制数据转换为LED七段码
; ************************************/
; void hextobcd(unsigned int count)
; {
	.dbline 45
;   unsigned char i,temp;
;   for (i=0;i<6;i++)
	clr R22
	rjmp L15
L12:
	.dbline 46
	.dbline 46
	ldi R18,10
	ldi R19,0
	mov R16,R10
	mov R17,R11
	rcall mod16u
	mov R20,R16
	mov R21,R17
	.dbline 47
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
	.dbline 48
	ldi R18,10
	ldi R19,0
	mov R16,R10
	mov R17,R11
	rcall div16u
	mov R10,R16
	mov R11,R17
	.dbline 49
L13:
	.dbline 45
	inc R22
L15:
	.dbline 45
	cpi R22,6
	brlo L12
	.dbline 50}
;   {temp=count%10;
;    ledbuff[i]=tabel[temp];
;    count=count/10;
;   }
; }
L11:
	rcall pop_gset3
	ret
	.dbsym r temp 20 c
	.dbsym r i 22 c
	.dbsym r count 10 i
	.dbfunc s mcu_init _mcu_init fI
	.even
_mcu_init::
	.dbline 55{
; /******************************
;           MCU初始化
; ******************************/ 
; void mcu_init(void)
;  {
	.dbline 56
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 57
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 58
;   PORTD=0xff;
	out 0x12,R24
	.dbline 59
;   PORTB=0xff;//端口初始化
	out 0x18,R24
	.dbline 60
;   TIMSK =0x08;//使能T1捕捉中断
	ldi R24,8
	out 0x39,R24
	.dbline 61
;   TCCR1A=0x00;
	clr R2
	out 0x2f,R2
	.dbline 62
;   TCCR1B=0xC2;//CK/8，捕捉周期的单位为1us
	ldi R24,194
	out 0x2e,R24
	.dbline 63
;   ICR1=0;            
	clr R3
	sts 68+1,R3
	sts 68,R2
	.dbline 64
;   TCNT1=0;          
	sts 76+1,R3
	sts 76,R2
	.dbline 65}
;  }
L16:
	ret
	.dbfunc s main _main fI
;              y -> y+4
;              x -> y+0
;              n -> R10
	.even
_main::
	sbiw R28,8
	.dbline 70{
; /************************************************
;         主程序：测量ICP引脚上信号的占空比
; ************************************************/ 
; void main()
; {
	.dbline 73
;  unsigned char n;
;  unsigned long x,y;
;  mcu_init();  
	rcall _mcu_init
	.dbline 74
;  SREG|=0x80;     //使能全局中断
	bset 7
	.dbline 75
;  for(;;)
L18:
	.dbline 76
;     { 
	.dbline 77
;      x=count_h*100;
	lds R19,_count_h+1
	lds R18,_count_h
	ldi R16,100
	ldi R17,0
	rcall mpy16s
	mov R2,R16
	mov R3,R17
	clr R4
	clr R5
	mov R30,R28
	mov R31,R29
	std z+0,R2
	std z+1,R3
	std z+2,R4
	std z+3,R5
	.dbline 78
; 	 y=count_l+count_h;
	lds R3,_count_h+1
	lds R2,_count_h
	lds R5,_count_l+1
	lds R4,_count_l
	add R4,R2
	adc R5,R3
	mov R2,R4
	mov R3,R5
	clr R4
	clr R5
	std z+4,R2
	std z+5,R3
	std z+6,R4
	std z+7,R5
	.dbline 79
; 	 n=x/y;       //计算占空比
	ldd R6,z+0
	ldd R7,z+1
	ldd R8,z+2
	ldd R9,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	mov R16,R6
	mov R17,R7
	mov R18,R8
	mov R19,R9
	rcall div32u
	mov R10,R16
	.dbline 80
; 	 hextobcd(n);	
	clr R17
	rcall _hextobcd
	.dbline 81
; 	 display();  //显示测量值 
	rcall _display
	.dbline 82
;     }
	.dbline 75
	.dbline 75
	rjmp L18
X0:
L17:
	adiw R28,8
	ret
	.dbline 76}
	.dbsym l y 4 l
	.dbsym l x 0 l
	.dbsym r n 10 c
	.dbfunc s Icp_timer1 _Icp_timer1 fI
	.even
_Icp_timer1::
	st -y,R2
	st -y,R3
	st -y,R24
	in R2,0x3f
	st -y,R2
	.dbline 88{
; }
; /**************************************
;              捕捉中断处理程序
; **************************************/
; void Icp_timer1(void)       
; {
	.dbline 89
;  if (TCCR1B&0x40)
	in R2,0x2e
	sbrs R2,6
	rjmp L23
	.dbline 90
;    count_l=ICR1; //脉冲低电平宽度
	in R2,0x24
	in R3,0x25
	sts _count_l+1,R3
	sts _count_l,R2
	rjmp L24
L23:
	.dbline 92
;  else
;    count_h=ICR1; //脉冲高电平宽度
	in R2,0x24
	in R3,0x25
	sts _count_h+1,R3
	sts _count_h,R2
L24:
	.dbline 93
;  ICR1=0;
	clr R2
	clr R3
	sts 68+1,R3
	sts 68,R2
	.dbline 94
;  TCNT1=0; 
	sts 76+1,R3
	sts 76,R2
	.dbline 95
;  TCCR1B^=0x40;
	ldi R24,64
	in R2,0x2e
	eor R2,R24
	out 0x2e,R2
	.dbline 96}
; }
L22:
	ld R2,y+
	out 0x3f,R2
	ld R24,y+
	ld R3,y+
	ld R2,y+
	reti
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
_count_h::
	.blkb 2
	.dbsym s count_h _count_h i
_count_l::
	.blkb 2
	.dbsym s count_l _count_l i
