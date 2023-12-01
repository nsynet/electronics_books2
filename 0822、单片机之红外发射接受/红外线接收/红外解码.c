#include "INC\STC89C52RC.H"
#include "INC\MY_SET.H"
#include "INC\IR_NEC.H"		   //调用NEC解码头文件





void _putchar(unsigned char c)
{
    SBUF = c;
    while(!TI);
    TI = 0;
	_nop_();
}

void _printf(unsigned char *p)
{
	while(*p)
	{
	    SBUF = *p++;
    	while(!TI);
    	TI = 0;
		_nop_();
	}
}

/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
函数：遥控短按处理
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
void KZ0()
{
   switch(NEC[2])	     
   {
      case 0x12: P10 = !P10; break;
	  case 0x05: break;
	  case 0x1E: break;
	  case 0x55: break;

	  case 0x01: break;
	  case 0x1B: break;
	  case 0x03: break;
	  case 0x6B: break;

	  case 0x07: break;
	  case 0x08: break;
	  case 0x09: break;
	  case 0x68: break;

	  case 0x22: break;
	  case 0xE6: break;
	  case 0x33: break;
	  case 0xE2: break;
	  default:break;
   }
}												*/
/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
函数：遥控长按处理
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
void KZ1()
{
   switch(NEC[2])	     
   {
      case 0x12: _printf(NEC); break;
	  case 0x05: break;
	  case 0x1E: break;
	  case 0x55: break;

	  case 0x01: break;
	  case 0x1B: break;
	  case 0x03: break;
	  case 0x6B: break;

	  case 0x07: break;
	  case 0x08: break;
	  case 0x09: break;
	  case 0x68: break;

	  case 0x22: break;
	  case 0xE6: break;
	  case 0x33: break;
	  case 0xE2: break;
	  default:break;
   }
}											   */


/***************** 主函数 ********************/
void main(void)
{
	NEC[0]= 1;
	NEC[1]= 2;
	NEC[2]= 3;
	NEC[3]= 4;
	IR_Init();			   //红外线解码初始化
	_printf("初始化接收完毕！");
    _printf("开始检测！");
	while(1)
	{ 
	  
	  //遥控检测

	  if((IR_BT==2)||(IR_BT==3))			  
      {
		if(IR_BT==2)_printf(NEC);      //短按处理		  
	 	else        _printf(NEC);      //长按处理	
		IR_BT =0;		        //清有效标志
	  }
	  
	}

}

/********************** 定时器0中断函数************************/
void time0(void) interrupt 1
{ 
   IR_NEC(); 
}  