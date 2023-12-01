	.module clock.c
	.area vector(rom, abs)
	.org 12
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
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
_time::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.dbsym s time _time Ac[3:3]
_flag::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.dbsym s flag _flag c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\clock\clock.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline 28{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----电脑时钟演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、学习定时器T1溢出中断的使用
; 		  2、学习电脑时钟的编程方法
; 		  3、在程序运行时按SHIFT进行校时
; 	使用注意：1、应包含头文件slavr.h
;               2、在工程选项中的Additional Lib中填入slavr
; 		         使用编译器使用附加库文件libslavr.a
; ***********************************************/
; #include <io8515.h>
; #include <macros.h>
; #include <slavr.h>
; #pragma interrupt_handler timer1:7
; #pragma data:code
;           /*   七段译码字形表     */        
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; #pragma data:data
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x3f,0x3f};
; unsigned char time[3]={0,0,0};
; unsigned char flag=0;
; /*****************************************
;                初始化
; *****************************************/
; void port_init(void)
;  {
	.dbline 29
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 30
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 31
;   PORTD=0xff;
	out 0x12,R24
	.dbline 32
;   PORTB=0xff;
	out 0x18,R24
	.dbline 33
;   TIMSK=0x80;//开放T1溢出中断
	ldi R24,128
	out 0x39,R24
	.dbline 34
;   TCCR1A=0x00;
	clr R2
	out 0x2f,R2
	.dbline 35
;   TCCR1B=0x04;
	ldi R24,4
	out 0x2e,R24
	.dbline 36
;   TCNT1=0x85ee;
	ldi R24,-31250
	ldi R25,-123
	sts 76+1,R25
	sts 76,R24
	.dbline 37
;   SEI();
	sei
	.dbline 38}
;  }
L1:
	ret
	.dbfunc s hextobcd _hextobcd fI
;           temp -> R20
;              i -> R22
	.even
_hextobcd::
	rcall push_gset2
	.dbline 43{
; /*****************************************
;              刷新LED显示缓冲区
; *****************************************/
; void hextobcd (void)
;    {
	.dbline 45
;     unsigned char i,temp;
; 	for (i=0;i<3;i++)
	clr R22
	rjmp L6
L3:
	.dbline 46
	.dbline 47
	ldi R24,<_time
	ldi R25,>_time
	mov R30,R22
	clr R31
	add R30,R24
	adc R31,R25
	ldd R16,z+0
	ldi R17,10
	rcall div8u
	mov R20,R16
	.dbline 48
	ldi R17,10
	rcall mod8u
	mov R20,R16
	.dbline 49
	mov R2,R22
	clr R3
	lsl R2
	rol R3
	ldi R30,5
	ldi R31,0
	sub R30,R2
	sbc R31,R3
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	add R30,R24
	adc R31,R25
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	st -y,R31
	st -y,R30
	mov R30,R2
	mov R31,R3
	lpm
	ld R30,y+
	ld R31,y+
	std z+0,R0
	.dbline 50
	ldi R24,<_time
	ldi R25,>_time
	mov R30,R22
	clr R31
	add R30,R24
	adc R31,R25
	ldd R16,z+0
	ldi R17,10
	rcall mod8u
	mov R20,R16
	.dbline 51
	mov R2,R22
	clr R3
	lsl R2
	rol R3
	ldi R30,4
	ldi R31,0
	sub R30,R2
	sbc R31,R3
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	add R30,R24
	adc R31,R25
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	st -y,R31
	st -y,R30
	mov R30,R2
	mov R31,R3
	lpm
	ld R30,y+
	ld R31,y+
	std z+0,R0
	.dbline 52
L4:
	.dbline 45
	inc R22
L6:
	.dbline 45
	cpi R22,3
	brsh X0
	rjmp L3
X0:
	.dbline 53}
;     {
; 	temp=time[i]/10;
; 	temp=temp%10;
; 	ledbuff[5-2*i]=tabel[temp];
; 	temp=time[i]%10;
; 	ledbuff[4-2*i]=tabel[temp];
; 	}
;    } 
L2:
	rcall pop_gset2
	ret
	.dbsym r temp 20 c
	.dbsym r i 22 c
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 58{
; /*****************************************
;           六路动态扫描显示电路
; *****************************************/   
; void display(void)
; {
	.dbline 60
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L11
L8:
	.dbline 61
	.dbline 62
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 63
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 64
	rcall _delay_1ms
	.dbline 65
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 66
L9:
	.dbline 60
	inc R20
L11:
	.dbline 60
	cpi R20,6
	brlo L8
	.dbline 67}
;   {
;    PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
;    PORTD=~(1<<i);   //开始显示
;    delay_1ms();     //每一位显示保持一定时间
;    PORTD|=(1<<i);   //关闭显示
;   }
; }
L7:
	rcall pop_gset1
	ret
	.dbsym r i 20 c
	.dbfunc s settime _settime fI
;             t1 -> R20
;             t3 -> R22
;             t2 -> R10
	.even
_settime::
	rcall push_gset3
	.dbline 72{
; /*****************************************
;           设定校时时间
; *****************************************/  
; void settime(void)
;    { 
	.dbline 74
;     unsigned char t1,t2,t3;
; 	for (t1=0;t1<3;t1++)
	clr R20
	rjmp L16
L13:
	.dbline 75
; 	{ 
	.dbline 76
; 	   ledbuff[5-2*t1]|=0x80;
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	ldi R24,5
	ldi R25,0
	sub R24,R2
	sbc R25,R3
	ldi R30,<_ledbuff
	ldi R31,>_ledbuff
	add R24,R30
	adc R25,R31
	mov R2,R24
	mov R3,R25
	mov R30,R2
	mov R31,R3
	ldd R24,z+0
	ori R24,128
	std z+0,R24
L17:
	.dbline 78
;        do
; 	     {
	.dbline 79
; 		 t2=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R10,R2
	.dbline 80
; 	  	 display();
	rcall _display
	.dbline 81
; 		 }
L18:
	.dbline 82
; 	   while(t2==0x7f);	 
	mov R24,R10
	cpi R24,127
	breq L17
L20:
	.dbline 84
; 	   do 
; 	     {
	.dbline 85
; 		 t3=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R22,R2
	.dbline 86
; 	     display();	    
	rcall _display
	.dbline 87
; 	     }
L21:
	.dbline 88
;        while (t2==t3);
	cp R10,R22
	breq L20
	.dbline 89
; 	   time[t1]=time[t1]%10+t2*10;
	ldi R24,<_time
	ldi R25,>_time
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	ldi R16,10
	mov R17,R10
	rcall mpy8s
	mov R4,R16
	ldi R17,10
	mov R30,R2
	mov R31,R3
	ldd R16,z+0
	rcall mod8u
	mov R5,R16
	add R5,R4
	mov R30,R2
	mov R31,R3
	std z+0,R5
	.dbline 90
; 	   hextobcd();
	rcall _hextobcd
	.dbline 91
; 	   ledbuff[5-2*t1]&=0x7f;
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	ldi R24,5
	ldi R25,0
	sub R24,R2
	sbc R25,R3
	ldi R30,<_ledbuff
	ldi R31,>_ledbuff
	add R24,R30
	adc R25,R31
	mov R2,R24
	mov R3,R25
	mov R30,R2
	mov R31,R3
	ldd R24,z+0
	andi R24,127
	std z+0,R24
	.dbline 92
; 	   ledbuff[4-2*t1]|=0x80;
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	ldi R24,4
	ldi R25,0
	sub R24,R2
	sbc R25,R3
	ldi R30,<_ledbuff
	ldi R31,>_ledbuff
	add R24,R30
	adc R25,R31
	mov R2,R24
	mov R3,R25
	mov R30,R2
	mov R31,R3
	ldd R24,z+0
	ori R24,128
	std z+0,R24
L23:
	.dbline 94
;        do
; 	     {
	.dbline 95
; 		 t2=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R10,R2
	.dbline 96
; 	  	 display();
	rcall _display
	.dbline 97
; 		 }
L24:
	.dbline 98
; 	   while(t2==0x7f);	 
	mov R24,R10
	cpi R24,127
	breq L23
L26:
	.dbline 100
; 	   do 
; 	     {
	.dbline 101
; 		 t3=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R22,R2
	.dbline 102
; 	     display();	    
	rcall _display
	.dbline 103
; 	     }
L27:
	.dbline 104
	cp R10,R22
	breq L26
	.dbline 105
	ldi R24,<_time
	ldi R25,>_time
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R16,z+0
	ldi R17,10
	rcall div8u
	mov R22,R16
	.dbline 106
	ldi R16,10
	mov R17,R22
	rcall mpy8s
	mov R2,R16
	add R2,R10
	ldi R24,<_time
	ldi R25,>_time
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
	.dbline 107
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	ldi R24,4
	ldi R25,0
	sub R24,R2
	sbc R25,R3
	ldi R30,<_ledbuff
	ldi R31,>_ledbuff
	add R24,R30
	adc R25,R31
	mov R2,R24
	mov R3,R25
	mov R30,R2
	mov R31,R3
	ldd R24,z+0
	andi R24,127
	std z+0,R24
	.dbline 108
	rcall _hextobcd
	.dbline 109
L14:
	.dbline 74
	inc R20
L16:
	.dbline 74
	cpi R20,3
	brsh X1
	rjmp L13
X1:
	.dbline 110}
;        while (t2==t3);
; 	   t3=time[t1]/10;
; 	   time[t1]=t3*10+t2;
; 	   ledbuff[4-2*t1]&=0x7f;
; 	   hextobcd();	   		 	    
;     }
;     }
L12:
	rcall pop_gset3
	ret
	.dbsym r t1 20 c
	.dbsym r t3 22 c
	.dbsym r t2 10 c
	.dbfunc s main _main fI
;              i -> R20
;              j -> R22
	.even
_main::
	.dbline 115{
; /*****************************************
; 主程序功能：演示了电脑时钟程序的工作过程
; *****************************************/
; void main(void)
; {
	.dbline 117
;  unsigned char i,j;
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 118
;  flag=0;
	sts _flag,R2
	.dbline 119
;  port_init(); //端口初始化
	rcall _port_init
	.dbline 120
;  i=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R20,R2
	rjmp L31
L30:
	.dbline 122
;  while(1)
;   {
	.dbline 123
;    i=scan_key(); 
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R20,R2
	.dbline 124
;    if (i!=0x7f)
	cpi R20,127
	breq L33
	.dbline 125
;      {
L35:
	.dbline 127
; 	  do 
; 	   {
	.dbline 128
; 	    j=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R22,R2
	.dbline 129
; 	    display();	    
	rcall _display
	.dbline 130
; 	   }
L36:
	.dbline 131
; 	  while (i==j); 
	cp R20,R22
	breq L35
	.dbline 132
;       if ((i&0x80)==0x80) 
	mov R24,R20
	andi R24,128
	cpi R24,128
	brne L38
	.dbline 133
; 	      settime();//设定时间
	rcall _settime
L38:
	.dbline 134
; 	 }
L33:
	.dbline 135
;    if(flag==1)
	lds R24,_flag
	cpi R24,1
	brne L40
	.dbline 136
;     {
	.dbline 137
; 	 flag=0;
	clr R2
	sts _flag,R2
	.dbline 138
; 	 if (time[2]>=60) 
	lds R24,_time+2
	cpi R24,60
	brlo L42
	.dbline 139
; 	    {
	.dbline 140
; 		 time[2]-=60;
	subi R24,60
	sts _time+2,R24
	.dbline 141
; 		 time[1]++;
	lds R24,_time+1
	subi R24,255	; addi 1
	sts _time+1,R24
	.dbline 142
; 		 }
L42:
	.dbline 143
; 	if (time[1]>=60) 
	lds R24,_time+1
	cpi R24,60
	brlo L47
	.dbline 144
;     {
	.dbline 145
; 	 time[1]-=60;
	subi R24,60
	sts _time+1,R24
	.dbline 146
; 	 time[0]++;
	lds R24,_time
	subi R24,255	; addi 1
	sts _time,R24
	.dbline 147
; 	 } 
L47:
	.dbline 148
; 	if (time[0]>=24) 
	lds R24,_time
	cpi R24,24
	brlo L51
	.dbline 149
; 	    {
	.dbline 150
; 		 time[0]-=24;
	subi R24,24
	sts _time,R24
	.dbline 151
; 		 }
L51:
	.dbline 152
; 	 hextobcd();
	rcall _hextobcd
	.dbline 153
;     }
L40:
	.dbline 154
	rcall _display
	.dbline 155
L31:
	.dbline 121
	rjmp L30
X2:
	.dbline 156}
;    display();
;   }
; }
L29:
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbfunc s timer1 _timer1 fI
	.even
_timer1::
	st -y,R24
	st -y,R25
	in R24,0x3f
	st -y,R24
	.dbline 161{
; /*****************************************
;           T1溢出中断
; *****************************************/  
; void timer1(void)
;    {
	.dbline 162
;     flag=1;
	ldi R24,1
	sts _flag,R24
	.dbline 163
; 	time[2]++;
	lds R24,_time+2
	subi R24,255	; addi 1
	sts _time+2,R24
	.dbline 164
; 	TCNT1=0x85ee;
	ldi R24,-31250
	ldi R25,-123
	sts 76+1,R25
	sts 76,R24
	.dbline 165}
;     }
L53:
	ld R24,y+
	out 0x3f,R24
	ld R25,y+
	ld R24,y+
	reti
