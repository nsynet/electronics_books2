#ifndef __MY_SET_H__
#define __MY_SET_H__

// data   固定指片内RAM：0x00~0x7F
// bdata  固定指片内RAM：0x20~0x2F
// idata  固定指片内RAM：0x00~0xFF
// xdata  一般指扩展RAM：0x0000~0xFFFF，也指STC内部扩展RAM：0x0000~0xFFFF
// code	  指程序存储区ROM：0x0000~0xFFFF

//无符号类型
#define   uint8     unsigned char			
#define   uint8b    unsigned char bdata		
#define   uint8i    unsigned char idata		
#define   uint8x    unsigned char xdata		
#define   uint8c    unsigned char code

#define   uint16    unsigned int
#define   uint16i   unsigned int  idata
#define   uint16x   unsigned int  xdata
#define   uint16c   unsigned int  code

#define   uint32    unsigned long
#define   uint32i   unsigned long idata
#define   uint32x   unsgined long xdata
#define   uint32c   unsgined long code

//有符号类型
#define   int8      char 
#define   int8x     char xdata
#define   int8c     char code

#define   int16     int
#define   int16x    int  xdata
#define   int16c    int  code

#define   int32     long 
#define   int32x    long xdata
#define   int32c    long code

//类汇编
#include  <intrins.h>
#define   NOP       _nop_()																							 
#define   NOP_12;   _nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();

#endif

/*
_crol_ 字符循环左移 　　
_cror_ 字符循环右移 　　
_irol_ 整数循环左移 　　
_iror_ 整数循环右移 　　
_lrol_ 长整数循环左移 　　
_lror_ 长整数循环右移 　　
_nop_ 空操作8051 NOP 指令
_testbit_ 测试并清零位8051 JBC 指令 

（_crol_，_irol_，_lrol_）以位形式将val 循环左移n 位，该函数与8051“RLA”指令相关，上面几个函数不同于参数类型。
（_cror_，_iror_，_lror_）以位形式将val 循环右移n 位，该函数与8051“RRA”指令相关，上面几个函数不同于参数类型。 
（_nop_）    产生一个NOP 指令,该函数可用作C 程序的时间比较。C51 编译器在_nop_函数工作期间不产生函数调用，即在程序中直接执行了NOP 指令。
（_testbit_）产生一个JBC 指令，该函数测试一个位，当置位时返回1，否则返回0。如果该位置为1，则将该位复位为0。
             8051 的JBC 指令即用作此目的。_testbit_只能用于可直接寻址的位；在表达式中使用是不允许的。
*/