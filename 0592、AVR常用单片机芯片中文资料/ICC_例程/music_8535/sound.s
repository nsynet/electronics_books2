	.module sound.c
	.area vector(rom, abs)
	.org 18
	rjmp _timer0
	.org 12
	rjmp _timer1
	.area lit(rom, con, rel)
_music_data::
	.word 440
	.word 600
	.word 494
	.word 200
	.word 523
	.word 600
	.word 440
	.word 200
	.word 523
	.word 400
	.word 494
	.word 200
	.word 440
	.word 200
	.word 494
	.word 400
	.word 330
	.word 400
	.word 494
	.word 600
	.word 523
	.word 200
	.word 578
	.word 600
	.word 494
	.word 200
	.word 578
	.word 400
	.word 523
	.word 200
	.word 494
	.word 200
	.word 440
	.word 800
	.word 659
	.word 400
	.word 880
	.word 400
	.word 784
	.word 400
	.word 880
	.word 200
	.word 784
	.word 200
	.word 698
	.word 400
	.word 659
	.word 200
	.word 578
	.word 200
	.word 659
	.word 400
	.word 440
	.word 400
	.word 0
	.word 200
	.word 698
	.word 400
	.word 578
	.word 200
	.word 659
	.word 600
	.word 523
	.word 200
	.word 494
	.word 200
	.word 330
	.word 200
	.word 523
	.word 200
	.word 494
	.word 200
	.word 440
	.word 800
	.word 659
	.word 400
	.word 880
	.word 400
	.word 784
	.word 400
	.word 880
	.word 200
	.word 784
	.word 200
	.word 698
	.word 400
	.word 659
	.word 200
	.word 578
	.word 200
	.word 659
	.word 400
	.word 440
	.word 400
	.word 0
	.word 200
	.word 698
	.word 400
	.word 578
	.word 200
	.word 659
	.word 600
	.word 523
	.word 200
	.word 494
	.word 200
	.word 330
	.word 200
	.word 523
	.word 200
	.word 494
	.word 200
	.word 440
	.word 800
	.word 0
	.word 0
	.dbfile D:\ICC-AVR\examples.sl\music_8535\sound.c
	.dbsym s music_data _music_data A[232:58:2]i
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\music_8535\sound.c
_delay::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\music_8535\sound.c
	.dbsym s delay _delay i
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\music_8535\sound.c
	.dbfunc s music_init _music_init fI
	.even
_music_init::
	.dbline -1
	.dbline 42
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----电脑音乐演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、学习定时器T0溢出中断的使用
; 		  2、学习定时器T1比较中断的使用
; 		  3、学习电脑音乐的产生
; **********************************************/
; #include <io8535.h>
; #include <macros.h>
; #pragma interrupt_handler timer0:IT_TIMER0_OVF0
; #pragma interrupt_handler timer1:IT_TIMER1_COMPA
; const unsigned int music_data[][2]=
; /*******************************************
;        卡秋莎音乐数据{x,y}
; 	   x:对应音符音阶(频率),0表示休止符
; 	   y:对应音符节拍
; ********************************************/
; {
; {440,600} ,{494,200} ,{523,600} ,{440,200},
; {523,400} ,{494,200} ,{440,200} ,{494,400},
; {330,400} ,{494,600} ,{523,200} ,{578,600},
; {494,200} ,{578,400} ,{523,200} ,{494,200},
; {440,800} ,{659,400} ,{880,400} ,{784,400},
; {880,200} ,{784,200} ,{698,400} ,{659,200},
; {578,200} ,{659,400} ,{440,400} ,{  0,200},//休止符
; {698,400} ,{578,200} ,{659,600} ,{523,200},
; {494,200} ,{330,200} ,{523,200} ,{494,200},
; {440,800} ,{659,400} ,{880,400} ,{784,400},
; {880,200} ,{784,200} ,{698,400} ,{659,200},
; {578,200} ,{659,400} ,{440,400} ,{  0,200},//休止符
; {698,400} ,{578,200}, {659,600} ,{523,200},
; {494,200} ,{330,200}, {523,200} ,{494,200},
; {440,800} ,
; {0,0}};
; #pragma data:data
; unsigned int delay=0;
; /*******************************
;        MCU初始化
; *******************************/
; void music_init(void)
;  {
	.dbline 43
;   MCUCR=0x00;
	clr R2
	out 0x35,R2
	.dbline 44
;   DDRC=0x01;
	ldi R24,1
	out 0x14,R24
	.dbline 45
;   TCCR1A=0x00;
	out 0x2f,R2
	.dbline 46
;   TCCR1B=0x09;
	ldi R24,9
	out 0x2e,R24
	.dbline 47
;   TCCR0=0x03;
	ldi R24,3
	out 0x33,R24
	.dbline 48
;   TCNT0=0x19;
	ldi R24,25
	out 0x32,R24
	.dbline 49
;   TIMSK=(1<<OCIE1A)|(1<<TOIE0);
	ldi R24,17
	out 0x39,R24
	.dbline -2
	.dbline 50
;   }
L1:
	.dbline 0 ; func end
	ret
	.dbfunc s timer0 _timer0 fI
	.even
_timer0::
	st -y,R24
	st -y,R25
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 55
; /**************************************************
;       T0中断程序，产生音乐节拍
; **************************************************/  
; void timer0(void) 
;     {
	.dbline 56
;      delay++;
	lds R24,_delay
	lds R25,_delay+1
	adiw R24,1
	sts _delay+1,R25
	sts _delay,R24
	.dbline 57
;      TCNT0=0x19;
	ldi R24,25
	out 0x32,R24
	.dbline -2
	.dbline 58
;     }
L2:
	ld R24,y+
	out 0x3f,R24
	ld R25,y+
	ld R24,y+
	.dbline 0 ; func end
	reti
	.dbfunc s timer1 _timer1 fI
	.even
_timer1::
	st -y,R2
	st -y,R24
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 63
; /**************************************************
;       T1中断程序，根据SOUND函数输出一定频率的方波
; **************************************************/  
; void timer1(void) 
;     {
	.dbline 64
;      PORTC^=0x01;
	ldi R24,1
	in R2,0x15
	eor R2,R24
	out 0x15,R2
	.dbline -2
	.dbline 65
;     }
L3:
	ld R2,y+
	out 0x3f,R2
	ld R24,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbfunc s sound _sound fI
;              y -> R10,R11
;              x -> R12,R13
	.even
_sound::
	rcall push_gset4
	mov R10,R18
	mov R11,R19
	mov R12,R16
	mov R13,R17
	.dbline -1
	.dbline 72
; /*****************************************************
;       SOUND程序，输出频率为 x HZ的方波,延时 y MS
;        x:100~20000 HZ, 0表示不发声
;        y:0~65536 MS
; *****************************************************/     
; void sound(unsigned int x,unsigned int y)
;     {
	.dbline 73
;        SEI(); 
	sei
	.dbline 74
;        delay=0; 
	clr R2
	clr R3
	sts _delay+1,R3
	sts _delay,R2
	.dbline 75
;        if (x!=0)
	tst R12
	brne X0
	tst R13
	breq L5
X0:
	.dbline 76
;         {         
	.dbline 77
;          x=4000000/x; 
	mov R2,R12
	mov R3,R13
	clr R4
	clr R5
	ldi R20,0
	ldi R21,9
	ldi R22,61
	ldi R23,0
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	mov R16,R20
	mov R17,R21
	mov R18,R22
	mov R19,R23
	rcall div32s
	mov R12,R16
	mov R13,R17
	.dbline 78
;          OCR1A=x;   
	sts 74+1,R13
	sts 74,R12
	.dbline 79
;          TCNT1=0x00;
	clr R2
	clr R3
	sts 76+1,R3
	sts 76,R2
	.dbline 80
; 		 TIMSK|=(1<<OCIE1A);
	in R24,0x39
	ori R24,16
	out 0x39,R24
L7:
	.dbline 82
L8:
	.dbline 81
;          while(delay<y)
	lds R2,_delay
	lds R3,_delay+1
	cp R2,R10
	cpc R3,R11
	brlo L7
	.dbline 83
;           ;
; 		 TIMSK&=~(1<<OCIE1A);      
	in R24,0x39
	andi R24,239
	out 0x39,R24
	.dbline 84
;          }
	rjmp L6
L5:
	.dbline 86
;       else
;          {
	.dbline 87
;           TIMSK&=~(1<<OCIE1A);
	in R24,0x39
	andi R24,239
	out 0x39,R24
L10:
	.dbline 89
L11:
	.dbline 88
;           while(delay<y)
	lds R2,_delay
	lds R3,_delay+1
	cp R2,R10
	cpc R3,R11
	brlo L10
	.dbline 90
;           ;
;           }
L6:
	.dbline 91
;       CLI(); 
	cli
	.dbline -2
	.dbline 93
;              
;     }
L4:
	rcall pop_gset4
	.dbline 0 ; func end
	ret
	.dbsym r y 10 i
	.dbsym r x 12 i
	.dbfunc s main _main fI
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 98
; /*******************************
;           主程序
; *******************************/  
; void main(void)
;   {
	.dbline 99
;    unsigned char i=0;
	clr R20
	.dbline 100
;    music_init();  
	rcall _music_init
	rjmp L15
X1:
	.dbline 102
;    while(1)
;       { 
L17:
	.dbline 104
	.dbline 105
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	lsl R2
	rol R3
	ldi R24,<_music_data+2
	ldi R25,>_music_data+2
	mov R16,R2
	mov R17,R3
	add R16,R24
	adc R17,R25
	rcall lpm16
	mov R18,R16
	mov R19,R17
	ldi R24,<_music_data
	ldi R25,>_music_data
	mov R16,R2
	mov R17,R3
	add R16,R24
	adc R17,R25
	rcall lpm16
	rcall _sound
	.dbline 106
	inc R20
	.dbline 107
L18:
	.dbline 103
	ldi R24,<_music_data+2
	ldi R25,>_music_data+2
	mov R16,R20
	clr R17
	lsl R16
	rol R17
	lsl R16
	rol R17
	add R16,R24
	adc R17,R25
	rcall lpm16
	cpi R16,0
	cpc R16,R17
	brne L17
	.dbline 108
	clr R20
	.dbline 109
L15:
	.dbline 101
	rjmp L18
X2:
	.dbline -2
	.dbline 110
;        while(music_data[i][1]!=0)
;            {
;             sound(music_data[i][0],music_data[i][1]);
;             i++;
;             }
;        i=0;     
;        }
;    }
L13:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
