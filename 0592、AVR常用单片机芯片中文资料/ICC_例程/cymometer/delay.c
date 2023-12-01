/****************************************/
/*  ÑÓÊ±º¯Êı(mS),ÔÚ±¾ÎÄ¼şÖĞÓ¦¶¨Òå:xtalº */
/*      xtalÎª¶ÔÓ¦¾§ÕñÆµÂÊ,µ¥Î»ÎªMHZ    */
/*  ÔÚµ÷ÓÃÑÓÊ±º¯ÊıµÄÎÄ¼şÖĞ,Ó¦×÷ÈçÏÂËµÃ÷ */
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