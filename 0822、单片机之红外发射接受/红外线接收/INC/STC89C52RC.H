/****************************
 STC89C52RC	（40引脚）
****************************/

#ifndef __STC89C52RC_H__
#define __STC89C52RC_H__

/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
特殊寄存器（SFR）      
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈*/
sfr B          = 0xF0;
/////////////////////
sfr ACC        = 0xE0;
sfr WDT_CONR   = 0xE1;	 
sfr IAP_DATA   = 0xE2;	 
sfr IAP_ADDRH  = 0xE3;	 
sfr IAP_ADDRL  = 0xE4;	 
sfr IAP_CMD	   = 0xE5;	 
sfr IAP_TRIG   = 0xE6;	 
sfr IAP_CONTR  = 0xE7;	 
/////////////////////
sfr PSW        = 0xD0;
/////////////////////
sfr T2CON      = 0xC8;
sfr T2MOD      = 0xC9;
sfr RCAP2L     = 0xCA;
sfr RCAP2H     = 0xCB;
sfr TL2        = 0xCC;
sfr TH2        = 0xCD;
/////////////////////
sfr XICON      = 0xC0;	 
/////////////////////
sfr IP         = 0xB8;
sfr SADEN      = 0xB9;
/////////////////////
sfr P3         = 0xB0;
sfr IPH		   = 0xB7;
/////////////////////
sfr IE         = 0xA8;
sfr SADDR      = 0xA9;
/////////////////////
sfr P2         = 0xA0;
sfr AUXR1      = 0xA2;	 
/////////////////////
sfr SCON	   = 0x98;
sfr SBUF	   = 0x99;
/////////////////////
sfr P1         = 0x90;
/////////////////////
sfr TCON       = 0x88;
sfr TMOD       = 0x89;
sfr TL0        = 0x8A;
sfr TL1        = 0x8B;
sfr TH0        = 0x8C;
sfr TH1        = 0x8D;
sfr AUXR	   = 0x8E;
/////////////////////
sfr P0         = 0x80;
sfr SP         = 0x81;
sfr DPL        = 0x82;
sfr DPH        = 0x83;
sfr PCON       = 0x87;
/////////////////////

/*┈┈┈┈┈┈┈┈┈┈┈┈┈
特殊寄存器(SFR)位定义 
┈┈┈┈┈┈┈┈┈┈┈┈┈*/
/*  ACC位定义  */
sbit ACC7 = ACC^7;
sbit ACC6 = ACC^6;
sbit ACC5 = ACC^5;
sbit ACC4 = ACC^4;
sbit ACC3 = ACC^3;
sbit ACC2 = ACC^2;
sbit ACC1 = ACC^1;
sbit ACC0 = ACC^0;

/*  PSW位定义  */
sbit CY    = PSW^7;
sbit AC    = PSW^6;
sbit F0    = PSW^5;
sbit RS1   = PSW^4;
sbit RS0   = PSW^3;
sbit OV    = PSW^2;
sbit P     = PSW^0; 

/*  TCON位定义  */
sbit TF1   = TCON^7;
sbit TR1   = TCON^6;
sbit TF0   = TCON^5;
sbit TR0   = TCON^4;
sbit IE1   = TCON^3;
sbit IT1   = TCON^2;
sbit IE0   = TCON^1;
sbit IT0   = TCON^0;

/*  T2CON位定义  */
sbit TF2   = T2CON^7;
sbit EXF2  = T2CON^6;
sbit RCLK  = T2CON^5;
sbit TCLK  = T2CON^4;
sbit EXEN2 = T2CON^3;
sbit TR2   = T2CON^2;
sbit C_T2  = T2CON^1;
sbit CP_RL2= T2CON^0;

/*  IE位定义  */
sbit EA    = IE^7;
sbit ET2   = IE^5; 
sbit ES    = IE^4;
sbit ET1   = IE^3;
sbit EX1   = IE^2;
sbit ET0   = IE^1;
sbit EX0   = IE^0;

/*  IP位定义  */
sbit PT2   = IP^5;
sbit PS    = IP^4;
sbit PT1   = IP^3;
sbit PX1   = IP^2;
sbit PT0   = IP^1;
sbit PX0   = IP^0;

/*  SCON位定义  */
sbit SM0   = SCON^7;
sbit SM1   = SCON^6;
sbit SM2   = SCON^5;
sbit REN   = SCON^4;
sbit TB8   = SCON^3;
sbit RB8   = SCON^2;
sbit TI    = SCON^1;
sbit RI    = SCON^0;

/* P1端口位定义 */
sbit P07   = P0^7;
sbit P06   = P0^6;
sbit P05   = P0^5;
sbit P04   = P0^4;
sbit P03   = P0^3;
sbit P02   = P0^2;
sbit P01   = P0^1;
sbit P00   = P0^0;

/* P1端口位定义 */
sbit T2EX  = P1^1;
sbit T2    = P1^0;

sbit P17   = P1^7;
sbit P16   = P1^6;
sbit P15   = P1^5;
sbit P14   = P1^4;
sbit P13   = P1^3;
sbit P12   = P1^2;
sbit P11   = P1^1;
sbit P10   = P1^0; 

/* P2端口位定义 */
sbit P27   = P2^7;
sbit P26   = P2^6;
sbit P25   = P2^5;
sbit P24   = P2^4;
sbit P23   = P2^3;
sbit P22   = P2^2;
sbit P21   = P2^1;
sbit P20   = P2^0;

/* P3端口位定义 */
sbit RD    = P3^7;
sbit WR    = P3^6;
sbit T1    = P3^5;
sbit T0    = P3^4;
sbit INT1  = P3^3;
sbit INT0  = P3^2;
sbit TXD   = P3^1;
sbit RXD   = P3^0;

sbit P37   = P3^7;
sbit P36   = P3^6;
sbit P35   = P3^5;
sbit P34   = P3^4;
sbit P33   = P3^3;
sbit P32   = P3^2;
sbit P31   = P3^1;
sbit P30   = P3^0;

#endif

//【 T2CON 】
/*
TF2    T2CON.7 定时器 2 溢出标志。定时器2 溢出时置位，必须由软件清除。当RCLK或TCLK=1 时，TF2 将不会置位
EXF2   T2CON.6 定时器 2 外部标志。当 EXEN2=1 且T2EX 的负跳变产生捕获或重装时，EXF2 置位。
               定时器2 中断使能时，EXF2=1 将使CPU 从中断向量处执行定时器2 中断子程序。EXF2 位必须用软件清零。
               在递增/ 递减计数器模式（DCEN=1）中，EXF2 不会引起中断。
RCLK   T2CON.5 接收时钟标志。RCLK 置位时，定时器2 的溢出脉冲作为串行口模式1 和模式3 的接收时钟。
               RCLK=0 时，将定时器1 的溢出脉冲作为接收时钟。
TCLK   T2CON.4 发送时钟标志。TCLK 置位时，定时器2 的溢出脉冲作为串行口模式1 和模式3 的发送时钟。
               TCLK=0 时，将定时器1 的溢出脉冲作为发送时钟。
EXEN2  T2CON.3 定时器 2 外部使能标志。当其置位且定时器 2 未作为串行口时钟时，允许T2EX 的负跳变产生捕获或重装。
               EXEN2=0 时，T2EX 的跳变对定时器2无效。
TR2    T2CON.2 定时器2 启动/ 停止控制位。置1 时启动定时器
C_T2   T2CON.1 定时器 / 计数器选择。（定时器 2 ）
                               0= 内部定时器（OSC/12 或OSC/6）
                               1= 外部事件计数器（下降沿触发）
CP_RL2 T2CON.0 捕获/ 重装标志。置位：EXEN2=1 时，T2EX 的负跳变产生捕获。
               清零：EXEN2=0 时，定时器2 溢出或T2EX 的负跳变都可使定时器自动重装。
               当RCLK=1 或TCLK=1 时，该位无效且定时器强制为溢出时自动重装。
*/

// RCLK+TCLK   CP/RL2   TR2     模  式
//     0         0       1    16位自动重装 
//     0         1       1    16位捕获
//     1         X       1    波特率发生器 
//     X         X       0     （关闭）
//
// 注意：①T2定时溢出后，不管开不开T2内部中断，溢出标志TF2都会置1，
//         此时若不用软件清0，T2也继续定时，TH2、TL2继续自加，
//		   但是RCAP2H、RCAP2L不会捕获。
//		 ②貌似要打开T2内部定时中断ET2=1，T2EX下降沿中断才可以使用；
//		   ET2=1，不启动TR2，T2EX下降沿中断也可以使用。

//停电后POF=1（PCON.4=1），上电后根据POF=1判断进行上电操作且将POF清0；
//其它复位将根据POF=0判断不是上电操作，进行普通复位。