// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\cckXaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\KeyPwm/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/KeyPwm/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	call _SP_Init_IOA	// call with return value
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _F_IRQ3_Init	// call with return value
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[_KeyDownTimes]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=0	// QImode move
	[_KeyFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
LBB3:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	call _F_Key_Scan	// call with return value
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L6:
	R1=[_KeyFlag]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L28	// QImode EQ
	PC=L8
L28:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB4:
	call _F_Get_Key	// call with return value
	[_KeyVal]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=0	// QImode move
	[_KeyFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_KeyVal]	// QImode move
	CMP R1,15	// QImode compare
	JNA L29	// QImode GTU
	PC=L26
L29:
	R1=[_KeyVal]	// QImode move
	R2=R1	// QImode move
	R1=R2	// QImode move
	R1=R1+L27
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	pc=R2	// tablejump
.text
L27:
	.dw L10
	.dw L11
	.dw L12
	.dw L13
	.dw L14
	.dw L15
	.dw L16
	.dw L17
	.dw L18
	.dw L19
	.dw L20
	.dw L21
	.dw L22
	.dw L23
	.dw L24
	.dw L25
.code
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
LBB5:
L10:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=304	// QImode move
	[SP--]=R1	// QImode move
	R1=32	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	pc=L9	// jump
L11:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=240	// QImode move
	[SP--]=R1	// QImode move
	R1=32	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L9	// jump
L12:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=944	// QImode move
	[SP--]=R1	// QImode move
	R1=32	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	pc=L9	// jump
L13:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=560	// QImode move
	[SP--]=R1	// QImode move
	R1=32	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	pc=L9	// jump
L14:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=304	// QImode move
	[SP--]=R1	// QImode move
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	pc=L9	// jump
L15:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=240	// QImode move
	[SP--]=R1	// QImode move
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	pc=L9	// jump
L16:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=432	// QImode move
	[SP--]=R1	// QImode move
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	pc=L9	// jump
L17:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=944	// QImode move
	[SP--]=R1	// QImode move
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	pc=L9	// jump
L18:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=112	// QImode move
	[SP--]=R1	// QImode move
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	pc=L9	// jump
L19:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=240	// QImode move
	[SP--]=R1	// QImode move
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	pc=L9	// jump
L20:
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R1=944	// QImode move
	[SP--]=R1	// QImode move
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	pc=L9	// jump
L21:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=432	// QImode move
	[SP--]=R1	// QImode move
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	pc=L9	// jump
L22:
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=112	// QImode move
	[SP--]=R1	// QImode move
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	pc=L9	// jump
L23:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	R1=240	// QImode move
	[SP--]=R1	// QImode move
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	pc=L9	// jump
L24:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	R1=944	// QImode move
	[SP--]=R1	// QImode move
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	pc=L9	// jump
L25:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_Pwm	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
	pc=L9	// jump
L26:
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
	pc=L9	// jump
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
LBE5:
L9:
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM48-_main
	.dw 0x0d,0x0a
.code
LM48:
LBE4:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
LBE2:
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_main
	.dw 0x0d,0x0a
.code
LME1:
.debug
	.dw '.stabs "KeyVal:G4",32,0,0,',0,0,offset _KeyVal,seg _KeyVal,0x0d,0x0a
.CODE
.ram
.public _KeyVal
_KeyVal:
	.dw 0
.debug
	.dw '.stabs "KeyDownTimes:G4",32,0,0,',0,0,offset _KeyDownTimes,seg _KeyDownTimes,0x0d,0x0a
.CODE
.ram
.public _KeyDownTimes
_KeyDownTimes:
	.dw 0
.debug
	.dw '.stabs "KeyFlag:G4",32,0,0,',0,0,offset _KeyFlag,seg _KeyFlag,0x0d,0x0a
.CODE
.ram
.public _KeyFlag
_KeyFlag:
	.dw 0
.external _F_Pwm
.external _F_Get_Key
.external _F_Key_Scan
.external _F_IRQ3_Init
.external _SP_Init_IOA
	.end
