      1)��void delay_us(int time);
           ΢����ʱ����
      2)��unsigned char ds1820_ack(void);
           ���DS1820�Ƿ���ڣ�
	   ���DS1820�����ڷ���1�����򷵻�0
      3)��void ds1820_write(unsigned char cmd);
           дROM����������DS1820
      4)��unsigned char ds1820_read(void);
           ��DS1820��1�ֽ�����
      5)��unsigned char crccheck(unsigned char *p,unsigned char len);
           CRCУ��