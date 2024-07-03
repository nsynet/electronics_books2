.define  Write_Port_Data     0xffff;
.define  Write_Port_Data0    0xaaaa;
.define  TIMER_DATA_FOR_8KHZ 0xfa23
.include hardware.inc
.code
//=====================================//
//�������ƣ�unsigned IOTest����
//���ڲ�����1.���Գɹ�0������ʧ��
//����ڲ���
//Ӳ�����ӣ�A��B�ڶ̽�
//=====================================//

.public _IOTest;
_IOTest:    .proc

InitPortAinput_Boutput:
    r1=0x0000                 //��ʼ��A��Ϊ�����
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	[P_IOA_Data]=r1
	                          //��ʼ��B��Ϊ�����
	r1=0xffff                 
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	r1=0x0000
	[P_IOB_Data]=r1

WritePortB:
    r1 = Write_Port_Data;    //��B��д����0xaaaa   
LoopWrite:   // 
    r1 = r1-1;
    jz  InitPortBinput_Aoutput;//
    [P_IOB_Data]=r1
ReadPortA: 
                             //ʹ�����ȶ�
    nop;
    nop;
    nop;
    nop;
    nop;      
    r2 = [P_IOA_Data];       //��A������    
    cmp r1,r2;               //�Ƚ϶�д�����Ƿ���ͬ
    je  LoopWrite;
    //je  InitPortBinput_Aoutput;
    nop;
    nop;
    nop;
    r1 = 0x0000;             //����ʧ��
    nop;
    nop;
    retf;
    
InitPortBinput_Aoutput:
   
     r1=0x0000                 //��ʼ��B��Ϊ����
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	[P_IOB_Data]=r1
	                          //��ʼ��A��Ϊ���
	r1=0xffff                 
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	r1=0x0000
	[P_IOA_Data]=r1
	
WritePortA:                  //��A��д����
    r1 = Write_Port_Data
LoopWrite0:
    r1 = r1 - 1;
    jz  TestSuc;    
    [P_IOA_Data]=r1    
ReadPortB:
                             //ʹ�����ȶ�
    nop;
    nop;
    nop;
    nop;
    nop;    
    r2 = [P_IOB_Data];       //��B������    
    cmp r1,r2;               //�Ƚ϶�д�����Ƿ���ͬ
    je  LoopWrite0;

    r1 = 0x0000;             //����ʧ��
    retf;
 TestSuc:
    r1 = 0x0001;
    retf;
    .endp
//===========================================//
//�������ƣ�unsigned KeyWakeUp()
//���ڲ�����1.���Գɹ�0������ʧ��
//����ڲ���
//Ӳ�����ӣ�A��B�ڶ̽�
//=====================================//
.public _KeyWakeUp;
_KeyWakeUp:    .proc
.define P_IOA_RL   0x7004
//InitPortA_input_B_output0:
    r1=0x0000                 //��ʼ��A��Ϊ�����
	[P_IOA_Dir]=r1
	[P_IOA_Attrib]=r1
	[P_IOA_Data]=r1


	                          //��ʼ��B��Ϊ�����
	r1=0xffff                 
	[P_IOB_Dir]=r1
	[P_IOB_Attrib]=r1
	r1=0x0000
	[P_IOB_Data]=r1
    r1 = [P_INT_Ctrl]
    r1 |= 0x0004                //�жϳ�ʼ��
    [P_INT_Ctrl] = r1;  
    r1=[P_IOA_RL] 
    INT IRQ                  //���ж�   
    r1=0x0017;               //on 32768   
    [P_SystemClock]=r1       //����˯��״̬
    
    
    
    r1 = 0x0000
    [P_SystemClock]=r1 
    r1 = 0x0001;             //���Գɹ�
    retf;
.endp    
//********************************//
//�������ж�    
//*******************************//
.text  
.public _IRQ3
_IRQ3:
    push r1,r4 to [sp]
  
    r1=0x0080
    test r1,[P_INT_Ctrl]   //�Ƿ�Ϊ�������ж�
    jz L_notKeyArouse      //���˳��жϳ���
    r1=0x0080
    [P_INT_Clear]=r1       //�ǣ����ж� 
L_notKeyArouse: 
    pop r1,r4 from [sp] 
    reti
//=======================================//
//�������ƣ�unsigned UART(char *Psend)
//���ڲ�����1.���Գɹ�0������ʧ��
//����ڲ���
//Ӳ�����ӣ�A��B�ڶ̽�
//=====================================// 


.data   //���͵�����
    SendData:.dw 0x00aa,0x0055,0x00a5,0x005a,0x00aa
.isram
.public  RecData    //�������ݻ�����
 RecData: .dw  5 dup(0);
 
 .var recNum        //�������ݸ���

 .var sendNum       //�������ݸ���
 
.code
.public _UART;
_UART:

    r1 = 0xffff;      //����A��Ϊ���
    [P_IOA_Attrib] = r1;    
    [P_IOA_Dir] = r1;
    r1 = 0xffff;    
    [P_IOA_Data] = r1; 
       
    r2 = RecData;   
    
_UART_INIT:		
F_UART_INIT:
	INT OFF;
	R1 = 0x0000;		    //�ر��ж�	
	[P_INT_Ctrl] = R1;   

	R1 = 0x0480;		    //����IOB7Ϊ����IOB10Ϊ���
	[P_IOB_Attrib] = R1;
	R1 = 0x0400;
	[P_IOB_Dir] = R1;
	R1 = 0x0000;	
	[P_IOB_Data] = R1;

	R1 = 0x006b;		    //���ò����� 114.84KHz(~=115.2KHz)
	[P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
	[P_UART_BaudScalarHigh] = R1;
	
	
	R1 = 0x0000;
	R4 = 0x00C0;	      //ʹ��RX��TX
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;
	


	
	R3 = 0x00;
	bp = 0x0000
	[sendNum] = bp
    [recNum] = bp
	
L_sendData:
	
L_Check_TxRDY:
    R4 = SendData;				//׼����������
    bp = [sendNum] 
	
	R3 -= 1;
	jz	L_TxRDY_TimeOut;

    cmp bp,5                    //�����Ƿ����
    je L_Check_RxRDY;           
    
	R1 = [P_UART_Command2];    
	R1 &= 0x0040;			      //��� TxRDY = 1;
	JZ L_Check_RxRDY;
    r4 = r4 + bp
	r4 = [r4]
	[P_UART_Data] = R4;	          //��������
    
    bp += 1     
    [sendNum] = bp                //�������ݵĸ���      
    
L_recData:      
	R3 = 0x00;
L_Check_RxRDY:
	
	R3 -= 1;
	jz	L_RxRDY_TimeOut;
    
    bp = [recNum]
    r2 =  bp + RecData            
    
	R1 = [P_UART_Command2];			//����Ƿ������ݽ���
	R1 &= 0x0080;
	JZ L_Check_TxRDY;
	                                //�����Լ����͵�8λʮ��������
	r1 = 0x0000;
	//... Get data .................
	R1 = [P_UART_Data];				//ȡ���յ�����
    
    [r2] = r1;    
    bp += 1
    [recNum] = bp                   //�����Ƿ�ȫ������
    cmp bp ,5
    jne L_Check_RxRDY
    
    R1 = 0x0000;
    [P_UART_Command2] = R1;        //��ֹ����
    jmp L_TxRDY_TimeOut

	
L_TxRDY_TimeOut:
L_RxRDY_TimeOut:		
    call CmpRecSend;
	retf;

//==============================//
//�������ƣ�CmpRecSend:

//�ȽϷ�����������������Ƿ����
//==============================//
CmpRecSend:
   bp = [recNum] 
   bp -= 1
loopCmp:   
   r3 = bp + RecData
   r4 = bp + SendData
  // r3 -= 1 
   r3 = [r3] 
   r4 = [r4]
   cmp r3,r4;
   jne UartFail;
   bp -= 1 
   cmp bp,0xffff
   jne loopCmp;      
   r1 = 0x0001  //�ɹ�
   retf
 UartFail:
   r1 = 0x0000;   //ʧ��
 retf;
//==============================//
// MIC���Բ���
//==============================//
.CODE
_InitAD_DA: 
		INT OFF;	
	
		R1 = 0x0030; 				// ʱ��Ƶ��ΪCLKA��Fosc/2
		[P_TimerA_Ctrl] = R1;		//
		R1 = TIMER_DATA_FOR_8KHZ; 	// ������Ϊ 8kHz
		[P_TimerA_Data] = R1;		//
		
		R1 = 0x0015;				// ����AGC 
		//R1 = 0x0011				// ȡ��AGC 
		[P_ADC_Ctrl] = R1;			// �����Զ���ʽ����ͨ��MIC_INͨ������,
		
		
		R1 = 0x00A8;				//ͨ����ʱ��A������������ݣ�ADCΪ�Զ���ʽ
		[P_DAC_Ctrl] = R1;			
		R1 = 0x1000;				//
		[P_INT_Ctrl] = R1;			// ���ж�IRQ1_TM
		
		INT IRQ;
		retf; 

//������
.PUBLIC _MICTEST	
_MICTEST: .PROC 
		call _InitAD_DA				// ����AD ��ʼ���ӳ��� 
	.ENDP
loop:
	nop 
	nop 
	nop 
	nop 
	jmp loop 
.text
.PUBLIC _IRQ1 
_IRQ1:       
		push R1 to [SP]
	
		R1 = [P_ADC] 
		[P_DAC1] = R1 
		[P_DAC2] = R1 
		R1 = 0x1000 
		[P_INT_Clear] = R1 
		pop R1 from [SP] 
		reti 
