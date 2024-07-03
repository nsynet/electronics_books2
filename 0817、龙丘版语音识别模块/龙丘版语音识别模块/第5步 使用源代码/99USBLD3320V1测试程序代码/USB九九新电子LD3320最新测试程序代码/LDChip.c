
#include "STC10F08XE.H"
#include "config.h"
#include "LDChip.h"
#include "LD3320_HardW.H"


extern void          _nop_     (void);


uint32 nMp3StartPos=0;
uint32 nMp3Size=0;
uint32 nMp3Pos=0;
uint32 nCurMp3Pos=0;
uint8  idata nLD_Mode = LD_MODE_IDLE;
uint8 bMp3Play=0;
uint8 idata ucRegVal;
uint8 idata ucHighInt;
uint8 idata ucLowInt;
uint8 idata ucStatus;
uint8 idata ucSPVol=15; // MAX=15 MIN=0

extern uint8 idata nAsrStatus;

/**************************************************************** 
�������ƣ� delay 
��    �ܣ� ��ʱ������
��ڲ����� uldata 
����ֵ  �� ��
��    �ģ� 2010-2-1		 
****************************************************************/ 
void  delay(uint32 uldata)
{
	unsigned int j  =  0;
	unsigned int g  =  0;
	for (j=0;j<5;j++)
	{
		for (g=0;g<uldata;g++)
		{
			_nop_();
			_nop_();
			_nop_();
		}
	}
}

/**************************************************************** 
�������ƣ� LD_Init_Common 
��    �ܣ� LD3320 ͨ�ó�ʼ������
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_Init_Common()
{
	bMp3Play = 0;

	LD_ReadReg(0x06);  
    /* soft reset. */
	LD_WriteReg(0x1F, 0x1);
	delay( 10 );                
	LD_WriteReg(0x1F, 0x0);  
	delay( 10 );                
	
	LD_WriteReg(0x89, 0x03);  
	LD_WriteReg(0xCF, 0x43);   
	LD_WriteReg(0xCB, 0x02);
	
	/*PLL setting*/
	LD_WriteReg(0x11, LD_PLL_11);       
	LD_WriteReg(0x19, LD_PLL_19);   
	LD_WriteReg(0x1B, LD_PLL_1B);   
	LD_WriteReg(0x1D, LD_PLL_1D);
	LD_WriteReg(0x79, LD_LEDMTR_FREQ);
	LD_WriteReg(0xCD, 0x04);
	LD_WriteReg(0x17, 0x4c); 
	LD_WriteReg(0xB9, 0x00);
	LD_WriteReg(0xCF, 0x4f); 
}

/**************************************************************** 
�������ƣ� LD_Init_MP3 
��    �ܣ� LD3320 MP3���ܳ�ʼ��
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_Init_MP3()
{
	nLD_Mode = LD_MODE_MP3;
	LD_WriteReg(0xBD,0x02);
	LD_WriteReg(0x17, 0x48);

	LD_WriteReg(0x85, 0x52); 
	LD_WriteReg(0x8F ,0x00);  
	LD_WriteReg(0x81,0x00);
	LD_WriteReg(0x83,0x00);
	LD_WriteReg(0x8E,0xff);
	LD_WriteReg(0x8D,0xff);
    delay(1);
	LD_WriteReg(0x87,0xff);
	LD_WriteReg(0x89,0xff);	
	LD_WriteReg(0x22,0);    
	LD_WriteReg(0x23,0);
	LD_WriteReg(0x20,(uint8)2031);    
	LD_WriteReg(0x21,(uint8)((2031>>8)&0x07));
	LD_WriteReg(0x24, (uint8)1524);          
    LD_WriteReg(0x25, (uint8)((1524>>8)&0x07));
    LD_WriteReg(0x26,(uint8)1524);    
    LD_WriteReg(0x27,(uint8)((1524>>8)&0x07)); 
}

/**************************************************************** 
�������ƣ� LD_Init_ASR 
��    �ܣ� LD3320 ����ʶ���ʼ������
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_Init_ASR()
{
	nLD_Mode=LD_MODE_ASR_RUN;
	LD_WriteReg(0xBD,0x00);
	LD_WriteReg(0x17,0x48);

	delay( 10 );
	LD_WriteReg(0x1E,0x00);
    LD_WriteReg(0x19,0x3f); 
    LD_WriteReg(0x1D,0x1f);
	LD_WriteReg(0x1B,0x08);		

	LD_WriteReg(0x3C,0xf0);    
	LD_WriteReg(0x3E,7);

	LD_WriteReg(0x38,0xff);    
	LD_WriteReg(0x3A  ,7);
	
	LD_WriteReg(0x40, 8);          
	LD_WriteReg(0x42, 0);
	LD_WriteReg(0x44,8);    
	LD_WriteReg(0x46,0); 
	LD_WriteReg(0x1b,0x48);
	delay( 1 );
}


/**************************************************************** 
�������ƣ� ExtInt0Handler 
��    �ܣ� �������˷�ɼ��������������Ƿ�ʶ�����������������
           ��һ���ж��źš����жϳ���Ҫ���ݼĴ�����ֵ�����������
		   ȡBA �Ĵ�����ֵ������֪���м�����ѡ�𰸣���C5 �Ĵ�����
           �Ĵ��ǵ÷���ߡ��������ȷ�Ĵ𰸡����緢��Ϊ���Ϻ���
		   �����ɹ�ʶ����������ѡ������ôBA �Ĵ��������ֵ��1��
		   ��C5 �Ĵ������ֵ�Ƕ�Ӧ�ı���3��
		   �ڿ�ʼ���ſ��԰��������ݵ������������оƬ���ȵ�оƬ��
		   ����һ�κ�ᷢ���ж����󡣶��жϺ�����᲻�ϵ��������ݣ�
		   ֱ��FIFO_DATA װ�����������ݽ�������һ�γ���Ϳ�ʼ����
		   �Ƚ����ƣ�����ͨ��LD_ReloadMp3Data()�����������ݡ�����
		   LD3320оƬֻ��һֻ�ܽŸ����ж��������������һ�������
		   ��һ���ж���Ӧ��������2 ���жϡ�
��ڲ����� ��
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void ExtInt0Handler(void) interrupt 0  
{
	uint8 nAsrResCount=0;

	EX0=0;
	ET0=0;
	
	ucRegVal = LD_ReadReg(0x2B);
	ucHighInt = LD_ReadReg(0x29); 
	LD_WriteReg(0x29,0);

	ucLowInt=LD_ReadReg(0x02); 
	LD_WriteReg(0x02,0) ;
	if(nLD_Mode == LD_MODE_ASR_RUN)
	{
		if((ucRegVal & 0x10) &&LD_ReadReg(0xb2)==0x21 && LD_ReadReg(0xbf)==0x35)
		{
			nAsrResCount = LD_ReadReg(0xba);
			if(nAsrResCount>0 && nAsrResCount<4) 
			{
				nAsrStatus=LD_ASR_FOUNDOK;
			}
			else
		    {
				nAsrStatus=LD_ASR_FOUNDZERO;
			}	
		}
		else
		{
			nAsrStatus=LD_ASR_FOUNDZERO;
		}
			
		LD_WriteReg(0x2b, 0);
    	LD_WriteReg(0x1C,0);
		ET0=1;
		return;
	}
		
    if(LD_ReadReg(0xBA)&CAUSE_MP3_SONG_END)
    {
		LD_WriteReg(0x2B,LD_ReadReg(0x2B)&(~MASK_INT_SYNC));	
      	LD_WriteReg(0xBA, 0);	
		LD_WriteReg(0xBC,0x0);	
		bMp3Play=0;
		LD_WriteReg(0x08,1);
		delay(5);
      	LD_WriteReg(0x08,0);
		LD_WriteReg(0x33, 0);

		ET0=1;
		return ;
     }

	 if(nMp3Pos>=nMp3Size)
	{
		LD_WriteReg(0xBC,0x01);
		ucStatus = LD_ReadReg(0x02);
		ucStatus&=(~MASK_AFIFO_INT);
		LD_WriteReg(0x02, ucStatus);
		ucStatus=LD_ReadReg(0x29);
		ucStatus&=(~MASK_INT_FIFO);  
		LD_WriteReg(0x29,ucStatus|MASK_INT_SYNC) ;
		EX0=1;
		ET0=1;

		return;	
	}

	LD_ReloadMp3Data();
		
	LD_WriteReg(0x29,ucHighInt); 
	LD_WriteReg(0x02,ucLowInt) ;

	delay(10);
	EX0=1;
	ET0=1;

}

/**************************************************************** 
�������ƣ� LD_Play 
��    �ܣ� LD-MP3����
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_Play()
{
	nMp3Pos=0;
	bMp3Play=1;

	LD_WriteReg(0x1B, LD_ReadReg(0x1B)|0x08);	
	if (nMp3Pos >=  nMp3Size)
		return ; 

	LD_ReloadMp3Data();

    LD_WriteReg(0xBA, 0);
	LD_WriteReg(0x17,0x48);
	LD_WriteReg(0x33, 1);
	ucRegVal  =  LD_ReadReg(0x29);
	LD_WriteReg(0x29, ucRegVal|MASK_INT_FIFO);
	
	ucRegVal  =  LD_ReadReg(0x02);
	LD_WriteReg(0x02, ucRegVal|MASK_AFIFO_INT); 
	ucRegVal=LD_ReadReg(0x89);
	LD_WriteReg(0x89, ucRegVal | 0x0c);
	ucRegVal = (2& 0x03)<<2;//
	ucStatus=LD_ReadReg(0x85)&(~0x0c);
	LD_WriteReg(0x85, ucStatus | ucRegVal);

	EX0=1;

}

/**************************************************************** 
�������ƣ� LD_AdjustMIX2SPVolume 
��    �ܣ� ���ڲ������� ��������Ҫ�޸ļĴ���8E�� ������Ϊ16 ������
           4 λ�����Ʊ�ʾ����Χ��0-15�� ��������ʱ����(15-����ֵ) 
		   ����Ĵ���8E �ĵ�2-5 λ���������ֻ�������ȣ�Speaker����
		   �������Ͷ�������������޹ء�����ʵ�����ֻ�����������������
��ڲ����� val�������ȼ� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_AdjustMIX2SPVolume(uint8 val)
{
	ucSPVol = val;
	val = ((15-val)&0x0f) << 2;
	ucRegVal = LD_ReadReg(0x8E)&0xc3;  
	LD_WriteReg(0x8E, val | ucRegVal); 
	LD_WriteReg(0x87, 0x78); 
}

/**************************************************************** 
�������ƣ� LD_ReloadMp3Data 
��    �ܣ� LD����SpiЭ������FLASH������ ����Ҫ���ݲ�ͬӲ����������޸�
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_ReloadMp3Data()
{
	uint32 nCurMp3Pos;
	uint8 val;
	uint8 k;

	nCurMp3Pos = nMp3StartPos + nMp3Pos;
	FLASH_CS=1;
	FLASH_CLK=0;
	FLASH_CS=0;

	 IO_Send_Byte(W25P_FastReadData);   
	 IO_Send_Byte(((nCurMp3Pos & 0xFFFFFF) >> 16));  
	 IO_Send_Byte(((nCurMp3Pos & 0xFFFF) >> 8));
	 IO_Send_Byte(nCurMp3Pos & 0xFF);
	 IO_Send_Byte(0xFF);

	ucStatus = LD_ReadReg(0x06);
	while ( !(ucStatus&MASK_FIFO_STATUS_AFULL) && (nMp3Pos<nMp3Size) )
	{
		val=0;
		for(k=0;k<8;k++)
		{
			FLASH_CLK=0;
			val<<=1;
			FLASH_CLK=1;
			val|=FLASH_DO;
		}
		LD_WriteReg(0x01,val);

		nMp3Pos++;

		ucStatus = LD_ReadReg(0x06);
	}
	
	FLASH_CS=1;
	FLASH_CLK=0;

}

/**************************************************************** 
�������ƣ� LD_Check_AsrBusyFlag_b2 
��    �ܣ� ��ȡ0xB2 �Ĵ����ĺ�����������Ժ��ASR �����ǰ���ܹ�
           ��ȡ����ȷIdle ״̬��˵��оƬ�ڲ����ܳ����ˡ����������ԣ�
		   ��ʹ�õĵ�Դ��ѹ/�������ֲ��ȶ��нϴ󲨶�ʱ����С���ʻ�
		   ������������������������ʱ������Reset LD3320 оƬ����
		   ����������оƬ��
��ڲ����� �� 
����ֵ  �� flag���ɹ���־ 1: success. 
��    �ģ� 2010-2-1
****************************************************************/ 
uint8 LD_Check_ASRBusyFlag_b2()
{
	uint8 j;
	uint8 flag = 0;
	for (j=0; j<10; j++)
	{
		if (LD_ReadReg(0xb2) == 0x21)
		{
			flag = 1;
			break;
		}
		delay(10);		
	}
	return flag;
}

/**************************************************************** 
�������ƣ� LD_AsrStart 
��    �ܣ� LD����ASR����ʶ��
��ڲ����� �� 
����ֵ  �� ��
��    �ģ� 2010-2-1
****************************************************************/ 
void LD_AsrStart()
{
	LD_Init_Common();
	LD_Init_ASR();
}

/**************************************************************** 
�������ƣ� RunASR 
��    �ܣ�  ����LD3320����ʶ��
��ڲ����� �� 
����ֵ  �� 1Ϊ�ɹ�
��    �ģ� 2010-2-1
****************************************************************/ 
uint8 LD_AsrRun()
{
	LD_WriteReg(0x35, MIC_VOL);
	LD_WriteReg(0x1C, 0x09);
	LD_WriteReg(0xBD, 0x20);
	LD_WriteReg(0x08, 0x01);
	delay( 1 );
	LD_WriteReg(0x08, 0x00);
	delay( 1 );

	if(LD_Check_ASRBusyFlag_b2() == 0)
	{
		return 0;
	}

	LD_WriteReg(0xB2, 0xff);	
	LD_WriteReg(0x37, 0x06);
	delay( 5 );
	LD_WriteReg(0x1C, 0x0b);
	LD_WriteReg(0x29, 0x10);
	
	EX0=1;
	return 1;
}

/**************************************************************** 
�������ƣ� LD_AsrAddFixed 
��    �ܣ� LD3320 �����������
��ڲ����� �� 
����ֵ  �� 1Ϊ�ɹ�
��    �ģ� 2010-2-1
��    ע�� �����ʶ����������,���һЩ�������������մ���ʶ��
****************************************************************/ 
uint8 LD_AsrAddFixed()
{
	uint8 k, flag;
	uint8 nAsrAddLength;
	/*code char sRecog[26][26] = {"liu hao kai","liu hao guan","wu hao jian kai","wu hao jian guan","feng shan kai","feng shan guan","tai deng kai","tai deng guan","dian dong chuang kai", 
    	                        "dian dong chuang guan","zhao ming deng kai","zhao ming deng guan","dian dong chuang lian kai",
								"dian dong chuang lian guan","dian re qi kai","feng shan","tai deng","dian dong chuang",
								"dian dong chuang lian","zhao ming deng","gao ya guo guan","dian fan bao","en en","qing suo","la la la","dian deng"};
	code uint8 pCode[26] = {CODE_SIXK,CODE_SIXG,CODE_FIVK,CODE_FIVG,CODE_FSK, CODE_FSG, CODE_TDK, CODE_TDG, CODE_DDCK,CODE_DDCG,CODE_ZMDK,CODE_ZMDG,CODE_DDCLK,CODE_DDCLG,
							CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,CODE_ERROR,
							CODE_ERROR,CODE_ERROR};	  */
	code char sRecog[26][26] = {"feng shan kai","feng shan guan","tai deng kai","tai deng guan",
	                            "cha ji sheng","cha ji jiang","ting deng kai","ting deng guan",
								"fang deng kai","fang deng guan",
								"liu hao kai","liu hao guan","qi hao kai","qi hao guan",
								"ba hao	kai","ba hao guan","jiu hao kai","jiu hao guan",
								"dian dong chuang lian kai","dian dong chuang lian guan",
								"shi yi hao kai","shi yi hao guan",
								"dian dong chuang kai","dian dong chuang guan",
								"wo xi huan","wo hen xi huan"
	                             };
	code uint8 pCode[26] = {CODE_FSK,CODE_FSG,CODE_TDK,CODE_TDG,CODE_CJS, CODE_CJJ, CODE_TINGDENGK, CODE_TINGDENGG, 
	                        CODE_FANGDENGK,CODE_FANGDENGG,CODE_LIUHAOK,CODE_LIUHAOG,CODE_QIHAOK,CODE_QIHAOG,
							CODE_BAHAOK,CODE_BAHAOG,CODE_JIUHAOK,CODE_JIUHAOG,CODE_DDCLK,CODE_DDCLG,
							CODE_SHIYIHAOK,CODE_SHIYIHAOG,CODE_DDCK,CODE_DDCG,
							CODE_ERROR,CODE_ERROR};	
	flag = 1;
	for (k=0; k<26; k++)//k���ֵҪ��֮�仯
	{
			
		if(LD_Check_ASRBusyFlag_b2() == 0)
		{
			flag = 0;
			break;
		}
		
		LD_WriteReg(0xc1, pCode[k]);
		LD_WriteReg(0xc3, 0 );
		LD_WriteReg(0x08, 0x04);
		delay(1);
		LD_WriteReg(0x08, 0x00);
		delay(1);

		for (nAsrAddLength=0; nAsrAddLength<26; nAsrAddLength++)//nAsrAddLength���ֵҪ��֮�仯
		{
			if (sRecog[k][nAsrAddLength] == 0)
				break;
			LD_WriteReg(0x5, sRecog[k][nAsrAddLength]);
		}
		LD_WriteReg(0xb9, nAsrAddLength);
		LD_WriteReg(0xb2, 0xff);
		LD_WriteReg(0x37, 0x04);
	}
    return flag;
}


/**************************************************************** 
�������ƣ� LD_GetResult 
��    �ܣ� ��ȡʶ�������
��ڲ����� �� 
����ֵ  �� ��ȡ���ʶ����
��    �ģ� 2010-2-1
****************************************************************/ 
uint8 LD_GetResult()
{
	uint8 temp;
	temp = LD_ReadReg(0xc5 );
	if(temp<50)
		return temp;
	else  return CODE_ERROR;
}



