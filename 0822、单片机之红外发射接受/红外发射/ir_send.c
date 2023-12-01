#include "ir_send.h"



/*------------初始化IO------------*/
void ir_init(void)
{
	P2M0 = 0x80; 		   //P2.7强推挽
	P2M1 = 0x00;
	TMOD = 0x01;		   //T0  16位 定时	
	IR   = 0;
}

/*-------发射数据 + 载波---------*/
void ir_t(bit BT , uint p)
{
	TH0 = p>>8;	            
	TL0 = p;
    TF0=0;			       
    TR0=1;			        								   //启动定时器0
    if(BT == 0)												   //BT=0时，不发射38KHz载波只延时；BT=1发射38KHz脉冲且延时
	{
		while(!TF0);
    }
	else while(1)			      							   //38KHz载波，（低电平）占空比5:26			
    	{
		  IR = 1;
		  if(TF0)break;if(TF0)break;
		  if(TF0)break;if(TF0)break;
		  if(TF0)break;if(TF0)break;
		  if(TF0)break;

		  IR = 0;
  	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
  	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
  	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
   	      if(TF0)break;if(TF0)break;
		}
    TR0=0;			        								   //关闭定时器0
    TF0=0;			        							
    IR =0;			        				
}


/*-----------发送一帧数据-----------*/
void ir_send_byt(uchar temp)
{ 
  uchar i;
	for (i = 0; i < 8; i++ )                     //循环8次移位 
	{     
	    ir_t( 1 , m_56 );		        	   //高电平0.65mS			          
		if( temp & 0x01 ) 
		ir_t( 0 , m1_6 ); 	   				   //先发送最低位		
		else          
		ir_t( 0 , m_56 ); 			     
		temp >>= 1;                
	}    
}

/*┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
函数：NEC编码发送程序
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈*/
void ir_send(uchar p)
{  
	ir_t( 1 , m9   );		       	//高电平9mS
	ir_t( 0 , m4_5 );	            //低电平4.5mS

  /*┈ 发送4帧数据┈*/
	ir_send_byt( user_h );		   	   //用户码高8位										                               
	ir_send_byt( user_l );			   //用户码低8位
	ir_send_byt(  p  );			   //操作码
	ir_send_byt( ~p  );			   //操作码反码

  /*┈┈ 结束码 ┈┈*/
    ir_t( 1 , m_56 );
 	ir_t( 0 , m40  );
 /*┈┈ 重复码 ┈┈*/
	while(0)
	{
        ir_t( 1 , m9 	);
        ir_t( 0 , m2_25 );

        ir_t( 1 , m_56	);
        ir_t( 0 , m40 	);
		ir_t( 0 , m56 	);				  
    } 		  
}



























