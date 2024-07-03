// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\IDE180\cc1.exe C:\WINDOWS\TEMP\ccx5qdgb.i -fkeep-inline-functions -quiet -dumpbase 88ledtest.c -gstabs -o .\Debug/88ledtest.asm
// gcc2_compiled.:

.stabs "D:\\2003年工作\\tset\\实验箱\\BoxTest\\自检程式/", 0x64, 0, 3, Ltext0
.stabs "D:/2003年工作/tset/实验箱/BoxTest/自检程式/88ledtest.c", 0x64, 0, 3, Ltext0
.code
Ltext0:
.debug
	.dw '.stabs "int:t1=r1;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "char:t2=r2;0;127;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long int:t3=r3;-2147483648;2147483647;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "unsigned int:t4=r4;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long unsigned int:t5=r5;0;4294967295;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long long int:t6=r6;-2147483648;2147483647;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long long unsigned int:t7=r7;0;4294967295;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "short int:t8=r8;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "short unsigned int:t9=r9;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "signed char:t10=r10;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "unsigned char:t11=r11;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "float:t12=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "double:t13=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long double:t14=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex int:t15=s2real:1,0,16;imag:1,16,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex float:t16=r16;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex double:t17=r17;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex long double:t18=r18;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "void:t19=19",128,0,0,0',0x0d,0x0a
.CODE
.code
.debug
	.dw '.stabs "delay1:F1",36,0,0,',0,0,offset _delay1,seg _delay1,0x0d,0x0a
.CODE
.public _delay1
_delay1:	.proc
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM1-_delay1
	.dw 0x0d,0x0a
.code
LM1:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R1=BP+6
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM2-_delay1
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM3-_delay1
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	R2=[bp+2]	// QImode move
	CMP R1,[R2]	// QImode compare
	JNB L11	// QImode LTU
	PC=L6
L11:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM4-_delay1
	.dw 0x0d,0x0a
.code
LM4:
LBB3:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM5-_delay1
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L7:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,99	// QImode compare
	JA L12	// QImode LEU
	PC=L9
L12:
	pc=L8	// jump
L10:
L9:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM6-_delay1
	.dw 0x0d,0x0a
.code
LM6:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM7-_delay1
	.dw 0x0d,0x0a
.code
LM7:
LBE3:
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM8-_delay1
	.dw 0x0d,0x0a
.code
LM8:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM9-_delay1
	.dw 0x0d,0x0a
.code
LM9:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM10-_delay1
	.dw 0x0d,0x0a
.code
LM10:
LBE2:
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM11-_delay1
	.dw 0x0d,0x0a
.code
LM11:
L2:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of delay1

.debug
	.dw '.stabs "n:p4",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_delay1
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "j:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_delay1
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_delay1
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_delay1
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_delay1
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "TestLed:F19",36,0,0,',0,0,offset _TestLed,seg _TestLed,0x0d,0x0a
.CODE
.public _TestLed
_TestLed:	.proc
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM12-_TestLed
	.dw 0x0d,0x0a
.code
LM12:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM13-_TestLed
	.dw 0x0d,0x0a
.code
LM13:
LBB4:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM14-_TestLed
	.dw 0x0d,0x0a
.code
LM14:
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOA	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM15-_TestLed
	.dw 0x0d,0x0a
.code
LM15:
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM16-_TestLed
	.dw 0x0d,0x0a
.code
LM16:
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM17-_TestLed
	.dw 0x0d,0x0a
.code
LM17:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM18-_TestLed
	.dw 0x0d,0x0a
.code
LM18:
	R1=10000	// QImode move
	[SP--]=R1	// QImode move
	call _delay1	// call with return value
	SP=SP+1
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM19-_TestLed
	.dw 0x0d,0x0a
.code
LM19:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM20-_TestLed
	.dw 0x0d,0x0a
.code
LM20:
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM21-_TestLed
	.dw 0x0d,0x0a
.code
LM21:
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM22-_TestLed
	.dw 0x0d,0x0a
.code
LM22:
	R1=10000	// QImode move
	[SP--]=R1	// QImode move
	call _delay1	// call with return value
	SP=SP+1
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM23-_TestLed
	.dw 0x0d,0x0a
.code
LM23:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM24-_TestLed
	.dw 0x0d,0x0a
.code
LM24:
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM25-_TestLed
	.dw 0x0d,0x0a
.code
LM25:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM26-_TestLed
	.dw 0x0d,0x0a
.code
LM26:
	R1=10000	// QImode move
	[SP--]=R1	// QImode move
	call _delay1	// call with return value
	SP=SP+1
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM27-_TestLed
	.dw 0x0d,0x0a
.code
LM27:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM28-_TestLed
	.dw 0x0d,0x0a
.code
LM28:
	pc=L13	// jump
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM29-_TestLed
	.dw 0x0d,0x0a
.code
LM29:
LBE4:
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM30-_TestLed
	.dw 0x0d,0x0a
.code
LM30:
L13:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of TestLed

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_TestLed
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "delayFg:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_TestLed
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_TestLed
	.dw 0x0d,0x0a
.code
LME2:
.external _ClearWatchDog
.external _SP_Export
.external _SP_Init_IOB
.external _SP_Init_IOA
	.end
