//============================================================= 
// ��������:  _IRQ3
// ��������:  IRQ3��IRQ3_EXT2��IRQ3_EXT1��IRQ3_KEY�����ж�Դ, ����
//        ֻ�����������жϡ�
//��ڲ���:     ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
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
   push r1,r5 to [sp]		     //ѹջ���� 
   r1 = 0x0100 	    
   test r1,[P_INT_Ctrl] 	     //�Ƚ��Ƿ�ΪIRQ3_EXT1	 
   jnz L_IRQ3_Ext1			     //�ǣ���ת����Ӧ����Σ�
   r1 = 0x0200 	    
   test r1,[P_INT_Ctrl] 	     //����Ƚ��Ƿ�ΪIRQ3_EXT2
   jnz  L_IRQ3_Ext2			     //�ǣ���ת����Ӧ����Σ�  	    
L_IRQ3_Key:					     //�������������ж�
    r2 = [P_IOA_Data]            //��IOA0-7״̬
    test r2,C_IRQ3_Key1          //�Ƿ�ΪIOA0--IRQ3_Key1
    jnz L_IRQ3_Key1              //�ǣ�ת�Ƶ���Ӧ�����
    test r2, C_IRQ3_Key2         //�Ƿ�ΪIOA1--IRQ3_Key2
    jnz L_IRQ3_Key2              //�ǣ�ת�Ƶ���Ӧ�����
    test r2, C_IRQ3_Key3         //�Ƿ�ΪIOA2--IRQ3_Key3 
    jnz L_IRQ3_Key3              //�ǣ�ת�Ƶ���Ӧ�����   
    test r2, C_IRQ3_Key4         //�Ƿ�ΪIOA3--IRQ3_Key4 
    jnz L_IRQ3_Key4              //�ǣ�ת�Ƶ���Ӧ����� 
    test r2 ,C_IRQ3_Key5         //�Ƿ�ΪIOA4--IRQ3_Key5 
    jnz L_IRQ3_Key5              //�ǣ�ת�Ƶ���Ӧ����� 
    test r2 ,C_IRQ3_Key6         //�Ƿ�ΪIOA5--IRQ3_Key6 
    jnz L_IRQ3_Key6              //�ǣ�ת�Ƶ���Ӧ����� 
    test r2, C_IRQ3_Key7         //�Ƿ�ΪIOA6--IRQ3_Key7 
    jnz L_IRQ3_Key7              //�ǣ�ת�Ƶ���Ӧ����� 
    test r2, C_IRQ3_Key8         //�Ƿ�ΪIOA7--IRQ3_Key8 
    jnz L_IRQ3_Key8              //�ǣ�ת�Ƶ���Ӧ����� 
    r1 = 0x0080 	     
	[P_INT_Clear] = r1           //ȫ���������ж�
	pop r1,r5 from [sp]          //�˳�
	reti 
L_IRQ3_Key1:    
L_IRQ3_Key2:    
L_IRQ3_Key3:  
L_IRQ3_Key4:    
L_IRQ3_Key5:   
L_IRQ3_Key6:    
L_IRQ3_Key7:    
L_IRQ3_Key8:    
    [P_IOB_Buffer] =  r2       //Ϩ���Ӧ�ķ��������    
    r1 = 0x0080 	     
	[P_INT_Clear] = r1         //���ж�
	r3 =  [P_IOB_Data]
	pop r1,r5 from [sp]        //�˳�
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