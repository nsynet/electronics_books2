#include "ir_send.h"



/*------------��ʼ��IO------------*/
void ir_init(void)
{
	P2M0 = 0x80; 		   //P2.7ǿ����
	P2M1 = 0x00;
	TMOD = 0x01;		   //T0  16λ ��ʱ	
	IR   = 0;
}

/*-------�������� + �ز�---------*/
void ir_t(bit BT , uint p)
{
	TH0 = p>>8;	            
	TL0 = p;
    TF0=0;			       
    TR0=1;			        								   //������ʱ��0
    if(BT == 0)												   //BT=0ʱ��������38KHz�ز�ֻ��ʱ��BT=1����38KHz��������ʱ
	{
		while(!TF0);
    }
	else while(1)			      							   //38KHz�ز������͵�ƽ��ռ�ձ�5:26			
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
    TR0=0;			        								   //�رն�ʱ��0
    TF0=0;			        							
    IR =0;			        				
}


/*-----------����һ֡����-----------*/
void ir_send_byt(uchar temp)
{ 
  uchar i;
	for (i = 0; i < 8; i++ )                     //ѭ��8����λ 
	{     
	    ir_t( 1 , m_56 );		        	   //�ߵ�ƽ0.65mS			          
		if( temp & 0x01 ) 
		ir_t( 0 , m1_6 ); 	   				   //�ȷ������λ		
		else          
		ir_t( 0 , m_56 ); 			     
		temp >>= 1;                
	}    
}

/*������������������������������������������������������������
������NEC���뷢�ͳ���
������������������������������������������������������������*/
void ir_send(uchar p)
{  
	ir_t( 1 , m9   );		       	//�ߵ�ƽ9mS
	ir_t( 0 , m4_5 );	            //�͵�ƽ4.5mS

  /*�� ����4֡���ݩ�*/
	ir_send_byt( user_h );		   	   //�û����8λ										                               
	ir_send_byt( user_l );			   //�û����8λ
	ir_send_byt(  p  );			   //������
	ir_send_byt( ~p  );			   //�����뷴��

  /*���� ������ ����*/
    ir_t( 1 , m_56 );
 	ir_t( 0 , m40  );
 /*���� �ظ��� ����*/
	while(0)
	{
        ir_t( 1 , m9 	);
        ir_t( 0 , m2_25 );

        ir_t( 1 , m_56	);
        ir_t( 0 , m40 	);
		ir_t( 0 , m56 	);				  
    } 		  
}



























