.INCLUDE hardware.inc


.code
.public _delay
_delay: .proc
    r1+=1;
    nop
    nop
    nop
    nop
    nop
    nop
    call ClearWatchDog
    retf;
    .endp

.public _SerialInit
_SerialInit: .proc
		R1=0x0480
	[P_IOB_Attrib]=R1
	R1=0x0400
	[P_IOB_Dir]=R1
	call ClearWatchDog
	R1=0x006b
	[P_UART_BaudScalarLow]=R1
	R1=0x00
	[P_UART_BaudScalarHigh]=R1
    R1=0x0000
    [P_UART_Command1]=R1
    R1=0x00c0
    [P_UART_Command2]=R1
    retf
    .endp

.public _Output
_Output: .proc
  //  INT OFF
    
	bp=sp
	R1=[bp+3]
	R2=[bp+4]
TxRDY:
    call ClearWatchDog
	R4=[P_UART_Command2]
	r4&=0x0040
	JZ TxRDY
	R3=[R1]
	[P_UART_Data]=R3
	R1+=1
	R2-=1
	JNZ TxRDY
	INT FIQ
	INT IRQ
	retf
    .endp
	
.code
.public _ClearWatchDog
.public ClearWatchDog
_ClearWatchDog: .proc
ClearWatchDog:
 push R1,R5 to [SP]
 R1 = 0x0001
 [0x7012] = R1
 pop R1,R5 from [SP]
 retf
.endp
	
