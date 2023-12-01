#ifndef FlashDef_H
#define FlashDef_H

sbit FLASH_CS=    P1 ^ 7;
sbit FLASH_CLK=   P1 ^ 3;
sbit FLASH_IO0=   P1 ^ 2;
sbit FLASH_IO1=   P1 ^ 6;
sbit FLASH_IO2=   P1 ^ 5;
sbit FLASH_IO3=   P1 ^ 4;

sbit FLASH_WP=    P1 ^ 5;
sbit FLASH_HOLD=  P1 ^ 4;
sbit FLASH_DO  =  P1 ^ 6;
sbit FLASH_DIO  = P1 ^ 2;

sbit DS01=P3^4;
sbit DS02=P3^5;
sbit BUZZ=P4^1;

sbit DS03=P4^0;
sbit DS04=P2^1;
sbit DS05=P2^2;
sbit DS06=P2^3;
sbit DS07=P2^4;
sbit DS08=P2^5;
sbit DS09=P2^7;

sbit KEYAJ1=P4^2;
sbit KEYAJ2=P4^3;
sbit KEYAJ3=P1^1;

#define W25P_FastReadData 0x0B

void IO_Send_Byte(uint8 dataout);

#endif
