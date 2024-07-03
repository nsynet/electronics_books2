//======================================================
// �ļ�����:	PWM.asm
// ����������   PWM���÷��� 
// ������ڣ�   2003-8-13
//======================================================
.define		P_INT_CTRL		0x7010;
.define		P_INT_CLEAR		0x7011;
.EXTERNAL   _F_PwmIRQ3
.RAM
                           //TimeA: Ƶ������ֵ,PWM:ռ�ձ�����ֵ
.VAR TimeA=0x0020,PWM=0x0000
.text
//======================================================
// ��������:	IRQ3
// ʵ�ֹ���:    �ⲿ�жϷ���
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1��r2
//======================================================
.public _IRQ3
_IRQ3:
   push r1,r5 to [sp]		//ѹջ���� 
   r1=0x0100 	    
   test r1,[P_INT_CTRL] 	//�Ƚ��Ƿ�ΪIRQ3_EXT1	 
   jnz  irq3_ext1			//�ǣ���ת����Ӧ����Σ�
   r1=0x0200 	    
   test r1,[P_INT_CTRL] 	//����Ƚ��Ƿ�ΪIRQ3_EXT2
   jnz  irq3_ext2			//�ǣ���ת����Ӧ����Σ�
   r1=0x0200 	    
   
irq3_key:					//�������������ж�
	r1=0x0080 	     
	[P_INT_CLEAR]=r1 
	pop r1,r5 from [sp]   
	reti

irq3_ext2:
   r1=[TimeA]
   r1+=0xf0
   [TimeA]=r1
   r2=[PWM]
   call _F_PwmIRQ3;          //����pwm,������pwm.asm
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
   call _F_PwmIRQ3;          //����pwm,������pwm.asm
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti
ReturnLoop:
   r1=0x0000
   [PWM]=r1
   r1=[TimeA]
   r2=[PWM]
   call _F_PwmIRQ3;          //����pwm,������pwm.asm
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti
    
   
   
    





