#ifndef  _ir_send_
#define  _ir_send_

#include "extern.h"


void ir_init(void);	   //IR初始化
void ir_t(bit BT , uint p); //发送数据
void ir_send_byt(uchar temp);
void ir_send(uchar p);


#endif