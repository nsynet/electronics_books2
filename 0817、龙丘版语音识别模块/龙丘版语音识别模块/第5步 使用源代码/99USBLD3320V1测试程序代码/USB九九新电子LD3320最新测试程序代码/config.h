#ifndef __CONFIG_H__
#define __CONFIG_H__

#define debug
#define Fclk      22118400UL		 /*使用11.0592M晶体*/  //11059200UL//
#define BitRate   9600UL		     /*波特率定义为9600*/
//数据类型定义
typedef unsigned long uint32;
typedef unsigned int  uint16;
typedef unsigned char uint8;

//FLASH W25P40硬件接口 
sbit FLASH_CS  =   P1 ^ 7;
sbit FLASH_CLK =   P1 ^ 3;
sbit FLASH_IO0 =   P1 ^ 2;
sbit FLASH_IO1 =   P1 ^ 6;
sbit FLASH_IO2 =   P1 ^ 5;
sbit FLASH_IO3 =   P1 ^ 4;

sbit FLASH_WP   =  P1 ^ 5;
sbit FLASH_HOLD =  P1 ^ 4;
sbit FLASH_DO   =  P1 ^ 6;
sbit FLASH_DIO  =  P1 ^ 2;

//LD3320复位脚位
sbit RSTB = P3^3;

#define W25P_FastReadData 0x0B


//enum NLD_Mode{LD_MODE_ASR_RUN,LD_MODE_MP3}nLD_Mode;
//enum NAsrStatus{LD_ASR_RUNING,LD_ASR_FOUNDOK,LD_ASR_FOUNDZERO}nAsrStatus;
#endif