//***********************************************************
// Note:通过模拟量输入口LINE_IN输入电压值，以8K的采样率经A/D
//转换后送给IOB口控制LED点亮,同时可以根据LED的点亮来了解转换
//的数据
//*************************************************************									

// 时钟源为Fosc/2，采样率为8KHz
.define     TIMER_DATA_FOR_8KHZ   0xFA23  

.define		P_IOB_DATA  	0x7005 
.define		P_IOB_DIR   	0x7007 
.define		P_IOB_ATTRI		0x7008 
.define		P_INT_Ctrl		0x7010 
.define		P_INT_CLEAR		0x7011 

.define		P_TimerA_Ctrl	0x700b 
.define		P_TimerA_Data	0x700a 
.define		P_ADC_Ctrl		0x7015 
.define		P_ADC			0x7014 
.define		P_ADC_MUX_Ctrl	0x702b 
.define		P_ADC_MUX_DATA	0x702C
.define		P_DAC_Ctrl		0x702A 


.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.ISRAM
.VAR RESULT
.VAR TIME            //Line in select
.var value           //vol 0 or ffc
.CODE
.public _AD_Line;
_AD_Line:  .proc
       
        R1=0x0001
        [TIME]=R1//选择LINE0
		r1=0x00f0
		[value]=r1	//端口送入的值
		r1=0xffff 
		[P_IOB_ATTRI]=r1 
		[P_IOB_DIR]=r1 
		r1=0x0000
		[P_IOB_DATA]=r1;
		
	    
		   		
		R1 = 0x0001	            //允许A/D
		[P_ADC_Ctrl] = R1 		 
	    r1 = 0x00A0;
	    [P_DAC_Ctrl] = r1;
		call _InitAD1
		test r1,0x0001;
		jz fail;	
		
		r1=0xffff
		[P_IOB_DATA]=r1;
   		R1=0x0001
        [TIME]=R1
		r1=0xff00
		[value]=r1	
		
		call _InitAD2
		test r1,0x0001;
		jz fail;		
		r1 = 0x0001  //success
		
	    retf;
		
fail:	r1 = 0x0000   //fail
        // fiq on
        // irq on
	    retf;
	
.endp
		
		
.public _InitAD1
_InitAD1:
       
       R2=[TIME]							
	   test r2,0x0080
	   jNZ NEXT1
	   [P_ADC_MUX_Ctrl]=R2
	   R2=R2 LSL 1
	   [TIME]=R2
	   NOP
	   NOP
      r1=[P_ADC_MUX_DATA]
       
 _AD1:
 	 
       r1=[P_ADC_MUX_Ctrl] 
       test r1,0x8000
       jz _AD1
     
       
   
       r1=[P_ADC_MUX_DATA]
       
       CMP R1,[value] 
       jbe  _InitAD1
      
       r1 = 0;
       retf;
        			      // 调用ADC初始化程序
NEXT1:
		//成功
		r1 = 0x0001;
       RETF
       
       
.public _InitAD2
_InitAD2:
       
       R2 = [TIME]							
	   test r2,0x0080
	   jNZ NEXT2
	   [P_ADC_MUX_Ctrl] = R2
	   R2=R2 LSL 1
	   [TIME]=R2
	   NOP
	   NOP
       r1=[P_ADC_MUX_DATA]

 _AD2:  
       r1=[P_ADC_MUX_Ctrl] 
       test r1,0x8000
       jz _AD2   
       
   
       r1 = [P_ADC_MUX_DATA]
       
       CMP R1,[value] 
       jae  _InitAD2
       //shibai
       r1 = 0;
       retf;
        			      // 调用ADC初始化程序
NEXT2:
		//成功
		r1 = 0x0001;
       RETF
       
delay://1ms
	push r1,r2 to [sp]
    r1 = 1
loop_out:
    r2 = 0x00ff
loop_in:
    r2 -=1
    cmp r2,0x0000
    jnz loop_in;
    r1 -= 1;
    cmp r1,0x0000
    jnz loop_out;
    pop r1,r2 from [sp]
   retf  
   
   
   
 