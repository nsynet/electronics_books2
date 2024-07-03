/************************************************************
 * Uart Program
 *   gz.
 * 2009.9.28 [complete]	  �ڴ��ڵ��Ժ�eg-s20d v2.0����ͨ��
 * --------------------------------------------------
 * ��PC��ͨ�������ն˻����������ڵ��Թ��ߣ������̰��µ�ֵ��ʾ
 * ���ն��ϣ�����������ַ����ٴ�������ն��ϡ�
 *
 * P30: RXD
 * P31: TXD
 * W77E58ϵ�еĲ�����
 * ��ע��T2��������Fosc/(32*(65536-(RCAP2H,RCAP2L))) 
 *       T1��������TH1=TL1= 256-(F*1000000*(SMOD+1))/(32*12*B) 
 ***********************************************************/
#include "STC10F08XE.H"
#include "config.h"
#include "uart.h"
#ifdef debug

#define RELOAD_COUNT  256-Fclk/(BitRate*12*16)   //22.1184MHz,12T,SMOD=1,9600bps

//#define use_T2	  // ʹ�ö�ʱ��2��Ϊ�����ʷ�����
//unsigned char idata g_ucCmd[CMD_LEN + 1] = {0};
//volatile unsigned char  g_ucCmd[CMD_LEN + 1] ;
unsigned char idata g_ucLen = 0;   // �����
unsigned char idata g_ucCur = 1;   // ���λ��

/************************************************************
 * Name: UartInit
 * Func:
 *  ����ͨ�ų�ʼ��
 * Para: 
 *  unsigned char ch: ���͵��ַ�
 * Return: None
 ***********************************************************/
void UartInit()
{
	SCON  = 0x50;       // SCON: serail mode 1, 8-bit����1λ��ʼ1λֹͣ UART
    TMOD |= 0x20;       // TMOD: timer 1, mode 2, 8-bit reload 
    PCON |= 0x80;       // SMOD=1; 	//�����ʼӱ�
	BRT	= RELOAD_COUNT;
	//  BRTR = 1, S1BRS = 1, EXTRAM = 1 ENABLE EXTRAM
	//��ͨ8051���ݣ���12T�����������ʷ���������������
	AUXR |= 0x11; // T0x12,T1x12,UART_M0x6,BRTR,S2SMOD,BRTx12,EXTRAM,S1BRS	
 //  TH1=256-Fclk/(BitRate*12*16); // Baud:9600  fosc=11.0592MHz
 //   TL1=256-Fclk/(BitRate*12*16); // Baud:9600  fosc=11.0592MHz
 // IE   |= 0x90;       // ʹ�ܴ����ж�
 // IP    = 0X10;		// �м�û���õ����ж�Ҫ��ֹ��Ҫ������������ܷ�
    TR1   = 1;          // ����TIMER1
	ET1=0;              // ��ֹ��ʱ��1�ж�
 	EA = 1;
}

/************************************************************
 * Name: UartSendStr
 * Func:
 *  �򴮿ڷ�����0��β���ַ���
 * Para: 
 *  unsigned char *pStr: ���͵��ַ�ָ��
 * Return: None
 ***********************************************************/
void UartSendStr(unsigned char *pStr)
{
 	while(*pStr != 0) 
	{
  		SBUF = *pStr++;
    	while(TI==0);
    	TI=0;
 	}
}
#if 0
/************************************************************
 * Name: UartSendChar
 * Func:
 *  �򴮿ڷ���һ���ַ�
 * Para: 
 *  unsigned char ch: ���͵��ַ�
 * Return: None
 ***********************************************************/
void UartSendChar(unsigned char ch)
{
    SBUF = ch;
    while(TI==0);
    TI=0;
}

code unsigned char HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
/********************************************************************/
void UartSendHex(unsigned char x)
{
 UartSendChar( '0' );
 UartSendChar( 'X' );
 UartSendChar(HexTable[x>>4]);
 UartSendChar(HexTable[x&0xf]);
 UartSendChar(' ');
}
void UartSrv() interrupt 4
{
 	unsigned char ch;
 	ch = SBUF;
 	if(RI)
 	{
  		RI = 0;
  		UartCharPro(ch);
 	}
}
/************************************************************
 * Name: UartCharPro
 * Func:
 *  �ַ�������̺����������������ͨ�ַ�������ַ��жϻ��ԡ�
 * Para: 
 *  unsigned char ch: �жϵ��ַ�
 * Return: None
 ***********************************************************/
void UartCharPro(unsigned char ch)
{
 	switch(ch) 
	{
 	case '\b':    // �˸��
  				if(g_ucCur > CMD_TAG)
				{
   					UartSendChar('\b');
    				UartSendChar(' ');
   					UartSendChar('\b');
   					if(g_ucLen)
					{
    					g_ucLen--;
   					}
   					g_ucCur--;
  				}
  				break;
 	case '\r':    // �س���
  				UartSendChar('\r');
  				UartSendChar('\n');
  				g_ucCmd[g_ucLen] = 0;
  				UartSendStr(g_ucCmd);
  				UartSendChar('\r');
  				UartSendChar('\n');
  				UartSendChar('>');
  				g_ucLen = 0;
  				g_ucCur = 1;
 				break;
 	default:    // �����ַ�
  				UartSendChar(ch);
  
  				g_ucCur++;
  				if(g_ucLen < CMD_LEN)
				{
   					g_ucCmd[g_ucLen++] = ch;
  				}
 				else 
				{
   					g_ucCmd[g_ucLen] = 0;
  				}
 	}
}
#endif
#endif
