#ifndef  _extern_
#define  _extern_

#include "STC5A08AD.h"
#define uchar unsigned char
#define uint  unsigned int


/*-------------红外发射有关----------------*/

#define user_h	0x5a
#define user_l  0xa5

#define m9    (65536-4500) 	      //9mS
#define m4_5  (65536-2250) 	      //4.5mS
#define m1_6  (65536-825) 	      //1.65mS
#define m_56  (65536-280) 	      //0.56mS
#define m40   (65536-20000)       //40mS
#define m56   (65536-28000)       //56mS
#define m2_25 (65536-1125)        //2.25mS

sbit IR = P2^7;		

/*-------------红外发射有关----------------*/


/*----按键定义-----*/
sbit P01 = P0^1;
sbit P02 = P0^2;
sbit P03 = P0^3;
sbit P04 = P0^4;
sbit P05 = P0^5;
sbit P06 = P0^6;
sbit P07 = P0^7;

sbit P45 = P4^5;
sbit P46 = P4^6;

/*-----------------*/










#endif


