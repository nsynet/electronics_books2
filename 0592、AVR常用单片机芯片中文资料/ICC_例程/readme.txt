使用注意事项：
  1、在使用例子程序之前，将库文件libslavr.a拷贝到ICCAVR安装目录下的库文件目录中
      即...\LIB\目录。将头文件slavr.h拷贝到头文件目录即...\include\目录。
  2、如果想使用库文件中的函数，那么设置如下：
        1)、在文件中应使用 “#include <slavr.h>”包含slavr.h头文件。
        2)、在工程选项中的Additional LIB一栏中填入"slavr"，使用附加的libslavr.a
            库文件。(注意：引号不需要输入)
  3、libslavr.a库中包含的函数清单如下：       
     1)、void write_lcd(unsigned char data,unsigned char data_type);
         写命令或数据到LCD模块，可直接使用控制命令对LCD模块操作  
           data:命令或数据字节 ,data_type：0表示命令，1表示数据   
     2)、unsigned char read_lcd(unsigned char data_type);
         从LCD模块中读取数据或地址 
          data_type：0表示读取地址，1表示读取数据   
     3)、void lcd_init(void);
         LCD模块初始化
     4)、void lcd_putc(unsigned char c) ;
         单字符输出函数
     5)、void lcd_puts(unsigned char *s);
         字符串输出函数
     6)、void lcd_clear(void);
         清除LCD显示函数
     7)、void lcd_write(unsigned char adder,unsigned char data);
         写数据到指定DDRAM/CGRAM位置	   
     8)、void lcd_write_data(unsigned char data);
         写数据到DDRAM当前位置
     9)、unsigned char lcd_read(unsigned char adder);
	 从指定DDRAM/CGRAM位置读取数据  
     10)、void lcd_gotoxy(unsigned char x,unsigned char y);
          将光标转移到DDRAM指定位置处, x:0~39,y:0~1
     11)、void lcd_shift(unsigned char n,unsigned char p);     
          LCD字符移位函数,n:移动的次数,p:移动方向,'l'或'L'表示左移，'r'或'R'表示右移	
     12)、void delay_1ms(void);
     13)、void delay_ms(unsigned int n);
          延时函数(mS),对应晶振频率为8MHZ  
     14)、unsigned char scan_key(void);
          键盘扫描函数,注意本函数不作按键释放检查					 
	      返回值：1、没有键按下返回0x7f
                      2、如果shift按下，返回值最高位为1
                      3、其余键按下时，返回键名对应数值
     15)、unsigned char keypad(void);  
          键盘扫描函数,注意本函数作按键释放检查					 
	      返回值：1、没有键按下返回0x7f
                      2、如果shift按下，返回值最高位为1
                      3、其余键按下时，返回键名对应数值
     16)、void Start(void); 
              I2C总线启动
     17)、void Stop(void); 
              I2C总线停止
     18)、void Ack(void);
              发送应答信号
     19)、void NoAck(void);
              发送非应答信号
     20)、unsigned char TestAck(void);
              测试应签信号，有应答信号返回0，无应答信号返回01。
     21)、void Write8Bit(unsigned char input);
              写一个字节数据到I2C总路线
     22)、unsigned char Read8Bit(void);
              从I2C总线读取一个字节数据
     23)、void Write24c02(unsigned char *Wdata,unsigned char RomAddress,unsigned char number);
              对串行EEPROM存贮器AT24C02采用页写模式连续写多个字节
              参数说明：unsigned char *Wdata ，指向源数据块首地址的指针
                        unsigned char RomAddress，EEPROM中的目标地址
                        unsigned char number，连续写的字节数
     24)、void Read24c02(unsigned char *RamAddress,unsigned char RomAddress,unsigned char bytes);
              对串行EEPROM存贮器AT24C02连续读多个字节
              参数说明：unsigned char *RamAddress，指向存放读出数据的变量的指针
                        unsigned char RomAddress，EEPROM中的目标地址
                        unsigned char bytes，连续读的字节数
      25)、void delay_us(int time);
           微秒延时程序
      26)、unsigned char ds1820_ack(void);
           检查DS1820是否存在：
	   如果DS1820不存在返回1，否则返回0
      27)、void ds1820_write(unsigned char cmd);
           写ROM或存贮器命令到DS1820
      28)、unsigned char ds1820_read(void);
           从DS1820读1字节数据
      29)、unsigned char crccheck(unsigned char *p,unsigned char len);
           CRC校验
  4、例子说明
      1)、LED  ICCAVR中的典型例子，可作为ICCAVR的起步
      2)、interrupt 使用定时器1溢出中断的例子
      3)、LCD  SL-AVR实验仪中的2*16位LCD模块的使用例子  
      4)、display SL-AVR实验仪中六路LED进行动态显示的例子程序
      5)、keyboard 包含三个例子程序 keyboard.c、keyboard1.c和keyboard2.c
          keyboard.c ：使用keypad函数，观察其对LED显示有何影响
          keyboard1.c：使用scan_key函数，观察其对LED显示有何影响
          keyboard2.c：使用keypad函数，观察其对LCD显示有何影响
      6)、music 电脑音乐演示程序----播放“卡秋莎”音乐
      7)、clock 电脑时钟程序----24小时制时钟
      8)、cymometer 单量程频率计，测量范围0-999999 HZ
      9)、I2C  AVR单片机使用I2C总线的例子，AVR工作于I2C的主节点模式，包含两个例子
          I2C.c 以单字节模式访问I2C总路线器件AT24C02的例子程序，从中可以学习I2C总线的工作过程
          AT24C02.c 调用库函数对AT24C02进行读写，可以连续多字节读写。
      10)、Cycle.c 为ICP引脚信号周期测量程序
           Cycle_1.c为ICP引脚信号占空比测量程序
      11)、DTMF  利用T1 的PWM方式产生双音频信号
      12)、1WRITE 以DS1820为例介绍单总线器件的应用
      13)、UART为RS232串行通信例子程序，利用ICCAVR的终端调试窗口和PC机键盘，可以将你从PC键盘输
           入的字母、数字或汉字转送到ICCAVR的终端调试窗口。
      14)、pc_8515：PC键盘演示程序，适用于SL-AVR+，SL-AVRAD需另外跳线。
      15)、pc_8535：PC键盘演示程序，适用于SL-AVRAD，SL-AVR+需另外跳线。
      16)、music_8535：音乐演示程序，适用于SL-AVRAD，SL-AVR+使用原SL-AVR音乐演示程序。
      17)、AD_8535_LCD：AD转换演示程序，用2*16字符LCD显示，适用于SL-AVRAD。
      18)、AD_8535_LED：AD转换演示程序，用6位LED显示，适用于SL-AVRAD。
      注意：a、以上程序中部分例子程序使用了SL-AVR专用库libslavr.a，其中有关函数原型说明参考
               头文件slavr.h。
            b、上述例子程序的硬件接线如果没有特殊说明，采用双龙电子出品的SL-AVR、SL-AVR+、
	       SL-AVRAD实验仪的出厂默认跳线。


       