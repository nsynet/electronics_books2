// GCC for SUNPLUS u'nSP version 1.0.8
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE162\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\cc2xaaaa.i -fkeep-inline-functions -quiet -dumpbase usbmain.c -gstabs -o .\Debug/usbmain.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\ÍøÕ¾×ÊÁÏ_release\\usb\\model2_0613_wdog_en\\061/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/ÍøÕ¾×ÊÁÏ_release/usb/model2_0613_wdog_en/061/usbmain.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "_flags:T20=s1bus_reset:4,0,1;suspend:4,1,1;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "setup_packet:4,2,1;remote_wakeup:4,3,1;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "in_isr:4,4,1;control_state:4,5,2;configuration:4,7,1;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "ep1_rxdone:4,8,1;ep2_rxdone:4,9,1;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "_epp_flags:T21=u1bits:20,0,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "EPPFLAGS:t22=21",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "_device_request:T23=s8bmRequestType:4,0,16;bRequest:4,16,16;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "wValue:5,32,32;wIndex:5,64,32;wLength:5,96,32;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "DEVICE_REQUEST:t24=23",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "_control_transfers:T25=s21DeviceRequest:24,0,128;wLength:5,128,32;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "wCount:5,160,32;pData:26=*4,192,16;dataBuffer:27=ar1;0;7;4,208,128;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "CONTROL_TRANSFERS:t28=25",128,0,0,0',0x0d,0x0a
.CODE
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,58,',0,0
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
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
	call _F_System_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _F_Reconnect_USB	// call without return value
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _F_Interrupt_On	// call without return value
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	pc=L5	// Indirect jump
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R2=[_bEPPflags]	// QImode move
	R1=R2&1
	CMP R1,0	// QImode test
	JNZ L18	// QImode EQ
	PC=L6
L18:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[_bEPPflags]	// QImode move
	R2=(-2)	// QImode move
	[_bEPPflags]=R1&R2
L6:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=[_bEPPflags]	// QImode move
	R2=1	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L19	// QImode EQ
	PC=L7
L19:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=[_bEPPflags]	// QImode move
	R2=(-3)	// QImode move
	[_bEPPflags]=R1&R2
L7:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[_bEPPflags]	// QImode move
	R2=2	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L20	// QImode EQ
	PC=L8
L20:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[_bEPPflags]	// QImode move
	R2=(-5)	// QImode move
	[_bEPPflags]=R1&R2
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	call _F_Control_Handler	// call without return value
L8:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_bEPPflags]	// QImode move
	R2=9	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L21	// QImode NE
	PC=L9
L21:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=[_bEPPflags]	// QImode move
	R2=(-513)	// QImode move
	[_bEPPflags]=R1&R2
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=[_MainEpBuf]	// QImode move
	CMP R1,1	// QImode compare
	JZ L22	// QImode NE
	PC=L10
L22:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=_MainEpBuf	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_D12_WriteEndpoint	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L9	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=[_MainEpBuf]	// QImode move
	CMP R1,2	// QImode compare
	JZ L23	// QImode NE
	PC=L12
L23:
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=[_MainEpBuf+1]	// QImode move
	CMP R1,1	// QImode compare
	JZ L24	// QImode NE
	PC=L13
L24:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	call _F_TurnOnFirstLed	// call without return value
L13:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=[_MainEpBuf+1]	// QImode move
	CMP R1,0	// QImode test
	JZ L25	// QImode NE
	PC=L14
L25:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	call _F_TurnOffFirstLed	// call without return value
L14:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=[_MainEpBuf+1]	// QImode move
	CMP R1,3	// QImode compare
	JZ L26	// QImode NE
	PC=L15
L26:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	call _F_TurnOnSecondLed	// call without return value
L15:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=[_MainEpBuf+1]	// QImode move
	CMP R1,2	// QImode compare
	JZ L27	// QImode NE
	PC=L16
L27:
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	call _F_TurnOffSecondLed	// call without return value
L16:
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	pc=L9	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=_MainEpBuf	// QImode move
	[SP--]=R1	// QImode move
	R1=[_OneRecByteNum]	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_D12_WriteEndpoint	// call with return value
	SP=SP+3
L17:
L11:
L9:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	call _F_Clear_WatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabf ',0,0
	.dd LME1-_main
	.dw 0x0d,0x0a
.code
LME1:
.debug
	.dw '.stabs "ControlData:G28",32,0,0,',0,0,offset _ControlData,seg _ControlData,0x0d,0x0a
.CODE
.ram
.public _ControlData
_ControlData:
	.dw 21 dup(0)
.external _F_Clear_WatchDog
.external _OneRecByteNum
.external _F_TurnOffSecondLed
.external _F_TurnOnSecondLed
.external _F_TurnOffFirstLed
.external _F_TurnOnFirstLed
.external _F_D12_WriteEndpoint
.external _MainEpBuf
.external _F_Control_Handler
.external _bEPPflags
.external _F_Interrupt_On
.external _F_Reconnect_USB
.external _F_System_Initial
.external __rshu1
	.end
