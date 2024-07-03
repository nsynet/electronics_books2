/*
文件名：LD3320_HardW.C
描  述：用于实现LD3320底层硬件驱动
*/
#include "STC10F08XE.H"
#include "config.h"
#include "LD3320_HardW.H"

sbit A0=P2^0;	   //8位
sbit CSB=P2^6;	   //14位  
sbit WRB=P3^6;
sbit RD=P3^7;
//sbit	LD_MODE	= P1^0;
#define DATA P0
extern void          _nop_     (void);
extern void  delay(uint32 uldata);

#define DELAY_NOP _nop_();_nop_();_nop_();

#if (Parallel_Interface)
/*
由时序图可以看到，A0负责通知芯片是数据段还是地址段。A0为高时是地
址，而A0为低时是数据。发送地址时CSB*和WRB*必须有效，写数据时同样
CSB*和WRB*必须有效，而读数据时CSB*和RDB*必须有效。

在实验板上，利用MCU 自己的读写时序特征，可以很方便地读写LD芯片的
寄存器。在现有连接中，MCU 的A14 连接到LD 芯片的CSB*，而MCU的A8连
接到LD 芯片的A0。
8100: 第14 位=1 第8 位=1 
8000: 第14 位=1 第8 位=0 
于是MCU 向LD 芯片的CSB*和A0 发出信号，配合此时的数据线，可以对LD 
芯片的寄存器进行读写操作，十分方便。第15 位=1 是为了避开低端地址。 
并行方式的读写函数为： 
*/
#define LD_INDEX_PORT (*((volatile uint8 xdata*)(0x8100))) 
#define LD_DATA_PORT (*((volatile uint8 xdata*)(0x8000))) 
/**************************************************************** 
函数名称： LD_WriteReg 
功    能： 根据并行接口写数据
入口参数： ulAddr,地址；ucVal，数据 
返回值  ： 无
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
函数名称： LD_ReadReg 
功    能： 根据并行接口写数据
入口参数： ulAddr,地址 
返回值  ： 读取端口数据
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
//对外接口封装使其统一
#define LD_WriteReg(ulAddr, ucVal ) LD_SPI_WriteReg(ulAddr, ucVal)
#define	LD_ReadReg(ulAddr) LD_SPI_ReadReg(ulAddr) 
sbit SCS=P2^6; //芯片片选信号
sbit SDCK=P0^2; //SPI 时钟信号
sbit SDI=P0^0; //SPI 数据输入
sbit SDO=P0^1; //SPI 数据输出
sbit SPIS=P3^6; //SPI 模式设置：低有效。

/**************************************************************** 
函数名称： LD_SPI_WriteReg 
功    能： 根据SPI 接口写数据
入口参数： address,地址；dataout，写入数据
返回值  ： 无
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
函数名称： LD_SPI_ReadReg 
功    能： 根据SPI 接口写数据
入口参数： address,地址
返回值：   读取数据
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
函数名称： LD_reset 
功    能： LD3320 复位操作
入口参数： 无 
返回值  ： 无
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
函数名称： IO_Send_Byte 
功    能： FLASH发送一字节数据
入口参数： 无 
返回值  ： 无
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
