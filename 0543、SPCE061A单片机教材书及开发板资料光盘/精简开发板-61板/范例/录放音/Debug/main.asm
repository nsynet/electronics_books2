// GCC for SUNPLUS u'nSP version 1.0.9
// Command: E:\PROGRA~1\Sunplus\STUDYU~1\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccgxaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\SN03-TG028\\录放音/", 0x64, 0, 3, Ltext0
.stabs "F:/SN03-TG028/录放音/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,40,',0,0
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
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	pc=L5	// Indirect jump
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
LBB3:
	call _SP_GetCh	// call with return value
	[_Key]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[_Key]	// QImode move
	CMP R1,2	// QImode compare
	JNZ L47	// QImode EQ
	PC=L12
L47:
	CMP R1,2	// QImode compare
	JNA L48	// QImode GTU
	PC=L31
L48:
	CMP R1,1	// QImode compare
	JNZ L49	// QImode EQ
	PC=L7
L49:
	pc=L29	// Indirect jump
L31:
	CMP R1,4	// QImode compare
	JNZ L50	// QImode EQ
	PC=L21
L50:
	pc=L29	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=(-24576)	// QImode move
	[_Addr]=R1	// QImode move
L8:
	R1=[_Addr]	// QImode move
	CMP R1,(-4097)	// QImode compare
	JA L51	// QImode LEU
	PC=L11
L51:
	pc=L9	// Indirect jump
L11:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
LBB4:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashErase	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
LBE4:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
L10:
	R1=[_Addr]	// QImode move
	R2=256	// QImode move
	[_Addr]=R1+R2
	pc=L8	// Indirect jump
L9:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=1	// QImode move
	[_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=(-24576)	// QImode move
	[_Addr]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _SACM_DVR_InitQueue	// call without return value
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_InitEncoder	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L6	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=[_Status]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L52	// QImode EQ
	PC=L14
L52:
	CMP R1,2	// QImode compare
	JNZ L53	// QImode EQ
	PC=L18
L53:
	pc=L19	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
L15:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JZ L54	// QImode NE
	PC=L17
L54:
	pc=L16	// Indirect jump
L17:
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
LBB5:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashWrite1Word	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
LBE5:
	pc=L15	// Indirect jump
L16:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	pc=L13	// Indirect jump
L18:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	pc=L13	// Indirect jump
L19:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	pc=L13	// Indirect jump
L13:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=0	// QImode move
	[_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	pc=L6	// Indirect jump
L21:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=[_Status]	// QImode move
	CMP R1,1	// QImode compare
	JZ L55	// QImode NE
	PC=L22
L55:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
L23:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JZ L56	// QImode NE
	PC=L25
L56:
	pc=L22	// Indirect jump
L25:
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
LBB6:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashWrite1Word	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
LBE6:
	pc=L23	// Indirect jump
L24:
L22:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=2	// QImode move
	[_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	R1=(-24576)	// QImode move
	[_Addr]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	call _SACM_DVR_InitQueue	// call without return value
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
L26:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JZ L57	// QImode NE
	PC=L28
L57:
	pc=L27	// Indirect jump
L28:
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
LBB7:
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashRead	// call with return value
	SP=SP+1
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_FillQueue	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,109,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
LBE7:
	pc=L26	// Indirect jump
L27:
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_InitDecoder	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
	pc=L6	// Indirect jump
L29:
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM48-_main
	.dw 0x0d,0x0a
.code
LM48:
	pc=L6	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
	R1=[_Status]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L58	// QImode EQ
	PC=L33
L58:
	CMP R1,1	// QImode compare
	JNB L59	// QImode LTU
	PC=L44
L59:
	CMP R1,2	// QImode compare
	JNZ L60	// QImode EQ
	PC=L40
L60:
	pc=L45	// Indirect jump
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
LBB8:
L33:
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
	R1=[_Addr]	// QImode move
	CMP R1,(-4097)	// QImode compare
	JNA L61	// QImode GTU
	PC=L34
L61:
.debug
	.dw '.stabn 0x44,0,124,',0,0
	.dd LM52-_main
	.dw 0x0d,0x0a
.code
LM52:
LBB9:
	call _SACM_DVR_Encode	// call with return value
.debug
	.dw '.stabn 0x44,0,125,',0,0
	.dd LM53-_main
	.dw 0x0d,0x0a
.code
LM53:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JNZ L62	// QImode EQ
	PC=L35
L62:
.debug
	.dw '.stabn 0x44,0,127,',0,0
	.dd LM54-_main
	.dw 0x0d,0x0a
.code
LM54:
LBB10:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM55-_main
	.dw 0x0d,0x0a
.code
LM55:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashWrite1Word	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,130,',0,0
	.dd LM56-_main
	.dw 0x0d,0x0a
.code
LM56:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM57-_main
	.dw 0x0d,0x0a
.code
LM57:
LBE10:
L35:
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM58-_main
	.dw 0x0d,0x0a
.code
LM58:
LBE9:
	pc=L36	// Indirect jump
L34:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM59-_main
	.dw 0x0d,0x0a
.code
LM59:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM60-_main
	.dw 0x0d,0x0a
.code
LM60:
L37:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JZ L63	// QImode NE
	PC=L39
L63:
	pc=L38	// Indirect jump
L39:
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM61-_main
	.dw 0x0d,0x0a
.code
LM61:
LBB11:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM62-_main
	.dw 0x0d,0x0a
.code
LM62:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashWrite1Word	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM63-_main
	.dw 0x0d,0x0a
.code
LM63:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,141,',0,0
	.dd LM64-_main
	.dw 0x0d,0x0a
.code
LM64:
LBE11:
	pc=L37	// Indirect jump
L38:
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM65-_main
	.dw 0x0d,0x0a
.code
LM65:
	R1=0	// QImode move
	[_Status]=R1	// QImode move
L36:
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM66-_main
	.dw 0x0d,0x0a
.code
LM66:
	pc=L32	// Indirect jump
L40:
.debug
	.dw '.stabn 0x44,0,149,',0,0
	.dd LM67-_main
	.dw 0x0d,0x0a
.code
LM67:
	call _SACM_DVR_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L64	// QImode EQ
	PC=L41
L64:
.debug
	.dw '.stabn 0x44,0,151,',0,0
	.dd LM68-_main
	.dw 0x0d,0x0a
.code
LM68:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JNZ L65	// QImode EQ
	PC=L42
L65:
.debug
	.dw '.stabn 0x44,0,153,',0,0
	.dd LM69-_main
	.dw 0x0d,0x0a
.code
LM69:
LBB12:
	R1=[_Addr]	// QImode move
	[SP--]=R1	// QImode move
	call _F_FlashRead	// call with return value
	SP=SP+1
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM70-_main
	.dw 0x0d,0x0a
.code
LM70:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_FillQueue	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM71-_main
	.dw 0x0d,0x0a
.code
LM71:
	R1=[_Addr]	// QImode move
	R2=1	// QImode move
	[_Addr]=R1+R2
.debug
	.dw '.stabn 0x44,0,156,',0,0
	.dd LM72-_main
	.dw 0x0d,0x0a
.code
LM72:
LBE12:
L42:
.debug
	.dw '.stabn 0x44,0,157,',0,0
	.dd LM73-_main
	.dw 0x0d,0x0a
.code
LM73:
	pc=L43	// Indirect jump
L41:
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM74-_main
	.dw 0x0d,0x0a
.code
LM74:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,161,',0,0
	.dd LM75-_main
	.dw 0x0d,0x0a
.code
LM75:
	R1=0	// QImode move
	[_Status]=R1	// QImode move
L43:
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM76-_main
	.dw 0x0d,0x0a
.code
LM76:
	call _SACM_DVR_Decode	// call with return value
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM77-_main
	.dw 0x0d,0x0a
.code
LM77:
	pc=L32	// Indirect jump
L44:
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM78-_main
	.dw 0x0d,0x0a
.code
LM78:
	pc=L32	// Indirect jump
L45:
.debug
	.dw '.stabn 0x44,0,171,',0,0
	.dd LM79-_main
	.dw 0x0d,0x0a
.code
LM79:
	pc=L32	// Indirect jump
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM80-_main
	.dw 0x0d,0x0a
.code
LM80:
LBE8:
L32:
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM81-_main
	.dw 0x0d,0x0a
.code
LM81:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM82-_main
	.dw 0x0d,0x0a
.code
LM82:
LBE3:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM83-_main
	.dw 0x0d,0x0a
.code
LM83:
LBE2:
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM84-_main
	.dw 0x0d,0x0a
.code
LM84:
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
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_main
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
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB9-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB10-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE10-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE9-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB11-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE11-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB12-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE12-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE8-_main
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
	.dw '.stabs "Status:G4",32,0,0,',0,0,offset _Status,seg _Status,0x0d,0x0a
.CODE
.ram
.public _Status
_Status:
	.dw 0
.debug
	.dw '.stabs "Ret:G4",32,0,0,',0,0,offset _Ret,seg _Ret,0x0d,0x0a
.CODE
.ram
.public _Ret
_Ret:
	.dw 0
.debug
	.dw '.stabs "Key:G4",32,0,0,',0,0,offset _Key,seg _Key,0x0d,0x0a
.CODE
.ram
.public _Key
_Key:
	.dw 0
.debug
	.dw '.stabs "Addr:G4",32,0,0,',0,0,offset _Addr,seg _Addr,0x0d,0x0a
.CODE
.ram
.public _Addr
_Addr:
	.dw 0
.debug
	.dw '.stabs "Save_Addr:G4",32,0,0,',0,0,offset _Save_Addr,seg _Save_Addr,0x0d,0x0a
.CODE
.ram
.public _Save_Addr
_Save_Addr:
	.dw 0
.external _System_ServiceLoop
.external _SACM_DVR_Decode
.external _F_FlashRead
.external _SACM_DVR_Status
.external _F_FlashWrite1Word
.external _SACM_DVR_Encode
.external _SACM_DVR_InitDecoder
.external _SACM_DVR_FillQueue
.external _SACM_DVR_FetchQueue
.external _SACM_DVR_TestQueue
.external _SACM_DVR_Stop
.external _SACM_DVR_InitEncoder
.external _SACM_DVR_InitQueue
.external _F_FlashErase
.external _Clear_WatchDog
.external _SP_GetCh
.external _SACM_DVR_Initial
.external _System_Initial
	.end
