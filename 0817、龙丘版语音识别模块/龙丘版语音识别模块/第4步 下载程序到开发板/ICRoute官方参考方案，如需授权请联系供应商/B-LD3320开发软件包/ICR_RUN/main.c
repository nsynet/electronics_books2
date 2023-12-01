/************************************************************************************/
//	版权所有：Copyright (c) 2005 - 2010 ICRoute INC.
/************************************************************************************/

#include "STC10F08XE.H"
#include "LDchip.h"
#include "Reg_RW.h"
#include "FlashDef.h"
#include "SubFuncs.h"

sbit LED0=P3^4;
sbit LED1=P3^5;

sbit KEY0=P4^2;
sbit KEY1=P4^1;
sbit KEY2=P4^0;
sbit KEY3=P4^3;
sbit TP1=P4^4;
sbit P45=P4^5;

/************************************************************************************/
//	nAsrStatus 用来在main主程序中表示程序运行的状态，不是LD3320芯片内部的状态寄存器
//	LD_ASR_NONE:		表示没有在作ASR识别
//	LD_ASR_RUNING：		表示LD3320正在作ASR识别中
//	LD_ASR_FOUNDOK:		表示一次识别流程结束后，有一个识别结果
//	LD_ASR_FOUNDZERO:	表示一次识别流程结束后，没有识别结果
//	LD_ASR_ERROR:		表示一次识别流程中LD3320芯片内部出现不正确的状态
/***********************************************************************************/
uint8 idata nAsrStatus=0;	

extern void          _nop_     (void);

void MCU_init();
void FlashLED(uint8 nTimes);
void PlaySound(uint8 nCode);
uint8 RunASR();
void ProcessInt0();
void UART_init();
void OutputIO(uint8 nRes);


/************************************************************************************/
//	这个示范程序是基于STC10L08XE编译的完整地，可以执行的程序
//	事先了识别和播放的功能
//	根据用户说出不同的关键词语，识别后播放对应的mp3声音
//
//	与LD3320芯片有关的函数功能，都在"开发手册.pdf"中有详细说明
//	请开发者对照"开发手册.pdf“阅读
//	
//	开发者在学习LD3320开始时，可以直接把在这个main函数拷贝到自己单片机中编译运行
//	如果只实现ASR语音识别功能，可以把程序中PlaySound()函数的调用注释掉就可以
//	
//	当然，用户要根据自己实际的单片机去修改 mcu_init ，以及对应的管脚连接的定义，中断定义
/************************************************************************************/

void  main()
{
	uint8 idata nAsrRes;

	FlashLED(3);

	MCU_init();
	UART_init();
	LD_reset();

	nAsrStatus = LD_ASR_NONE;		//	初始状态：没有在作ASR
	PlaySound(0);					//	播放提示音：为第一条声音
	while(1)
	{
		if (bMp3Play!=0)			//	如果还在播放MP3中，则等待，直到MP3播放完毕 即bMp3Play==0
			continue;				//	bMp3Play 是定义的一个全局变量用来记录MP3播放的状态，不是LD3320芯片内部的寄存器

		switch(nAsrStatus)
		{
			case LD_ASR_RUNING:
			case LD_ASR_ERROR:		
				break;
			case LD_ASR_NONE:
			{
				FlashLED(4);
				nAsrStatus=LD_ASR_RUNING;
				if (RunASR()==0)	//	启动一次ASR识别流程：ASR初始化，ASR添加关键词语，启动ASR运算
				{
					nAsrStatus = LD_ASR_ERROR;
					LED0=0;
					LED1=0;
				}
				break;
			}
			case LD_ASR_FOUNDOK:
			{
				FlashLED(2);
				nAsrRes = LD_GetResult();	//	一次ASR识别流程结束，去取ASR识别结果
				OutputIO(nAsrRes);			//  根据识别结果，在相应的IO管脚上输出1秒钟左右的低电平，开发者可以通过IO管脚输出到其他设备进行声控。
				PlaySound(nAsrRes);
				nAsrStatus = LD_ASR_NONE;
				break;
			}
			case LD_ASR_FOUNDZERO:
			default:
			{
				FlashLED(1);
				//PlaySound(0);
				nAsrStatus = LD_ASR_NONE;
				break;
			}
		}// switch
	}// while

}

void MCU_init()
{
	P1M0 |= 1;
	P3M0 |= 8;
	P4SW = 0xFF;

	LED0=0;
	LED1=0;
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xf7;
	P4 = 0x3f;


#if defined (SOFT_SPI_PORT)		//	软件模拟SPI读写
	LD_MODE = 1;				//	设置MD管脚为高
#elif defined (HARD_SPI_PORT)	//	硬件实现SPI读写
	LD_MODE = 1;				//	设置MD管脚为高
#else							//	并行读写 （硬件实现或者软件模拟）
	LD_MODE = 0;				//	设置MD管脚为低
#endif


	IP=0;
	IPH=0;

	PX0=1; 
	PT0=1;
	PS=1;
	IPH |= 1;	
	
	EX0=0;
	EX1=0;
	EA=1;
}

void  delay(unsigned long uldata)
{
	unsigned int j  =  0;
	unsigned long g  =  0;
	for (j=0;j<5;j++)
	{
		for (g=0;g<uldata;g++)
		{
			_nop_();
			_nop_();
			_nop_();
		}
	}
}

/*********************************************************************
//为了消除编译时的 警告 *** WARNING L15: MULTIPLE CALL TO SEGMENT
//把在中断函数中需要调用的函数重新复制并命名
//消除警告 Warning L15，并且避免由于函数重入可能带来的隐藏Bug
/*********************************************************************/

void  delay_2(unsigned long uldata)
{
	unsigned int j  =  0;
	unsigned long g  =  0;
	for (j=0;j<5;j++)
	{
		for (g=0;g<uldata;g++)
		{
			_nop_();
			_nop_();
			_nop_();
		}
	}
}

void FlashLED(uint8 nTimes)
{
	uint8 k;
	for (k=0; k<nTimes; k++)
	{
		LED0=0;
		LED1=0;
		delay(10000);
		LED0=1;
		LED1=1;
		delay(10000);
	}
}

/************************************************************************************/
//	IO_Send_Byte()是主控MCU向spi-flash (型号为华邦的 W25X40)发送指令
//	开发者应该根据自己使用的存储芯片去写具体的函数
//
//	ICroute公司无法对存储芯片的读写提供技术支持，
//	开发者需要自己向自己使用的存储芯片的厂商获得技术支持
//	或者在网络上搜索相关代码和文档
//
//	华邦的spi-flash的技术支持的文档页面在：
//	http://www.winbond.com.tw/hq/cht/ProductAndSales/ProductLines/FlashMemory/SerialFlash/
//	http://www.xtdpj.com/show_hdr.php?xname=915RL41&dname=23T0M41&xpos=84
/************************************************************************************/

void IO_Send_Byte(uint8 dataout)
{
	 uint8 i = 0; 
	 FLASH_CS = 0;
	 for (i=0; i<8; i++)
	 {
		  if ((dataout & 0x80) == 0x80) 
			   FLASH_DIO = 1;
		  else
			   FLASH_DIO = 0;
		  FLASH_CLK = 1;
		  dataout = (dataout << 1); 
		  FLASH_CLK = 0;   
	 }
}


/************************************************************************************/
//	RunASR()函数实现了一次完整的ASR语音识别流程
//	LD_AsrStart() 函数实现了ASR初始化
//	LD_AsrAddFixed() 函数实现了添加关键词语到LD3320芯片中
//	LD_AsrRun()	函数启动了一次ASR语音识别流程
//
//	任何一次ASR识别流程，都需要按照这个顺序，从初始化开始进行
/************************************************************************************/

uint8 RunASR()
{
	uint8 i=0;
	uint8 asrflag=0;
	for (i=0; i<5; i++)			//	防止由于硬件原因导致LD3320芯片工作不正常，所以一共尝试5次启动ASR识别流程
	{
		LD_AsrStart();
		delay(100);
		if (LD_AsrAddFixed()==0)
		{
			LD_reset();			//	LD3320芯片内部出现不正常，立即重启LD3320芯片
			delay(100);			//	并从初始化开始重新ASR识别流程
			continue;
		}
		delay(10);
		if (LD_AsrRun() == 0)
		{
			LD_reset();			//	LD3320芯片内部出现不正常，立即重启LD3320芯片
			delay(100);			//	并从初始化开始重新ASR识别流程
			continue;
		}

		asrflag=1;
		break;					//	ASR流程启动成功，退出当前for循环。开始等待LD3320送出的中断信号
	}

	return asrflag;
}

void ExtInt0Handler(void) interrupt 0  
{
	ProcessInt0();				//	LD3320 送出中断信号，包括ASR和播放MP3的中断，需要在中断处理函数中分别处理
}

//-------------------------------------------------------
void UART_init()  			//进行串口的相关信息初始化工作
{
#define   RELOAD_COUNT   0XFA

	SCON  =  0x50;             //0101，0000  8位可变波特率，无奇偶校验位
	BRT   =  RELOAD_COUNT;     ////定义波特率发生器重载值，晶体频率22.1184M,1T,SMOD=0;波特率115200bps    
	AUXR  =  0x15;  //将BRTR=1，BRTx12=1(1T模式)，SBRS=1
	              //T0x12,T1x12,UART_M0x6,BRTR,S2SMOD,BRTx12,XRAM,SBRS
	              //Baud=Fosc/(256-RELOAD_COUNT)/32/12  (12T模式)
	              //Baud=Fosc/(256-RELOAD_COUNT)/32     (1T模式)
	              //BRTR=1，启动独立波特率发生器
	              //S1BRS=1，串口1选择独立波特率发生器作为波特率发生器
	              //此时定时器1可以释放出来作为定时器，计数器，时钟输出使用
	//AUXR1=0x80；//释放该行指令，则串行口从P3切换到P1，设计串口在P1,不支持


	TMOD = 0x21; 	// 0010 0001 
					//设置定时器0为16位计数器
					//设置定时器1为8位自动重载计数器

	TR0 = 0;
	TR1 = 0;  	// 前面设置了专用波特率发生器。不使用Timer1.

	ES    =   1;      //允许串口中断
	EA    =   1;      //开总中断	
	                                    
}

//以下几个函数为从串口打印信息到PC机的函数，开发者可以直接调用
void SendChar (uint8 data_to_tx) 
{
#ifdef LD_DEBUG
	ES	  =		0;  //关串口中断
	TI    =   0;  //清零串口发送完成中断请求标志
	SBUF  =  data_to_tx;
	while(TI==0); //等待发送完成
	TI    =   0;
	ES    =   1;  //允许串口中断
#endif
}

void SendLineEnd(void) 
{
#ifdef LD_DEBUG
	SendChar(0x0D);
	SendChar(0x0A);
#endif
}

void SendString(unsigned char *pt)
{
#ifdef LD_DEBUG
    while(*pt)
		SendChar(*(pt++));
#endif
}

void SendByteHex (uint8 value)
{
#ifdef LD_DEBUG
	uint8 idata ch1 = value & 0xF0;
	ch1 = ch1>>4;
	if (ch1>9)
		ch1 = 'A' + ch1 - 10;
	else 
		ch1 = '0' + ch1;
	SendChar(ch1);
	ch1 = value & 0x0F;
	if (ch1>9)
		ch1 = 'A' + ch1 - 10;
	else 
		ch1 = '0' + ch1;
	SendChar(ch1);
	SendChar(' ');
#endif
}

void SendLongHex (uint32 value)
{
#ifdef LD_DEBUG
	uint8 idata bt;
	SendChar('[');
	bt = (uint8)(value>>24);
	SendByteHex(bt);
	bt = (uint8)((value&0x00FF0000L)>>16);
	SendByteHex(bt);
	bt = (uint8)((value&0x0000FF00L)>>8);
	SendByteHex(bt);
	bt = (uint8)((value&0x000000FFL));
	SendByteHex(bt);
	SendChar(']');
	SendChar(' ');
#endif
}


//在某个IO管脚上输出低电平，持续大概1秒钟左右
//如果开发者不需要这一步骤，可以去除，从而减少识别结束到播放声音的延时
void OutputIO(uint8 nRes)
{
	switch(nRes)
	{
	case 0:
		KEY0=0; delay(60000); KEY0=1; break;
	case 1:
		LED0=0; delay(60000); LED0=1; break;
	case 2:
		KEY3=0; delay(60000); KEY3=1; break;
	case 3:
		LED1=0; delay(60000); LED1=1; break;
	case 4:
		TP1=0; delay(60000); TP1=1; break;
	case 5:
		P45=0; delay(60000); P45=1; break;
	case 6:
		KEY1=0; delay(60000); KEY1=1; break;
	case 7:
		KEY2=0; delay(60000); KEY2=1; break;
	}
}

