	.module I2C.c
	.area code(ram, con, rel)
	.area lit(rom, con, rel)
_tabel::
	.byte 63,6
	.byte 91,'O
	.byte 'f,'m
	.byte 125,7
	.byte 127,'o
	.byte 'w,124
	.byte 57,94
	.byte 'y,'q
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
	.dbsym s tabel _tabel Ac[16:16]
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
_ledbuff::
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
	.blkb 2
	.area idata
	.byte 63,63
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
	.dbsym s ledbuff _ledbuff Ac[6:6]
	.area text(rom, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
	.dbfunc s i2c_Write _i2c_Write fI
;     RomAddress -> R22
;          Wdata -> R20
	.even
_i2c_Write::
	rcall push_gset2
	mov R22,R18
	mov R20,R16
	.dbline 25{
; /**********************************************
;              http://www.sl.com.cn
;       双龙电子公司----I2C总线演示程序(ICCAVR)
; 	             作者：詹卫前
; 		  1、以访问AT24C02为例
; 		  2、SDA ：PORTA.0
; 		  3、SCL : PORTA.1
; 	使用注意：1、应包含头文件slavr.h
;               2、在工程选项中的Additional Lib中填入slavr
; 		         使用编译器使用附加库文件libslavr.a
; ***********************************************/
; #include <io8515.h>
; #include <slavr.h>
;           /*   七段译码字形表     */
; #pragma data:code		          
; const unsigned char tabel[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; #pragma data:data
;           /*     显示缓冲区       */
; unsigned char ledbuff[]={0x3f,0x3f,0x3f,0x3f,0x00,0x00};
; unsigned char at24_add,at24_data;
; /******************************************
;                I2C总线写一个字节
; *******************************************/
; void i2c_Write(unsigned char Wdata,unsigned char RomAddress) 
; {
	.dbline 26
; 	  Start();
	rcall _Start
	.dbline 27
; 	  Write8Bit(0xa0);
	ldi R16,160
	rcall _Write8Bit
	.dbline 28
; 	  TestAck();
	rcall _TestAck
	.dbline 29
; 	  Write8Bit(RomAddress);
	mov R16,R22
	rcall _Write8Bit
	.dbline 30
; 	  TestAck();	
	rcall _TestAck
	.dbline 31
; 	  Write8Bit(Wdata);
	mov R16,R20
	rcall _Write8Bit
	.dbline 32
; 	  TestAck();		
	rcall _TestAck
	.dbline 33
; 	  Stop();
	rcall _Stop
	.dbline 34
;  	  delay_ms(10);
	ldi R16,10
	ldi R17,0
	rcall _delay_ms
	.dbline 35}
; }
L1:
	rcall pop_gset2
	ret
	.dbsym r RomAddress 22 c
	.dbsym r Wdata 20 c
	.dbfunc s i2c_Read _i2c_Read fI
;           temp -> R20
;     RomAddress -> R20
	.even
_i2c_Read::
	rcall push_gset1
	mov R20,R16
	.dbline 40{
; /******************************************
;                I2C总线读一个字节
; *******************************************/
; unsigned char i2c_Read(unsigned char RomAddress) 
;       {
	.dbline 42
; 	   unsigned char temp;
; 	   Start();
	rcall _Start
	.dbline 43
; 	   Write8Bit(0xa0); 
	ldi R16,160
	rcall _Write8Bit
	.dbline 44
; 	   TestAck();
	rcall _TestAck
	.dbline 45
; 	   Write8Bit(RomAddress);
	mov R16,R20
	rcall _Write8Bit
	.dbline 46
; 	   TestAck();
	rcall _TestAck
	.dbline 47
; 	   Start();
	rcall _Start
	.dbline 48
; 	   Write8Bit(0xa1);
	ldi R16,161
	rcall _Write8Bit
	.dbline 49
; 	   TestAck();	
	rcall _TestAck
	.dbline 50
; 	   temp=Read8Bit();
	rcall _Read8Bit
	mov R2,R16
	mov R3,R17
	mov R20,R2
	.dbline 51
; 	   NoAck();
	rcall _NoAck
	.dbline 52
;        Stop();
	rcall _Stop
	.dbline 53
; 	   return temp;
	mov R16,R20
	clr R17
L2:
	rcall pop_gset1
	ret
	.dbline 54}
	.dbsym r temp 20 c
	.dbsym r RomAddress 20 c
	.dbfunc s port_init _port_init fI
	.even
_port_init::
	.dbline 59{
;       }   
; /******************************************
;                端口初始化
; *******************************************/
; void port_init(void)
;  {
	.dbline 60
;   DDRD=0x3f;
	ldi R24,63
	out 0x11,R24
	.dbline 61
;   DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 62
;   PORTD=0xff;
	out 0x12,R24
	.dbline 63
;   PORTB=0xff;
	out 0x18,R24
	.dbline 64}
;  }
L3:
	ret
	.dbfunc s display _display fI
;              i -> R20
	.even
_display::
	rcall push_gset1
	.dbline 69{
; /******************************************
;           六路动态扫描显示电路
; *******************************************/
; void display(void)
; {
	.dbline 71
;  unsigned char i;
;   i=at24_data%16;
	ldi R17,16
	lds R16,_at24_data
	rcall mod8u
	mov R20,R16
	.dbline 72
;   ledbuff[0]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff,R0
	.dbline 73
;   i=at24_data/16;
	ldi R17,16
	lds R16,_at24_data
	rcall div8u
	mov R20,R16
	.dbline 74
;   ledbuff[1]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+1,R0
	.dbline 75
;   i=at24_add%16;
	ldi R17,16
	lds R16,_at24_add
	rcall mod8u
	mov R20,R16
	.dbline 76
;   ledbuff[2]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+2,R0
	.dbline 77
;   i=at24_add/16;
	ldi R17,16
	lds R16,_at24_add
	rcall div8u
	mov R20,R16
	.dbline 78
;   ledbuff[3]=tabel[i];
	ldi R24,<_tabel
	ldi R25,>_tabel
	mov R2,R20
	clr R3
	add R2,R24
	adc R3,R25
	mov R30,R2
	mov R31,R3
	lpm
	sts _ledbuff+3,R0
	.dbline 79
;  for (i=0;i<6;i++)
	clr R20
	rjmp L11
L8:
	.dbline 80
	.dbline 81
	ldi R24,<_ledbuff
	ldi R25,>_ledbuff
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 82
	ldi R16,1
	mov R17,R20
	rcall lsl8
	mov R2,R16
	com R2
	out 0x12,R2
	.dbline 83
	rcall _delay_1ms
	.dbline 84
	ldi R16,1
	mov R17,R20
	rcall lsl8
	in R2,0x12
	or R2,R16
	out 0x12,R2
	.dbline 85
L9:
	.dbline 79
	inc R20
L11:
	.dbline 79
	cpi R20,6
	brlo L8
	.dbline 86}
;   {
;    PORTB=ledbuff[i];//将显示缓冲区数据送PORTB口
;    PORTD=~(1<<i);   //开始显示
;    delay_1ms();     //每一位显示保持一定时间
;    PORTD|=(1<<i);   //关闭显示
;   }
; }
L4:
	rcall pop_gset1
	ret
	.dbsym r i 20 c
	.dbfunc s main _main fI
;          index -> R22
;           flag -> R10
;           key1 -> R12
;           key2 -> R14
	.even
_main::
	.dbline 99{
; /******************************************
;     主程序功能：演示了读写AT24C02的过程
; 	说明：1、键盘上0~F键用于输入地址或数据，
; 	         SHIFT键用于切换状态
; 		  2、上电复位后，按数字键只可以修改地
; 		     址,程序自动显示AT24C02单元内容。
; 		  3、按一次SHIFT键，最高位LED小数点亮
; 		     此时可以修改数字，再按一次SHIFT键
; 			 程序将修改后的数字写入AT24C02，然
; 			 后回到上电复位后的状态		
; *******************************************/
; void main(void)
; {
	.dbline 102
;  unsigned char key1,key2;
;  unsigned char index,flag;
;  MCUCR=0;
	clr R2
	out 0x35,R2
	.dbline 103
;  at24_add=0;
	sts _at24_add,R2
	.dbline 104
;  at24_data=0;
	sts _at24_data,R2
	.dbline 105
;  index=0;
	clr R22
	.dbline 106
;  flag=0;
	clr R10
	.dbline 107
;  port_init(); //端口初始化
	rcall _port_init
	rjmp L14
L13:
	.dbline 109
;  while(1)
;   {  
	.dbline 110
;      key1=scan_key();
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R12,R2
	.dbline 111
;   	 if (key1!=0x7f)
	mov R24,R12
	cpi R24,127
	brne X2
	rjmp L16
X2:
	.dbline 112
; 	    {
L18:
	.dbline 114
; 		 do 
; 		   {
	.dbline 115
; 		    key2=scan_key();//检查按键释放
	rcall _scan_key
	mov R2,R16
	mov R3,R17
	mov R14,R2
	.dbline 116
; 	  	    display();
	rcall _display
	.dbline 117
; 			}
L19:
	.dbline 118
; 		 while(key1==key2);
	cp R12,R14
	breq L18
	.dbline 119
; 		 if (key1>=0x80)
	mov R24,R12
	cpi R24,128
	brlo L21
	.dbline 120
; 		    {
	.dbline 121
; 			 if (flag!=0x00)//SHIFT键切换数据和地址修改
	tst R10
	breq L23
	.dbline 122
; 			     { 
	.dbline 123
; 				   i2c_Write(at24_data,at24_add);
	lds R18,_at24_add
	lds R16,_at24_data
	rcall _i2c_Write
	.dbline 124
; 				   flag=0x00;
	clr R10
	.dbline 125
; 				  }			 
	rjmp L24
L23:
	.dbline 126
; 			 else flag=0x80;
	ldi R24,128
	mov R10,R24
L24:
	.dbline 127
; 			 ledbuff[5]=0x00^flag;
	sts _ledbuff+5,R10
	.dbline 128
; 			 index=0;
	clr R22
	.dbline 129
; 			 }
	rjmp L22
L21:
	.dbline 131
; 		 else
; 		    {
	.dbline 132
; 			 switch (index)
	mov R20,R22
	clr R21
	cpi R20,0
	cpc R20,R21
	breq L29
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L32
	rjmp L26
X0:
	.dbline 133
; 			   {
L29:
	.dbline 134
; 			    case 0:{if (flag==0x00)
	.dbline 134
	tst R10
	brne L30
	.dbline 135
; 				           {key2=at24_add&0x0f;
	.dbline 135
	lds R24,_at24_add
	andi R24,15
	mov R14,R24
	.dbline 136
; 						    at24_add=key2|(key1<<4);
	mov R24,R12
	andi R24,#0x0F
	swap R24
	mov R2,R14
	or R2,R24
	sts _at24_add,R2
	.dbline 137
; 						    }
	rjmp L31
L30:
	.dbline 139
; 				        else
; 						   {key2=at24_data&0x0f;
	.dbline 139
	lds R24,_at24_data
	andi R24,15
	mov R14,R24
	.dbline 140
; 						    at24_data=key2|(key1<<4);
	mov R24,R12
	andi R24,#0x0F
	swap R24
	mov R2,R14
	or R2,R24
	sts _at24_data,R2
	.dbline 141
; 							}
L31:
	.dbline 142
; 						index=01;							
	ldi R22,1
	.dbline 143
; 						break;	     
	rjmp L27
L32:
	.dbline 145
; 				       }
; 				case 1:{if (flag==0x00)
	.dbline 145
	tst R10
	brne L33
	.dbline 146
; 				           {key2=at24_add&0xf0;
	.dbline 146
	lds R24,_at24_add
	andi R24,240
	mov R14,R24
	.dbline 147
; 						    at24_add=key2|(key1&0x0f);
	mov R24,R12
	andi R24,15
	mov R2,R14
	or R2,R24
	sts _at24_add,R2
	.dbline 148
; 						    }
	rjmp L34
L33:
	.dbline 150
; 				        else
; 						   {key2=at24_data&0xf0;
	.dbline 150
	lds R24,_at24_data
	andi R24,240
	mov R14,R24
	.dbline 151
; 						    at24_data=key2|(key1&0x0f);
	mov R24,R12
	andi R24,15
	mov R2,R14
	or R2,R24
	sts _at24_data,R2
	.dbline 152
; 							}
L34:
	.dbline 153
; 						index=00;	
	clr R22
	.dbline 154
; 						break;	
L26:
L27:
	.dbline 157
; 				       }
; 			   }    			
; 			} 	
L22:
	.dbline 158
; 		 }	 	 		 		 			  
L16:
	.dbline 159
;      if (flag==0x00)
	tst R10
	brne L35
	.dbline 160
; 	 at24_data=i2c_Read(at24_add);
	lds R16,_at24_add
	rcall _i2c_Read
	mov R2,R16
	mov R3,R17
	sts _at24_data,R2
L35:
	.dbline 161
	rcall _display
	.dbline 162
L14:
	.dbline 108
	rjmp L13
X1:
	.dbline 163}
; 	 display();	  
;   }
; }
L12:
	ret
	.dbsym r index 22 c
	.dbsym r flag 10 c
	.dbsym r key1 12 c
	.dbsym r key2 14 c
	.area bss(ram, con, rel)
	.dbfile D:\ICC-AVR\examples.sl\I2C\I2C.c
_at24_data::
	.blkb 1
	.dbsym s at24_data _at24_data c
_at24_add::
	.blkb 1
	.dbsym s at24_add _at24_add c
