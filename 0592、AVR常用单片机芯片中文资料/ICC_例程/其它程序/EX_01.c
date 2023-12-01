#if defined(__PCM__)
#include <16F74.h>
#fuses XT,NOWDT,NOPROTECT//,NOLVP
#use delay(clock=4000000)
//#use rs232(baud=9600, xmit=PIN_C6, rcv=PIN_C7)  // Jumpers: 8 to 11, 7 to 12
#define SPI_CS   PIN_C3
#define SPI_CLK  PIN_C4
#define SPI_DATA PIN_C5
#endif
char  x[32] = {0x1E,0x12,0x12,0xFF,0x12,0x12,0x1E,0x00};
char  y[8]  = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};

void	HC595_Send(int8 dat){
      int8 i;
      output_low(SPI_CS);
      for(i=0;i<8;i++){
      output_low(SPI_CLK);
      if((dat&0x80)!=0)
            output_high(SPI_DATA);
      else
            output_low(SPI_DATA);
      dat <<= 1;
      output_high(SPI_CLK);
      }
      output_high(SPI_CS);
}

void  pctf_Send(){
	  int8 i;
	  for(i=0;i<8;i++){
	  		HC595_Send(x[i]);
	  		HC595_Send(x[8+i]);
	  		HC595_Send(x[16+i]);	  		
	  		HC595_Send(x[24+i]);
	  		output_d(y[i]);
	  		delay_us(800);	
	  		output_d(0);
	  }	  
}

//      ÓÒÒÆ´úÂë
void	LLL_conu(){
		int8 i;
		for(i=31;i>0;i--)
			x[i] = x[i-1];
		x[0] = 0;
}			

void  main(){
	  int8 i;
	  for(i=0;i<50;i++)
		  pctf_Send();
	  while(TRUE){
		  for(i=0;i<9;i++)
		  pctf_Send();
		  LLL_conu();
	  }   
}
