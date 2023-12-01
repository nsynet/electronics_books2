	.module led.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\LED\led.c
	.dbfunc s Delay _Delay fI
;              a -> R16
;              b -> R18
	.even
_Delay::
	.dbline 6{
; #include <io8515.h>
; /********************************************************** 
; 为了可以看见LED的图案变化，每次LED图案变化需要保持一定时间
;  *********************************************************/
; void Delay()
; 	{
	.dbline 9
; 	unsigned char a, b;
; 
; 	for (a = 1; a; a++)
	ldi R16,1
	rjmp L5
L2:
	.dbline 10
; 		for (b = 1; b; b++)
	ldi R18,1
	rjmp L9
L6:
	.dbline 11
L7:
	.dbline 10
	inc R18
L9:
	.dbline 10
	tst R18
	brne L6
L3:
	.dbline 9
	inc R16
L5:
	.dbline 9
	tst R16
	brne L2
	.dbline 12}
; 			;
; 	}
L1:
	ret
	.dbsym r a 16 c
	.dbsym r b 18 c
	.dbfunc s LED_On _LED_On fI
;              i -> R20,R21
	.even
_LED_On::
	rcall push_gset1
	mov R20,R16
	mov R21,R17
	.dbline 15{
; 
; void LED_On(int i)
; 	{
	.dbline 16
; 	PORTB=~(1<<i);	/* 输出低电平，使LED发光 */
	ldi R16,1
	ldi R17,0
	mov R18,R20
	mov R19,R21
	rcall lsl16
	mov R2,R16
	mov R3,R17
	com R2
	com R3
	out 0x18,R2
	.dbline 17
; 	Delay();
	rcall _Delay
	.dbline 18}
; 	}
L10:
	rcall pop_gset1
	ret
	.dbsym r i 20 I
	.dbfunc s main _main fI
;              i -> R20,R21
	.even
_main::
	.dbline 21{
; 
; void main()
; 	{
	.dbline 23
; 	int i;
; 	DDRB = 0xFF;	/* 定义B口为输出*/
	ldi R24,255
	out 0x17,R24
	.dbline 24
; 	PORTB = 0xFF;	/* 关闭全部LED */
	out 0x18,R24
	rjmp L13
L12:
	.dbline 27
; 
; 	while (1)
; 		{
	.dbline 29
; 		/* 往前步进 */
; 		for (i = 0; i < 8; i++)
	clr R20
	clr R21
L15:
	.dbline 30
	mov R16,R20
	mov R17,R21
	rcall _LED_On
L16:
	.dbline 29
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 29
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	brlt L15
	.dbline 32
; 			LED_On(i);
; 		/* 往后步进 */
; 		for (i = 8; i > 0; i--)
	ldi R20,8
	ldi R21,0
L19:
	.dbline 33
	mov R16,R20
	mov R17,R21
	rcall _LED_On
L20:
	.dbline 32
	subi R20,1
	sbci R21,0
	.dbline 32
	clr R2
	clr R3
	cp R2,R20
	cpc R3,R21
	brlt L19
	.dbline 35
; 			LED_On(i);
; 		/*  跳 跃  */
; 		for (i = 0; i < 8; i += 2)
	clr R20
	clr R21
L23:
	.dbline 36
	mov R16,R20
	mov R17,R21
	rcall _LED_On
L24:
	.dbline 35
	subi R20,254  ; offset = 2
	sbci R21,255
	.dbline 35
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	brlt L23
	.dbline 37
; 			LED_On(i);
; 		for (i = 7; i > 0; i -= 2)
	ldi R20,7
	ldi R21,0
L27:
	.dbline 38
	mov R16,R20
	mov R17,R21
	rcall _LED_On
L28:
	.dbline 37
	subi R20,2
	sbci R21,0
	.dbline 37
	clr R2
	clr R3
	cp R2,R20
	cpc R3,R21
	brlt L27
	.dbline 39
L13:
	.dbline 26
	rjmp L12
X0:
	.dbline 40}
; 			LED_On(i);
; 		}
; 	}
L11:
	ret
	.dbsym r i 20 I
