/************************************************************
 * Uart Program
 *   gz.
 * 2009.9.28 [complete]	  在串口调试和eg-s20d v2.0调试通过
 * --------------------------------------------------
 * 在PC上通过超级终端或者其它串口调试工具，将键盘按下的值显示
 * 在终端上，并将输入的字符串再次输出到终端上。
 *
 * P30: RXD
 * P31: TXD
 * W77E58系列的波特率
 * 备注：T2发生器：Fosc/(32*(65536-(RCAP2H,RCAP2L))) 
 *       T1发生器：TH1=TL1= 256-(F*1000000*(SMOD+1))/(32*12*B) 
 ***********************************************************/
#include "STC10F08XE.H"
#include "config.h"
#include "uart.h"
#ifdef debug

#define RELOAD_COUNT  256-Fclk/(BitRate*12*16)   //22.1184MHz,12T,SMOD=1,9600bps

//#define use_T2	  // 使用定时器2作为波特率发生器
//unsigned char idata g_ucCmd[CMD_LEN + 1] = {0};
//volatile unsigned char  g_ucCmd[CMD_LEN + 1] ;
unsigned char idata g_ucLen = 0;   // 命令长度
unsigned char idata g_ucCur = 1;   // 光标位置

/************************************************************
 * Name: UartInit
 * Func:
 *  串行通信初始化
 * Para: 
 *  unsigned char ch: 发送的字符
 * Return: None
 ***********************************************************/
void UartInit()
{
	SCON  = 0x50;       // SCON: serail mode 1, 8-bit数据1位起始1位停止 UART
    TMOD |= 0x20;       // TMOD: timer 1, mode 2, 8-bit reload 
    PCON |= 0x80;       // SMOD=1; 	//波特率加倍
	BRT	= RELOAD_COUNT;
	//  BRTR = 1, S1BRS = 1, EXTRAM = 1 ENABLE EXTRAM
	//普通8051兼容，即12T，独立波特率发生器，允许运行
	AUXR |= 0x11; // T0x12,T1x12,UART_M0x6,BRTR,S2SMOD,BRTx12,EXTRAM,S1BRS	
 //  TH1=256-Fclk/(BitRate*12*16); // Baud:9600  fosc=11.0592MHz
 //   TL1=256-Fclk/(BitRate*12*16); // Baud:9600  fosc=11.0592MHz
 // IE   |= 0x90;       // 使能串行中断
 // IP    = 0X10;		// 切记没有用到的中断要禁止不要开，否则程序跑飞
    TR1   = 1;          // 启动TIMER1
	ET1=0;              // 禁止定时器1中断
 	EA = 1;
}

/************************************************************
 * Name: UartSendStr
 * Func:
 *  向串口发送以0结尾的字符串
 * Para: 
 *  unsigned char *pStr: 发送的字符指针
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
 *  向串口发送一个字符
 * Para: 
 *  unsigned char ch: 发送的字符
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
 *  字符处理过程函数。根据输入的普通字符或控制字符判断回显。
 * Para: 
 *  unsigned char ch: 判断的字符
 * Return: None
 ***********************************************************/
void UartCharPro(unsigned char ch)
{
 	switch(ch) 
	{
 	case '\b':    // 退格键
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
 	case '\r':    // 回车键
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
 	default:    // 其它字符
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
