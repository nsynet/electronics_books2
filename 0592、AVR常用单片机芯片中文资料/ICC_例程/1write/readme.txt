      1)、void delay_us(int time);
           微秒延时程序
      2)、unsigned char ds1820_ack(void);
           检查DS1820是否存在：
	   如果DS1820不存在返回1，否则返回0
      3)、void ds1820_write(unsigned char cmd);
           写ROM或存贮器命令到DS1820
      4)、unsigned char ds1820_read(void);
           从DS1820读1字节数据
      5)、unsigned char crccheck(unsigned char *p,unsigned char len);
           CRC校验