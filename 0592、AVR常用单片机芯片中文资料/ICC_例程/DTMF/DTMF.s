	.module DTMF.c
	.area vector(rom, abs)
	.org 12
	rjmp _ISR_T1_Overflow
	.area lit(rom, con, rel)
_auc_SinParam::
	.byte 64,'C
	.byte 'F,'I
	.byte 'L,'O
	.byte 'R,'U
	.byte 'X,91
	.byte 94,96
	.byte 'c,'f
	.byte 'h,'j
	.byte 'm,'o
	.byte 'q,'s
	.byte 'u,'v
	.byte 'x,'y
	.byte 123,124
	.byte 125,126
	.byte 126,127
	.byte 127,127
	.byte 127,127
	.byte 127,127
	.byte 126,126
	.byte 125,124
	.byte 123,'y
	.byte 'x,'v
	.byte 'u,'s
	.byte 'q,'o
	.byte 'm,'j
	.byte 'h,'f
	.byte 'c,96
	.byte 94,91
	.byte 'X,'U
	.byte 'R,'O
	.byte 'L,'I
	.byte 'F,'C
	.byte 64,60
	.byte 57,54
	.byte 51,48
	.byte 45,42
	.byte 39,36
	.byte 33,31
	.byte 28,25
	.byte 23,21
	.byte 18,16
	.byte 14,12
	.byte 10,9
	.byte 7,6
	.byte 4,3
	.byte 2,1
	.byte 1,0
	.byte 0,0
	.byte 0,0
	.byte 0,0
	.byte 1,1
	.byte 2,3
	.byte 4,6
	.byte 7,9
	.byte 10,12
	.byte 14,16
	.byte 18,21
	.byte 23,25
	.byte 28,31
	.byte 33,36
	.byte 39,42
	.byte 45,48
	.byte 51,54
	.byte 57,60
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbsym s auc_SinParam _auc_SinParam Ac[128:128]
_auc_frequencyH::
	.byte 'k,96
	.byte 'W,'O
	.dbsym s auc_frequencyH _auc_frequencyH Ac[4:4]
_auc_frequencyL::
	.byte 61,56
	.byte 50,46
	.dbsym s auc_frequencyL _auc_frequencyL Ac[4:4]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
_x_SWa::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbsym s x_SWa _x_SWa c
_x_SWb::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbsym s x_SWb _x_SWb c
_X_LUTaExt::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbsym s X_LUTaExt _X_LUTaExt i
_X_LUTbExt::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbsym s X_LUTbExt _X_LUTbExt i
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	.dbfunc s ISR_T1_Overflow _ISR_T1_Overflow fI
	.even
_ISR_T1_Overflow::
	st -y,R0
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline 129{
; /********************************************************
;                    http://www.sl.com.cn
;          双龙电子公司----双音频信号(DTMF)演示程序
; 		 键盘布置图：
; 		             1 2 3 A--PB4
; 		             4 5 6 B--PB5
; 					 7 8 9 C--PB6
; 					 * 0 # D--PB7
; 					 | | | |
; 					 P P P P
; 					 B B B B
; 					 0 1 2 3
; 		 喇叭接线图：PD5(OC1A)--1K电阻--喇叭			 
; ********************************************************/ 
; #include <io8515.h>
; #include <macros.h>
; #define  Xtal       8000000          // 系统时钟频率
; #define  prescaler  1                // T1预分频系数
; #define  N_samples  128              // 在查找表中的样本数
; #define  Fck        Xtal/prescaler   // T1工作频率
; #define  delaycyc   10               // 读取port C口延时循环数
; #pragma interrupt_handler ISR_T1_Overflow:7
; /*************************** 正弦表 *****************************
;        样本表: 一个周期分成128个点，每点按7位进行量化
; ****************************************************************/
; flash unsigned char auc_SinParam [128] = {
; 64,67,
; 70,73,
; 76,79,
; 82,85,
; 88,91,
; 94,96,
; 99,102,
; 104,106,
; 109,111,
; 113,115,
; 117,118,
; 120,121,
; 123,124,
; 125,126,
; 126,127,
; 127,127,
; 127,127,
; 127,127,
; 126,126,
; 125,124,
; 123,121,
; 120,118,
; 117,115,
; 113,111,
; 109,106,
; 104,102,
; 99,96,
; 94,91,
; 88,85,
; 82,79,
; 76,73,
; 70,67,
; 64,60,
; 57,54,
; 51,48,
; 45,42,
; 39,36,
; 33,31,
; 28,25,
; 23,21,
; 18,16,
; 14,12,
; 10,9,
; 7,6,
; 4,3,
; 2,1,
; 1,0,
; 0,0,
; 0,0,
; 0,0,
; 1,1,
; 2,3,
; 4,6,
; 7,9,
; 10,12,
; 14,16,
; 18,21,
; 23,25,
; 28,31,
; 33,36,
; 39,42,
; 45,48,
; 51,54,
; 57,60};
; 
; //***************************  x_SW  *************************
; //   x_SW 表(8倍): x_SW = ROUND(8*N_samples*f*510/Fck)
; //************************************************************
; 
; //高频(列)
; //1209hz  ---> x_SW = 79
; //1336hz  ---> x_SW = 87
; //1477hz  ---> x_SW = 96
; //1633hz  ---> x_SW = 107
; 
; const unsigned char auc_frequencyH [4] = {
; 107,96,
; 87,79};
; 
; //低频(行)
; //697hz  ---> x_SW = 46
; //770hz  ---> x_SW = 50
; //852hz  ---> x_SW = 56
; //941hz  ---> x_SW = 61
; 
; const unsigned char auc_frequencyL [4] = {
; 61,56,
; 50,46};
; 
; 
; //**************************  全局变量 ****************************
; unsigned char x_SWa = 0x00;               // 高频信号脉冲宽度
; unsigned char x_SWb = 0x00;               // 低频信号脉冲宽度
; unsigned int  X_LUTaExt = 0;           	  
; unsigned int  X_LUTbExt = 0;              
; unsigned int  X_LUTa;                   
; unsigned int  X_LUTb;                     
; 
; /*****************************************************************
;                     定时器溢出中断服务程序
; ******************************************************************/
; void ISR_T1_Overflow (void)
; { 
	.dbline 130
;   X_LUTaExt += x_SWa;       
	lds R2,_x_SWa
	clr R3
	lds R5,_X_LUTaExt+1
	lds R4,_X_LUTaExt
	add R4,R2
	adc R5,R3
	sts _X_LUTaExt+1,R5
	sts _X_LUTaExt,R4
	.dbline 131
;   X_LUTbExt += x_SWb;
	lds R2,_x_SWb
	clr R3
	lds R5,_X_LUTbExt+1
	lds R4,_X_LUTbExt
	add R4,R2
	adc R5,R3
	sts _X_LUTbExt+1,R5
	sts _X_LUTbExt,R4
	.dbline 133
;             // 数据规格化
;   X_LUTa  =  (char)(((X_LUTaExt+4) >> 3)&(0x007F)); 
	ldi R18,3
	ldi R19,0
	lds R17,_X_LUTaExt+1
	lds R16,_X_LUTaExt
	subi R16,252  ; offset = 4
	sbci R17,255
	rcall lsr16
	mov R24,R16
	mov R25,R17
	andi R24,127
	andi R25,0
	mov R2,R24
	clr R3
	sts _X_LUTa+1,R3
	sts _X_LUTa,R2
	.dbline 134
;   X_LUTb  =  (char)(((X_LUTbExt+4) >> 3)&(0x007F));
	ldi R18,3
	ldi R19,0
	lds R17,_X_LUTbExt+1
	lds R16,_X_LUTbExt
	subi R16,252  ; offset = 4
	sbci R17,255
	rcall lsr16
	mov R24,R16
	mov R25,R17
	andi R24,127
	andi R25,0
	mov R2,R24
	clr R3
	sts _X_LUTb+1,R3
	sts _X_LUTb,R2
	.dbline 136
;            // 计算 PWM 值: 高频值 + 3/4 低频值
;   OCR1A = (auc_SinParam[X_LUTa] + (auc_SinParam[X_LUTb]-(auc_SinParam[X_LUTb]>>2)));
	ldi R24,<_auc_SinParam
	ldi R25,>_auc_SinParam
	lds R3,_X_LUTb+1
	lds R2,_X_LUTb
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	mov R2,R0
	clr R3
	ldi R18,2
	ldi R19,0
	mov R16,R2
	mov R17,R3
	rcall asr16
	sub R2,R16
	sbc R3,R17
	ldi R24,<_auc_SinParam
	ldi R25,>_auc_SinParam
	lds R5,_X_LUTa+1
	lds R4,_X_LUTa
	add R4,R24
	adc R5,R25
	mov R30,R4
	mov R31,R5
	lpm
	mov R4,R0
	clr R5
	add R4,R2
	adc R5,R3
	sts 74+1,R5
	sts 74,R4
	.dbline 137}
; }
L1:
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R0,y+
	reti
	.dbfunc s init _init fI
	.even
_init::
	.dbline 143{
; 
; /***********************************************************
;                         初始化
; ***********************************************************/
; void init (void)
; {
	.dbline 144
;   MCUCR=0x00;
	clr R2
	out 0x35,R2
	.dbline 145
;   TIMSK  = 0x80;                     // T1 溢出中断使能
	ldi R24,128
	out 0x39,R24
	.dbline 146
;   TCCR1A = (1<<COM1A1)+(1<<PWM10);   // 不翻转、8位PWM
	ldi R24,129
	out 0x2f,R24
	.dbline 147
;   TCCR1B = (1<<CS10);                // 预分频系数为1、即CLK/1
	ldi R24,1
	out 0x2e,R24
	.dbline 148
;   DDRD   = (1 <<PD5);               // PD5 (OC1A)用作输出
	ldi R24,32
	out 0x11,R24
	.dbline 149
;   _SEI();                     	     // 全局中断使能
	sei
	.dbline 150}
; }
L2:
	ret
	.dbfunc s Delay _Delay fI
;              i -> R16,R17
	.even
_Delay::
	.dbline 156{
; 
; /*********************************************************************
;       为从PORT C口读取稳定的按键数据，所必须的延时程序（消抖延时）
; *********************************************************************/
; void Delay (void)
; {
	.dbline 158
	clr R16
	clr R17
L4:
	.dbline 158
	nop
L5:
	.dbline 158
;   int i;
;   for (i = 0; i < delaycyc; i++) _NOP();
	subi R16,255  ; offset = 1
	sbci R17,255
	.dbline 158
	cpi R16,10
	ldi R30,0
	cpc R17,R30
	brlt L4
	.dbline 159}
; }
L3:
	ret
	.dbsym r i 16 I
	.dbfunc s main _main fI
;     uc_Counter -> R20
;       uc_Input -> R22
	.even
_main::
	.dbline 170{
; 
; /********************************************************************
;                             主程序
;       从PORT C口读取按键数据(如：SL� AVR实验板) ，来确定产生哪个
;       高频(列)和低频(行)信号的混合信号，并且修正 x_SWa 和 x_SWb。
;                    行  -> PINC 高四位
;                    列  -> PINC 低四位
; *********************************************************************/
; 
; void main (void)
; {
	.dbline 172
;   unsigned char uc_Input;
;   unsigned char uc_Counter = 0;
	clr R20
	.dbline 173
;   init();
	rcall _init
	.dbline 174
L9:
	.dbline 174
;   for(;;){ 
	.dbline 176
;      // 高四位 - 行
;     DDRC  = 0x0F;           // 高四位输入、低四位输出
	ldi R24,15
	out 0x14,R24
	.dbline 177
;     PORTC = 0xF0;           // 高四位打开上位、低四位输出低电平
	ldi R24,240
	out 0x15,R24
	.dbline 178
;     uc_Counter = 0;
	clr R20
	.dbline 179
;     Delay();                          // 延时等待 Port C 电平稳定
	rcall _Delay
	.dbline 180
;     uc_Input = PINC;                  // 读取 Port C
	in R22,0x13
L13:
	.dbline 182
;     do 
;     {
	.dbline 183
;       if(!(uc_Input & 0x80))          // 检查MSB是否为低
	sbrc R22,7
	rjmp L16
	.dbline 184
;       {
	.dbline 186
;                                       // 取低音脉冲宽度并结束循环
;         x_SWb = auc_frequencyL[uc_Counter];  
	ldi R24,<_auc_frequencyL
	ldi R25,>_auc_frequencyL
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _x_SWb,R0
	.dbline 187
;         uc_Counter = 4;
	ldi R20,4
	.dbline 188
;       }
	rjmp L17
L16:
	.dbline 190
;       else
;       {
	.dbline 191
;         x_SWb = 0;                    // 没有频率调制要求
	clr R2
	sts _x_SWb,R2
	.dbline 192
;       }
L17:
	.dbline 193
;       uc_Counter++;
	inc R20
	.dbline 194
;       uc_Input = uc_Input << 1;       // 左移一位
	lsl R22
	.dbline 195
L14:
	.dbline 195
;     } while ((uc_Counter < 4));
	cpi R20,4
	brlo L13
	.dbline 198
;  
;     // 低四位 - 列
;     DDRC  = 0xF0;          // 高四位输出、低四位输入
	ldi R24,240
	out 0x14,R24
	.dbline 199
;     PORTC = 0x0F;          // 高四位输出低电平、低四位打开上拉
	ldi R24,15
	out 0x15,R24
	.dbline 200
;     uc_Counter = 0;
	clr R20
	.dbline 201
;     Delay();               // 延时等待 Port C 电平稳定
	rcall _Delay
	.dbline 202
;     uc_Input = PINC;
	in R22,0x13
	.dbline 203
;     uc_Input = uc_Input << 4;     
	mov R24,R22
	andi R24,#0x0F
	swap R24
	mov R22,R24
L18:
	.dbline 205
;     do 
;     {
	.dbline 206
;       if(!(uc_Input & 0x80))    // 检查 MSB 是否为低
	sbrc R22,7
	rjmp L21
	.dbline 207
;       {
	.dbline 209
;                                 
;         x_SWa = auc_frequencyH[uc_Counter];//取高音脉冲宽度并结束循环
	ldi R24,<_auc_frequencyH
	ldi R25,>_auc_frequencyH
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _x_SWa,R0
	.dbline 210
;         uc_Counter = 4;
	ldi R20,4
	.dbline 211
;       }
	rjmp L22
L21:
	.dbline 213
;       else 
;       {
	.dbline 214
;         x_SWa = 0;                 
	clr R2
	sts _x_SWa,R2
	.dbline 215
;       }
L22:
	.dbline 216
;       uc_Counter++;
	inc R20
	.dbline 217
;       uc_Input = uc_Input << 1;
	lsl R22
	.dbline 218
L19:
	.dbline 218
;     } while (uc_Counter < 4);
	cpi R20,4
	brlo L18
	.dbline 219
;   } 
	.dbline 174
	.dbline 174
	rjmp L9
X0:
L8:
	ret
	.dbline 175}
	.dbsym r uc_Counter 20 c
	.dbsym r uc_Input 22 c
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\DTMF\DTMF.c
_X_LUTb::
	.blkb 2
	.dbsym s X_LUTb _X_LUTb i
_X_LUTa::
	.blkb 2
	.dbsym s X_LUTa _X_LUTa i
