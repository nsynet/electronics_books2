	.module ad_led.c
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
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
	.dbsym s tabel _tabel A[16:16]c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline -1
	.dbline 23
; /******************************************************
;               双龙电子公司http://www.sl.com.cn
;               AT90S8535--AD转换演示程序(ICCAVR)
; 	                  作者：詹卫前		
; 	使用注意：1、应包含头文件slavr.h
;               2、在工程选项中的Additional Lib中填入slavr
; 		         使用编译器使用附加库文件libslavr.a
; 			  3、使用SL-AVRAD实验设备
;     接线说明：1、PA.0(PIN40)处接电平指示LED的短路块断开
; 			  2、A/D和VX之间的短路块闭合
; 			  3、AREF(PIN32)和AVCC(PIN30)接VCC
; 			  4、AGND(PIN31)接GND												   			  
; *******************************************************/
; #include<io8535.h>
; #include<slavr.h>
; #include<macros.h>
;           /*   七段译码字形表     */        
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,
; 	  	0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
;           /*     显示缓冲区       */
; unsigned char ledbuff[6];
; void port_init(void)//端口初始化
;  {
	.dbline 24
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 25
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 26
;   PORTD=0xff;
	out 0x12,R24
	.dbline 27
;   PORTB=0xff;
	out 0x18,R24
	.dbline -2
	.dbline 28
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
	.dbline 30
; void display(void)//六路动态扫描显示电路
; {
	.dbline 32
;  unsigned char i;
;  for (i=0;i<6;i++)
	clr R20
	rjmp L6
L3:
	.dbline 33
	.dbline 34
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 35
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 36
	rcall _delay_1ms
	.dbline 37
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 38
L4:
	.dbline 32
	inc R20
L6:
	.dbline 32
	cpi R20,6
	brlo L3
	.dbline -2
	.dbline 39
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
	.dbfunc s adctovol _adctovol fI
;         char_p -> <dead>
;              i -> R10
;           temp -> R12,R13
;            adc -> R10,R11
	.even
_adctovol::
	rcall push_gset4
	mov R10,R16
	mov R11,R17
	.dbline -1
	.dbline 44
; unsigned int ad_con;//存放PA0的AD转换结果
; /*      将AD结果转换成电压     */
; #define vref   497
; void adctovol(unsigned int adc)
;     {
	.dbline 48
; 	 unsigned int temp;
; 	 unsigned char i;
; 	 unsigned char *char_p;
;      temp=(unsigned int)(((unsigned long)((unsigned long)adc*vref))/1024);
	mov R2,R10
	mov R3,R11
	clr R4
	clr R5
	ldi R20,241
	ldi R21,1
	ldi R22,0
	ldi R23,0
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	mov R16,R20
	mov R17,R21
	mov R18,R22
	mov R19,R23
	rcall mpy32u
	ldi R24,10
	ldi R25,0
	st -y,R24
	rcall lsr32
	mov R12,R16
	mov R13,R17
	.dbline 49
;      for(i=0;i<3;i++)
	clr R10
	rjmp L11
L8:
	.dbline 50
	.dbline 51
	ldi R18,10
	ldi R19,0
	mov R16,R12
	mov R17,R13
	rcall mod16u
	mov R2,R16
	mov R3,R17
	ldi R24,<_tabel
	ldi R25,>_tabel
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R0
	.dbline 52
	ldi R18,10
	ldi R19,0
	mov R16,R12
	mov R17,R13
	rcall div16u
	mov R12,R16
	mov R13,R17
	.dbline 53
L9:
	.dbline 49
	inc R10
L11:
	.dbline 49
	mov R24,R10
	cpi R24,3
	brlo L8
	.dbline 54
; 	    {
; 		 ledbuff[i]=tabel[temp%10];
; 		 temp=temp/10;
; 		}
;      ledbuff[5]=tabel[0x0a];
	ldi R24,<_tabel+10
	ldi R25,>_tabel+10
	mov R30,R24
	mov R31,R25
	lpm
	sts _ledbuff+5,R0
	.dbline 55
; 	 ledbuff[4]=tabel[0x0d];
	ldi R24,<_tabel+13
	ldi R25,>_tabel+13
	mov R30,R24
	mov R31,R25
	lpm
	sts _ledbuff+4,R0
	.dbline 56
; 	 ledbuff[3]=0x40;
	ldi R24,64
	sts _ledbuff+3,R24
	.dbline 57
; 	 ledbuff[2]|=0x80;		
	lds R24,_ledbuff+2
	ori R24,128
	sts _ledbuff+2,R24
	.dbline -2
	.dbline 58
; 	}
L7:
	rcall pop_gset4
	.dbline 0 ; func end
	ret
	.dbsym l char_p 1 pc
	.dbsym r i 10 c
	.dbsym r temp 12 i
	.dbsym r adc 10 i
	.area vector(rom, abs)
	.org 28
	rjmp _adc_isr
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
	.dbfunc s adc_isr _adc_isr fI
;           temp -> R16,R17
	.even
_adc_isr::
	st -y,R2
	st -y,R3
	st -y,R16
	st -y,R17
	st -y,R30
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 62
; /*      AD转换程序     */
; #pragma interrupt_handler adc_isr:IT_ADC
; void adc_isr(void)
;    {
	.dbline 63
;     unsigned int temp=0;
	clr R16
	clr R17
	rjmp L20
L19:
	.dbline 65
	subi R16,255  ; offset = 1
	sbci R17,255
L20:
	.dbline 64
; 	while(temp<6)
	cpi R16,6
	ldi R30,0
	cpc R17,R30
	brlo L19
	.dbline 66
; 	    temp++;
; 	ad_con=ADC;    
	in R2,0x4
	in R3,0x5
	sts _ad_con+1,R3
	sts _ad_con,R2
	.dbline 67
;    	ADCSR|=(1<<ADSC);//启动转换 			 	 		 
	sbi 0x6,6
	.dbline -2
	.dbline 68
;    } 
L18:
	ld R2,y+
	out 0x3f,R2
	ld R30,y+
	ld R17,y+
	ld R16,y+
	ld R3,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbsym r temp 16 i
	.dbfunc s main _main fI
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 71
; //将AD转换结果转换成电压数值，然后在LCD上显示   
; void main(void)
; {
	.dbline 73
;  unsigned char i;
;  port_init();
	rcall _port_init
	.dbline 74
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 75
;  ADMUX=0x00;//0通道
	out 0x7,R2
	.dbline 76
;  ADCSR=(1<<ADEN)|(1<<ADSC)|(1<<ADIF)|(1<<ADIE)|0x06;
	ldi R24,222
	out 0x6,R24
	.dbline 77
;  SEI();
	sei
	.dbline 78
;  for(i=0;i<6;i++)
	clr R20
	rjmp L26
L23:
	.dbline 79
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldi R24,<_tabel
	ldi R25,>_tabel
	st -y,R31
	st -y,R30
	mov R30,R24
	mov R31,R25
	lpm
	ld R30,y+
	ld R31,y+
	std z+0,R0
L24:
	.dbline 78
	inc R20
L26:
	.dbline 78
	cpi R20,6
	brlo L23
	.dbline 80
;     ledbuff[i]=tabel[0];
;  i=0;
	clr R20
	rjmp L28
L27:
	.dbline 82
;  while(1)
;     {
	.dbline 83
;      if((i==127)|(i==0))
	cpi R20,127
	brne L32
	ldi R24,1
	ldi R25,0
	mov R10,R24
	mov R11,R25
	rjmp L33
L32:
	clr R10
	clr R11
L33:
	tst R20
	brne L34
	ldi R22,1
	ldi R23,0
	rjmp L35
L34:
	clr R22
	clr R23
L35:
	mov R2,R10
	mov R3,R11
	or R2,R22
	or R3,R23
	tst R2
	brne X1
	tst R3
	breq L30
X1:
	.dbline 84
; 	     adctovol(ad_con);//降低AD结果刷新速率
	lds R16,_ad_con
	lds R17,_ad_con+1
	rcall _adctovol
L30:
	.dbline 85
	rcall _display
	.dbline 86
	inc R20
	.dbline 87
L28:
	.dbline 81
	rjmp L27
X0:
	.dbline -2
	.dbline 88
; 	 display();			  //使末位闪烁不太明显
; 	 i++; 
;     }
;  }   
L22:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
_ad_con::
	.blkb 2
	.dbsym s ad_con _ad_con i
_ledbuff::
	.blkb 6
	.dbsym s ledbuff _ledbuff A[6:6]c
