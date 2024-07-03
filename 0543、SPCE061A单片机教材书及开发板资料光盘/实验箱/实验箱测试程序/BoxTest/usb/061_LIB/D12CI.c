//============================================================================//
// 文件名:    D12CI.c
// 描  述：   PDIUSBD12命令接口
// 日  期：   2003/04/03
//=============================================================================//
#include "D12CI.h"
#include "chap9.h"  
#define D12_FULLEMPTY			0x01
extern EPPFLAGS bEPPflags;
extern CONTROL_TRANSFERS ControlData;
extern void F_InitWriteD12(void);
extern void F_InitReadD12(void);
extern void F_WriteCmdOrDataToD12(unsigned int D_or_C_Addr,unsigned int Data_or_Command);
extern unsigned int F_ReadD12(unsigned int D_Addr);
void F_Disconnect_USB(void);
void F_Connect_USB(void);
void F_Reconnect_USB(void);

//void F_D12_SendResume(void);
void F_D12_SetAddressEnable(unsigned int bAddress, unsigned int bEnable)
{
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00D0);
	if(bEnable)
		bAddress |= 0x80;
    F_WriteCmdOrDataToD12(0xff02,bAddress);
}

void F_D12_SetEndpointEnable(unsigned int bEnable)
{
 	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00D8);
	if(bEnable)
		F_WriteCmdOrDataToD12(0xff02,0x0001);
	else
	    F_WriteCmdOrDataToD12(0xff02,0x0001);
}
void F_D12_SetMode(unsigned int bConfig, unsigned int bClkDiv)
{
 	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F3);
 	F_WriteCmdOrDataToD12(0xff02,bConfig);
 	F_WriteCmdOrDataToD12(0xff02,bClkDiv);
}
void F_D12_SetDMA(unsigned int bMode)
{
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00FB);
 	F_WriteCmdOrDataToD12(0xff02,bMode);
}
void F_D12_SetEndpointStatus(unsigned int bEndp, unsigned int bStalled)
{
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x40 + bEndp);
    F_WriteCmdOrDataToD12(0xff02,bStalled);

}
unsigned int F_D12_WriteEndpoint(unsigned int endp, unsigned int len, unsigned int * buf)
{
	unsigned int i;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,endp);
    F_InitReadD12();
	F_ReadD12(0xff02);
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F0);
	F_WriteCmdOrDataToD12(0xff02,0x0000);
	F_WriteCmdOrDataToD12(0xff02,len);
	for(i=0; i<len; i++)
	{
		F_WriteCmdOrDataToD12(0xff02,*(buf+i));
	}
	F_WriteCmdOrDataToD12(0xff03,0x00FA);
	return len;
}
void F_D12_AcknowledgeEndpoint(unsigned int endp)
{
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,endp);
	F_WriteCmdOrDataToD12(0xff03,0x00F1);
	if(endp == 0)
		F_WriteCmdOrDataToD12(0xff03,0x00F2);
}
unsigned int F_D12_ReadInterruptRegister(void)
{
	unsigned int b1,j;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F4);
	F_InitReadD12();
	b1 = F_ReadD12(0xff02);
    j = F_ReadD12(0xff02);
	j <<= 8;
	j += b1;
	return j;
}
unsigned int F_D12_ReadLastTransactionStatus(unsigned int bEndp)
{
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x40 + bEndp);
	F_InitReadD12();
	return F_ReadD12(0xff02);
}
unsigned int F_D12_ReadEndpoint(unsigned int endp, unsigned int len, unsigned int * buf)
{
	unsigned int i, j;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,endp);
	F_InitReadD12();
	if((F_ReadD12(0xff02) & D12_FULLEMPTY) == 0)
	{	
		return 0;
	}
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F0);
	F_InitReadD12();
	j = F_ReadD12(0xff02);
	j = F_ReadD12(0xff02);
	if(j > len)
		j = len;
	for(i=0; i<j; i++)
		*(buf+i) = F_ReadD12(0xff02);
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F2);
	return j;
}
unsigned int F_D12_SelectEndpoint(unsigned int bEndp)
{
	unsigned int c;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,bEndp);
	F_InitReadD12();
	c = F_ReadD12(0xff02);
	return c;
}
void F_Disconnect_USB(void)
{
	F_D12_SetMode(D12_NOLAZYCLOCK, D12_SETTOONE | D12_CLOCK_4M);
}
void F_Connect_USB(void)
{          
	F_D12_SetDMA(D12_ENDP4INTENABLE | D12_ENDP5INTENABLE); 
	F_D12_SetMode(D12_NOLAZYCLOCK | D12_SOFTCONNECT,D12_SETTOONE | D12_CLOCK_4M );
}
void F_Reconnect_USB(void)
{
	int i,j;
	F_Disconnect_USB();
 	for(i=0;i<=10;i++)
    {
		for(j=0;j<40;j++)
		{
         
		};
	};
	F_Connect_USB();
}


unsigned int F_D12_ReadEndpointAndClrD12Int(unsigned int endp, unsigned int len, unsigned int * buf)
{
	unsigned int I_DataLength=0,i=0;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,endp);
	F_InitReadD12();
	if((F_ReadD12(0xff02) & D12_FULLEMPTY) == 0)
	{	
		return 0;
	}
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F0);
	F_InitReadD12();
	I_DataLength = F_ReadD12(0xff02);
	I_DataLength = F_ReadD12(0xff02);
	if(I_DataLength > len)
		I_DataLength = len;
	for(i=0; i<I_DataLength; i++)
		*(buf+i) = F_ReadD12(0xff02);
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F2);
	//clear d12 interrupt
	F_D12_ReadLastTransactionStatus(endp);
	return I_DataLength;
}
unsigned int F_D12_WriteEndpointAndClrD12Int(unsigned int endp, unsigned int len, unsigned int * buf)
{
	unsigned int i;
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,endp);
    F_InitReadD12();
	F_ReadD12(0xff02);
	F_InitWriteD12();
	F_WriteCmdOrDataToD12(0xff03,0x00F0);
	F_WriteCmdOrDataToD12(0xff02,0x0000);
	F_WriteCmdOrDataToD12(0xff02,len);
	for(i=0; i<len; i++)
	{
		F_WriteCmdOrDataToD12(0xff02,*(buf+i));
	}
	F_WriteCmdOrDataToD12(0xff03,0x00FA);
	//clear d12 interrupt
	F_D12_ReadLastTransactionStatus(endp);	
	return len;
}