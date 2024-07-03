.include   hardware.inc

.public    _Key_Scan_ServiceLoop;

.DEFINE C_DebounceCnt	0x0050; //13ms ȥ��
.DEFINE C_CONTINUE   	0xB00;  //�ڶ����Ժ���Ч


.external  _Key
.external  _KeyPressFlag;  //�޼�����ʱ��0���м�����ʱB0=1��
                             //�ڶ����Ժ���ЧB15=1
.external _SleepFlag

.ram
.var    Key_Buff;           //���μ�ֵ�ݴ浥Ԫ
.var    Key_Debounce;       //������Ԫ
.var    KeyScanLineBuff;


.code   
.public Key_Scan_Init
Key_Scan_Init: .proc
       r1=0x0000
       [_Key]=r1
       [Key_Buff]=r1
       [_KeyPressFlag]=r1
       retf
      .endp
 
_Key_Scan_ServiceLoop: .proc
         R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;
         r2=[P_IOA_Data]
         r2&=0x00ff
         jnz F_SomeKeyIsPressed
         r1=0x0000
         [Key_Buff]=r1      
         [_KeyPressFlag]=r1    //��0
         r1=1 
         [_SleepFlag] = r1   //��˯�߱�־
         retf
//-----------------------------//
 F_SomeKeyIsPressed:    
         R3=[_KeyPressFlag]    //�м�����  B0=1
         R3|=0x0001
         [_KeyPressFlag]=R3   //�ð�����־
             
         r3=0 
         [_SleepFlag] = r3      //��˯�߱�־
         
         r1=[Key_Buff]    //���ϴμ�ֵ� 
         [Key_Buff]=r2    //�ݴ汾�μ�ֵ
         cmp r1,r2
         je L_KS_StableTwoSample
         r1=0x0000
         [_Key]=r1
         r1=C_DebounceCnt    //��ʼ��������Ԫ
         [Key_Debounce]=r1  
         retf
        
   
   L_KS_StableTwoSample:       
	     r1=[Key_Debounce]
         jz L_KS_StableOverDebounce
         r1-=1              //������ 1
         [Key_Debounce]=r1    
         retf   
         

L_KS_StableOverDebounce:   //�γɼ���
		r1=[Key_Buff]       //�ݴ�ֵ

        r3=0x8000    //�ǵ�һ����Ч��
        test r3,[_KeyPressFlag]   
        jz Key_First_Avail

        r1|=0x8000       //����������Ч         ///////////////////////
        jmp  Key_Get_Value
        
 Key_First_Avail:    //��һ����Ч        
       R3=[_KeyPressFlag]    //�м�����  B15=1
       R3|=0x8000
       [_KeyPressFlag]=R3   
       
 Key_Get_Value:      
        [_Key]=r1   //����Ч��ֵ  
        r1=C_CONTINUE
        [Key_Debounce]=r1
        retf
      .endp    
        
 