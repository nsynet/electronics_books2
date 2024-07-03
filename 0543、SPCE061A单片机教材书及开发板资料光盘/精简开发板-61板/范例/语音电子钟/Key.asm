.include   hardware.inc

.public    _Key_Scan_ServiceLoop;

.DEFINE C_DebounceCnt	0x0050; //13ms È¥¶¶
.DEFINE C_CONTINUE   	0xB00;  //µÚ¶þ´ÎÒÔºóÓÐÐ§


.external  _Key
.external  _KeyPressFlag;  //ÎÞ¼ü°´ÏÂÊ±Çå0£»ÓÐ¼ü°´ÏÂÊ±B0=1£»
                             //µÚ¶þ´ÎÒÔºóÓÐÐ§B15=1
.external _SleepFlag

.ram
.var    Key_Buff;           //±¾´Î¼üÖµÔÝ´æµ¥Ôª
.var    Key_Debounce;       //¼ÆÊýµ¥Ôª
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
         [_KeyPressFlag]=r1    //Çå0
         r1=1 
         [_SleepFlag] = r1   //ÖÃË¯Ãß±êÖ¾
         retf
//-----------------------------//
 F_SomeKeyIsPressed:    
         R3=[_KeyPressFlag]    //ÓÐ¼ü°´ÏÂ  B0=1
         R3|=0x0001
         [_KeyPressFlag]=R3   //ÖÃ°´¼ü±êÖ¾
             
         r3=0 
         [_SleepFlag] = r3      //ÇåË¯Ãß±êÖ¾
         
         r1=[Key_Buff]    //¶ÁÉÏ´Î¼üÖµÉ 
         [Key_Buff]=r2    //ÔÝ´æ±¾´Î¼üÖµ
         cmp r1,r2
         je L_KS_StableTwoSample
         r1=0x0000
         [_Key]=r1
         r1=C_DebounceCnt    //³õÊ¼»¯¼ÆÊýµ¥Ôª
         [Key_Debounce]=r1  
         retf
        
   
   L_KS_StableTwoSample:       
	     r1=[Key_Debounce]
         jz L_KS_StableOverDebounce
         r1-=1              //¼ÆÊý¼õ 1
         [Key_Debounce]=r1    
         retf   
         

L_KS_StableOverDebounce:   //ÐÎ³É¼üÂë
		r1=[Key_Buff]       //ÔÝ´æÖµ

        r3=0x8000    //ÊÇµÚÒ»´ÎÓÐÐ§Âð£¿
        test r3,[_KeyPressFlag]   
        jz Key_First_Avail

        r1|=0x8000       //Á¬Ðø°´¼üÓÐÐ§         ///////////////////////
        jmp  Key_Get_Value
        
 Key_First_Avail:    //µÚÒ»´ÎÓÐÐ§        
       R3=[_KeyPressFlag]    //ÓÐ¼ü°´ÏÂ  B15=1
       R3|=0x8000
       [_KeyPressFlag]=R3   
       
 Key_Get_Value:      
        [_Key]=r1   //´æÓÐÐ§¼üÖµ  
        r1=C_CONTINUE
        [Key_Debounce]=r1
        retf
      .endp    
        
 