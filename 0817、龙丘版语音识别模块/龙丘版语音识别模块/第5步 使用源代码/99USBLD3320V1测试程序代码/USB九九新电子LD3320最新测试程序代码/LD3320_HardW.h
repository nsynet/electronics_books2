#ifndef __LD3320_HardW_H__
#define __LD3320_HardW_H__

//��дģʽ���ƣ�ѡ�ò��нӿ�
#define  Parallel_Interface	1
#define  Spi_Interface      0  


extern void LD_WriteReg( uint8 ulAddr, uint8 ucVal );
extern uint8 LD_ReadReg( uint8 ulAddr ); 
void LD_reset(void); 

//FLASH дһ�ֽ�����
extern void IO_Send_Byte(uint8 dataout);

#endif
