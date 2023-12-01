/********************************************************
                   http://www.sl.com.cn
         双龙电子公司----双音频信号(DTMF)演示程序
		 键盘布置图：
		             1 2 3 A--PB4
		             4 5 6 B--PB5
					 7 8 9 C--PB6
					 * 0 # D--PB7
					 | | | |
					 P P P P
					 B B B B
					 0 1 2 3
		 喇叭接线图：PD5(OC1A)--1K电阻--喇叭			 
********************************************************/ 
#include <io8515.h>
#include <macros.h>
#define  Xtal       8000000          // 系统时钟频率
#define  prescaler  1                // T1预分频系数
#define  N_samples  128              // 在查找表中的样本数
#define  Fck        Xtal/prescaler   // T1工作频率
#define  delaycyc   10               // 读取port C口延时循环数
#pragma interrupt_handler ISR_T1_Overflow:7
/*************************** 正弦表 *****************************
       样本表: 一个周期分成128个点，每点按7位进行量化
****************************************************************/
flash unsigned char auc_SinParam [128] = {
64,67,
70,73,
76,79,
82,85,
88,91,
94,96,
99,102,
104,106,
109,111,
113,115,
117,118,
120,121,
123,124,
125,126,
126,127,
127,127,
127,127,
127,127,
126,126,
125,124,
123,121,
120,118,
117,115,
113,111,
109,106,
104,102,
99,96,
94,91,
88,85,
82,79,
76,73,
70,67,
64,60,
57,54,
51,48,
45,42,
39,36,
33,31,
28,25,
23,21,
18,16,
14,12,
10,9,
7,6,
4,3,
2,1,
1,0,
0,0,
0,0,
0,0,
1,1,
2,3,
4,6,
7,9,
10,12,
14,16,
18,21,
23,25,
28,31,
33,36,
39,42,
45,48,
51,54,
57,60};

//***************************  x_SW  *************************
//   x_SW 表(8倍): x_SW = ROUND(8*N_samples*f*510/Fck)
//************************************************************

//高频(列)
//1209hz  ---> x_SW = 79
//1336hz  ---> x_SW = 87
//1477hz  ---> x_SW = 96
//1633hz  ---> x_SW = 107

const unsigned char auc_frequencyH [4] = {
107,96,
87,79};

//低频(行)
//697hz  ---> x_SW = 46
//770hz  ---> x_SW = 50
//852hz  ---> x_SW = 56
//941hz  ---> x_SW = 61

const unsigned char auc_frequencyL [4] = {
61,56,
50,46};


//**************************  全局变量 ****************************
unsigned char x_SWa = 0x00;               // 高频信号脉冲宽度
unsigned char x_SWb = 0x00;               // 低频信号脉冲宽度
unsigned int  X_LUTaExt = 0;           	  
unsigned int  X_LUTbExt = 0;              
unsigned int  X_LUTa;                   
unsigned int  X_LUTb;                     

/*****************************************************************
                    定时器溢出中断服务程序
******************************************************************/
void ISR_T1_Overflow (void)
{ 
  X_LUTaExt += x_SWa;       
  X_LUTbExt += x_SWb;
            // 数据规格化
  X_LUTa  =  (char)(((X_LUTaExt+4) >> 3)&(0x007F)); 
  X_LUTb  =  (char)(((X_LUTbExt+4) >> 3)&(0x007F));
           // 计算 PWM 值: 高频值 + 3/4 低频值
  OCR1A = (auc_SinParam[X_LUTa] + (auc_SinParam[X_LUTb]-(auc_SinParam[X_LUTb]>>2)));
}

/***********************************************************
                        初始化
***********************************************************/
void init (void)
{
  MCUCR=0x00;
  TIMSK  = 0x80;                     // T1 溢出中断使能
  TCCR1A = (1<<COM1A1)+(1<<PWM10);   // 不翻转、8位PWM
  TCCR1B = (1<<CS10);                // 预分频系数为1、即CLK/1
  DDRD   = (1 <<PD5);               // PD5 (OC1A)用作输出
  _SEI();                     	     // 全局中断使能
}

/*********************************************************************
      为从PORT C口读取稳定的按键数据，所必须的延时程序（消抖延时）
*********************************************************************/
void Delay (void)
{
  int i;
  for (i = 0; i < delaycyc; i++) _NOP();
}

/********************************************************************
                            主程序
      从PORT C口读取按键数据(如：SL� AVR实验板) ，来确定产生哪个
      高频(列)和低频(行)信号的混合信号，并且修正 x_SWa 和 x_SWb。
                   行  -> PINC 高四位
                   列  -> PINC 低四位
*********************************************************************/

void main (void)
{
  unsigned char uc_Input;
  unsigned char uc_Counter = 0;
  init();
  for(;;){ 
     // 高四位 - 行
    DDRC  = 0x0F;           // 高四位输入、低四位输出
    PORTC = 0xF0;           // 高四位打开上位、低四位输出低电平
    uc_Counter = 0;
    Delay();                          // 延时等待 Port C 电平稳定
    uc_Input = PINC;                  // 读取 Port C
    do 
    {
      if(!(uc_Input & 0x80))          // 检查MSB是否为低
      {
                                      // 取低音脉冲宽度并结束循环
        x_SWb = auc_frequencyL[uc_Counter];  
        uc_Counter = 4;
      }
      else
      {
        x_SWb = 0;                    // 没有频率调制要求
      }
      uc_Counter++;
      uc_Input = uc_Input << 1;       // 左移一位
    } while ((uc_Counter < 4));
 
    // 低四位 - 列
    DDRC  = 0xF0;          // 高四位输出、低四位输入
    PORTC = 0x0F;          // 高四位输出低电平、低四位打开上拉
    uc_Counter = 0;
    Delay();               // 延时等待 Port C 电平稳定
    uc_Input = PINC;
    uc_Input = uc_Input << 4;     
    do 
    {
      if(!(uc_Input & 0x80))    // 检查 MSB 是否为低
      {
                                
        x_SWa = auc_frequencyH[uc_Counter];//取高音脉冲宽度并结束循环
        uc_Counter = 4;
      }
      else 
      {
        x_SWa = 0;                 
      }
      uc_Counter++;
      uc_Input = uc_Input << 1;
    } while (uc_Counter < 4);
  } 
}

