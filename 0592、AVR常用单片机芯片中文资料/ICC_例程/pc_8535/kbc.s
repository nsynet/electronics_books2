	.module kbc.c
	.area lit(rom, con, rel)
_unshifted::
	.byte 13,9
	.byte 14,96
	.byte 21,'q
	.byte 22,49
	.byte 26,'z
	.byte 27,'s
	.byte 28,'a
	.byte 29,'w
	.byte 30,50
	.byte 33,'c
	.byte 34,'x
	.byte 35,'d
	.byte 36,'e
	.byte 37,52
	.byte 38,51
	.byte 41,32
	.byte 42,'v
	.byte 43,'f
	.byte 44,'t
	.byte 45,'r
	.byte 46,53
	.byte 49,'n
	.byte 50,'b
	.byte 51,'h
	.byte 52,'g
	.byte 53,'y
	.byte 54,54
	.byte 57,44
	.byte 58,'m
	.byte 59,'j
	.byte 60,'u
	.byte 61,55
	.byte 62,56
	.byte 'A,44
	.byte 'B,'k
	.byte 'C,'i
	.byte 'D,'o
	.byte 'E,48
	.byte 'F,57
	.byte 'I,46
	.byte 'J,47
	.byte 'K,'l
	.byte 'L,59
	.byte 'M,'p
	.byte 'N,45
	.byte 'R,39
	.byte 'T,91
	.byte 'U,61
	.byte 'Z,13
	.byte 91,93
	.byte 93,92
	.byte 'a,60
	.byte 'f,8
	.byte 'i,49
	.byte 'k,52
	.byte 'l,55
	.byte 'p,48
	.byte 'q,44
	.byte 'r,50
	.byte 's,53
	.byte 't,54
	.byte 'u,56
	.byte 'y,43
	.byte 'z,51
	.byte 123,45
	.byte 124,42
	.byte 125,57
	.byte 0,0
	.dbfile D:\ICC-AVR\examples.sl\pc_8535/scancodes.h
	.dbsym s unshifted _unshifted A[136:68:2]c
_shifted::
	.byte 13,9
	.byte 14,126
	.byte 21,'Q
	.byte 22,33
	.byte 26,'Z
	.byte 27,'S
	.byte 28,'A
	.byte 29,'W
	.byte 30,64
	.byte 33,'C
	.byte 34,'X
	.byte 35,'D
	.byte 36,'E
	.byte 37,36
	.byte 38,35
	.byte 41,32
	.byte 42,'V
	.byte 43,'F
	.byte 44,'T
	.byte 45,'R
	.byte 46,37
	.byte 49,'N
	.byte 50,'B
	.byte 51,'H
	.byte 52,'G
	.byte 53,'Y
	.byte 54,94
	.byte 57,'L
	.byte 58,'M
	.byte 59,'J
	.byte 60,'U
	.byte 61,38
	.byte 62,42
	.byte 'A,60
	.byte 'B,'K
	.byte 'C,'I
	.byte 'D,'O
	.byte 'E,41
	.byte 'F,40
	.byte 'I,62
	.byte 'J,63
	.byte 'K,'L
	.byte 'L,58
	.byte 'M,'P
	.byte 'N,95
	.byte 'R,34
	.byte 'T,123
	.byte 'U,43
	.byte 'Z,13
	.byte 91,125
	.byte 93,124
	.byte 'a,62
	.byte 'f,8
	.byte 'i,49
	.byte 'k,52
	.byte 'l,55
	.byte 'p,48
	.byte 'q,44
	.byte 'r,50
	.byte 's,53
	.byte 't,54
	.byte 'u,56
	.byte 'y,43
	.byte 'z,51
	.byte 123,45
	.byte 124,42
	.byte 125,57
	.byte 0,0
	.dbsym s shifted _shifted A[136:68:2]c
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535/scancodes.h
_input::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535/scancodes.h
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.dbsym s input _input c
_output::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.dbsym s output _output c
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.dbfunc s put_kbbuff _put_kbbuff fI
;              c -> R16
	.even
_put_kbbuff::
	.dbline -1
	.dbline 14
; #include <io8535.h>
; #include <macros.h>
; #include "pindefs.h"
; #include "scancodes.h"
; #define BUFF_SIZE 64
; //const ascii[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,
; //                 0x39,0x41,0x42,0x43,0x44,0x45,0x46};
; unsigned char bitcount;//PC键盘数据长度计数 
; unsigned char kb_buffer[BUFF_SIZE];//键盘缓冲区
; unsigned char input=0;//缓冲区读指针
; unsigned char output=0;//缓冲区写指针
; //送键盘按键ASCII码到键盘缓冲区
; void put_kbbuff(unsigned char c)
;  {
	.dbline 15
;   kb_buffer[input]=c;
	ldi R24,<_kb_buffer
	ldi R25,>_kb_buffer
	lds R30,_input
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R16
	.dbline 16
;   if (input<(BUFF_SIZE-1))
	lds R24,_input
	cpi R24,63
	brsh L2
	.dbline 17
;      input++; 
	subi R24,255    ; addi 1
	sts _input,R24
	rjmp L3
L2:
	.dbline 19
	clr R2
	sts _input,R2
L3:
	.dbline -2
	.dbline 20
;   else
;      input=0;	 
;  }
L1:
	.dbline 0 ; func end
	ret
	.dbsym r c 16 c
	.dbfunc s get_char _get_char fI
;           temp -> R16
	.even
_get_char::
	.dbline -1
	.dbline 23
; //从键盘缓冲区读取按键的ASCII码 
; unsigned char get_char(void)
;   {
	.dbline 25
;    unsigned char temp;
;    if(output==input)
	lds R2,_input
	lds R3,_output
	cp R3,R2
	brne L5
	.dbline 26
;        return 0;
	clr R16
	rjmp L4
L5:
	.dbline 28
;    else
;       {
	.dbline 29
; 	   temp=kb_buffer[output];
	ldi R24,<_kb_buffer
	ldi R25,>_kb_buffer
	lds R30,_output
	clr R31
	add R30,R24
	adc R31,R25
	ldd R16,z+0
	.dbline 30
; 	   if(output<(BUFF_SIZE-1))
	lds R24,_output
	cpi R24,63
	brsh L7
	.dbline 31
; 	     {
	.dbline 32
; 		  output++;
	subi R24,255    ; addi 1
	sts _output,R24
	.dbline 33
; 		 }
	rjmp L8
L7:
	.dbline 35
; 	   else
; 	     output=0;
	clr R2
	sts _output,R2
L8:
	.dbline 36
; 	   return temp;	  
	.dbline -2
L4:
	.dbline 0 ; func end
	ret
	.dbsym r temp 16 c
	.dbfunc s init_kb _init_kb fI
	.even
_init_kb::
	.dbline -1
	.dbline 41
; 	  }	     
;   }
; //为运行读取PC键盘程序进行初始化  
; void init_kb(void)
;     {
	.dbline 42
; 	 MCUCR=0x02;//设置8515的INT0为下降沿触发中断 
	ldi R24,2
	out 0x35,R24
	.dbline 43
;      GIMSK|=(1<<INT0);//使能INT0中断
	in R24,0x3b
	ori R24,64
	out 0x3b,R24
	.dbline 44
;      SEI(); //开中断
	sei
	.dbline 45
;      bitcount = 11;
	ldi R24,11
	sts _bitcount,R24
	.dbline -2
	.dbline 46
;     }
L9:
	.dbline 0 ; func end
	ret
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
L11:
	.blkb 1
L12:
	.blkb 1
L13:
	.blkb 1
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.dbfunc s decode _decode fI
	.dbsym s shiftup L13 c
	.dbsym s up L12 c
	.dbsym s shift L11 c
;              i -> R20
;             sc -> R22
	.even
_decode::
	rcall push_gset3
	mov R22,R16
	.dbline -1
	.dbline 49
; //对PC键盘的扫描码进行解码	
; void decode(unsigned char sc)
;     {
	.dbline 52
;       static unsigned char shift,up,shiftup;
; 	  unsigned char i;
; 	  if (sc==0xf0)//按键释放
	cpi R22,240
	brne L14
	.dbline 53
; 	      {
	.dbline 54
; 		   up=1;
	ldi R24,1
	sts L12,R24
	.dbline 55
; 		   return;
	rjmp L10
L14:
	.dbline 57
; 		  }
; 	  if (up==1)//SHIF键开关
	lds R24,L12
	cpi R24,1
	brne L16
	.dbline 58
; 	  	  {
	.dbline 59
; 		   up=0;
	clr R2
	sts L12,R2
	.dbline 60
; 		   if ((sc==0x12)|(sc==0x59)) shift=0;
	cpi R22,18
	brne L20
	ldi R24,1
	ldi R25,0
	mov R10,R24
	mov R11,R25
	rjmp L21
L20:
	clr R10
	clr R11
L21:
	cpi R22,89
	brne L22
	ldi R20,1
	ldi R21,0
	rjmp L23
L22:
	clr R20
	clr R21
L23:
	mov R2,R10
	mov R3,R11
	or R2,R20
	or R3,R21
	tst R2
	brne X1
	tst R3
	brne X2
	rjmp L10
X2:
X1:
	.dbline 60
	clr R2
	sts L11,R2
	.dbline 61
; 		   return;
	rjmp L10
L16:
	.dbline 63
; 		  }	  	   
; 	  switch (sc)
	mov R20,R22
	clr R21
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	breq L27
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	brlt L24
L47:
	cpi R20,89
	ldi R30,0
	cpc R21,R30
	breq L28
	rjmp L24
X0:
	.dbline 64
; 	    {
L27:
	.dbline 65
; 		 case 0x12:{//检测左SHIF键
	.dbline 66
; 					shift=1;		
	ldi R24,1
	sts L11,R24
	.dbline 67
; 					shiftup=1;
	sts L13,R24
	.dbline 68
; 		           }		           
L28:
	.dbline 69
; 		 case 0x59:{//检测右SHIF键
	.dbline 70
; 				    shift=1;	
	ldi R24,1
	sts L11,R24
	.dbline 71
; 					shiftup=1;
	sts L13,R24
	.dbline 72
; 		           }		           
L24:
	.dbline 73
; 		 default:{
	.dbline 74
; 		          if (shift==0)
	lds R2,L11
	tst R2
	breq X3
	rjmp L29
X3:
	.dbline 75
; 					 {
	.dbline 76
	clr R20
	rjmp L34
L31:
	.dbline 76
L32:
	.dbline 76
	inc R20
L34:
	.dbline 76
; 					 for(i = 0;unshifted[i][0]!=sc && unshifted[i][0]; i++);
	ldi R24,<_unshifted
	ldi R25,>_unshifted
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R2,R0
	clr R3
	mov R4,R22
	clr R5
	cp R2,R4
	cpc R3,R5
	breq L35
	tst R2
	brne L31
	tst R3
	brne L31
L35:
	.dbline 77
;                      if (unshifted[i][0] == sc)
	ldi R24,<_unshifted
	ldi R25,>_unshifted
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	cp R0,R22
	breq X4
	rjmp L30
X4:
	.dbline 78
; 						  put_kbbuff(unshifted[i][1]);	 
	ldi R24,<_unshifted+1
	ldi R25,>_unshifted+1
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R16,R0
	rcall _put_kbbuff
	.dbline 79
; 					 }
	rjmp L30
L29:
	.dbline 81
; 				  else
; 				     {
	.dbline 82
	clr R20
	rjmp L42
L39:
	.dbline 82
L40:
	.dbline 82
	inc R20
L42:
	.dbline 82
; 					 for(i = 0;shifted[i][0]!=sc && shifted[i][0]; i++);
	ldi R24,<_shifted
	ldi R25,>_shifted
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R2,R0
	clr R3
	mov R4,R22
	clr R5
	cp R2,R4
	cpc R3,R5
	breq L43
	tst R2
	brne L39
	tst R3
	brne L39
L43:
	.dbline 83
;                      if (shifted[i][0] == sc)
	ldi R24,<_shifted
	ldi R25,>_shifted
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	cp R0,R22
	brne L44
	.dbline 84
;                          {
	.dbline 85
; 						  put_kbbuff(shifted[i][1]);						  
	ldi R24,<_shifted+1
	ldi R25,>_shifted+1
	mov R2,R20
	clr R3
	lsl R2
	rol R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R16,R0
	rcall _put_kbbuff
	.dbline 86
; 						 }	 	 						 
L44:
	.dbline 87
; 					 } 
L30:
	.dbline 88
; 		         }		         
	.dbline 89
; 		} 	
	.dbline -2
	.dbline 90
;     }
L10:
	rcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r sc 22 c
	.area vector(rom, abs)
	.org 2
	rjmp _int0_isr
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
L49:
	.blkb 1
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	.dbfunc s int0_isr _int0_isr fI
	.dbsym s data L49 c
	.even
_int0_isr::
	rcall push_lset
	rcall push_gset1
	.dbline -1
	.dbline 94
; //键盘数据读取程序	
; #pragma interrupt_handler int0_isr:2
; void int0_isr(void)
;    {
	.dbline 96
;     static unsigned char data;   	
;     switch (bitcount)
	lds R20,_bitcount
	clr R21
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L57
	cpi R20,2
	ldi R30,0
	cpc R21,R30
	breq L56
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	brlt L50
L62:
	cpi R20,11
	ldi R30,0
	cpc R21,R30
	breq L53
	rjmp L50
X5:
	.dbline 97
; 	  {
L53:
	.dbline 98
; 	   case 11:{
	.dbline 99
; 	            if ((PIN_KB&(1<<DATAPIN))!=0)
	sbis 0x10,3
	rjmp L54
	.dbline 100
; 				     return;
	rjmp L48
L54:
	.dbline 102
; 			    else		 
; 	   			    bitcount--;
	lds R24,_bitcount
	subi R24,1
	sts _bitcount,R24
	.dbline 103
; 	    		break;}
	rjmp L51
L56:
	.dbline 104
; 	   case 2:{
	.dbline 105
; 	   			bitcount--;	   		   
	lds R24,_bitcount
	subi R24,1
	sts _bitcount,R24
	.dbline 106
; 			    break;}
	rjmp L51
L57:
	.dbline 107
; 	   case 1:{
	.dbline 108
; 	   			bitcount--;	 
	lds R24,_bitcount
	subi R24,1
	sts _bitcount,R24
	.dbline 109
; 				if ((PIN_KB&(1<<DATAPIN))==0)
	sbic 0x10,3
	rjmp L58
	.dbline 110
; 				    {
	.dbline 111
; 					 bitcount=11;
	ldi R24,11
	sts _bitcount,R24
	.dbline 112
; 					 return;
	rjmp L48
L58:
	.dbline 115
; 					}
; 				else
; 				   {
	.dbline 116
; 				    bitcount=11;
	ldi R24,11
	sts _bitcount,R24
	.dbline 117
; 		            decode(data);
	lds R16,L49
	rcall _decode
	.dbline 118
; 				   }	  
	.dbline 119
; 	   	        break;}
	rjmp L51
L50:
	.dbline 120
; 	   default:{
	.dbline 121
; 	   	        data = (data >> 1);
	lds R2,L49
	lsr R2
	sts L49,R2
	.dbline 122
;                 if((PIN_KB&(1<<DATAPIN))!=0)
	sbis 0x10,3
	rjmp L60
	.dbline 123
;                     data|=0x80;
	mov R24,R2
	ori R24,128
	sts L49,R24
L60:
	.dbline 124
	lds R24,_bitcount
	subi R24,1
	sts _bitcount,R24
	.dbline 125
	.dbline 126
L51:
	.dbline -2
	.dbline 127
; 				bitcount--;
; 	            }		
; 	  }		 		 	  	
;     } 
L48:
	rcall pop_gset1
	rcall pop_lset
	.dbline 0 ; func end
	reti
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\pc_8535\kbc.c
_kb_buffer::
	.blkb 64
	.dbsym s kb_buffer _kb_buffer A[64:64]c
_bitcount::
	.blkb 1
	.dbsym s bitcount _bitcount c
