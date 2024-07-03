// GCC for SUNPLUS u'nSP version 1.0.9
// Command: E:\PROGRA~1\Sunplus\STUDYU~1\cc1.exe C:\DOCUME~1\Àî»ªÀö.DOMAIN\LOCALS~1\Temp\cc8waaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -O2 -o .\Release/main.asm
// gcc2_compiled.:

.public _SpeechAdjustTemp
.iram
_SpeechAdjustTemp:
	.dw 0
.public _Key
.iram
_Key:
	.dw 0
.public _KeyPressFlag
.iram
_KeyPressFlag:
	.dw 0
.public _TimeCount
.iram
_TimeCount:
	.dw 0
.public _SleepFlag
.iram
_SleepFlag:
	.dw 0
.public _TimeChangeCount
.iram
_TimeChangeCount:
	.dw 0
.public _KeyStatus
.iram
_KeyStatus:
	.dw 0
.public _KeyAdjust
.iram
_KeyAdjust:
	.dw 0
.public _YearOrTime
.iram
_YearOrTime:
	.dw 0
.public _TimeChangeKey
.iram
_TimeChangeKey:
	.dw 0
.public _KeyCount
.iram
_KeyCount:
	.dw 0
.public _SecondAddOne
.iram
_SecondAddOne:
	.dw 0
.public _HourMinTemp
.iram
_HourMinTemp:
	.dw 0
.public _i
.iram
_i:
	.dw 0
.public _j
.iram
_j:
	.dw 0
.public _gTimeVSShem
.iram
_gTimeVSShem:
	.dw 2048
	.dw 2098
	.dw 2304
	.dw 2354
	.dw 2356
	.dw 2565
	.dw 2570
	.dw 2816
	.dw 2826
	.dw 3072
	.dw 3358
	.dw 3604
	.dw 3614
	.dw 3860
	.dw 3861
	.dw 3890
.code
.public _PlayRespond
_PlayRespond:	.proc
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=[bp+4]	// QImode move
	[BP]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	[SP--]=R1	// QImode move
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Play	// call with return value
	SP=SP+4
	pc=L3	// Indirect jump
L5:
	call _Clear_WatchDog	// call with return value
	call _SACM_A2000_ServiceLoop	// call with return value
L3:
	call _SACM_A2000_Status	// call with return value
	R1=R1&1
	CMP R1,0	// QImode test
	JZ L7	// QImode NE
	PC=L5
L7:
	call _SACM_A2000_Stop	// call with return value

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of PlayRespond

.code
.public _Delay3ms
_Delay3ms:	.proc
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=0	// QImode move
L11:
	R1=R1+1
	CMP R1,(-2)	// QImode compare
	JA L14	// QImode LEU
	PC=L11
L14:

	pop bp from [sp]
	retf
	.endp	// end of Delay3ms

.code
.public _PlayAdjustTime
_PlayAdjustTime:	.proc
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=[bp+3]	// QImode move
	CMP R1,5	// QImode compare
	JNA L26	// QImode GTU
	PC=L16
L26:
	R1=R1+L24
	pc=[R1]	// tablejump
.text
L24:
	.dw L17
	.dw L18
	.dw L19
	.dw L20
	.dw L21
	.dw L16
.code
L17:
	call _ReadRealYear	// call with return value
	[_SpeechAdjustTemp]=R1	// QImode move
	[SP--]=R1	// QImode move
	call _PlaySpeakYear	// call with return value
	pc=L25	// Indirect jump
L18:
	call _ReadRealMonthDay	// call with return value
	[_SpeechAdjustTemp]=R1	// QImode move
	R1=R1 lsr 4
	R1=R1 lsr 4
	[SP--]=R1	// QImode move
	call _PlaySpeakMonth	// call with return value
	pc=L25	// Indirect jump
L19:
	call _ReadRealMonthDay	// call with return value
	[_SpeechAdjustTemp]=R1	// QImode move
	R1=R1&255
	[SP--]=R1	// QImode move
	call _PlaySpeakDay	// call with return value
	pc=L25	// Indirect jump
L20:
	call _ReadRealHourMin	// call with return value
	[_SpeechAdjustTemp]=R1	// QImode move
	R1=R1 lsr 4
	R1=R1 lsr 4
	[SP--]=R1	// QImode move
	call _PlaySpeakHour	// call with return value
	pc=L25	// Indirect jump
L21:
	call _ReadRealHourMin	// call with return value
	[_SpeechAdjustTemp]=R1	// QImode move
	R1=R1&255
	[SP--]=R1	// QImode move
	call _PlaySpeakMinute	// call with return value
L25:
	SP=SP+1
L16:

	pop bp from [sp]
	retf
	.endp	// end of PlayAdjustTime

.code
.public _PlaySpeakYear
_PlaySpeakYear:	.proc
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=[bp+4]	// QImode move
	[BP]=R1	// QImode move
	R2=1000	// QImode move
	push R1,R2 to [sp]	// peepholes pushqi2
	call __divi1	// call with return value
	SP=SP+2
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=1000	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	push R1,R2 to [sp]	// peepholes pushqi2
	call __divi1	// call with return value
	SP=SP+2
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	push R1,R2 to [sp]	// peepholes pushqi2
	call __divi1	// call with return value
	SP=SP+2
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=21	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+5

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakYear

.code
.public _PlaySpeakMonth
_PlaySpeakMonth:	.proc
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=[bp+3]	// QImode move
	CMP R1,9	// QImode compare
	JNG L37	// QImode GT
	PC=L29
L37:
	R1=R1+6
	pc=L36	// Indirect jump
L29:
	CMP R1,10	// QImode compare
	JZ L38	// QImode NE
	PC=L31
L38:
	R1=16	// QImode move
	pc=L36	// Indirect jump
L31:
	CMP R1,11	// QImode compare
	JZ L39	// QImode NE
	PC=L33
L39:
	R1=17	// QImode move
	pc=L36	// Indirect jump
L33:
	CMP R1,12	// QImode compare
	JZ L40	// QImode NE
	PC=L30
L40:
	R1=18	// QImode move
L36:
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L30:
	R1=22	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1

	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakMonth

.code
.public _PlaySpeakDay
_PlaySpeakDay:	.proc
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=[bp+5]	// QImode move
	[BP]=R1	// QImode move
	R2=10	// QImode move
	push R1,R2 to [sp]	// peepholes pushqi2
	call __divi1	// call with return value
	SP=SP+2
	[bp+1]=R1	// QImode move
	CMP R1,1	// QImode compare
	JG L45	// QImode LE
	PC=L42
L45:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L42:
	R1=[bp+1]	// QImode move
	CMP R1,0	// QImode test
	JG L46	// QImode LE
	PC=L43
L46:
	R2=16	// QImode move
	[SP--]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L43:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JNZ L47	// QImode EQ
	PC=L44
L47:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L44:
	R1=23	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakDay

.code
.public _PlaySpeakHour
_PlaySpeakHour:	.proc
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R2=[bp+4]	// QImode move
	R1=R2+(-1)
	CMP R1,6	// QImode compare
	JNA L74	// QImode GTU
	PC=L49
L74:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	[BP]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
	R2=[BP]	// QImode move
	CMP R2,2	// QImode compare
	JZ L75	// QImode NE
	PC=L50
L75:
	R1=19	// QImode move
	pc=L73	// Indirect jump
L50:
	R1=R2+6
	pc=L73	// Indirect jump
L49:
	R1=R2+(-8)
	CMP R1,4	// QImode compare
	JNA L76	// QImode GTU
	PC=L53
L76:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	[BP]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
	R2=[BP]	// QImode move
	CMP R2,10	// QImode compare
	JNZ L77	// QImode EQ
	PC=L55
L77:
	JNL L78	// QImode LT
	PC=L58
L78:
	CMP R2,11	// QImode compare
	JNZ L79	// QImode EQ
	PC=L56
L79:
	CMP R2,12	// QImode compare
	JNZ L80	// QImode EQ
	PC=L57
L80:
	pc=L58	// Indirect jump
L55:
	R1=16	// QImode move
	pc=L73	// Indirect jump
L56:
	R1=17	// QImode move
	pc=L73	// Indirect jump
L57:
	R1=18	// QImode move
	pc=L73	// Indirect jump
L58:
	R1=R2+6
	pc=L73	// Indirect jump
L53:
	R1=R2+(-13)
	CMP R1,6	// QImode compare
	JNA L81	// QImode GTU
	PC=L61
L81:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	[BP]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
	R2=[BP]	// QImode move
	CMP R2,14	// QImode compare
	JZ L82	// QImode NE
	PC=L70
L82:
	R1=19	// QImode move
	pc=L73	// Indirect jump
L61:
	R1=R2+(-20)
	CMP R1,4	// QImode compare
	JNA L83	// QImode GTU
	PC=L52
L83:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	[BP]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
	R2=[BP]	// QImode move
	CMP R2,23	// QImode compare
	JNZ L84	// QImode EQ
	PC=L68
L84:
	JNG L85	// QImode GT
	PC=L72
L85:
	CMP R2,22	// QImode compare
	JNZ L86	// QImode EQ
	PC=L67
L86:
	pc=L70	// Indirect jump
L72:
	CMP R2,24	// QImode compare
	JNZ L87	// QImode EQ
	PC=L69
L87:
	pc=L70	// Indirect jump
L67:
	R1=16	// QImode move
	pc=L73	// Indirect jump
L68:
	R1=17	// QImode move
	pc=L73	// Indirect jump
L69:
	R1=18	// QImode move
	pc=L73	// Indirect jump
L70:
	R1=R2+(-6)
L73:
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L52:
	R1=24	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakHour

.code
.public _PlaySpeakMinute
_PlaySpeakMinute:	.proc
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=[bp+5]	// QImode move
	[BP]=R1	// QImode move
	CMP R1,0	// QImode test
	JZ L95	// QImode NE
	PC=L89
L95:
	R2=20	// QImode move
	[SP--]=R2	// QImode move
	pc=L94	// Indirect jump
L89:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	[bp+1]=R1	// QImode move
	CMP R1,1	// QImode compare
	JG L96	// QImode LE
	PC=L91
L96:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L91:
	R1=[bp+1]	// QImode move
	CMP R1,0	// QImode test
	JG L97	// QImode LE
	PC=L92
L97:
	R2=16	// QImode move
	[SP--]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L92:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JNZ L98	// QImode EQ
	PC=L93
L98:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L93:
	R1=25	// QImode move
	[SP--]=R1	// QImode move
L94:
	call _PlayRespond	// call without return value
	SP=SP+1

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakMinute

.code
.public _PlaySpeakSecond
_PlaySpeakSecond:	.proc
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=[bp+5]	// QImode move
	[BP]=R1	// QImode move
	CMP R1,0	// QImode test
	JZ L104	// QImode NE
	PC=L100
L104:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L100:
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	[bp+1]=R1	// QImode move
	CMP R1,1	// QImode compare
	JG L105	// QImode LE
	PC=L101
L105:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L101:
	R2=[bp+1]	// QImode move
	CMP R2,0	// QImode test
	JG L106	// QImode LE
	PC=L102
L106:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L102:
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JNZ L107	// QImode EQ
	PC=L103
L107:
	R1=R1+6
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L103:
	R2=26	// QImode move
	[SP--]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of PlaySpeakSecond

.code
.public _SpeakTime
_SpeakTime:	.proc
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=[bp+4]	// QImode move
	[BP]=R1	// QImode move
	CMP R1,1	// QImode compare
	JZ L111	// QImode NE
	PC=L109
L111:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	SP=SP+3
	pc=L110	// Indirect jump
L109:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	SP=SP+4
L110:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of SpeakTime

.code
.public _main
_main:	.proc
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	call _System_Initial	// call with return value
L115:
	call _Key_Scan_ServiceLoop	// call with return value
	R2=[_Key]	// QImode move
	CMP R2,1	// QImode compare
	JZ L151	// QImode NE
	PC=L116
L151:
	R1=[_KeyStatus]	// QImode move
	CMP R1,0	// QImode test
	JZ L152	// QImode NE
	PC=L116
L152:
	[_KeyCount]=R2	// QImode move
	[_Key]=R1	// QImode move
L116:
	R1=[_Key]	// QImode move
	CMP R1,(-32767)	// QImode compare
	JZ L153	// QImode NE
	PC=L117
L153:
	R2=[_KeyStatus]	// QImode move
	CMP R2,0	// QImode test
	JZ L154	// QImode NE
	PC=L117
L154:
	R1=[_KeyCount]	// QImode move
	R1=R1+1
	[_KeyCount]=R1	// QImode move
	[_Key]=R2	// QImode move
L117:
	R2=[_KeyPressFlag]	// QImode move
	CMP R2,0	// QImode test
	JZ L155	// QImode NE
	PC=L118
L155:
	R1=[_KeyCount]	// QImode move
	CMP R1,0	// QImode test
	JNZ L156	// QImode EQ
	PC=L118
L156:
	CMP R1,19	// QImode compare
	JNA L157	// QImode GTU
	PC=L148
L157:
	R1=[_YearOrTime]	// QImode move
	R1=R1^1
	[_YearOrTime]=R1	// QImode move
	[SP--]=R1	// QImode move
	[bp+1]=R2	// QImode move
	call _SpeakTime	// call without return value
	R2=[bp+1]	// QImode move
	[_KeyCount]=R2	// QImode move
	pc=L149	// Indirect jump
L148:
	[_KeyCount]=R2	// QImode move
	R1=1	// QImode move
	[_KeyStatus]=R1	// QImode move
	[_KeyAdjust]=R2	// QImode move
	[_TimeCount]=R2	// QImode move
	call _Start256HzRTC	// call with return value
	R1=[_KeyAdjust]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
L149:
	SP=SP+1
L118:
	R1=[_KeyStatus]	// QImode move
	[BP]=R1	// QImode move
	CMP R1,1	// QImode compare
	JZ L158	// QImode NE
	PC=L122
L158:
	R1=[_Key]	// QImode move
	CMP R1,2	// QImode compare
	JNZ L159	// QImode EQ
	PC=L127
L159:
	JNA L160	// QImode GTU
	PC=L131
L160:
	CMP R1,1	// QImode compare
	JNZ L161	// QImode EQ
	PC=L124
L161:
	pc=L123	// Indirect jump
L131:
	CMP R1,4	// QImode compare
	JNZ L162	// QImode EQ
	PC=L128
L162:
	pc=L123	// Indirect jump
L124:
	R1=[_KeyAdjust]	// QImode move
	R1=R1+1
	[_KeyAdjust]=R1	// QImode move
	CMP R1,5	// QImode compare
	JZ L163	// QImode NE
	PC=L125
L163:
	R1=0	// QImode move
	[_KeyStatus]=R1	// QImode move
	[_KeyAdjust]=R1	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	call _Stop256HzRTC	// call with return value
	SP=SP+5
	pc=L126	// Indirect jump
L125:
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	SP=SP+1
L126:
	R1=0	// QImode move
	[_Key]=R1	// QImode move
	[_TimeCount]=R1	// QImode move
	[_TimeChangeKey]=R1	// QImode move
	pc=L123	// Indirect jump
L127:
	R1=[_KeyAdjust]	// QImode move
	[SP--]=R1	// QImode move
	call _Adjust_Time_Up	// call with return value
	pc=L150	// Indirect jump
L128:
	R1=[_KeyAdjust]	// QImode move
	[SP--]=R1	// QImode move
	call _Adjust_Time_Down	// call with return value
L150:
	R1=0	// QImode move
	[_TimeChangeCount]=R1	// QImode move
	R1=[BP]	// QImode move
	[_TimeChangeKey]=R1	// QImode move
	R1=0	// QImode move
	[_TimeCount]=R1	// QImode move
	[_Key]=R1	// QImode move
	SP=SP+1
L123:
	R1=[_TimeChangeKey]	// QImode move
	CMP R1,1	// QImode compare
	JZ L164	// QImode NE
	PC=L132
L164:
	R1=[_TimeChangeCount]	// QImode move
	CMP R1,40	// QImode compare
	JA L165	// QImode LEU
	PC=L132
L165:
	R1=0	// QImode move
	[_TimeChangeKey]=R1	// QImode move
	R1=[_KeyAdjust]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayAdjustTime	// call with return value
	SP=SP+1
L132:
	R1=[_TimeCount]	// QImode move
	CMP R1,120	// QImode compare
	JA L166	// QImode LEU
	PC=L122
L166:
	R1=0	// QImode move
	[_KeyStatus]=R1	// QImode move
	[_KeyAdjust]=R1	// QImode move
L122:
	call _Calendar_Counter	// call with return value
	R1=[_SecondAddOne]	// QImode move
	CMP R1,(-1)	// QImode compare
	JZ L167	// QImode NE
	PC=L134
L167:
	R1=0	// QImode move
	[_SecondAddOne]=R1	// QImode move
	call _ReadRealHourMin	// call with return value
	[_HourMinTemp]=R1	// QImode move
	R1=0	// QImode move
	[_i]=R1	// QImode move
	R4=_gTimeVSShem	// QImode move
L138:
	R3=[_i]	// QImode move
	R1=R3	// QImode move
	R1+=R4	// addqi3_r0r
	R2=[_HourMinTemp]	// QImode move
	CMP R2,[R1]	// QImode compare
	JZ L168	// QImode NE
	PC=L137
L168:
	R1=0	// QImode move
	[_j]=R1	// QImode move
L143:
	call _LightOn	// call with return value
	call _Delay3ms	// call without return value
	call _LightOff	// call with return value
	call _Delay3ms	// call without return value
	R1=[_j]	// QImode move
	R1=R1+1
	[_j]=R1	// QImode move
	CMP R1,14	// QImode compare
	JA L169	// QImode LEU
	PC=L143
L169:
	pc=L134	// Indirect jump
L137:
	R1=R3+1
	[_i]=R1	// QImode move
	CMP R1,15	// QImode compare
	JA L170	// QImode LEU
	PC=L138
L170:
L134:
	R1=[_SleepFlag]	// QImode move
	CMP R1,1	// QImode compare
	JZ L171	// QImode NE
	PC=L115
L171:
	R1=[_KeyStatus]	// QImode move
	CMP R1,0	// QImode test
	JZ L172	// QImode NE
	PC=L115
L172:
	call _SP_GoSleep	// call with return value
	pc=L115	// Indirect jump

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of main

.external _SP_GoSleep
.external _LightOff
.external _LightOn
.external _ReadRealHourMin
.external _Calendar_Counter
.external _Adjust_Time_Down
.external _Adjust_Time_Up
.external _Stop256HzRTC
.external _Start256HzRTC
.external _Key_Scan_ServiceLoop
.external _System_Initial
.external _ReadRealMonthDay
.external _ReadRealYear
.external _SACM_A2000_Stop
.external _SACM_A2000_ServiceLoop
.external _Clear_WatchDog
.external _SACM_A2000_Status
.external _SACM_A2000_Play
.external _SACM_A2000_Initial
.external __modi1
.external __divi1
.external __rshu1
	.end
