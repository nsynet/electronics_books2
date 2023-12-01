//*********************【 NEC解码头文件 】*******************
//
//     简介：本程序适用于NCE解码：（9ms+4.5ms）引导码+32位编码。
//           兼容STC所有型号（包括 1T 和 12T 系列），可以定义任意I/O作红外接收脚，
//			 自适应解码主频：6MHz ~ 40MHz。
// 
// 使用条件：占用系统定时器0，开启定时器0中断（如使用其它定时器请自改IR_Init();初始化函数）
// 
// 使用说明：填相关宏定义：USER_H、USER_L、Check_EN、CPU_Fosc、IR，
//           上电初始化函数IR_Init()，
//           在定时器0中断中调用IR_NEC()解码函数，
//           解码有效时，IR_BT=2即短按，IR_BT=3即长按，由用户清0，
//           解码存放：用户码高8位NEC[0]，用户码低8位NEC[1]，操作码NEC[2]，操作码反码NEC[3]。
//
//【供用户调用的函数】
//    IR_Init();			 //接收初始化，开启定时器0中断400us
//    IR_NEC();			     //红外线解码（解NEC编码）
//	  
//***************************************************************/ 
#ifndef __IR_NEC_H__
#define __IR_NEC_H__


//【用户必填项：USER_H、USER_L、Check_EN、CPU_Fosc、IR】
#define  USER_H     0x80			 //用户码高8位
#define  USER_L     0x7F			 //用户码低8位
#define  Check_EN   0			     //是否要校验16位用户码：不校验填0，校验则填1	
#define  CPU_Fosc   6000000	    	 //输入主频，自适应解码（单位：Hz，范围：6MHz ~ 40MHz）
#define  CA_S       8			     //长按时间设置，单位：108mS（即 108mS整数倍，10倍以上为宜）

sbit IR = P3^3;	 	                 //红外线接口（任意引脚） 

#define  Step       400			     //红外采样步长：400us
#define  TH_H       ((65536-Step*(CPU_Fosc/300)/40000)/256)  //定时器高8位基准赋值
#define  TH_L       ((65536-Step*(CPU_Fosc/300)/40000)%256)  //定时器低8位基准赋值

uint8   IR_BT;		         //解码效果返回：0无效，1有效，2短按，3长按
uint8   NEC[4];		         //解码存放：16位用户码、操作码正反码
uint8   cntCA;		         //长按计数
uint16  cntStep;			 //步数计
bit     IRa,IRb;			 //电位状态保存
bit     IRsync;				 //同步标志
uint8   BitN;                //位码装载数


/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
函数：红外线解码初始化
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈*/
void IR_Init()
{
 	TMOD = 0x21;	   //定时器0：16位定时器
 	TL0 = TH_L;	       //每步时间
	TH0 = TH_H;
	ET0 = 1;
	EA  = 1;
	TR0 = 1;
/*--------波特率有关----1200--------*/
	SCON = 0x50;
    TH1 = 0xF3;
    TL1 = TH1;
    PCON = 0x80;
    TR1 = 1;
}

/*┈┈┈┈┈┈┈┈┈┈ 基准 ┈┈┈┈┈┈┈┈┈┈┈*/
#define    Boot_Limit	    (((9000+4500) +2000)/Step)	  //引导码周期上限    
#define    Boot_Lower	    (((9000+4500) -2000)/Step)	  //引导码周期下限    
#define    Bit1_Limit       ((2250 +800)/Step)	          //“1”周期上限
#define    Bit0_Limit       ((1125 +400)/Step)			  //“0”周期上限
/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
函数：红外线NEC周期采样解码法（定时中断，下降沿查询周期时间）
全局变量：IR_BT = 0无效
                  1有效，待继续判断长、短按（如不需要判断长、短按，则直接使用）
			      2短按
			      3长按
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈*/
void IR_NEC()
{ 	 
	TL0 = TH_L;	       //重赋值
	TH0 = TH_H;	

	cntStep++;		   //步数采样
	if(IR_BT==1)if(cntStep>300)IR_BT=2;//解码有效后，如果无长按，120ms（400us×300）后默认短按

	IRb = IRa;		   //上次电位状态
	IRa = IR;		   //当前电位状态
	
	if(IRb && !IRa)				  	  //是否下降沿（上次高，当前低）
	{
		if(cntStep > Boot_Limit)      //超过同步时间？
		{	
		    if(IR_BT==1)if(++cntCA>CA_S)IR_BT=3; //解码有效后，继续按住遥控>CA_S即长按
			IRsync=0;				  //同步位清0
		}
		else if(cntStep > Boot_Lower){ IRsync=1; BitN=32; }//同步位置1，装载位码数			  
		else if(IRsync)				                       //如果已同步
		{
			if(cntStep > Bit1_Limit)IRsync=0;	           
			else
			{	
				NEC[3] >>= 1;				
				if(cntStep > Bit0_Limit)NEC[3] |= 0x80;    //“0”与“1”
                if(--BitN == 0)				
				{
					IRsync = 0;				     //同步位清0
		            #if (Check_EN == 1)					
					if((NEC[0]==USER_H)&&(NEC[1]==USER_L)&&(NEC[2]==~NEC[3])) //校验16位用户码、操作码正反码
				 	{  IR_BT=1; cntCA=0;  }	     //解码有效，接下来判断：短按？长按？
					#else
					if(NEC[2]==~NEC[3]){ IR_BT=1; cntCA=0; } //校验操作码正反码
					#endif					
				}
				else if((BitN & 0x07)== 0)       //NEC[3]每装满8位，移动保存一次（即 BitN%8 == 0）
				{	NEC[0]=NEC[1]; NEC[1]=NEC[2]; NEC[2]=NEC[3];   }
			}
		}
		cntStep = 0;   //步数计清0
	}
} 

//取消相关宏定义
#undef CPU_Fosc 

#endif