
.include hardware.inc
.define P_IOA_RL              0x7004        //portA last data latch
.RAM
.code
.public _WakeUp

_WakeUp: .proc

    INT off 
    r1 = 0x0004                //中断初始化
    [P_INT_Ctrl] = r1;  
    r1=[P_IOA_RL] 
    INT IRQ                  //开中断   
    r1=0x0017;               //on 32768   
    [P_SystemClock]=r1       //进入睡眠状态
    r1 = 0x0002;
    [P_INT_Ctrl] = r1;  
    r1 = 0x0000
   [P_SystemClock]=r1 
    r1 = 0x0001;             //测试成功
    retf;
.endp    