	.module delay.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\display\delay.c
	.dbfunc s delay_1ms _delay_1ms fI
;              i -> R16,R17
	.even
_delay_1ms::
	.dbline -1
	.dbline 10
; /****************************************/
; /*  ÑÓÊ±º¯Êı(mS),ÔÚ±¾ÎÄ¼şÖĞÓ¦¶¨Òå:xtalº */
; /*      xtalÎª¶ÔÓ¦¾§ÕñÆµÂÊ,µ¥Î»ÎªMHZ    */
; /*  ÔÚµ÷ÓÃÑÓÊ±º¯ÊıµÄÎÄ¼şÖĞ,Ó¦×÷ÈçÏÂËµÃ÷ */
; /* extern void delay_ms(unsigned int n);*/
; /* extern void delay_1ms(void);         */
; /****************************************/
; #define xtal 8   
; void delay_1ms(void)
; { unsigned int i;
	.dbline 11
;  for(i=1;i<(unsigned int)(xtal*143-2);i++)
	ldi R16,1
	ldi R17,0
	rjmp L5
L2:
	.dbline 12
L3:
	.dbline 11
	subi R16,255  ; offset = 1
	sbci R17,255
L5:
	.dbline 11
	cpi R16,118
	ldi R30,4
	cpc R17,R30
	brlo L2
	.dbline -2
	.dbline 13
;     ;
; }
L1:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 i
	.dbfunc s delay_ms _delay_ms fI
;              i -> R20,R21
;              n -> R22,R23
	.even
_delay_ms::
	rcall push_gset2
	mov R22,R16
	mov R23,R17
	.dbline -1
	.dbline 15
; void delay_ms(unsigned int n)
; {
	.dbline 16
;  unsigned int i=0;
	clr R20
	clr R21
	rjmp L8
L7:
	.dbline 18
	.dbline 18
	rcall _delay_1ms
	.dbline 19
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 20
L8:
	.dbline 17
;    while(i<n)
	cp R20,R22
	cpc R21,R23
	brlo L7
	.dbline -2
	.dbline 21
;    {delay_1ms();
;     i++;
;    }
; }
L6:
	rcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r n 22 i
