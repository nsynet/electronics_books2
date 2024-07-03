//============================================================= 
// 函数名称:  _IRQ3
// 功能描述:  IRQ3有IRQ3_EXT2、IRQ3_EXT1和IRQ3_KEY三个中断源, 这里
//        只做触键唤醒中断。
//入口参数:     无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=================================================================
.INCLUDE hardware.inc

.DEFINE  P_IOA_RL                 0x7004;
.DEFINE  C_IRQ3_Key1              0x0001
.DEFINE  C_IRQ3_Key2              0x0002
.DEFINE  C_IRQ3_Key3              0x0004
.DEFINE  C_IRQ3_Key4              0x0008
.DEFINE  C_IRQ3_Key5              0x0010
.DEFINE  C_IRQ3_Key6              0x0020
.DEFINE  C_IRQ3_Key7              0x0040
.DEFINE  C_IRQ3_Key8              0x0080	    
.TEXT
.PUBLIC _IRQ3
_IRQ3:
   push r1,r5 to [sp]		     //压栈保护 
   r1 = 0x0100 	    
   test r1,[P_INT_Ctrl] 	     //比较是否为IRQ3_EXT1	 
   jnz L_IRQ3_Ext1			     //是，则转至对应程序段；
   r1 = 0x0200 	    
   test r1,[P_INT_Ctrl] 	     //否，则比较是否为IRQ3_EXT2
   jnz  L_IRQ3_Ext2			     //是，则转至对应程序段；  	    
L_IRQ3_Key:					     //否，则进入键唤醒中断
    r2 = [P_IOA_Data]            //读IOA0-7状态
    test r2,C_IRQ3_Key1          //是否为IOA0--IRQ3_Key1
    jnz L_IRQ3_Key1              //是，转移到对应程序段
    test r2, C_IRQ3_Key2         //是否为IOA1--IRQ3_Key2
    jnz L_IRQ3_Key2              //是，转移到对应程序段
    test r2, C_IRQ3_Key3         //是否为IOA2--IRQ3_Key3 
    jnz L_IRQ3_Key3              //是，转移到对应程序段   
    test r2, C_IRQ3_Key4         //是否为IOA3--IRQ3_Key4 
    jnz L_IRQ3_Key4              //是，转移到对应程序段 
    test r2 ,C_IRQ3_Key5         //是否为IOA4--IRQ3_Key5 
    jnz L_IRQ3_Key5              //是，转移到对应程序段 
    test r2 ,C_IRQ3_Key6         //是否为IOA5--IRQ3_Key6 
    jnz L_IRQ3_Key6              //是，转移到对应程序段 
    test r2, C_IRQ3_Key7         //是否为IOA6--IRQ3_Key7 
    jnz L_IRQ3_Key7              //是，转移到对应程序段 
    test r2, C_IRQ3_Key8         //是否为IOA7--IRQ3_Key8 
    jnz L_IRQ3_Key8              //是，转移到对应程序段 
    r1 = 0x0080 	     
	[P_INT_Clear] = r1           //全部不是清中断
	pop r1,r5 from [sp]          //退出
	reti 
L_IRQ3_Key1:    
L_IRQ3_Key2:    
L_IRQ3_Key3:  
L_IRQ3_Key4:    
L_IRQ3_Key5:   
L_IRQ3_Key6:    
L_IRQ3_Key7:    
L_IRQ3_Key8:    
    [P_IOB_Buffer] =  r2       //熄灭对应的发光二极管    
    r1 = 0x0080 	     
	[P_INT_Clear] = r1         //清中断
	r3 =  [P_IOB_Data]
	pop r1,r5 from [sp]        //退出
	reti                        
L_IRQ3_Ext2:   
   r1 = 0x0200 	     
   [P_INT_Clear] = r1           
   pop r1,r5 from [sp]
   reti
L_IRQ3_Ext1:   
   r1 = 0x0100 	     
   [P_INT_Clear] = r1  
   pop r1,r5 from [sp]
   reti