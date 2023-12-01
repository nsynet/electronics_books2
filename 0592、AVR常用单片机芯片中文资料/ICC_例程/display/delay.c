/****************************************/
/*  延时函数(mS),在本文件中应定义:xtal� */
/*      xtal为对应晶振频率,单位为MHZ    */
/*  在调用延时函数的文件中,应作如下说明 */
/* extern void delay_ms(unsigned int n);*/
/* extern void delay_1ms(void);         */
/****************************************/
#define xtal 8   
void delay_1ms(void)
{ unsigned int i;
 for(i=1;i<(unsigned int)(xtal*143-2);i++)
    ;
}
void delay_ms(unsigned int n)
{
 unsigned int i=0;
   while(i<n)
   {delay_1ms();
    i++;
   }
}