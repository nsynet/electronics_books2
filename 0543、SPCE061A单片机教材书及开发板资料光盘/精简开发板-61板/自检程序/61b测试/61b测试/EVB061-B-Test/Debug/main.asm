// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1.4\unSPIDE\cc1.exe C:\DOCUME~1\ÕÅÏòÑÞ\LOCALS~1\Temp\cciEaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\¿ÌÂ¼¹âÅÌ\\¾«¼ò¿ª·¢°å-61°å\\×Ô¼ì³ÌÐò\\61b²âÊÔ\\61b²âÊÔ\\EVB061-B-Test/", 0x64, 0, 3, Ltext0
.stabs "F:/¿ÌÂ¼¹âÅÌ/¾«¼ò¿ª·¢°å-61°å/×Ô¼ì³ÌÐò/61b²âÊÔ/61b²âÊÔ/EVB061-B-Test/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,28,',0,0
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
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[_FailTimes]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[_sum]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[_INTflag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L3:
	call _IOTest	// call with return value
	CMP R1,0	// QImode test
	JNZ L16	// QImode EQ
	PC=L5
L16:
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_FailTimes]	// QImode move
	R2=1	// QImode move
	[_FailTimes]=R1+R2
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_FailTimes]	// QImode move
	CMP R1,3	// QImode compare
	JZ L17	// QImode NE
	PC=L6
L17:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=0	// QImode move
	pc=L2	// jump
L6:
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
L7:
	call _KeyWakeUp	// call with return value
	CMP R1,0	// QImode test
	JNZ L18	// QImode EQ
	PC=L9
L18:
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
L10:
	call _AD_Line	// call with return value
	CMP R1,0	// QImode test
	JNZ L19	// QImode EQ
	PC=L12
L19:
	pc=L11	// jump
L12:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	pc=L10	// jump
L11:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=9	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
L13:
	pc=L15	// jump
	pc=L14	// jump
L15:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
LBB3:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	call _MICTEST	// call with return value
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	call _delay3s	// call without return value
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
LBE3:
	pc=L13	// jump
L14:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
LBE2:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
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
.code
.debug
	.dw '.stabs "playS480:F19",36,0,0,',0,0,offset _playS480,seg _playS480,0x0d,0x0a
.CODE
.public _playS480
_playS480:	.proc
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM42-_playS480
	.dw 0x0d,0x0a
.code
LM42:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM43-_playS480
	.dw 0x0d,0x0a
.code
LM43:
LBB4:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM44-_playS480
	.dw 0x0d,0x0a
.code
LM44:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L21:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JNZ L28	// QImode EQ
	PC=L24
L28:
	pc=L22	// jump
L24:
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM45-_playS480
	.dw 0x0d,0x0a
.code
LM45:
LBB5:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM46-_playS480
	.dw 0x0d,0x0a
.code
LM46:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R2=[bp+1]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM47-_playS480
	.dw 0x0d,0x0a
.code
LM47:
L25:
	call _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L29	// QImode NE
	PC=L27
L29:
	pc=L23	// jump
L27:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM48-_playS480
	.dw 0x0d,0x0a
.code
LM48:
LBB6:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM49-_playS480
	.dw 0x0d,0x0a
.code
LM49:
	call _SACM_S480_ServiceLoop	// call with return value
LBE6:
	pc=L25	// jump
L26:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM50-_playS480
	.dw 0x0d,0x0a
.code
LM50:
LBE5:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM51-_playS480
	.dw 0x0d,0x0a
.code
LM51:
L23:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L21	// jump
L22:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM52-_playS480
	.dw 0x0d,0x0a
.code
LM52:
LBE4:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM53-_playS480
	.dw 0x0d,0x0a
.code
LM53:
L20:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of playS480

.debug
	.dw '.stabs "num:p11",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_playS480
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "delay3s:F19",36,0,0,',0,0,offset _delay3s,seg _delay3s,0x0d,0x0a
.CODE
.public _delay3s
_delay3s:	.proc
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM54-_delay3s
	.dw 0x0d,0x0a
.code
LM54:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM55-_delay3s
	.dw 0x0d,0x0a
.code
LM55:
LBB7:
	call _RunTime2Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM56-_delay3s
	.dw 0x0d,0x0a
.code
LM56:
	R1=0	// QImode move
	[_FailTimes]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM57-_delay3s
	.dw 0x0d,0x0a
.code
LM57:
L31:
	R1=[_INTflag]	// QImode move
	CMP R1,0	// QImode test
	JNZ L34	// QImode EQ
	PC=L33
L34:
	pc=L32	// jump
L33:
	pc=L31	// jump
L32:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM58-_delay3s
	.dw 0x0d,0x0a
.code
LM58:
	R1=0	// QImode move
	[_INTflag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM59-_delay3s
	.dw 0x0d,0x0a
.code
LM59:
	call _OffTime2Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM60-_delay3s
	.dw 0x0d,0x0a
.code
LM60:
LBE7:
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM61-_delay3s
	.dw 0x0d,0x0a
.code
LM61:
L30:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of delay3s

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_delay3s
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_delay3s
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_delay3s
	.dw 0x0d,0x0a
.code
LME3:
.debug
	.dw '.stabs "INTflag:G11",32,0,0,',0,0,offset _INTflag,seg _INTflag,0x0d,0x0a
.CODE
.ram
.public _INTflag
_INTflag:
	.dw 0
.debug
	.dw '.stabs "sum:G4",32,0,0,',0,0,offset _sum,seg _sum,0x0d,0x0a
.CODE
.ram
.public _sum
_sum:
	.dw 0
.debug
	.dw '.stabs "FailTimes:G4",32,0,0,',0,0,offset _FailTimes,seg _FailTimes,0x0d,0x0a
.CODE
.ram
.public _FailTimes
_FailTimes:
	.dw 0
.external _OffTime2Hz
.external _RunTime2Hz
.external _SACM_S480_ServiceLoop
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _Clear_WatchDog
.external _MICTEST
.external _AD_Line
.external _KeyWakeUp
.external _IOTest
.external _SACM_S480_Initial
	.end
