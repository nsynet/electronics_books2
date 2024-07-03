/*
�ļ�����LD3320_HardW.C
��  ��������ʵ��LD3320�ײ�Ӳ������
*/
#include "STC10F08XE.H"
#include "config.h"
#include "LD3320_HardW.H"

sbit A0=P2^0;	   //8λ
sbit CSB=P2^6;	   //14λ  
sbit WRB=P3^6;
sbit RD=P3^7;
//sbit	LD_MODE	= P1^0;
#define DATA P0
extern void          _nop_     (void);
extern void  delay(uint32 uldata);

#define DELAY_NOP _nop_();_nop_();_nop_();

#if (Parallel_Interface)
/*
��ʱ��ͼ���Կ�����A0����֪ͨоƬ�����ݶλ��ǵ�ַ�Ρ�A0Ϊ��ʱ�ǵ�
ַ����A0Ϊ��ʱ�����ݡ����͵�ַʱCSB*��WRB*������Ч��д����ʱͬ��
CSB*��WRB*������Ч����������ʱCSB*��RDB*������Ч��

��ʵ����ϣ�����MCU �Լ��Ķ�дʱ�����������Ժܷ���ض�дLDоƬ��
�Ĵ����������������У�MCU ��A14 ���ӵ�LD оƬ��CSB*����MCU��A8��
�ӵ�LD оƬ��A0��
8100: ��14 λ=1 ��8 λ=1 
8000: ��14 λ=1 ��8 λ=0 
����MCU ��LD оƬ��CSB*��A0 �����źţ���ϴ�ʱ�������ߣ����Զ�LD 
оƬ�ļĴ������ж�д������ʮ�ַ��㡣��15 λ=1 ��Ϊ�˱ܿ��Ͷ˵�ַ�� 
���з�ʽ�Ķ�д����Ϊ�� 
*/
#define LD_INDEX_PORT (*((volatile uint8 xdata*)(0x8100))) 
#define LD_DATA_PORT (*((volatile uint8 xdata*)(0x8000))) 
/**************************************************************** 
�������ƣ� LD_WriteReg 
��    �ܣ� ���ݲ��нӿ�д����
��ڲ����� ulAddr,��ַ��ucVal������ 
����ֵ  �� ��
****************************************************************/ 
void LD_WriteReg( uint8 ulAddr, uint8 ucVal ) 
{ 
	//LD_INDEX_PORT = ulAddr; 
	//LD_DATA_PORT = ucVal;
	A0=1;
	CSB=0;
	WRB=0;
	RD=1;
	DATA=ulAddr;
	;;;;;
	WRB=1;
    A0=0;
	CSB=1;
	DATA=ucVal;
	CSB=0;
	WRB=0;
	;;;
	A0=1;
	CSB=0;
	WRB=1;	 
}

/**************************************************************** 
�������ƣ� LD_ReadReg 
��    �ܣ� ���ݲ��нӿ�д����
��ڲ����� ulAddr,��ַ 
����ֵ  �� ��ȡ�˿�����
****************************************************************/ 
unsigned char  LD_ReadReg( uint8 ulAddr ) 
{ 
//	LD_INDEX_PORT = ulAddr; 
//	return (uint8)LD_DATA_PORT;
	unsigned char redata; 
	DATA=ulAddr;
	A0=1;
	CSB=0;
	WRB=0;
	DELAY_NOP;

	WRB=1;
	CSB=1;
	DELAY_NOP;

	A0=0;
	CSB=0;
	RD=0;
	DELAY_NOP;

	redata=DATA;
	RD=1;
	CSB=1;
	DELAY_NOP;	 
	return redata;  
} 
#elif  Spi_Interface
//����ӿڷ�װʹ��ͳһ
#define LD_WriteReg(ulAddr, ucVal ) LD_SPI_WriteReg(ulAddr, ucVal)
#define	LD_ReadReg(ulAddr) LD_SPI_ReadReg(ulAddr) 
sbit SCS=P2^6; //оƬƬѡ�ź�
sbit SDCK=P0^2; //SPI ʱ���ź�
sbit SDI=P0^0; //SPI ��������
sbit SDO=P0^1; //SPI �������
sbit SPIS=P3^6; //SPI ģʽ���ã�����Ч��

/**************************************************************** 
�������ƣ� LD_SPI_WriteReg 
��    �ܣ� ����SPI �ӿ�д����
��ڲ����� address,��ַ��dataout��д������
����ֵ  �� ��
****************************************************************/ 
void LD_SPI_WriteReg(uint8 address,uint8 dataout) 
{ 
	uint8 i = 0; 
	uint8 command=0x04; 
	SPIS =0; 
	SCS = 0; 
	//write command 
	for (i=0;i < 8; i++) 
	{ 
		if ((command & 0x80) == 0x80) 
			SDI = 1; 
		else 
			SDI = 0; 
		delay(1); 
		SDCK = 0; 
		command = (command << 1); 
		SDCK = 1; 
	} 
	//write address 
	for (i=0;i < 8; i++) 
	{ 
		if ((address & 0x80) == 0x80) 
			SDI = 1; 
		else 
			SDI = 0; 
		delay(1); 
		SDCK = 0; 
		address = (address << 1); 
		SDCK = 1; 
	} 
	//write data 
	for (i=0;i < 8; i++) 
	{ 
		if ((dataout & 0x80) == 0x80) 
			SDI = 1; 
		else 
			SDI = 0; 
		delay(1); 
		SDCK = 0; 
		dataout = (dataout << 1); 
		SDCK = 1; 
	} 
	SCS = 1; 
} 
/**************************************************************** 
�������ƣ� LD_SPI_ReadReg 
��    �ܣ� ����SPI �ӿ�д����
��ڲ����� address,��ַ
����ֵ��   ��ȡ����
****************************************************************/ 
uint8 LD_SPI_ReadReg(uint8 address) 
{ 
	uint8 i = 0; 
	uint8 in =0 ; 
	uint8 temp = 0; 
	uint8 command=0x05; 
	SPIS =0; 
	SCS = 0; 
	//write command 
	for (i=0;i < 8; i++) 
	{ 
		if ((command & 0x80) == 0x80) 
			SDI = 1; 
		else 
			SDI = 0; 
		delay(1); 
		SDCK = 0; 
		command = (command << 1); 
		SDCK = 1; 
	} 
	//write address 
	for (i=0;i < 8; i++) 
	{ 
		if ((address & 0x80) == 0x80) 
			SDI = 1; 
		else 
			SDI = 0; 
		delay(1); 
		SDCK = 0; 
		address = (address << 1); 
		SDCK = 1; 
	} 
	//Read data 
	for (i=0;i < 8; i++) 
	{ 
		in = (in << 1); 
		temp = SDO; 
		SDCK = 0; 
		if (temp == 1) 
			in |= 0x01; 
		SDCK = 1; 
	} 
	SCS = 1; 
	return in; 
} 
#endif

/**************************************************************** 
�������ƣ� LD_reset 
��    �ܣ� LD3320 ��λ����
��ڲ����� �� 
����ֵ  �� ��
****************************************************************/ 
void LD_reset(void) 
{ 
	RSTB =1; 
	delay(1); 
	RSTB =0; 
	delay(1); 
	RSTB =1; 
}

/**************************************************************** 
�������ƣ� IO_Send_Byte 
��    �ܣ� FLASH����һ�ֽ�����
��ڲ����� �� 
����ֵ  �� ��
****************************************************************/ 
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
