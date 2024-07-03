// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\IDE180\cc1.exe C:\WINDOWS\TEMP\ccbYldgb.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "D:\\2003年工作\\tset\\实验箱\\BoxTest\\自检程式/", 0x64, 0, 3, Ltext0
.stabs "D:/2003年工作/tset/实验箱/BoxTest/自检程式/main.c", 0x64, 0, 3, Ltext0
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
.debug
	.dw '.stabs "uiDelay:G4",32,0,0,',0,0,offset _uiDelay,seg _uiDelay,0x0d,0x0a
.CODE
.public _uiDelay
.iram
_uiDelay:
	.dw 8
.code
.debug
	.dw '.stabs "playS480:F19",36,0,0,',0,0,offset _playS480,seg _playS480,0x0d,0x0a
.CODE
.public _playS480
_playS480:	.proc
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM1-_playS480
	.dw 0x0d,0x0a
.code
LM1:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM2-_playS480
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM3-_playS480
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JNZ L10	// QImode EQ
	PC=L6
L10:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM4-_playS480
	.dw 0x0d,0x0a
.code
LM4:
LBB3:
	call _Turnoff_INT_64Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM5-_playS480
	.dw 0x0d,0x0a
.code
LM5:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM6-_playS480
	.dw 0x0d,0x0a
.code
LM6:
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
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM7-_playS480
	.dw 0x0d,0x0a
.code
LM7:
L7:
	call _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L11	// QImode NE
	PC=L9
L11:
	pc=L5	// jump
L9:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM8-_playS480
	.dw 0x0d,0x0a
.code
LM8:
LBB4:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM9-_playS480
	.dw 0x0d,0x0a
.code
LM9:
	call _SACM_S480_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM10-_playS480
	.dw 0x0d,0x0a
.code
LM10:
LBE4:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM11-_playS480
	.dw 0x0d,0x0a
.code
LM11:
LBE3:
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM12-_playS480
	.dw 0x0d,0x0a
.code
LM12:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM13-_playS480
	.dw 0x0d,0x0a
.code
LM13:
	call _SP_INT_64Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM14-_playS480
	.dw 0x0d,0x0a
.code
LM14:
LBE2:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM15-_playS480
	.dw 0x0d,0x0a
.code
LM15:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of playS480

.debug
	.dw '.stabs "num:p11",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_playS480
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "WakeUpTest:F19",36,0,0,',0,0,offset _WakeUpTest,seg _WakeUpTest,0x0d,0x0a
.CODE
.public _WakeUpTest
_WakeUpTest:	.proc
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM16-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM16:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM17-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM17:
LBB5:
L13:
	call _WakeUp	// call with return value
	CMP R1,0	// QImode test
	JNZ L16	// QImode EQ
	PC=L15
L16:
	pc=L14	// jump
L15:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM18-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM18:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM19-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM19:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM20-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM20:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM21-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM21:
	pc=L12	// jump
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM22-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM22:
	pc=L13	// jump
L14:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM23-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM23:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM24-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM24:
LBE5:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM25-_WakeUpTest
	.dw 0x0d,0x0a
.code
LM25:
L12:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of WakeUpTest

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_WakeUpTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_WakeUpTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_WakeUpTest
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "UartTest:F19",36,0,0,',0,0,offset _UartTest,seg _UartTest,0x0d,0x0a
.CODE
.public _UartTest
_UartTest:	.proc
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM26-_UartTest
	.dw 0x0d,0x0a
.code
LM26:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM27-_UartTest
	.dw 0x0d,0x0a
.code
LM27:
LBB6:
	R1=0	// QImode move
	[_FailTimes]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM28-_UartTest
	.dw 0x0d,0x0a
.code
LM28:
L18:
	call _UART	// call with return value
	CMP R1,0	// QImode test
	JNZ L22	// QImode EQ
	PC=L20
L22:
	pc=L19	// jump
L20:
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM29-_UartTest
	.dw 0x0d,0x0a
.code
LM29:
	R1=[_FailTimes]	// QImode move
	R2=1	// QImode move
	[_FailTimes]=R1+R2
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM30-_UartTest
	.dw 0x0d,0x0a
.code
LM30:
	R1=[_FailTimes]	// QImode move
	CMP R1,2	// QImode compare
	JZ L23	// QImode NE
	PC=L21
L23:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM31-_UartTest
	.dw 0x0d,0x0a
.code
LM31:
LBB7:
	call _F_Uart_Init_Restore_IO	// call with return value
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM32-_UartTest
	.dw 0x0d,0x0a
.code
LM32:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM33-_UartTest
	.dw 0x0d,0x0a
.code
LM33:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM34-_UartTest
	.dw 0x0d,0x0a
.code
LM34:
	pc=L17	// jump
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM35-_UartTest
	.dw 0x0d,0x0a
.code
LM35:
LBE7:
L21:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM36-_UartTest
	.dw 0x0d,0x0a
.code
LM36:
	pc=L18	// jump
L19:
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM37-_UartTest
	.dw 0x0d,0x0a
.code
LM37:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM38-_UartTest
	.dw 0x0d,0x0a
.code
LM38:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM39-_UartTest
	.dw 0x0d,0x0a
.code
LM39:
LBE6:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM40-_UartTest
	.dw 0x0d,0x0a
.code
LM40:
L17:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of UartTest

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_UartTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_UartTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_UartTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_UartTest
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_UartTest
	.dw 0x0d,0x0a
.code
LME3:
.debug
	.dw '.stabs "Addr:G5",32,0,0,',0,0,offset _Addr,seg _Addr,0x0d,0x0a
.CODE
.public _Addr
.iram
_Addr:
	.dw 0
	.dw 0
.text
LC0:
	.dw 's','u','n','p','l','u','s',0
LC1:
	.dw 'T','e','c','h','n','o','l','o','g','y',' ','f','o','r',' '
	.dw 'E','a','s','y',' ',0
LC2:
	.dw 'l','i','v','i','n','g',' ','!',' ',0
LC3:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','0',0
LC4:
	.dw 'L','c','d',' ','t','e','s','t',' ','o','v','e','r','!',' '
	.dw 0
LC5:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1',0
LC6:
	.dw 'G','i','v','e',' ','o','u','t',' ','l','i','g','h','t',' '
	.dw 't','h','e',' ',0
LC7:
	.dw ' ','d','i','o','d','e',' ','t','e','s','t','.','.','.',0

LC8:
	.dw 'J','2','6','-','-','-','-','J','1','6',0
LC9:
	.dw '1','*','8',' ','L','E','D',' ','t','e','s','t',' ','o','v'
	.dw 'e','r','!',' ',0
LC10:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','2',0
LC11:
	.dw '1','*','8',' ','K','e','y',' ','t','e','s','t',0
LC12:
	.dw 'J','1','6','-','-','-','-','J','1','8',0
LC13:
	.dw 'P','r','e','s','s',' ','t','h','e',' ','k','e','y',' ',0

LC14:
	.dw 'O','n','e',' ','b','y',' ','o','n','e',0
LC15:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','3',0
LC16:
	.dw '8','*','8',' ','P','o','i','n','t',' ','t','s','e','t','.'
	.dw '.','.',0
LC17:
	.dw 'L','i','v','i','n','g',' ','!',' ',0
LC18:
	.dw '8','*','8',' ','P','o','i','n','t',' ','t','s','e','t',0

LC19:
	.dw 'o','v','e','r','!',0
LC20:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','4',0
LC21:
	.dw 'U','A','R','T',' ','t','e','s','t','.','.','.',0
LC22:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','5',0
LC23:
	.dw 'S','P','R','4','0','9','6',' ','T','e','s','t','.','.','.'
	.dw 0
LC24:
	.dw ' ','s','u','c','c','e','e','d','s','.',0
LC25:
	.dw ' ','f','a','i','l','s','.',0
LC26:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','6',0
LC27:
	.dw '6',' ','s','i','x',0
LC28:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','7',0
LC29:
	.dw '7',' ','s','e','v','e','n',0
LC30:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','8',0
LC31:
	.dw 'S','l','e','e','p',' ','t','e','s','t','.','.','.',0
LC32:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','9',0
LC33:
	.dw '9',' ','n','i','n','e',0
LC34:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','0',0
LC35:
	.dw 'A',' ','t','e','n',0
LC36:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','1',0
LC37:
	.dw 'B',' ','e','l','e','v','e','n',0
LC38:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','2',0
LC39:
	.dw 'C',' ','t','w','e','l','v','e',0
LC40:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','3',0
LC41:
	.dw 'R','f',' ','R','e','c','e','i','v','e','d',0
LC42:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','4',0
LC43:
	.dw 'M','I','C',' ','T','e','s','t',0
LC44:
	.dw 'K','e','y',' ','t','e','s','t','-','-','-','1','5',0
LC45:
	.dw 'T','h','e',' ','t','e','s','t',' ','p','a','s','s','e','s'
	.dw '!',0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	// total=22, vars=22
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=22
	bp=sp+1

	R1=BP+25
	[bp+15]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
LBB8:
	R1=BP	// QImode move
	R2=BP+4
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+6
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	R1=BP	// QImode move
	R2=BP+8
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+10
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+11
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+12
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
	R1=BP	// QImode move
	R2=BP+13
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM48-_main
	.dw 0x0d,0x0a
.code
LM48:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	call _FG_Ellipse	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM52-_main
	.dw 0x0d,0x0a
.code
LM52:
	R1=(-1)	// QImode move
	[_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM53-_main
	.dw 0x0d,0x0a
.code
LM53:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,123,',0,0
	.dd LM54-_main
	.dw 0x0d,0x0a
.code
LM54:
	R1=9	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,124,',0,0
	.dd LM55-_main
	.dw 0x0d,0x0a
.code
LM55:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
L25:
.debug
	.dw '.stabn 0x44,0,129,',0,0
	.dd LM56-_main
	.dw 0x0d,0x0a
.code
LM56:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,130,',0,0
	.dd LM57-_main
	.dw 0x0d,0x0a
.code
LM57:
	call _key_asm	// call with return value
	R2=BP	// QImode move
	R3=BP+8
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM58-_main
	.dw 0x0d,0x0a
.code
LM58:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+9
	R4=R3	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM59-_main
	.dw 0x0d,0x0a
.code
LM59:
	R1=15	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,133,',0,0
	.dd LM60-_main
	.dw 0x0d,0x0a
.code
LM60:
	R2=BP	// QImode move
	R1=BP+8
	R3=BP	// QImode move
	R2=BP+8
	R4=[_value]	// QImode move
	R3=R4	// QImode move
	R4=R2	// QImode move
	R3&=[R4]	// andqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM61-_main
	.dw 0x0d,0x0a
.code
LM61:
	R1=240	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM62-_main
	.dw 0x0d,0x0a
.code
LM62:
	R2=BP	// QImode move
	R1=BP+9
	R3=BP	// QImode move
	R2=BP+9
	R4=[_value]	// QImode move
	R3=R4	// QImode move
	R4=R2	// QImode move
	R3&=[R4]	// andqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM63-_main
	.dw 0x0d,0x0a
.code
LM63:
	R2=BP	// QImode move
	R1=BP+8
	R3=BP	// QImode move
	R2=BP+8
	R4=BP	// QImode move
	R3=BP+9
	R4=R2	// QImode move
	R4=[R4]	// QImode move
	[bp+18]=R4	// QImode move
	R2=[bp+18]	// QImode move
	R4=R3	// QImode move
	R2|=[R4]	// iorqi3_r0R
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM64-_main
	.dw 0x0d,0x0a
.code
LM64:
	R1=255	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM65-_main
	.dw 0x0d,0x0a
.code
LM65:
	R2=BP	// QImode move
	R1=BP+8
	R2=BP	// QImode move
	R3=BP+8
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2^[_value]
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM66-_main
	.dw 0x0d,0x0a
.code
LM66:
	R1=BP	// QImode move
	R2=BP+8
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,190	// QImode compare
	JNZ L114	// QImode EQ
	PC=L38
L114:
	CMP R1,190	// QImode compare
	JNG L115	// QImode GT
	PC=L91
L115:
	CMP R1,125	// QImode compare
	JNZ L116	// QImode EQ
	PC=L59
L116:
	CMP R1,125	// QImode compare
	JNG L117	// QImode GT
	PC=L92
L117:
	CMP R1,119	// QImode compare
	JNZ L118	// QImode EQ
	PC=L83
L118:
	CMP R1,119	// QImode compare
	JNG L119	// QImode GT
	PC=L93
L119:
	CMP R1,0	// QImode test
	JNZ L120	// QImode EQ
	PC=L27
L120:
	pc=L26	// jump
L93:
	CMP R1,123	// QImode compare
	JNZ L121	// QImode EQ
	PC=L71
L121:
	pc=L26	// jump
L92:
	CMP R1,183	// QImode compare
	JNZ L122	// QImode EQ
	PC=L80
L122:
	CMP R1,183	// QImode compare
	JNG L123	// QImode GT
	PC=L94
L123:
	CMP R1,126	// QImode compare
	JNZ L124	// QImode EQ
	PC=L41
L124:
	pc=L26	// jump
L94:
	CMP R1,187	// QImode compare
	JNZ L125	// QImode EQ
	PC=L68
L125:
	CMP R1,189	// QImode compare
	JNZ L126	// QImode EQ
	PC=L56
L126:
	pc=L26	// jump
L91:
	CMP R1,222	// QImode compare
	JNZ L127	// QImode EQ
	PC=L33
L127:
	CMP R1,222	// QImode compare
	JNG L128	// QImode GT
	PC=L95
L128:
	CMP R1,219	// QImode compare
	JNZ L129	// QImode EQ
	PC=L65
L129:
	CMP R1,219	// QImode compare
	JNG L130	// QImode GT
	PC=L96
L130:
	CMP R1,215	// QImode compare
	JNZ L131	// QImode EQ
	PC=L77
L131:
	pc=L26	// jump
L96:
	CMP R1,221	// QImode compare
	JNZ L132	// QImode EQ
	PC=L51
L132:
	pc=L26	// jump
L95:
	CMP R1,235	// QImode compare
	JNZ L133	// QImode EQ
	PC=L62
L133:
	CMP R1,235	// QImode compare
	JNG L134	// QImode GT
	PC=L97
L134:
	CMP R1,231	// QImode compare
	JNZ L135	// QImode EQ
	PC=L74
L135:
	pc=L26	// jump
L97:
	CMP R1,237	// QImode compare
	JNZ L136	// QImode EQ
	PC=L48
L136:
	CMP R1,238	// QImode compare
	JNZ L137	// QImode EQ
	PC=L28
L137:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,141,',0,0
	.dd LM67-_main
	.dw 0x0d,0x0a
.code
LM67:
LBB9:
L27:
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM68-_main
	.dw 0x0d,0x0a
.code
LM68:
	pc=L26	// jump
L28:
.debug
	.dw '.stabn 0x44,0,145,',0,0
	.dd LM69-_main
	.dw 0x0d,0x0a
.code
LM69:
	R1=0	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,146,',0,0
	.dd LM70-_main
	.dw 0x0d,0x0a
.code
LM70:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM71-_main
	.dw 0x0d,0x0a
.code
LM71:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,148,',0,0
	.dd LM72-_main
	.dw 0x0d,0x0a
.code
LM72:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,149,',0,0
	.dd LM73-_main
	.dw 0x0d,0x0a
.code
LM73:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM74-_main
	.dw 0x0d,0x0a
.code
LM74:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L138	// QImode NE
	PC=L29
L138:
.debug
	.dw '.stabn 0x44,0,152,',0,0
	.dd LM75-_main
	.dw 0x0d,0x0a
.code
LM75:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,153,',0,0
	.dd LM76-_main
	.dw 0x0d,0x0a
.code
LM76:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM77-_main
	.dw 0x0d,0x0a
.code
LM77:
	pc=L30	// jump
L29:
.debug
	.dw '.stabn 0x44,0,157,',0,0
	.dd LM78-_main
	.dw 0x0d,0x0a
.code
LM78:
	R1=BP	// QImode move
	R2=BP+11
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L139	// QImode NE
	PC=L31
L139:
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM79-_main
	.dw 0x0d,0x0a
.code
LM79:
LBB10:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM80-_main
	.dw 0x0d,0x0a
.code
LM80:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,161,',0,0
	.dd LM81-_main
	.dw 0x0d,0x0a
.code
LM81:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM82-_main
	.dw 0x0d,0x0a
.code
LM82:
	R1=BP	// QImode move
	R2=BP+11
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,163,',0,0
	.dd LM83-_main
	.dw 0x0d,0x0a
.code
LM83:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM84-_main
	.dw 0x0d,0x0a
.code
LM84:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM85-_main
	.dw 0x0d,0x0a
.code
LM85:
LBE10:
	pc=L30	// jump
L31:
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM86-_main
	.dw 0x0d,0x0a
.code
LM86:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,170,',0,0
	.dd LM87-_main
	.dw 0x0d,0x0a
.code
LM87:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,171,',0,0
	.dd LM88-_main
	.dw 0x0d,0x0a
.code
LM88:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM89-_main
	.dw 0x0d,0x0a
.code
LM89:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC4	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM90-_main
	.dw 0x0d,0x0a
.code
LM90:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM91-_main
	.dw 0x0d,0x0a
.code
LM91:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM92-_main
	.dw 0x0d,0x0a
.code
LM92:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM93-_main
	.dw 0x0d,0x0a
.code
LM93:
	R1=BP	// QImode move
	R2=BP+11
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L32:
L30:
.debug
	.dw '.stabn 0x44,0,179,',0,0
	.dd LM94-_main
	.dw 0x0d,0x0a
.code
LM94:
	pc=L26	// jump
L33:
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM95-_main
	.dw 0x0d,0x0a
.code
LM95:
	R1=1	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM96-_main
	.dw 0x0d,0x0a
.code
LM96:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,184,',0,0
	.dd LM97-_main
	.dw 0x0d,0x0a
.code
LM97:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,185,',0,0
	.dd LM98-_main
	.dw 0x0d,0x0a
.code
LM98:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,186,',0,0
	.dd LM99-_main
	.dw 0x0d,0x0a
.code
LM99:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,187,',0,0
	.dd LM100-_main
	.dw 0x0d,0x0a
.code
LM100:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L140	// QImode NE
	PC=L34
L140:
.debug
	.dw '.stabn 0x44,0,189,',0,0
	.dd LM101-_main
	.dw 0x0d,0x0a
.code
LM101:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC5	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,190,',0,0
	.dd LM102-_main
	.dw 0x0d,0x0a
.code
LM102:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,191,',0,0
	.dd LM103-_main
	.dw 0x0d,0x0a
.code
LM103:
	pc=L35	// jump
L34:
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM104-_main
	.dw 0x0d,0x0a
.code
LM104:
	R1=BP	// QImode move
	R2=BP+12
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L141	// QImode NE
	PC=L36
L141:
.debug
	.dw '.stabn 0x44,0,196,',0,0
	.dd LM105-_main
	.dw 0x0d,0x0a
.code
LM105:
LBB11:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC6	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,197,',0,0
	.dd LM106-_main
	.dw 0x0d,0x0a
.code
LM106:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC7	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,198,',0,0
	.dd LM107-_main
	.dw 0x0d,0x0a
.code
LM107:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=LC8	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,200,',0,0
	.dd LM108-_main
	.dw 0x0d,0x0a
.code
LM108:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,201,',0,0
	.dd LM109-_main
	.dw 0x0d,0x0a
.code
LM109:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM110-_main
	.dw 0x0d,0x0a
.code
LM110:
	R1=BP	// QImode move
	R2=BP+12
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM111-_main
	.dw 0x0d,0x0a
.code
LM111:
	call _F_18LedTest	// call with return value
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM112-_main
	.dw 0x0d,0x0a
.code
LM112:
LBE11:
	pc=L35	// jump
L36:
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM113-_main
	.dw 0x0d,0x0a
.code
LM113:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=150	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC9	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,209,',0,0
	.dd LM114-_main
	.dw 0x0d,0x0a
.code
LM114:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,210,',0,0
	.dd LM115-_main
	.dw 0x0d,0x0a
.code
LM115:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,211,',0,0
	.dd LM116-_main
	.dw 0x0d,0x0a
.code
LM116:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM117-_main
	.dw 0x0d,0x0a
.code
LM117:
	R1=BP	// QImode move
	R2=BP+12
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L37:
L35:
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM118-_main
	.dw 0x0d,0x0a
.code
LM118:
	pc=L26	// jump
L38:
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM119-_main
	.dw 0x0d,0x0a
.code
LM119:
	R1=2	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,220,',0,0
	.dd LM120-_main
	.dw 0x0d,0x0a
.code
LM120:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM121-_main
	.dw 0x0d,0x0a
.code
LM121:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,222,',0,0
	.dd LM122-_main
	.dw 0x0d,0x0a
.code
LM122:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,223,',0,0
	.dd LM123-_main
	.dw 0x0d,0x0a
.code
LM123:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM124-_main
	.dw 0x0d,0x0a
.code
LM124:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L142	// QImode NE
	PC=L39
L142:
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM125-_main
	.dw 0x0d,0x0a
.code
LM125:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC10	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,227,',0,0
	.dd LM126-_main
	.dw 0x0d,0x0a
.code
LM126:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM127-_main
	.dw 0x0d,0x0a
.code
LM127:
	pc=L40	// jump
L39:
.debug
	.dw '.stabn 0x44,0,230,',0,0
	.dd LM128-_main
	.dw 0x0d,0x0a
.code
LM128:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=150	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC11	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L40:
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM129-_main
	.dw 0x0d,0x0a
.code
LM129:
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=LC12	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM130-_main
	.dw 0x0d,0x0a
.code
LM130:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=LC13	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM131-_main
	.dw 0x0d,0x0a
.code
LM131:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=LC14	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,234,',0,0
	.dd LM132-_main
	.dw 0x0d,0x0a
.code
LM132:
	R1=11	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,235,',0,0
	.dd LM133-_main
	.dw 0x0d,0x0a
.code
LM133:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,236,',0,0
	.dd LM134-_main
	.dw 0x0d,0x0a
.code
LM134:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM135-_main
	.dw 0x0d,0x0a
.code
LM135:
	pc=L26	// jump
L41:
.debug
	.dw '.stabn 0x44,0,240,',0,0
	.dd LM136-_main
	.dw 0x0d,0x0a
.code
LM136:
	R1=3	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM137-_main
	.dw 0x0d,0x0a
.code
LM137:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,242,',0,0
	.dd LM138-_main
	.dw 0x0d,0x0a
.code
LM138:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,243,',0,0
	.dd LM139-_main
	.dw 0x0d,0x0a
.code
LM139:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM140-_main
	.dw 0x0d,0x0a
.code
LM140:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,245,',0,0
	.dd LM141-_main
	.dw 0x0d,0x0a
.code
LM141:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L143	// QImode NE
	PC=L42
L143:
.debug
	.dw '.stabn 0x44,0,247,',0,0
	.dd LM142-_main
	.dw 0x0d,0x0a
.code
LM142:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC15	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,248,',0,0
	.dd LM143-_main
	.dw 0x0d,0x0a
.code
LM143:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,249,',0,0
	.dd LM144-_main
	.dw 0x0d,0x0a
.code
LM144:
	pc=L43	// jump
L42:
.debug
	.dw '.stabn 0x44,0,251,',0,0
	.dd LM145-_main
	.dw 0x0d,0x0a
.code
LM145:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=125	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC16	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L43:
.debug
	.dw '.stabn 0x44,0,252,',0,0
	.dd LM146-_main
	.dw 0x0d,0x0a
.code
LM146:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM147-_main
	.dw 0x0d,0x0a
.code
LM147:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM148-_main
	.dw 0x0d,0x0a
.code
LM148:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM149-_main
	.dw 0x0d,0x0a
.code
LM149:
	R1=BP	// QImode move
	R2=BP+6
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L144	// QImode NE
	PC=L44
L144:
.debug
	.dw '.stabn 0x44,0,257,',0,0
	.dd LM150-_main
	.dw 0x0d,0x0a
.code
LM150:
LBB12:
	R1=7	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,258,',0,0
	.dd LM151-_main
	.dw 0x0d,0x0a
.code
LM151:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,259,',0,0
	.dd LM152-_main
	.dw 0x0d,0x0a
.code
LM152:
	R1=BP	// QImode move
	R2=BP+6
	R3=BP	// QImode move
	R1=BP+6
	R2=BP	// QImode move
	R3=BP+6
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM153-_main
	.dw 0x0d,0x0a
.code
LM153:
	call _TestLed	// call with return value
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM154-_main
	.dw 0x0d,0x0a
.code
LM154:
LBE12:
	pc=L45	// jump
L44:
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM155-_main
	.dw 0x0d,0x0a
.code
LM155:
	R2=BP	// QImode move
	R1=BP+6
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R3=R2	// QImode move
	R2=R2+1
	R4=R1	// QImode move
	[R4]=R2	// QImode move
	CMP R3,4	// QImode compare
	JNG L145	// QImode GT
	PC=L46
L145:
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM156-_main
	.dw 0x0d,0x0a
.code
LM156:
LBB13:
	R1=BP	// QImode move
	R2=BP+6
	R3=BP	// QImode move
	R1=BP+6
	R2=BP	// QImode move
	R3=BP+6
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,265,',0,0
	.dd LM157-_main
	.dw 0x0d,0x0a
.code
LM157:
	call _TestLed	// call with return value
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM158-_main
	.dw 0x0d,0x0a
.code
LM158:
LBE13:
	pc=L45	// jump
L46:
.debug
	.dw '.stabn 0x44,0,269,',0,0
	.dd LM159-_main
	.dw 0x0d,0x0a
.code
LM159:
LBB14:
	R1=BP	// QImode move
	R2=BP+6
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM160-_main
	.dw 0x0d,0x0a
.code
LM160:
	call _TestLed	// call with return value
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM161-_main
	.dw 0x0d,0x0a
.code
LM161:
LBE14:
L47:
L45:
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM162-_main
	.dw 0x0d,0x0a
.code
LM162:
	R1=3	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,273,',0,0
	.dd LM163-_main
	.dw 0x0d,0x0a
.code
LM163:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM164-_main
	.dw 0x0d,0x0a
.code
LM164:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM165-_main
	.dw 0x0d,0x0a
.code
LM165:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM166-_main
	.dw 0x0d,0x0a
.code
LM166:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=125	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC18	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,277,',0,0
	.dd LM167-_main
	.dw 0x0d,0x0a
.code
LM167:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC19	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,278,',0,0
	.dd LM168-_main
	.dw 0x0d,0x0a
.code
LM168:
	R1=7	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,279,',0,0
	.dd LM169-_main
	.dw 0x0d,0x0a
.code
LM169:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,280,',0,0
	.dd LM170-_main
	.dw 0x0d,0x0a
.code
LM170:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,281,',0,0
	.dd LM171-_main
	.dw 0x0d,0x0a
.code
LM171:
	pc=L26	// jump
L48:
.debug
	.dw '.stabn 0x44,0,283,',0,0
	.dd LM172-_main
	.dw 0x0d,0x0a
.code
LM172:
	R1=4	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,284,',0,0
	.dd LM173-_main
	.dw 0x0d,0x0a
.code
LM173:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM174-_main
	.dw 0x0d,0x0a
.code
LM174:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,286,',0,0
	.dd LM175-_main
	.dw 0x0d,0x0a
.code
LM175:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,287,',0,0
	.dd LM176-_main
	.dw 0x0d,0x0a
.code
LM176:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM177-_main
	.dw 0x0d,0x0a
.code
LM177:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L146	// QImode NE
	PC=L49
L146:
.debug
	.dw '.stabn 0x44,0,290,',0,0
	.dd LM178-_main
	.dw 0x0d,0x0a
.code
LM178:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC20	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,291,',0,0
	.dd LM179-_main
	.dw 0x0d,0x0a
.code
LM179:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM180-_main
	.dw 0x0d,0x0a
.code
LM180:
	pc=L50	// jump
L49:
.debug
	.dw '.stabn 0x44,0,294,',0,0
	.dd LM181-_main
	.dw 0x0d,0x0a
.code
LM181:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC21	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L50:
.debug
	.dw '.stabn 0x44,0,295,',0,0
	.dd LM182-_main
	.dw 0x0d,0x0a
.code
LM182:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,296,',0,0
	.dd LM183-_main
	.dw 0x0d,0x0a
.code
LM183:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,297,',0,0
	.dd LM184-_main
	.dw 0x0d,0x0a
.code
LM184:
	R1=17	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM185-_main
	.dw 0x0d,0x0a
.code
LM185:
	call _UartTest	// call without return value
.debug
	.dw '.stabn 0x44,0,299,',0,0
	.dd LM186-_main
	.dw 0x0d,0x0a
.code
LM186:
	pc=L26	// jump
L51:
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM187-_main
	.dw 0x0d,0x0a
.code
LM187:
	R1=5	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,302,',0,0
	.dd LM188-_main
	.dw 0x0d,0x0a
.code
LM188:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,303,',0,0
	.dd LM189-_main
	.dw 0x0d,0x0a
.code
LM189:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,304,',0,0
	.dd LM190-_main
	.dw 0x0d,0x0a
.code
LM190:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM191-_main
	.dw 0x0d,0x0a
.code
LM191:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,306,',0,0
	.dd LM192-_main
	.dw 0x0d,0x0a
.code
LM192:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L147	// QImode NE
	PC=L52
L147:
.debug
	.dw '.stabn 0x44,0,308,',0,0
	.dd LM193-_main
	.dw 0x0d,0x0a
.code
LM193:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC22	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM194-_main
	.dw 0x0d,0x0a
.code
LM194:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,310,',0,0
	.dd LM195-_main
	.dw 0x0d,0x0a
.code
LM195:
	pc=L53	// jump
L52:
.debug
	.dw '.stabn 0x44,0,312,',0,0
	.dd LM196-_main
	.dw 0x0d,0x0a
.code
LM196:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=125	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC23	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L53:
.debug
	.dw '.stabn 0x44,0,314,',0,0
	.dd LM197-_main
	.dw 0x0d,0x0a
.code
LM197:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,315,',0,0
	.dd LM198-_main
	.dw 0x0d,0x0a
.code
LM198:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,316,',0,0
	.dd LM199-_main
	.dw 0x0d,0x0a
.code
LM199:
	call _Test_4096	// call with return value
.debug
	.dw '.stabn 0x44,0,317,',0,0
	.dd LM200-_main
	.dw 0x0d,0x0a
.code
LM200:
	R1=[_a]	// QImode move
	CMP R1,255	// QImode compare
	JZ L148	// QImode NE
	PC=L54
L148:
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM201-_main
	.dw 0x0d,0x0a
.code
LM201:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,324,',0,0
	.dd LM202-_main
	.dw 0x0d,0x0a
.code
LM202:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC24	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,325,',0,0
	.dd LM203-_main
	.dw 0x0d,0x0a
.code
LM203:
	pc=L55	// jump
L54:
.debug
	.dw '.stabn 0x44,0,332,',0,0
	.dd LM204-_main
	.dw 0x0d,0x0a
.code
LM204:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC25	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,333,',0,0
	.dd LM205-_main
	.dw 0x0d,0x0a
.code
LM205:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
L55:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM206-_main
	.dw 0x0d,0x0a
.code
LM206:
	pc=L26	// jump
L56:
.debug
	.dw '.stabn 0x44,0,337,',0,0
	.dd LM207-_main
	.dw 0x0d,0x0a
.code
LM207:
	R1=6	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,338,',0,0
	.dd LM208-_main
	.dw 0x0d,0x0a
.code
LM208:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,339,',0,0
	.dd LM209-_main
	.dw 0x0d,0x0a
.code
LM209:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,340,',0,0
	.dd LM210-_main
	.dw 0x0d,0x0a
.code
LM210:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,341,',0,0
	.dd LM211-_main
	.dw 0x0d,0x0a
.code
LM211:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,342,',0,0
	.dd LM212-_main
	.dw 0x0d,0x0a
.code
LM212:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L149	// QImode NE
	PC=L57
L149:
.debug
	.dw '.stabn 0x44,0,344,',0,0
	.dd LM213-_main
	.dw 0x0d,0x0a
.code
LM213:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC26	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,345,',0,0
	.dd LM214-_main
	.dw 0x0d,0x0a
.code
LM214:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM215-_main
	.dw 0x0d,0x0a
.code
LM215:
	pc=L58	// jump
L57:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM216-_main
	.dw 0x0d,0x0a
.code
LM216:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC27	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L58:
.debug
	.dw '.stabn 0x44,0,349,',0,0
	.dd LM217-_main
	.dw 0x0d,0x0a
.code
LM217:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,350,',0,0
	.dd LM218-_main
	.dw 0x0d,0x0a
.code
LM218:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,351,',0,0
	.dd LM219-_main
	.dw 0x0d,0x0a
.code
LM219:
	pc=L26	// jump
L59:
.debug
	.dw '.stabn 0x44,0,353,',0,0
	.dd LM220-_main
	.dw 0x0d,0x0a
.code
LM220:
	R1=7	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,354,',0,0
	.dd LM221-_main
	.dw 0x0d,0x0a
.code
LM221:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,355,',0,0
	.dd LM222-_main
	.dw 0x0d,0x0a
.code
LM222:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,356,',0,0
	.dd LM223-_main
	.dw 0x0d,0x0a
.code
LM223:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM224-_main
	.dw 0x0d,0x0a
.code
LM224:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,358,',0,0
	.dd LM225-_main
	.dw 0x0d,0x0a
.code
LM225:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L150	// QImode NE
	PC=L60
L150:
.debug
	.dw '.stabn 0x44,0,360,',0,0
	.dd LM226-_main
	.dw 0x0d,0x0a
.code
LM226:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC28	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,361,',0,0
	.dd LM227-_main
	.dw 0x0d,0x0a
.code
LM227:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,362,',0,0
	.dd LM228-_main
	.dw 0x0d,0x0a
.code
LM228:
	pc=L61	// jump
L60:
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM229-_main
	.dw 0x0d,0x0a
.code
LM229:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC29	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L61:
.debug
	.dw '.stabn 0x44,0,365,',0,0
	.dd LM230-_main
	.dw 0x0d,0x0a
.code
LM230:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,366,',0,0
	.dd LM231-_main
	.dw 0x0d,0x0a
.code
LM231:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,367,',0,0
	.dd LM232-_main
	.dw 0x0d,0x0a
.code
LM232:
	pc=L26	// jump
L62:
.debug
	.dw '.stabn 0x44,0,369,',0,0
	.dd LM233-_main
	.dw 0x0d,0x0a
.code
LM233:
	R1=8	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,370,',0,0
	.dd LM234-_main
	.dw 0x0d,0x0a
.code
LM234:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,371,',0,0
	.dd LM235-_main
	.dw 0x0d,0x0a
.code
LM235:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,372,',0,0
	.dd LM236-_main
	.dw 0x0d,0x0a
.code
LM236:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,373,',0,0
	.dd LM237-_main
	.dw 0x0d,0x0a
.code
LM237:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,374,',0,0
	.dd LM238-_main
	.dw 0x0d,0x0a
.code
LM238:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L151	// QImode NE
	PC=L63
L151:
.debug
	.dw '.stabn 0x44,0,376,',0,0
	.dd LM239-_main
	.dw 0x0d,0x0a
.code
LM239:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,377,',0,0
	.dd LM240-_main
	.dw 0x0d,0x0a
.code
LM240:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,378,',0,0
	.dd LM241-_main
	.dw 0x0d,0x0a
.code
LM241:
	pc=L64	// jump
L63:
.debug
	.dw '.stabn 0x44,0,380,',0,0
	.dd LM242-_main
	.dw 0x0d,0x0a
.code
LM242:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC31	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L64:
.debug
	.dw '.stabn 0x44,0,381,',0,0
	.dd LM243-_main
	.dw 0x0d,0x0a
.code
LM243:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,382,',0,0
	.dd LM244-_main
	.dw 0x0d,0x0a
.code
LM244:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,383,',0,0
	.dd LM245-_main
	.dw 0x0d,0x0a
.code
LM245:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,384,',0,0
	.dd LM246-_main
	.dw 0x0d,0x0a
.code
LM246:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,385,',0,0
	.dd LM247-_main
	.dw 0x0d,0x0a
.code
LM247:
	call _WakeUpTest	// call without return value
.debug
	.dw '.stabn 0x44,0,386,',0,0
	.dd LM248-_main
	.dw 0x0d,0x0a
.code
LM248:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,387,',0,0
	.dd LM249-_main
	.dw 0x0d,0x0a
.code
LM249:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,388,',0,0
	.dd LM250-_main
	.dw 0x0d,0x0a
.code
LM250:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,389,',0,0
	.dd LM251-_main
	.dw 0x0d,0x0a
.code
LM251:
	pc=L26	// jump
L65:
.debug
	.dw '.stabn 0x44,0,391,',0,0
	.dd LM252-_main
	.dw 0x0d,0x0a
.code
LM252:
	R1=9	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,392,',0,0
	.dd LM253-_main
	.dw 0x0d,0x0a
.code
LM253:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,393,',0,0
	.dd LM254-_main
	.dw 0x0d,0x0a
.code
LM254:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,394,',0,0
	.dd LM255-_main
	.dw 0x0d,0x0a
.code
LM255:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,395,',0,0
	.dd LM256-_main
	.dw 0x0d,0x0a
.code
LM256:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,396,',0,0
	.dd LM257-_main
	.dw 0x0d,0x0a
.code
LM257:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L152	// QImode NE
	PC=L66
L152:
.debug
	.dw '.stabn 0x44,0,398,',0,0
	.dd LM258-_main
	.dw 0x0d,0x0a
.code
LM258:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC32	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,399,',0,0
	.dd LM259-_main
	.dw 0x0d,0x0a
.code
LM259:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,400,',0,0
	.dd LM260-_main
	.dw 0x0d,0x0a
.code
LM260:
	pc=L67	// jump
L66:
.debug
	.dw '.stabn 0x44,0,402,',0,0
	.dd LM261-_main
	.dw 0x0d,0x0a
.code
LM261:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC33	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L67:
.debug
	.dw '.stabn 0x44,0,403,',0,0
	.dd LM262-_main
	.dw 0x0d,0x0a
.code
LM262:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,404,',0,0
	.dd LM263-_main
	.dw 0x0d,0x0a
.code
LM263:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,405,',0,0
	.dd LM264-_main
	.dw 0x0d,0x0a
.code
LM264:
	pc=L26	// jump
L68:
.debug
	.dw '.stabn 0x44,0,407,',0,0
	.dd LM265-_main
	.dw 0x0d,0x0a
.code
LM265:
	R1=10	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,408,',0,0
	.dd LM266-_main
	.dw 0x0d,0x0a
.code
LM266:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,409,',0,0
	.dd LM267-_main
	.dw 0x0d,0x0a
.code
LM267:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,410,',0,0
	.dd LM268-_main
	.dw 0x0d,0x0a
.code
LM268:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,411,',0,0
	.dd LM269-_main
	.dw 0x0d,0x0a
.code
LM269:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,412,',0,0
	.dd LM270-_main
	.dw 0x0d,0x0a
.code
LM270:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L153	// QImode NE
	PC=L69
L153:
.debug
	.dw '.stabn 0x44,0,414,',0,0
	.dd LM271-_main
	.dw 0x0d,0x0a
.code
LM271:
LBB15:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,415,',0,0
	.dd LM272-_main
	.dw 0x0d,0x0a
.code
LM272:
	R1=29	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,416,',0,0
	.dd LM273-_main
	.dw 0x0d,0x0a
.code
LM273:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetBMPMode	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,417,',0,0
	.dd LM274-_main
	.dw 0x0d,0x0a
.code
LM274:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,418,',0,0
	.dd LM275-_main
	.dw 0x0d,0x0a
.code
LM275:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,419,',0,0
	.dd LM276-_main
	.dw 0x0d,0x0a
.code
LM276:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,420,',0,0
	.dd LM277-_main
	.dw 0x0d,0x0a
.code
LM277:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,421,',0,0
	.dd LM278-_main
	.dw 0x0d,0x0a
.code
LM278:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC34	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,422,',0,0
	.dd LM279-_main
	.dw 0x0d,0x0a
.code
LM279:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,423,',0,0
	.dd LM280-_main
	.dw 0x0d,0x0a
.code
LM280:
LBE15:
	pc=L70	// jump
L69:
.debug
	.dw '.stabn 0x44,0,425,',0,0
	.dd LM281-_main
	.dw 0x0d,0x0a
.code
LM281:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC35	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L70:
.debug
	.dw '.stabn 0x44,0,426,',0,0
	.dd LM282-_main
	.dw 0x0d,0x0a
.code
LM282:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,427,',0,0
	.dd LM283-_main
	.dw 0x0d,0x0a
.code
LM283:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,428,',0,0
	.dd LM284-_main
	.dw 0x0d,0x0a
.code
LM284:
	pc=L26	// jump
L71:
.debug
	.dw '.stabn 0x44,0,430,',0,0
	.dd LM285-_main
	.dw 0x0d,0x0a
.code
LM285:
	R1=11	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,431,',0,0
	.dd LM286-_main
	.dw 0x0d,0x0a
.code
LM286:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,432,',0,0
	.dd LM287-_main
	.dw 0x0d,0x0a
.code
LM287:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,433,',0,0
	.dd LM288-_main
	.dw 0x0d,0x0a
.code
LM288:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,434,',0,0
	.dd LM289-_main
	.dw 0x0d,0x0a
.code
LM289:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,435,',0,0
	.dd LM290-_main
	.dw 0x0d,0x0a
.code
LM290:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L154	// QImode NE
	PC=L72
L154:
.debug
	.dw '.stabn 0x44,0,437,',0,0
	.dd LM291-_main
	.dw 0x0d,0x0a
.code
LM291:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC36	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,438,',0,0
	.dd LM292-_main
	.dw 0x0d,0x0a
.code
LM292:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,439,',0,0
	.dd LM293-_main
	.dw 0x0d,0x0a
.code
LM293:
	pc=L73	// jump
L72:
.debug
	.dw '.stabn 0x44,0,441,',0,0
	.dd LM294-_main
	.dw 0x0d,0x0a
.code
LM294:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC37	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L73:
.debug
	.dw '.stabn 0x44,0,442,',0,0
	.dd LM295-_main
	.dw 0x0d,0x0a
.code
LM295:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,443,',0,0
	.dd LM296-_main
	.dw 0x0d,0x0a
.code
LM296:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,444,',0,0
	.dd LM297-_main
	.dw 0x0d,0x0a
.code
LM297:
	pc=L26	// jump
L74:
.debug
	.dw '.stabn 0x44,0,446,',0,0
	.dd LM298-_main
	.dw 0x0d,0x0a
.code
LM298:
	R1=12	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,447,',0,0
	.dd LM299-_main
	.dw 0x0d,0x0a
.code
LM299:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,448,',0,0
	.dd LM300-_main
	.dw 0x0d,0x0a
.code
LM300:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,449,',0,0
	.dd LM301-_main
	.dw 0x0d,0x0a
.code
LM301:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,450,',0,0
	.dd LM302-_main
	.dw 0x0d,0x0a
.code
LM302:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,451,',0,0
	.dd LM303-_main
	.dw 0x0d,0x0a
.code
LM303:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L155	// QImode NE
	PC=L75
L155:
.debug
	.dw '.stabn 0x44,0,453,',0,0
	.dd LM304-_main
	.dw 0x0d,0x0a
.code
LM304:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC38	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,454,',0,0
	.dd LM305-_main
	.dw 0x0d,0x0a
.code
LM305:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,455,',0,0
	.dd LM306-_main
	.dw 0x0d,0x0a
.code
LM306:
	pc=L76	// jump
L75:
.debug
	.dw '.stabn 0x44,0,457,',0,0
	.dd LM307-_main
	.dw 0x0d,0x0a
.code
LM307:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC39	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L76:
.debug
	.dw '.stabn 0x44,0,458,',0,0
	.dd LM308-_main
	.dw 0x0d,0x0a
.code
LM308:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,459,',0,0
	.dd LM309-_main
	.dw 0x0d,0x0a
.code
LM309:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,460,',0,0
	.dd LM310-_main
	.dw 0x0d,0x0a
.code
LM310:
	pc=L26	// jump
L77:
.debug
	.dw '.stabn 0x44,0,462,',0,0
	.dd LM311-_main
	.dw 0x0d,0x0a
.code
LM311:
	R1=13	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,463,',0,0
	.dd LM312-_main
	.dw 0x0d,0x0a
.code
LM312:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,464,',0,0
	.dd LM313-_main
	.dw 0x0d,0x0a
.code
LM313:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,465,',0,0
	.dd LM314-_main
	.dw 0x0d,0x0a
.code
LM314:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,466,',0,0
	.dd LM315-_main
	.dw 0x0d,0x0a
.code
LM315:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,467,',0,0
	.dd LM316-_main
	.dw 0x0d,0x0a
.code
LM316:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L156	// QImode NE
	PC=L78
L156:
.debug
	.dw '.stabn 0x44,0,469,',0,0
	.dd LM317-_main
	.dw 0x0d,0x0a
.code
LM317:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC40	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,470,',0,0
	.dd LM318-_main
	.dw 0x0d,0x0a
.code
LM318:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,471,',0,0
	.dd LM319-_main
	.dw 0x0d,0x0a
.code
LM319:
	pc=L79	// jump
L78:
.debug
	.dw '.stabn 0x44,0,473,',0,0
	.dd LM320-_main
	.dw 0x0d,0x0a
.code
LM320:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC41	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L79:
.debug
	.dw '.stabn 0x44,0,474,',0,0
	.dd LM321-_main
	.dw 0x0d,0x0a
.code
LM321:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,475,',0,0
	.dd LM322-_main
	.dw 0x0d,0x0a
.code
LM322:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,476,',0,0
	.dd LM323-_main
	.dw 0x0d,0x0a
.code
LM323:
	R1=BP	// QImode move
	R2=BP+7
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,477,',0,0
	.dd LM324-_main
	.dw 0x0d,0x0a
.code
LM324:
	call _Rf_Received	// call with return value
.debug
	.dw '.stabn 0x44,0,478,',0,0
	.dd LM325-_main
	.dw 0x0d,0x0a
.code
LM325:
	pc=L26	// jump
L80:
.debug
	.dw '.stabn 0x44,0,480,',0,0
	.dd LM326-_main
	.dw 0x0d,0x0a
.code
LM326:
	R1=14	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,481,',0,0
	.dd LM327-_main
	.dw 0x0d,0x0a
.code
LM327:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,482,',0,0
	.dd LM328-_main
	.dw 0x0d,0x0a
.code
LM328:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,483,',0,0
	.dd LM329-_main
	.dw 0x0d,0x0a
.code
LM329:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,484,',0,0
	.dd LM330-_main
	.dw 0x0d,0x0a
.code
LM330:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,485,',0,0
	.dd LM331-_main
	.dw 0x0d,0x0a
.code
LM331:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L157	// QImode NE
	PC=L81
L157:
.debug
	.dw '.stabn 0x44,0,487,',0,0
	.dd LM332-_main
	.dw 0x0d,0x0a
.code
LM332:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC42	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,488,',0,0
	.dd LM333-_main
	.dw 0x0d,0x0a
.code
LM333:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,489,',0,0
	.dd LM334-_main
	.dw 0x0d,0x0a
.code
LM334:
	pc=L82	// jump
L81:
.debug
	.dw '.stabn 0x44,0,491,',0,0
	.dd LM335-_main
	.dw 0x0d,0x0a
.code
LM335:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC43	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L82:
.debug
	.dw '.stabn 0x44,0,492,',0,0
	.dd LM336-_main
	.dw 0x0d,0x0a
.code
LM336:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,493,',0,0
	.dd LM337-_main
	.dw 0x0d,0x0a
.code
LM337:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,494,',0,0
	.dd LM338-_main
	.dw 0x0d,0x0a
.code
LM338:
	call _MicAD_DA	// call with return value
.debug
	.dw '.stabn 0x44,0,495,',0,0
	.dd LM339-_main
	.dw 0x0d,0x0a
.code
LM339:
	pc=L26	// jump
L83:
.debug
	.dw '.stabn 0x44,0,497,',0,0
	.dd LM340-_main
	.dw 0x0d,0x0a
.code
LM340:
	R1=15	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,498,',0,0
	.dd LM341-_main
	.dw 0x0d,0x0a
.code
LM341:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,499,',0,0
	.dd LM342-_main
	.dw 0x0d,0x0a
.code
LM342:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,500,',0,0
	.dd LM343-_main
	.dw 0x0d,0x0a
.code
LM343:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,501,',0,0
	.dd LM344-_main
	.dw 0x0d,0x0a
.code
LM344:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,502,',0,0
	.dd LM345-_main
	.dw 0x0d,0x0a
.code
LM345:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L158	// QImode NE
	PC=L84
L158:
.debug
	.dw '.stabn 0x44,0,504,',0,0
	.dd LM346-_main
	.dw 0x0d,0x0a
.code
LM346:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC44	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,505,',0,0
	.dd LM347-_main
	.dw 0x0d,0x0a
.code
LM347:
	R1=BP	// QImode move
	R2=BP+10
	R3=BP	// QImode move
	R1=BP+10
	R2=BP	// QImode move
	R3=BP+10
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,506,',0,0
	.dd LM348-_main
	.dw 0x0d,0x0a
.code
LM348:
	R1=BP	// QImode move
	R2=BP+8
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,507,',0,0
	.dd LM349-_main
	.dw 0x0d,0x0a
.code
LM349:
	R1=9	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,508,',0,0
	.dd LM350-_main
	.dw 0x0d,0x0a
.code
LM350:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,509,',0,0
	.dd LM351-_main
	.dw 0x0d,0x0a
.code
LM351:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,510,',0,0
	.dd LM352-_main
	.dw 0x0d,0x0a
.code
LM352:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,511,',0,0
	.dd LM353-_main
	.dw 0x0d,0x0a
.code
LM353:
	pc=L85	// jump
L84:
.debug
	.dw '.stabn 0x44,0,515,',0,0
	.dd LM354-_main
	.dw 0x0d,0x0a
.code
LM354:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC45	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,516,',0,0
	.dd LM355-_main
	.dw 0x0d,0x0a
.code
LM355:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,517,',0,0
	.dd LM356-_main
	.dw 0x0d,0x0a
.code
LM356:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=120	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC17	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,519,',0,0
	.dd LM357-_main
	.dw 0x0d,0x0a
.code
LM357:
L86:
	pc=L88	// jump
	pc=L85	// jump
L88:
.debug
	.dw '.stabn 0x44,0,521,',0,0
	.dd LM358-_main
	.dw 0x0d,0x0a
.code
LM358:
LBB16:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,522,',0,0
	.dd LM359-_main
	.dw 0x0d,0x0a
.code
LM359:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,523,',0,0
	.dd LM360-_main
	.dw 0x0d,0x0a
.code
LM360:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,524,',0,0
	.dd LM361-_main
	.dw 0x0d,0x0a
.code
LM361:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,525,',0,0
	.dd LM362-_main
	.dw 0x0d,0x0a
.code
LM362:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,526,',0,0
	.dd LM363-_main
	.dw 0x0d,0x0a
.code
LM363:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,527,',0,0
	.dd LM364-_main
	.dw 0x0d,0x0a
.code
LM364:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,528,',0,0
	.dd LM365-_main
	.dw 0x0d,0x0a
.code
LM365:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,529,',0,0
	.dd LM366-_main
	.dw 0x0d,0x0a
.code
LM366:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,530,',0,0
	.dd LM367-_main
	.dw 0x0d,0x0a
.code
LM367:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,531,',0,0
	.dd LM368-_main
	.dw 0x0d,0x0a
.code
LM368:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,532,',0,0
	.dd LM369-_main
	.dw 0x0d,0x0a
.code
LM369:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,533,',0,0
	.dd LM370-_main
	.dw 0x0d,0x0a
.code
LM370:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,534,',0,0
	.dd LM371-_main
	.dw 0x0d,0x0a
.code
LM371:
LBE16:
	pc=L86	// jump
L87:
L85:
.debug
	.dw '.stabn 0x44,0,536,',0,0
	.dd LM372-_main
	.dw 0x0d,0x0a
.code
LM372:
	pc=L26	// jump
.debug
	.dw '.stabn 0x44,0,538,',0,0
	.dd LM373-_main
	.dw 0x0d,0x0a
.code
LM373:
	pc=L24	// jump
.debug
	.dw '.stabn 0x44,0,539,',0,0
	.dd LM374-_main
	.dw 0x0d,0x0a
.code
LM374:
LBE9:
L90:
L26:
.debug
	.dw '.stabn 0x44,0,540,',0,0
	.dd LM375-_main
	.dw 0x0d,0x0a
.code
LM375:
	R1=[_value]	// QImode move
	CMP R1,255	// QImode compare
	JZ L159	// QImode NE
	PC=L98
L159:
	pc=L99	// jump
L98:
.debug
	.dw '.stabn 0x44,0,541,',0,0
	.dd LM376-_main
	.dw 0x0d,0x0a
.code
LM376:
	R1=[_value]	// QImode move
	[_ko]=R1	// QImode move
L99:
.debug
	.dw '.stabn 0x44,0,542,',0,0
	.dd LM377-_main
	.dw 0x0d,0x0a
.code
LM377:
	R1=BP	// QImode move
	R2=BP+12
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,1	// QImode compare
	JZ L160	// QImode NE
	PC=L100
L160:
.debug
	.dw '.stabn 0x44,0,546,',0,0
	.dd LM378-_main
	.dw 0x0d,0x0a
.code
LM378:
	R1=BP	// QImode move
	R2=BP+12
	R1=2	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,547,',0,0
	.dd LM379-_main
	.dw 0x0d,0x0a
.code
LM379:
	pc=L101	// jump
L100:
.debug
	.dw '.stabn 0x44,0,548,',0,0
	.dd LM380-_main
	.dw 0x0d,0x0a
.code
LM380:
	R1=BP	// QImode move
	R2=BP+7
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,1	// QImode compare
	JZ L161	// QImode NE
	PC=L102
L161:
.debug
	.dw '.stabn 0x44,0,550,',0,0
	.dd LM381-_main
	.dw 0x0d,0x0a
.code
LM381:
	R1=BP	// QImode move
	R2=BP+13
	R3=BP	// QImode move
	R1=BP+13
	R2=BP	// QImode move
	R2=BP+13
	[bp+19]=R2	// QImode move
	R4=[bp+19]	// QImode move
	R3=[R4++]	// RD=[RS] HImode, RD+1=RS
	R4=[R4]
	[bp+16]=R3	// HImode [BP+#IM6]=RS
	[bp+17]=R4
	R3=[bp+16]	// HImode RD=[BP+#IM6]
	R4=[bp+17]
	R3=R3+1	// HImode RD=RS+#IMM16
	R4=R4+0, Carry
	[bp+20]=R3	// HImode [BP+#IM6]=RS
	[bp+21]=R4
	R3=[bp+20]	// HImode RD=[BP+#IM6]
	R4=[bp+21]
	R2=R1	// QImode move
	[R2]=R3	// [RD]=RS HImode, RD=RS+1
	PUSH BP TO [SP]
	BP=R2
	[BP+1]=R4
	POP BP FROM [SP]
.debug
	.dw '.stabn 0x44,0,551,',0,0
	.dd LM382-_main
	.dw 0x0d,0x0a
.code
LM382:
	R1=[_Last]	// QImode move
	CMP R1,(-21768)	// QImode compare
	JNZ L162	// QImode EQ
	PC=L104
L162:
	R1=[_Last]	// QImode move
	CMP R1,(-21792)	// QImode compare
	JNZ L163	// QImode EQ
	PC=L104
L163:
	pc=L103	// jump
L104:
.debug
	.dw '.stabn 0x44,0,553,',0,0
	.dd LM383-_main
	.dw 0x0d,0x0a
.code
LM383:
LBB17:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,554,',0,0
	.dd LM384-_main
	.dw 0x0d,0x0a
.code
LM384:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,555,',0,0
	.dd LM385-_main
	.dw 0x0d,0x0a
.code
LM385:
	R1=0	// QImode move
	[_Last]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,556,',0,0
	.dd LM386-_main
	.dw 0x0d,0x0a
.code
LM386:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,557,',0,0
	.dd LM387-_main
	.dw 0x0d,0x0a
.code
LM387:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,558,',0,0
	.dd LM388-_main
	.dw 0x0d,0x0a
.code
LM388:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,559,',0,0
	.dd LM389-_main
	.dw 0x0d,0x0a
.code
LM389:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,560,',0,0
	.dd LM390-_main
	.dw 0x0d,0x0a
.code
LM390:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,561,',0,0
	.dd LM391-_main
	.dw 0x0d,0x0a
.code
LM391:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC41	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,562,',0,0
	.dd LM392-_main
	.dw 0x0d,0x0a
.code
LM392:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=125	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC24	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,563,',0,0
	.dd LM393-_main
	.dw 0x0d,0x0a
.code
LM393:
LBE17:
	pc=L105	// jump
L103:
.debug
	.dw '.stabn 0x44,0,564,',0,0
	.dd LM394-_main
	.dw 0x0d,0x0a
.code
LM394:
	R1=BP	// QImode move
	R2=BP+13
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	CMP R4,15	// HImode compare
	JNZ L164	// HImode NE
	CMP R3,(-1)
	JZ  L165
L164:
	PC=L105
L165:
.debug
	.dw '.stabn 0x44,0,566,',0,0
	.dd LM395-_main
	.dw 0x0d,0x0a
.code
LM395:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,567,',0,0
	.dd LM396-_main
	.dw 0x0d,0x0a
.code
LM396:
	R1=BP	// QImode move
	R2=BP+13
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,568,',0,0
	.dd LM397-_main
	.dw 0x0d,0x0a
.code
LM397:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,569,',0,0
	.dd LM398-_main
	.dw 0x0d,0x0a
.code
LM398:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,570,',0,0
	.dd LM399-_main
	.dw 0x0d,0x0a
.code
LM399:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,571,',0,0
	.dd LM400-_main
	.dw 0x0d,0x0a
.code
LM400:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,572,',0,0
	.dd LM401-_main
	.dw 0x0d,0x0a
.code
LM401:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,573,',0,0
	.dd LM402-_main
	.dw 0x0d,0x0a
.code
LM402:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC41	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,574,',0,0
	.dd LM403-_main
	.dw 0x0d,0x0a
.code
LM403:
	R1=45	// QImode move
	[SP--]=R1	// QImode move
	R1=125	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC25	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
L106:
L105:
.debug
	.dw '.stabn 0x44,0,578,',0,0
	.dd LM404-_main
	.dw 0x0d,0x0a
.code
LM404:
	pc=L101	// jump
L102:
.debug
	.dw '.stabn 0x44,0,581,',0,0
	.dd LM405-_main
	.dw 0x0d,0x0a
.code
LM405:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L166	// QImode NE
	PC=L108
L166:
.debug
	.dw '.stabn 0x44,0,583,',0,0
	.dd LM406-_main
	.dw 0x0d,0x0a
.code
LM406:
LBB18:
	R1=(-32640)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,584,',0,0
	.dd LM407-_main
	.dw 0x0d,0x0a
.code
LM407:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,585,',0,0
	.dd LM408-_main
	.dw 0x0d,0x0a
.code
LM408:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,586,',0,0
	.dd LM409-_main
	.dw 0x0d,0x0a
.code
LM409:
	R1=BP	// QImode move
	R2=BP+2
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L109:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,80	// QImode compare
	JG L167	// QImode LE
	PC=L112
L167:
	pc=L110	// jump
L112:
.debug
	.dw '.stabn 0x44,0,588,',0,0
	.dd LM410-_main
	.dw 0x0d,0x0a
.code
LM410:
LBB19:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,589,',0,0
	.dd LM411-_main
	.dw 0x0d,0x0a
.code
LM411:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,590,',0,0
	.dd LM412-_main
	.dw 0x0d,0x0a
.code
LM412:
LBE19:
.debug
	.dw '.stabn 0x44,0,586,',0,0
	.dd LM413-_main
	.dw 0x0d,0x0a
.code
LM413:
L111:
	R1=BP	// QImode move
	R2=BP+2
	R3=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L109	// jump
L110:
.debug
	.dw '.stabn 0x44,0,591,',0,0
	.dd LM414-_main
	.dw 0x0d,0x0a
.code
LM414:
LBE18:
	pc=L101	// jump
L108:
.debug
	.dw '.stabn 0x44,0,593,',0,0
	.dd LM415-_main
	.dw 0x0d,0x0a
.code
LM415:
	R1=BP	// QImode move
	R2=BP+2
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L113:
L107:
L101:
.debug
	.dw '.stabn 0x44,0,596,',0,0
	.dd LM416-_main
	.dw 0x0d,0x0a
.code
LM416:
	pc=L25	// jump
.debug
	.dw '.stabn 0x44,0,598,',0,0
	.dd LM417-_main
	.dw 0x0d,0x0a
.code
LM417:
LBE8:
.debug
	.dw '.stabn 0x44,0,598,',0,0
	.dd LM418-_main
	.dw 0x0d,0x0a
.code
LM418:
L24:

	sp+=22
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "tm0:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm1:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "t:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "loada:1",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "loadb:1",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Led_Test:1",128,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iRf:1",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "keyfirst:1",128,0,0,8',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "keylast:1",128,0,0,9',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ttee:1",128,0,0,10',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iLcd:1",128,0,0,11',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iDiode:1",128,0,0,12',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "RfFlag:5",128,0,0,13',0x0d,0x0a
.CODE
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
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB13-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE13-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB14-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE14-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB15-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE15-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB16-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE16-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE9-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB17-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE17-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB18-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB19-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE19-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE18-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME4-_main
	.dw 0x0d,0x0a
.code
LME4:
.debug
	.dw '.stabs "value:G4",32,0,0,',0,0,offset _value,seg _value,0x0d,0x0a
.CODE
.ram
.public _value
_value:
	.dw 0
.debug
	.dw '.stabs "ko:G4",32,0,0,',0,0,offset _ko,seg _ko,0x0d,0x0a
.CODE
.ram
.public _ko
_ko:
	.dw 0
.debug
	.dw '.stabs "Record_Stard:G4",32,0,0,',0,0,offset _Record_Stard,seg _Record_Stard,0x0d,0x0a
.CODE
.ram
.public _Record_Stard
_Record_Stard:
	.dw 0
.debug
	.dw '.stabs "Record_Stop:G4",32,0,0,',0,0,offset _Record_Stop,seg _Record_Stop,0x0d,0x0a
.CODE
.ram
.public _Record_Stop
_Record_Stop:
	.dw 0
.debug
	.dw '.stabs "Record_Play:G4",32,0,0,',0,0,offset _Record_Play,seg _Record_Play,0x0d,0x0a
.CODE
.ram
.public _Record_Play
_Record_Play:
	.dw 0
.debug
	.dw '.stabs "FailTimes:G4",32,0,0,',0,0,offset _FailTimes,seg _FailTimes,0x0d,0x0a
.CODE
.ram
.public _FailTimes
_FailTimes:
	.dw 0
.debug
	.dw '.stabs "Key:G4",32,0,0,',0,0,offset _Key,seg _Key,0x0d,0x0a
.CODE
.ram
.public _Key
_Key:
	.dw 0
.debug
	.dw '.stabs "Status:G4",32,0,0,',0,0,offset _Status,seg _Status,0x0d,0x0a
.CODE
.ram
.public _Status
_Status:
	.dw 0
.external _delay
.external _singleled
.external _SP_Export
.external _Last
.external _F_SingleLed
.external _MicAD_DA
.external _Rf_Received
.external _mode2
.external _FG_PutBitmap
.external _FG_ClearScreen
.external _FG_SetBMPMode
.external _FG_PutPixel
.external _a
.external _Test_4096
.external _TestLed
.external _F_18LedTest
.external _key_asm1
.external _key_asm
.external _FG_Ellipse
.external _FG_PutStr
.external _FG_SetLineStyle
.external _FG_InitGraphic
.external _Init_sys
.external _F_Uart_Init_Restore_IO
.external _UART
.external _WakeUp
.external _SP_INT_64Hz
.external _SACM_S480_ServiceLoop
.external _ClearWatchDog
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external _Turnoff_INT_64Hz
	.end
