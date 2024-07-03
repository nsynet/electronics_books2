#include "hardware.h"
unsigned int a=0;
int Test_4096(){
int addr=0,data=0,i,Error=0;
extern void SP_SIOSendAWord(unsigned long int,unsigned int);
extern unsigned int SP_SIOReadAWord(unsigned long int);
// Initialize IOB0 as output for SCK, Set PortA to be output buffer low
unsigned int Ret=0x00ff;
	unsigned long int Addr=0;

	unsigned int a1=0;
	//_Low=0x01,Addr_High=00;
	System_Initial();

//	Addr = 0x0001;

	Ret=0x00ff;
	// Initial Flash  
	SP_SIOMassErase();
	Addr=0x0007fff0;

		SP_SIOSendAWord(Addr,Ret);
		a=SP_SIOReadAWord(Addr);
		a1=a;
      F_User_Init_Restore_IO();
      a=a1;
	    
	
}
