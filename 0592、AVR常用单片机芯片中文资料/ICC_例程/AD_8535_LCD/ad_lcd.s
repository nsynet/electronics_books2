	.module ad_lcd.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
	.dbfunc s adctoasc _adctoasc fI
;         char_p -> R10,R11
;              i -> R12
;           temp -> R14,R15
;            adc -> R10,R11
	.even
_adctoasc::
	rcall push_gset5
	mov R10,R16
	mov R11,R17
	.dbline -1
	.dbline 22
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
; unsigned int ad_con;//存放PA0的AD转换结果
; unsigned char adcval[6];//存放电压ASCII码
; /*      将AD结果转换成电压     */
; #define vref   497
; unsigned char * adctoasc(unsigned int adc)
;     {
	.dbline 26
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
	mov R14,R16
	mov R15,R17
	.dbline 27
;      for(i=0;i<3;i++)
	clr R12
	rjmp L5
L2:
	.dbline 28
	.dbline 29
	mov R2,R12
	clr R3
	ldi R30,3
	ldi R31,0
	sub R30,R2
	sbc R31,R3
	ldi R24,<_adcval
	ldi R25,>_adcval
	add R30,R24
	adc R31,R25
	ldi R18,10
	ldi R19,0
	mov R16,R14
	mov R17,R15
	rcall mod16u
	mov R24,R16
	mov R25,R17
	adiw R24,48
	std z+0,R24
	.dbline 30
	ldi R18,10
	ldi R19,0
	mov R16,R14
	mov R17,R15
	rcall div16u
	mov R14,R16
	mov R15,R17
	.dbline 31
L3:
	.dbline 27
	inc R12
L5:
	.dbline 27
	mov R24,R12
	cpi R24,3
	brlo L2
	.dbline 32
; 	    {
; 		 adcval[3-i]=temp%10+0x30;
; 		 temp=temp/10;
; 		}
; 	 adcval[0]=adcval[1];
	lds R2,_adcval+1
	sts _adcval,R2
	.dbline 33
; 	 adcval[1]='.';	
	ldi R24,46
	sts _adcval+1,R24
	.dbline 34
; 	 adcval[4]='V';	
	ldi R24,86
	sts _adcval+4,R24
	.dbline 35
; 	 adcval[5]=0;	
	clr R2
	sts _adcval+5,R2
	.dbline 36
; 	 char_p=adcval;
	ldi R24,<_adcval
	ldi R25,>_adcval
	mov R10,R24
	mov R11,R25
	.dbline 37
; 	 return char_p;
	mov R16,R24
	mov R17,R25
	.dbline -2
L1:
	rcall pop_gset5
	.dbline 0 ; func end
	ret
	.dbsym r char_p 10 pc
	.dbsym r i 12 c
	.dbsym r temp 14 i
	.dbsym r adc 10 i
	.area vector(rom, abs)
	.org 28
	rjmp _adc_isr
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
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
	.dbline 42
; 	}
; /*      AD转换程序     */
; #pragma interrupt_handler adc_isr:IT_ADC
; void adc_isr(void)
;    {
	.dbline 43
;     unsigned int temp=0;
	clr R16
	clr R17
	rjmp L12
L11:
	.dbline 45
	subi R16,255  ; offset = 1
	sbci R17,255
L12:
	.dbline 44
; 	while(temp<6)
	cpi R16,6
	ldi R30,0
	cpc R17,R30
	brlo L11
	.dbline 46
; 	    temp++;
; 	ad_con=ADC;    
	in R2,0x4
	in R3,0x5
	sts _ad_con+1,R3
	sts _ad_con,R2
	.dbline 47
;    	ADCSR|=(1<<ADSC);//启动转换 			 	 		 
	sbi 0x6,6
	.dbline -2
	.dbline 48
;    } 
L10:
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
	.even
_main::
	.dbline -1
	.dbline 51
; //将AD转换结果转换成电压数值，然后在LCD上显示   
; void main(void)
; {
	.dbline 52
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 53
;  ADMUX=0x00;//0通道
	out 0x7,R2
	.dbline 54
;  ADCSR=(1<<ADEN)|(1<<ADSC)|(1<<ADIF)|(1<<ADIE)|0x06;
	ldi R24,222
	out 0x6,R24
	.dbline 55
;  lcd_init();
	rcall _lcd_init
	.dbline 56
;  SEI();
	sei
	rjmp L16
L15:
	.dbline 58
	.dbline 59
	clr R18
	ldi R16,2
	rcall _lcd_gotoxy
	.dbline 60
	ldi R16,<L18
	ldi R17,>L18
	rcall _lcd_puts
	.dbline 61
	ldi R18,1
	ldi R16,2
	rcall _lcd_gotoxy
	.dbline 62
	ldi R16,<L19
	ldi R17,>L19
	rcall _lcd_puts
	.dbline 63
	ldi R18,1
	ldi R16,10
	rcall _lcd_gotoxy
	.dbline 64
	lds R16,_ad_con
	lds R17,_ad_con+1
	rcall _adctoasc
	rcall _lcd_puts
	.dbline 65
	ldi R16,500
	ldi R17,1
	rcall _delay_ms
	.dbline 66
	rcall _lcd_clear
	.dbline 67
L16:
	.dbline 57
	rjmp L15
X0:
	.dbline -2
	.dbline 68
;  while(1)
;     {
;      lcd_gotoxy(2,0);
;      lcd_puts("AD--Converter");
; 	 lcd_gotoxy(2,1); 
; 	 lcd_puts("Voltage:");   
;      lcd_gotoxy(10,1);
;      lcd_puts(adctoasc(ad_con));
; 	 delay_ms(500);
; 	 lcd_clear();
;      }
;  }   
L14:
	.dbline 0 ; func end
	ret
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
_adcval::
	.blkb 6
	.dbsym s adcval _adcval A[6:6]c
_ad_con::
	.blkb 2
	.dbsym s ad_con _ad_con i
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
L19:
	.blkb 9
	.area idata
	.byte 'V,'o,'l,'t,'a,'g,'e,58,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
L18:
	.blkb 14
	.area idata
	.byte 'A,'D,45,45,'C,'o,'n,'v,'e,'r,'t,'e,'r,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\AD_8535_LCD\ad_lcd.c
