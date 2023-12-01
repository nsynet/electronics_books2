/************************************************************************************/
//  �޸ģ��ž��µ��� 2011-08-01   www.99xdz.com
/************************************************************************************/

#include "STC10F08XE.H"
#include "LDchip.h"
#include "Reg_RW.h"
#include "FlashDef.h"
#include "SubFuncs.h"


/************************************************************************************/
//	nAsrStatus ������main�������б�ʾ�������е�״̬������LD3320оƬ�ڲ���״̬�Ĵ���
//	LD_ASR_NONE:		��ʾû������ASRʶ��
//	LD_ASR_RUNING��		��ʾLD3320������ASRʶ����
//	LD_ASR_FOUNDOK:		��ʾһ��ʶ�����̽�������һ��ʶ����
//	LD_ASR_FOUNDZERO:	��ʾһ��ʶ�����̽�����û��ʶ����
//	LD_ASR_ERROR:		��ʾһ��ʶ��������LD3320оƬ�ڲ����ֲ���ȷ��״̬
/***********************************************************************************/
uint8 idata nAsrStatus=0;
	
#define Same_VOIC_COUNT  9		//���峤�ȺͲ�����������һ�£������жϷ���ֵ�Ƿ���Ҫ��������

extern void          _nop_     (void);

void MCU_init();
void FlashLED(uint8 nTimes);
void PlaySound(uint8 nCode);
uint8 RunASR();
void ProcessInt0();
void UART_init();
void OutputIO(uint8 nRes);
void LED_TEST();

/************************************************************************************/
//	���ʾ�������ǻ���STC10L08XE����������أ�����ִ�еĳ���
//	������ʶ��Ͳ��ŵĹ���
//	�����û�˵����ͬ�Ĺؼ����ʶ��󲥷Ŷ�Ӧ��mp3����
//
//	��LD3320оƬ�йصĺ������ܣ�����"�����ֲ�.pdf"������ϸ˵��
//	�뿪���߶���"�����ֲ�.pdf���Ķ�
//	
//	��������ѧϰLD3320��ʼʱ������ֱ�Ӱ������main�����������Լ���Ƭ���б�������
//	���ֻʵ��ASR����ʶ���ܣ����԰ѳ�����PlaySound()�����ĵ���ע�͵��Ϳ���
//	
//	��Ȼ���û�Ҫ�����Լ�ʵ�ʵĵ�Ƭ��ȥ�޸� mcu_init ���Լ���Ӧ�Ĺܽ����ӵĶ��壬�ж϶���
/************************************************************************************/

void  main()
{
	uint8 idata nAsrRes;
	MCU_init();
	UART_init();
	LD_reset();
	BUZZ=0;
	LED_TEST();						//����LED��
	nAsrStatus = LD_ASR_NONE;		//	��ʼ״̬��û������ASR	
	PlaySound(8);					//	������ʾ����Ϊ�ھ�������9-Verygood
	while(1)
	{
		if (bMp3Play!=0)			//	������ڲ���MP3�У���ȴ���ֱ��MP3������� ��bMp3Play==0
			continue;				//	bMp3Play �Ƕ����һ��ȫ�ֱ���������¼MP3���ŵ�״̬������LD3320оƬ�ڲ��ļĴ���

		switch(nAsrStatus)
		{
			case LD_ASR_RUNING:
			case LD_ASR_ERROR:		
				break;
			case LD_ASR_NONE:
			{
				//FlashLED(1);
				nAsrStatus=LD_ASR_RUNING;
				if (RunASR()==0)	//	����һ��ASRʶ�����̣�ASR��ʼ����ASR��ӹؼ��������ASR����
				{
					nAsrStatus = LD_ASR_ERROR;
				}
				break;
			}
			case LD_ASR_FOUNDOK:
			{
				nAsrRes = LD_GetResult();	//	һ��ASRʶ�����̽�����ȥȡASRʶ����
				OutputIO(nAsrRes);			//  ����ʶ����������Ӧ��IO�ܽ������1�������ҵĵ͵�ƽ�������߿���ͨ��IO�ܽ�����������豸�������ء�
				if(nAsrRes<Same_VOIC_COUNT)	
				{
				PlaySound(nAsrRes);	    //  ����ʶ������				
				}
				nAsrStatus = LD_ASR_NONE;				
				break;
			}
			case LD_ASR_FOUNDZERO:
			default:
			{
				//FlashLED(1);
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
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xf7;
	P4 = 0x3f;


#if defined (SOFT_SPI_PORT)		//	���ģ��SPI��д
	LD_MODE = 1;				//	����MD�ܽ�Ϊ��
#elif defined (HARD_SPI_PORT)	//	Ӳ��ʵ��SPI��д
	LD_MODE = 1;				//	����MD�ܽ�Ϊ��
#else							//	���ж�д ��Ӳ��ʵ�ֻ������ģ�⣩
	LD_MODE = 0;				//	����MD�ܽ�Ϊ��
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
//Ϊ����������ʱ�� ���� *** WARNING L15: MULTIPLE CALL TO SEGMENT
//�����жϺ�������Ҫ���õĺ������¸��Ʋ�����
//�������� Warning L15�����ұ������ں���������ܴ���������Bug
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
		DS01=0;
		DS02=0;
		BUZZ=1;
		delay(5000);
		DS01=1;
		DS02=1;
		BUZZ=0;
		delay(5000);
	}
}


void LED_TEST()
{
DS01=0;DS02=1;DS03=1;DS04=1;DS05=1;DS06=1;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=1;DS04=1;DS05=1;DS06=1;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=1;DS05=1;DS06=1;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=1;DS06=1;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=0;DS06=1;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=0;DS06=0;DS07=1;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=0;DS06=0;DS07=0;DS08=1;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=0;DS06=0;DS07=0;DS08=0;DS09=1;
delay(2500);
DS01=0;DS02=0;DS03=0;DS04=0;DS05=0;DS06=0;DS07=0;DS08=0;DS09=0;
delay(4000);
DS01=1;DS02=1;DS03=1;DS04=1;DS05=1;DS06=1;DS07=1;DS08=1;DS09=1;
}
/************************************************************************************/
//
//	IO_Send_Byte()������MCU��spi-flash (�ͺ�Ϊ����� W25Q32)����ָ��
//	������Ӧ�ø����Լ�ʹ�õĴ洢оƬȥд����ĺ���
//
//	ICroute��˾�޷��Դ洢оƬ�Ķ�д�ṩ����֧�֣�
//	��������Ҫ�Լ����Լ�ʹ�õĴ洢оƬ�ĳ��̻�ü���֧��
//	������������������ش�����ĵ�
//
//	�����spi-flash�ļ���֧�ֵ��ĵ�ҳ���ڣ�
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
//	RunASR()����ʵ����һ��������ASR����ʶ������
//	LD_AsrStart() ����ʵ����ASR��ʼ��
//	LD_AsrAddFixed() ����ʵ������ӹؼ����ﵽLD3320оƬ��
//	LD_AsrRun()	����������һ��ASR����ʶ������
//
//	�κ�һ��ASRʶ�����̣�����Ҫ�������˳�򣬴ӳ�ʼ����ʼ����
/************************************************************************************/

uint8 RunASR()
{
	uint8 i=0;
	uint8 asrflag=0;
	for (i=0; i<5; i++)			//	��ֹ����Ӳ��ԭ����LD3320оƬ����������������һ������5������ASRʶ������
	{
		LD_AsrStart();
		delay(100);
		if (LD_AsrAddFixed()==0)
		{
			LD_reset();			//	LD3320оƬ�ڲ����ֲ���������������LD3320оƬ
			delay(100);			//	���ӳ�ʼ����ʼ����ASRʶ������
			continue;
		}
		delay(10);
		if (LD_AsrRun() == 0)
		{
			LD_reset();			//	LD3320оƬ�ڲ����ֲ���������������LD3320оƬ
			delay(100);			//	���ӳ�ʼ����ʼ����ASRʶ������
			continue;
		}

		asrflag=1;
		break;					//	ASR���������ɹ����˳���ǰforѭ������ʼ�ȴ�LD3320�ͳ����ж��ź�
	}

	return asrflag;
}

void ExtInt0Handler(void) interrupt 0  
{
	ProcessInt0();				//	LD3320 �ͳ��ж��źţ�����ASR�Ͳ���MP3���жϣ���Ҫ���жϴ������зֱ���
}

//-------------------------------------------------------
void UART_init()  			//���д��ڵ������Ϣ��ʼ������
{
#define   RELOAD_COUNT   0XFA

	SCON  =  0x50;             //0101��0000  8λ�ɱ䲨���ʣ�����żУ��λ
	BRT   =  RELOAD_COUNT;     ////���岨���ʷ���������ֵ������Ƶ��22.1184M,1T,SMOD=0;������115200bps    
	AUXR  =  0x15;  //��BRTR=1��BRTx12=1(1Tģʽ)��SBRS=1
	              //T0x12,T1x12,UART_M0x6,BRTR,S2SMOD,BRTx12,XRAM,SBRS
	              //Baud=Fosc/(256-RELOAD_COUNT)/32/12  (12Tģʽ)
	              //Baud=Fosc/(256-RELOAD_COUNT)/32     (1Tģʽ)
	              //BRTR=1���������������ʷ�����
	              //S1BRS=1������1ѡ����������ʷ�������Ϊ�����ʷ�����
	              //��ʱ��ʱ��1�����ͷų�����Ϊ��ʱ������������ʱ�����ʹ��
	//AUXR1=0x80��//�ͷŸ���ָ����пڴ�P3�л���P1����ƴ�����P1,��֧��


	TMOD = 0x21; 	// 0010 0001 
					//���ö�ʱ��0Ϊ16λ������
					//���ö�ʱ��1Ϊ8λ�Զ����ؼ�����

	TR0 = 0;
	TR1 = 0;  	// ǰ��������ר�ò����ʷ���������ʹ��Timer1.

	ES    =   1;      //�������ж�
	EA    =   1;      //�����ж�	
	                                    
}

//���¼�������Ϊ�Ӵ��ڴ�ӡ��Ϣ��PC���ĺ����������߿���ֱ�ӵ���
void SendChar (uint8 data_to_tx) 
{
#ifdef LD_DEBUG
	ES	  =		0;  //�ش����ж�
	TI    =   0;  //���㴮�ڷ�������ж������־
	SBUF  =  data_to_tx;
	while(TI==0); //�ȴ��������
	TI    =   0;
	ES    =   1;  //�������ж�
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


//��ĳ��IO�ܽ�������ߵ͵�ƽ����LDE������
//��������߲���Ҫ��һ���裬����ȥ�����Ӷ�����ʶ�������������������ʱ
void OutputIO(uint8 nRes)
{
	switch(nRes)
	{
	case 0:
	FlashLED(1);DS03=0;break;
	//KEY0=0; delay(60000); KEY0=1; break;
	case 1:
	FlashLED(1);DS03=1;break;
	//LED0=0; delay(60000); LED0=1; break;
	case 2:
	FlashLED(1);DS04=0;break;
	//KEY3=0; delay(60000); KEY3=1; break;
	case 3:
	FlashLED(1);DS04=1;break;	
	//LED1=0; delay(60000); LED1=1; break;
	case 4:
	FlashLED(1);DS05=0;break;
	//TP1=0; delay(60000); TP1=1; break;
	case 5:
	FlashLED(1);DS05=1;break;
	//P45=0; delay(60000); P45=1; break;
	case 6:
	FlashLED(1);DS06=0;break;
	//KEY1=0; delay(60000); KEY1=1; break;
	case 7:
	FlashLED(1);DS06=1;break;
	case 8:
	FlashLED(1);DS07=0;break;
	case 9:
	FlashLED(1);DS07=1;Send_getbacknum(9);break;
	case 10:
	FlashLED(1);DS08=0;Send_getbacknum(10);break;
	case 11:
	FlashLED(1);DS08=1;Send_getbacknum(11);break;
	case 12:
	FlashLED(1);DS09=0;Send_getbacknum(12);break;
	case 13:
    FlashLED(1);DS09=1;Send_getbacknum(13);break;
	//*******����������������*********//
	}
}