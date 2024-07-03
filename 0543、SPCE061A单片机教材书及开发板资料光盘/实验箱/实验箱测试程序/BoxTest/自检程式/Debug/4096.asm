// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\IDE180\cc1.exe C:\WINDOWS\TEMP\ccx5qdgb.i -fkeep-inline-functions -quiet -dumpbase 4096.c -gstabs -o .\Debug/4096.asm
// gcc2_compiled.:

.stabs "D:\\2003年工作\\tset\\实验箱\\BoxTest\\自检程式/", 0x64, 0, 3, Ltext0
.stabs "D:/2003年工作/tset/实验箱/BoxTest/自检程式/4096.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "a:G4",32,0,0,',0,0,offset _a,seg _a,0x0d,0x0a
.CODE
.public _a
.iram
_a:
	.dw 0
.code
.debug
	.dw '.stabs "Test_4096:F1",36,0,0,',0,0,offset _Test_4096,seg _Test_4096,0x0d,0x0a
.CODE
.public _Test_4096
_Test_4096:	.proc
.debug
	.dw '.stabn 0x44,0,3,',0,0
	.dd LM1-_Test_4096
	.dw 0x0d,0x0a
.code
LM1:
	// total=9, vars=9
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=9
	bp=sp+1

	R1=BP+12
	[bp+8]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM2-_Test_4096
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM3-_Test_4096
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+4
	R1=255	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM4-_Test_4096
	.dw 0x0d,0x0a
.code
LM4:
	R1=BP	// QImode move
	R2=BP+5
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM5-_Test_4096
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM6-_Test_4096
	.dw 0x0d,0x0a
.code
LM6:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM7-_Test_4096
	.dw 0x0d,0x0a
.code
LM7:
	R1=BP	// QImode move
	R2=BP+4
	R1=255	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM8-_Test_4096
	.dw 0x0d,0x0a
.code
LM8:
	call _SP_SIOMassErase	// call with return value
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM9-_Test_4096
	.dw 0x0d,0x0a
.code
LM9:
	R1=BP	// QImode move
	R2=BP+5
	R3=(-16)	// HImode immediate to register move
	R4=7
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM10-_Test_4096
	.dw 0x0d,0x0a
.code
LM10:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+5
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	push R3,R4 to [sp]	// pushhi
	call _SP_SIOSendAWord	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM11-_Test_4096
	.dw 0x0d,0x0a
.code
LM11:
	R1=BP	// QImode move
	R2=BP+5
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	push R3,R4 to [sp]	// pushhi
	call _SP_SIOReadAWord	// call with return value
	SP=SP+2
	[_a]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM12-_Test_4096
	.dw 0x0d,0x0a
.code
LM12:
	R1=BP	// QImode move
	R2=BP+7
	R1=[_a]	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM13-_Test_4096
	.dw 0x0d,0x0a
.code
LM13:
	call _F_User_Init_Restore_IO	// call with return value
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM14-_Test_4096
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[_a]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM15-_Test_4096
	.dw 0x0d,0x0a
.code
LM15:
LBE2:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM16-_Test_4096
	.dw 0x0d,0x0a
.code
LM16:
L2:

	sp+=9
	pop bp from [sp]
	retf
	.endp	// end of Test_4096

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_Test_4096
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "addr:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "data:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Error:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Ret:4",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Addr:5",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "a1:4",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_Test_4096
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_Test_4096
	.dw 0x0d,0x0a
.code
LME1:
.external _F_User_Init_Restore_IO
.external _SP_SIOReadAWord
.external _SP_SIOSendAWord
.external _SP_SIOMassErase
.external _System_Initial
	.end
