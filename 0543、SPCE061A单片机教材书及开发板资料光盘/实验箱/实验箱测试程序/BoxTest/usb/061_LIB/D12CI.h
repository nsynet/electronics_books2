#ifndef	__D12CI_H__
#define	__D12CI_H__
//	write your header here
#define D12_NOLAZYCLOCK			0x02
#define D12_CLOCKRUNNING  	    0x04
#define D12_INTERRUPTMODE		0x08
#define D12_SOFTCONNECT			0x10
#define D12_ENDP_NONISO			0x00
#define D12_ENDP_ISOOUT			0x40
#define D12_ENDP_ISOIN			0x80
#define D12_ENDP_ISOIO			0xC0
#define D12_CLOCK_12M			0x03
#define D12_CLOCK_4M			0x0b
#define D12_SETTOONE   		    0x40
#define D12_SOFONLY			    0x80

#define D12_DMASINGLE			0x00
#define D12_BURST_4				0x01
#define D12_BURST_8				0x02
#define D12_BURST_16			0x03
#define D12_DMAENABLE     	    0x04
#define D12_DMA_INTOKEN			0x08
#define D12_AUTOLOAD			0x10

//==============================================
#define D12_NORMALPLUSSOF		0x20
#define D12_ENDP4INTENABLE		0x40
#define D12_ENDP5INTENABLE		0x80	

#define D12_INT_ENDP0OUT		(unsigned int)0x01
#define D12_INT_ENDP0IN			(unsigned int)0x02
#define D12_INT_ENDP1OUT		(unsigned int)0x04
#define D12_INT_ENDP1IN			(unsigned int)0x08
#define D12_INT_ENDP2OUT		(unsigned int)0x10
#define D12_INT_ENDP2IN			(unsigned int)0x20
#define D12_INT_BUSRESET		(unsigned int)0x40
#define D12_INT_SUSPENDCHANGE	(unsigned int)0x80
#define D12_INT_EOT			    (unsigned int)0x0100

#define D12_SETUPPACKET			0x20
#define D12_BUFFER0FULL			0x20
#define D12_BUFFER1FULL			0x40
#define D12_FULLEMPTY			0x01
#define D12_STALL				0x02

#define D12_COMMAND				0x0ff03
#define D12_DATA				0x0ff02
//--------------------------------------------------------------------------------------
void F_D12_SetDMA(unsigned int bMode);
void F_D12_AcknowledgeEndpoint(unsigned int endp);
void F_D12_SetEndpointEnable(unsigned int bEnable);
void F_D12_SetMode(unsigned int bConfig, unsigned int bClkDiv);
void F_D12_SetAddressEnable(unsigned int bAddress, unsigned int bEnable);
void F_D12_SetEndpointStatus(unsigned int bEndp, unsigned int bStalled);
unsigned int F_D12_ReadInterruptRegister(void);
unsigned int F_D12_SelectEndpoint(unsigned int bEndp);
unsigned int F_D12_ReadLastTransactionStatus(unsigned int bEndp);
unsigned int F_D12_ReadEndpoint(unsigned int endp, unsigned int len, unsigned int * buf);
unsigned int F_D12_WriteEndpoint(unsigned int endp, unsigned int len, unsigned int * buf);

unsigned int F_D12_ReadEndpointAndClrD12Int(unsigned int endp, unsigned int len, unsigned int * buf);
unsigned int F_D12_WriteEndpointAndClrD12Int(unsigned int endp, unsigned int len, unsigned int * buf);
#endif
