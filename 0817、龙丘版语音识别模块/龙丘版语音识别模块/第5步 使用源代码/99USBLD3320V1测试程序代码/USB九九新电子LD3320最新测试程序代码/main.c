
#include "STC10F08XE.H"
#include "config.h"
#include "LDchip.h"
#include "uart.h"

sbit LED1=P3^4;
sbit LED2=P3^5;
sbit BUZZ=P4^1;

sbit TLED1=P4^0;
sbit TLED2=P2^1;
sbit TLED3=P2^2;
sbit TLED4=P2^3;
sbit TLED5=P2^4;
sbit TLED6=P2^5;
sbit TLED7=P2^7;
sbit LD_MODE	= P1^0;
uint8 idata nAsrStatus=0;															

//****************宏定义*******************
#define MP3_BEIJING_START	0x0000;
#define MP3_BEIJING_SIZE	0x0868;
#define MP3_SHANGHAI_START	0x0C00;
#define MP3_SHANGHAI_SIZE	0x0ab0;
#define MP3_TIANJIN_START	0x1800;
#define MP3_TIANJIN_SIZE	0x0a20;
#define MP3_CHONGQING_START	0x2400;
#define MP3_CHONGQING_SIZE	0x0990;
#define MP3_NIHAO_START	0x3000;
//#define MP3_NIHAO_SIZE	0x1170;	//原始地址
#define MP3_NIHAO_SIZE	0x4170;	//原始地址
//***********函数声明**********************
extern void          _nop_     (void);
void MCU_init();
void FlashLED(uint8 nTimes);
void PlaySound(uint8 nCode);
uint8 RunASR();

void  main()
{
	uint8 idata nAsrRes;
	BUZZ=1;
	FlashLED(3);
	LD_MODE=0;
	MCU_init();
	LD_MODE=0;
	LD_reset();
	LD_MODE=0;
	UartInit();
	UartSendStr("STC10L08XE串口测试");
	nAsrStatus = LD_ASR_NONE;
//	PlaySound(CODE_KONGTIAO);
    BUZZ=1;
	TLED1=0;TLED2=0;TLED3=0;TLED4=0;TLED5=0;TLED6=0;TLED7=0;
	delay(20000);
	BUZZ=0;
	TLED1=1;TLED2=1;TLED3=1;TLED4=1;TLED5=1;TLED6=1;TLED7=1;	
	while(1)
	{
		if (bMp3Play!=0)
			continue;

		switch(nAsrStatus)
		{
			case LD_ASR_RUNING:		//自动识别运行状态  
			case LD_ASR_ERROR:		//自动识别错误
				break;
			case LD_ASR_NONE:		//没有识别到语音
			{
				FlashLED(4);
				nAsrStatus=LD_ASR_RUNING;
				
				if (RunASR()==0)
				{
					nAsrStatus = LD_ASR_ERROR;
					LED1=0;
					LED2=0;					
					//MCU_init();
	                LD_reset();
	                //UartInit();
			//		UartSendStr("STC10L08XE死机重启");
					nAsrStatus = LD_ASR_NONE;
                    //	PlaySound(CODE_KONGTIAO);                  
				}
				break;
			}
			case LD_ASR_FOUNDOK:   //找到识别语音
			{				    						
				FlashLED(2);	
				nAsrRes = LD_GetResult();
				if(nAsrRes!=CODE_ERROR)//如果不是为误识别
				{
					PlaySound(nAsrRes);
					delay(100);
					PlaySound(nAsrRes);
					BUZZ=1;
	                delay(10000);
	                BUZZ=0;
					delay(8000);
					BUZZ=1;
	                delay(10000);
	                BUZZ=0;
				}
				nAsrStatus = LD_ASR_NONE;
				break;
			}
			case LD_ASR_FOUNDZERO://找到0个匹配语音
			default:
			{
				FlashLED(1);
			//	PlaySound(CODE_DEFAULT);
				nAsrStatus = LD_ASR_NONE;// 无语音识别
				break;
			}
		}// switch
	}// while

}

/**************************************************************** 
函数名称： MCU_init 
功    能： MCU初始化
入口参数： 无 
返回值  ： 无
修    改： 2010-2-2
****************************************************************/ 
void MCU_init(void)
{
	LED1=0;
	LED2=0;
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xf7;
	P4 = 0x0f;

	IP=0;
	IPH=0;

	PX0=1; 
	PT0=1;
	PS=1;
	IPH |= 1;	
	
	EX0=0;
	EX1=0;
	ET0=0;
	EA=1;
}

/**************************************************************** 
函数名称： FlashLED 
功    能： 控制LED
入口参数： nTimes 
返回值  ： 无
修    改： 2010-2-2
****************************************************************/ 
void FlashLED(uint8 nTimes)
{
	uint8 k;
	for (k=0; k<nTimes; k++)
	{
		LED1=0;
		LED2=0;
		delay(15000);
		LED1=1;
		LED2=1;
		delay(15000);
	}
}

/**************************************************************** 
函数名称： PlaySound 
功    能： 按要求播放语音
入口参数： nCode 
返回值  ： 无
修    改： 2010-2-2
****************************************************************/
void PlaySound(uint8 nCode)
{
	unsigned char Buff_Dat[5]={0x1b,0x21,0x51,0xD0,0x00}; 
	switch(nCode)
	{
	case CODE_FSK:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		TLED1=0;
		break;
	case CODE_FSG:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		TLED1=1;
		break;
	case CODE_TDK:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		TLED2=0;
		break;
	case CODE_TDG:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		TLED2=1;
		break;
	case CODE_CJS:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		TLED3=0;
		break;
	case CODE_CJJ:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		TLED3=1;
		break;
	case CODE_TINGDENGK:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		TLED4=0;
		break;
	case CODE_TINGDENGG:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		TLED4=1;
		break;
	case CODE_FANGDENGK:
		nMp3StartPos = MP3_TIANJIN_START;
		nMp3Size = MP3_TIANJIN_SIZE;
		TLED5=0;
		break;
	case CODE_FANGDENGG:
		nMp3StartPos = MP3_TIANJIN_START;
		nMp3Size = MP3_TIANJIN_SIZE;
		TLED5=1;
		break;
	case CODE_LIUHAOK:
		nMp3StartPos = MP3_CHONGQING_START;
		nMp3Size = MP3_CHONGQING_SIZE;
		TLED6=0;
		break;
	case CODE_LIUHAOG:
		nMp3StartPos = MP3_CHONGQING_START;
		nMp3Size = MP3_CHONGQING_SIZE;
		TLED6=1;
		break;
	case CODE_QIHAOK:
		nMp3StartPos = MP3_NIHAO_START;
		nMp3Size = MP3_NIHAO_SIZE;
		TLED7=0;
		break;
	case CODE_QIHAOG:
		nMp3StartPos = MP3_NIHAO_START;
		nMp3Size = MP3_NIHAO_SIZE;
		TLED7=1;
		break;
	//=====================================================================7
	/*case CODE_BAHAOK:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		//UartSendStr("风扇");
		Buff_Dat[2]=0x58;
		Buff_Dat[3]=0xD1;
		break;
	case CODE_BAHAOG:
		nMp3StartPos = MP3_BEIJING_START;
		nMp3Size = MP3_BEIJING_SIZE;
		//UartSendStr("风扇");
		Buff_Dat[2]=0x58;
		Buff_Dat[3]=0xD0;
		break;
	case CODE_JIUHAOK:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		//UartSendStr("风扇");
		Buff_Dat[2]=0x59;
		Buff_Dat[3]=0xD1;
		break;
	case CODE_JIUHAOG:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		//UartSendStr("风扇");
		Buff_Dat[2]=0x59;
		Buff_Dat[3]=0xD0;
		break;
	case CODE_DDCLK:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		//UartSendStr("台灯");
		Buff_Dat[2]=0x5A;
		Buff_Dat[3]=0xD1;
		break;
	case CODE_DDCLG:
		nMp3StartPos = MP3_SHANGHAI_START;
		nMp3Size = MP3_SHANGHAI_SIZE;
		//UartSendStr("台灯");
		Buff_Dat[2]=0x5A;
		Buff_Dat[3]=0xD0;
		break;
	case CODE_SHIYIHAOK:
		nMp3StartPos = MP3_TIANJIN_START;
		nMp3Size = MP3_TIANJIN_SIZE;
		//UartSendStr("电动窗");
		Buff_Dat[2]=0x5B;
		Buff_Dat[3]=0xD1;
		break;
	case CODE_SHIYIHAOG:
		nMp3StartPos = MP3_TIANJIN_START;
		nMp3Size = MP3_TIANJIN_SIZE;
		//UartSendStr("电动窗");
		Buff_Dat[2]=0x5B;
		Buff_Dat[3]=0xD0;
		break;
	case CODE_DDCK:
		nMp3StartPos = MP3_CHONGQING_START;
		nMp3Size = MP3_CHONGQING_SIZE;
		//UartSendStr("照明灯");
		Buff_Dat[2]=0x5C;
		Buff_Dat[3]=0xD1;
		break;
	case CODE_DDCG:
		nMp3StartPos = MP3_CHONGQING_START;
		nMp3Size = MP3_CHONGQING_SIZE;
		//UartSendStr("照明灯");
		Buff_Dat[2]=0x5C;
		Buff_Dat[3]=0xD0;
		break;	 */
	
	default:
		break;		
	}
//	UartSendStr(Buff_Dat);
//	LD_Init_Common();		  //公共初始化代码
//	LD_Init_MP3();			  //MP3初始化
//	LD_AdjustMIX2SPVolume(15);//设定输出音量
//	LD_Play();
}


/**************************************************************** 
函数名称： RunASR 
功    能：  运行LD3320语音识别
入口参数： 无 
返回值  ： 1为成功
修    改： 2010-2-1
****************************************************************/ 
uint8 RunASR()
{
	uint8 i=0;
	uint8 asrflag=0;
	for (i=0; i<5; i++)
	{
		LD_AsrStart();
		delay(100);
		if (LD_AsrAddFixed()==0)
		{
			LD_reset();
			delay(100);
			continue;
		}
		delay(10);
		if (LD_AsrRun() == 0)
		{
			LD_reset();
			delay(100);
			continue;
		}

		asrflag=1;
		break;
	}

	return asrflag;
}


