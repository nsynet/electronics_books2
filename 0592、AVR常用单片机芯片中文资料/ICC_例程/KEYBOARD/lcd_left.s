	.module lcd_left.c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\lcd_left.c
	.dbfunc s lcd_shift _lcd_shift fI
;              i -> R20
;              j -> R22
;              p -> R20
;              n -> R10
	.even
_lcd_shift::
	rcall push_gset3
	mov R20,R18
	mov R10,R16
	.dbline 7{
; /************************************************
;             LCD字符移位函数
; 	n:移动的次数 
; 	p:移动方向,'l'或'L'表示左移，'r'或'R'表示右移		
; *************************************************/
; void lcd_shift(unsigned char n,unsigned char p)
;       {
	.dbline 8
;        unsigned char i,j=1;
	ldi R22,1
	.dbline 9
; 	   switch (p)
	clr R21
	cpi R20,82
	ldi R30,0
	cpc R21,R30
	breq L6
	ldi R24,82
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L10
L9:
	cpi R20,76
	ldi R30,0
	cpc R21,R30
	breq L8
	rjmp L1
L10:
	cpi R20,108
	ldi R30,0
	cpc R21,R30
	breq L7
	cpi R20,108
	ldi R30,0
	cpc R21,R30
	brlt L1
L11:
	cpi R20,114
	ldi R30,0
	cpc R21,R30
	breq L5
	rjmp L1
X0:
	.dbline 10
;     	   {
L5:
	.dbline 11
;     	    case 'r':i=0x1c;break;
	ldi R20,28
	.dbline 11
	rjmp L13
L6:
	.dbline 12
; 			case 'R':i=0x1c;break;
	ldi R20,28
	.dbline 12
	rjmp L13
L7:
	.dbline 13
;     	    case 'l':i=0x18;break;    
	ldi R20,24
	.dbline 13
	rjmp L13
L8:
	.dbline 14
; 			case 'L':i=0x18;break;    
	ldi R20,24
	.dbline 14
	.dbline 15
;     	    default:return;
	rjmp L13
L12:
	.dbline 18
	.dbline 19
	inc R22
	.dbline 20
	clr R18
	clr R19
	mov R16,R20
	clr R17
	rcall _write_lcd
	.dbline 21
L13:
	.dbline 17
;     		}
; 	   while (j<=n)
	cp R10,R22
	brsh L12
	.dbline 22}
; 	       {
; 		    j++;
; 			write_lcd(i,0);
; 		   } 	    
; 	  }
L1:
	rcall pop_gset3
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbsym r p 20 c
	.dbsym r n 10 c
