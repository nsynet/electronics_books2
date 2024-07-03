#ifndef LD_CHIP_H
#define LD_CHIP_H


#define LD_MODE_IDLE		0x00
#define LD_MODE_ASR_RUN		0x08
#define LD_MODE_MP3		 	0x40

#define LD_ASR_NONE				0x00
#define LD_ASR_RUNING			0x01
#define LD_ASR_FOUNDOK			0x10
#define LD_ASR_FOUNDZERO 		0x11
#define LD_ASR_ERROR	 		0x31


#define CLK_IN   		22.1184	/* user need modify this value according to clock in */
#define LD_PLL_11		(uint8)((CLK_IN/2.0)-1)
#define LD_PLL_1D   	(uint8)(((180.0*((LD_PLL_11)+1))/(CLK_IN))-1)
#define LD_PLL_19		0x1f
#define LD_PLL_1B		0x40
#define LD_LEDMTR_FREQ  (uint8)((CLK_IN*1000000/8)/12700)

// LD chip fixed values.
#define        RESUM_OF_MUSIC               0x01
#define        CAUSE_MP3_SONG_END           0x20

#define        MASK_INT_SYNC				0x10
#define        MASK_INT_FIFO				0x04
#define    	   MASK_AFIFO_INT				0x01
#define        MASK_FIFO_STATUS_AFULL		0x08
#define        MASK_ADPCM_START				0x01


#define LD_INDEX_PORT		(*((volatile uint8 xdata*)(0x8100))) 
#define LD_DATA_PORT		(*((volatile uint8 xdata*)(0x8000))) 



#define CODE_FSK	    1
#define CODE_FSG	    2
#define CODE_TDK	    3
#define CODE_TDG	    4
#define CODE_CJS	    5
#define CODE_CJJ	    6   
#define CODE_TINGDENGK		7
#define CODE_TINGDENGG		8
#define	CODE_FANGDENGK		9
#define	CODE_FANGDENGG		10
#define CODE_LIUHAOK       11
#define CODE_LIUHAOG       12
#define CODE_QIHAOK       13
#define CODE_QIHAOG       14
#define CODE_BAHAOK       15
#define CODE_BAHAOG       16
#define CODE_JIUHAOK       17
#define CODE_JIUHAOG       18
#define CODE_DDCLK       19
#define CODE_DDCLG       20
#define CODE_SHIYIHAOK       21
#define CODE_SHIYIHAOG       22
#define CODE_DDCK       23
#define CODE_DDCG       24

		 

#define CODE_ERROR		50



#define MIC_VOL 0x43


void LD_WriteReg( uint8 ulAddr, uint8 ucVal );
uint8 LD_ReadReg( uint8 ulAddr );
void LD_reset();

void LD_Init_Common();
void LD_Init_MP3();
void LD_Init_ASR();

void LD_Play();
void LD_AdjustMIX2SPVolume(uint8 value);
void LD_ReloadMp3Data();
void LD_ReloadMp3Data_Online();

uint8 LD_ProcessAsr(uint32 RecogAddr);
void LD_AsrStart();
uint8 LD_AsrRun();
uint8 LD_AsrAddFixed();
uint8 LD_GetResult();

void LD_ReadMemoryBlock(uint8 dev, uint8 * ptr, uint32 addr, uint8 count);
void LD_WriteMemoryBlock(uint8 dev, uint8 * ptr, uint32 addr, uint8 count);

extern uint32 nMp3StartPos;
extern uint32 nMp3Size;
extern uint32 nMp3Pos;
extern uint8 bMp3Play;
extern uint8 idata  nLD_Mode;
extern void  delay(uint32 uldata);

#endif
