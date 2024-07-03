
.define		P_IOA_DATA  	    0x7000
.define		P_IOA_DIR   	    0x7002 
.define		P_IOA_ATTRI	    	0x7003
.define		P_IOB_DATA  	    0x7005
.define		P_IOB_Dir   	    0x7007
.define		P_IOB_ATTRI			0x7008
.external ClearWatchDog
.external _main
.ram
.var first,last,keyword;

.code

.public _key_asm

_key_asm:
   call ClearWatchDog
/////////////////////////////////////
    r1=0xfff0;
		[P_IOA_DIR]=r1 ;
   r1=[pc]
    r1=0xff00;
		[P_IOA_ATTRI]=r1   ;        
	
	r1=0x0000;
		[P_IOA_DATA]=r1;

  r1=0x00f0;

 	r2 = 19;
?L_Debug:
	r2 -= 1;
	jnz		?L_Debug;


   r1=[P_IOA_DATA];
   [first]=r1; 
        nop
        nop
        nop
        retf;
 


retf
