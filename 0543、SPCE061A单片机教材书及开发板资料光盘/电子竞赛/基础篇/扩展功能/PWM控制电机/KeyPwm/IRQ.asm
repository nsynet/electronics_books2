//======================================================
// 文件名称:	PWM.asm
// 功能描述：   PWM设置服务 
// 完成日期：   2003-8-13
//======================================================
.define		P_INT_CTRL		0x7010;
.define		P_INT_CLEAR		0x7011;
.EXTERNAL   _F_PwmIRQ3
.RAM
                           //TimeA: 频率设置值,PWM:占空比设置值
.VAR TimeA=0x0020,PWM=0x0000
.text
//======================================================
// 函数名称:	IRQ3
// 实现功能:    外部中断服务
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r1，r2
//======================================================
.public _IRQ3
_IRQ3:
   push r1,r5 to [sp]		//压栈保护 
   r1=0x0100 	    
   test r1,[P_INT_CTRL] 	//比较是否为IRQ3_EXT1	 
   jnz  irq3_ext1			//是，则转至对应程序段；
   r1=0x0200 	    
   test r1,[P_INT_CTRL] 	//否，则比较是否为IRQ3_EXT2
   jnz  irq3_ext2			//是，则转至对应程序段；
   r1=0x0200 	    
   
irq3_key:					//否，则进入键唤醒中断
	r1=0x0080 	     
	[P_INT_CLEAR]=r1 
	pop r1,r5 from [sp]   
	reti

irq3_ext2:
   r1=[TimeA]
   r1+=0xf0
   [TimeA]=r1
   r2=[PWM]
   call _F_PwmIRQ3;          //重设pwm,来自于pwm.asm
   r1=0x0200 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti

irq3_ext1:
   r1=[PWM]
   r1+=0x0030
   r2=0x0ff0
   cmp r2,r1
   jb ReturnLoop 
   [PWM]=r1
   r1=[TimeA]
   r2=[PWM]
   call _F_PwmIRQ3;          //重设pwm,来自于pwm.asm
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti
ReturnLoop:
   r1=0x0000
   [PWM]=r1
   r1=[TimeA]
   r2=[PWM]
   call _F_PwmIRQ3;          //重设pwm,来自于pwm.asm
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti
    
   
   
    





