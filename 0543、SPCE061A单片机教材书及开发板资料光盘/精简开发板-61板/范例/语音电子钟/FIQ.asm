
.INCLUDE a2000.inc;
.INCLUDE hardware.inc

.PUBLIC _FIQ,_IRQ3, _IRQ5, _IRQ6

.external	_TimeCount;        // 触发计时
.external   Per500msSet        //2Hz中断，每次500ms时钟
.external   _TimeChangeCount;  //计时

//*********************************************************//
//函数：FIQ()
//语法：void  FIQ(void)
//描述：快速请求中断；
//		入口地址：_FIQ
//		功能：调用语音解码并播放API
//参数：无
//返回：无
//*********************************************************//
.TEXT
_FIQ:
	push R1,R5 to [SP]
	R1 = 0x0800
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_TimB
	R1 = 0x2000
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_TimA
	R1 = 0x8000
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_PWM

FIQ_is_PWM:
    [P_INT_Clear] = R1
	pop	R1,R5 from [SP];
	reti;

FIQ_is_TimA:
    call F_FIQ_Service_SACM_A2000;
	R1 = 0x2000
	[P_INT_Clear] = R1
	pop	R1,R5 from [SP];
	reti;

FIQ_is_TimB:   
    r1=0x0800;  
    [P_INT_Clear] = r1;           
    pop r1,r5 from [sp];
    reti;             


_IRQ3: 
	push R1,R5 to [SP]
	r1 = 0x0380;           //按键唤醒
    [P_INT_Clear] = R1;
	pop	R1,R5 from [SP];
	reti;
	

//--------2Hz and 4Hz------//
_IRQ5: 
	push R1,R5 to [SP]
	r1 = 0x0008;
	test r1,[P_INT_Ctrl];
	jnz	L_IRQ5_4Hz;

L_IRQ5_2Hz:
	R1 = 0xFFFF;          //万年历时间///////////////////
    [Per500msSet] = R1;
    r1 = [_TimeCount];    //计时
	r1 += 1;
	[_TimeCount] = r1;
    R1=0x0004
    [P_INT_Clear] = R1;
	pop	R1,R5 from [SP];
	reti;

L_IRQ5_4Hz:
    [P_INT_Clear] = R1;
	pop	R1,R5 from [SP];
	reti;

//-------- 256Hz RTC --------//
_IRQ6: 
    push R1,R5 to [SP]
    r1=0x0001
    test r1,[P_INT_Ctrl]
    jnz IRQ6_TMB2
 IRQ6_TMB1:
    r1=0x0002
    [P_INT_Clear]=r1
	pop	R1,R5 from [SP];
	reti; 
 IRQ6_TMB2:

    R1=[_TimeChangeCount]
    R1+=1
    [_TimeChangeCount]=R1
    r1=0x0001   
    [P_INT_Clear]=r1
	pop	R1,R5 from [SP];
	reti;
	    
.END

 