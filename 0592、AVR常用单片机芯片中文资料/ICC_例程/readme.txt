ʹ��ע�����
  1����ʹ�����ӳ���֮ǰ�������ļ�libslavr.a������ICCAVR��װĿ¼�µĿ��ļ�Ŀ¼��
      ��...\LIB\Ŀ¼����ͷ�ļ�slavr.h������ͷ�ļ�Ŀ¼��...\include\Ŀ¼��
  2�������ʹ�ÿ��ļ��еĺ�������ô�������£�
        1)�����ļ���Ӧʹ�� ��#include <slavr.h>������slavr.hͷ�ļ���
        2)���ڹ���ѡ���е�Additional LIBһ��������"slavr"��ʹ�ø��ӵ�libslavr.a
            ���ļ���(ע�⣺���Ų���Ҫ����)
  3��libslavr.a���а����ĺ����嵥���£�       
     1)��void write_lcd(unsigned char data,unsigned char data_type);
         д��������ݵ�LCDģ�飬��ֱ��ʹ�ÿ��������LCDģ�����  
           data:����������ֽ� ,data_type��0��ʾ���1��ʾ����   
     2)��unsigned char read_lcd(unsigned char data_type);
         ��LCDģ���ж�ȡ���ݻ��ַ 
          data_type��0��ʾ��ȡ��ַ��1��ʾ��ȡ����   
     3)��void lcd_init(void);
         LCDģ���ʼ��
     4)��void lcd_putc(unsigned char c) ;
         ���ַ��������
     5)��void lcd_puts(unsigned char *s);
         �ַ����������
     6)��void lcd_clear(void);
         ���LCD��ʾ����
     7)��void lcd_write(unsigned char adder,unsigned char data);
         д���ݵ�ָ��DDRAM/CGRAMλ��	   
     8)��void lcd_write_data(unsigned char data);
         д���ݵ�DDRAM��ǰλ��
     9)��unsigned char lcd_read(unsigned char adder);
	 ��ָ��DDRAM/CGRAMλ�ö�ȡ����  
     10)��void lcd_gotoxy(unsigned char x,unsigned char y);
          �����ת�Ƶ�DDRAMָ��λ�ô�, x:0~39,y:0~1
     11)��void lcd_shift(unsigned char n,unsigned char p);     
          LCD�ַ���λ����,n:�ƶ��Ĵ���,p:�ƶ�����,'l'��'L'��ʾ���ƣ�'r'��'R'��ʾ����	
     12)��void delay_1ms(void);
     13)��void delay_ms(unsigned int n);
          ��ʱ����(mS),��Ӧ����Ƶ��Ϊ8MHZ  
     14)��unsigned char scan_key(void);
          ����ɨ�躯��,ע�Ȿ�������������ͷż��					 
	      ����ֵ��1��û�м����·���0x7f
                      2�����shift���£�����ֵ���λΪ1
                      3�����������ʱ�����ؼ�����Ӧ��ֵ
     15)��unsigned char keypad(void);  
          ����ɨ�躯��,ע�Ȿ�����������ͷż��					 
	      ����ֵ��1��û�м����·���0x7f
                      2�����shift���£�����ֵ���λΪ1
                      3�����������ʱ�����ؼ�����Ӧ��ֵ
     16)��void Start(void); 
              I2C��������
     17)��void Stop(void); 
              I2C����ֹͣ
     18)��void Ack(void);
              ����Ӧ���ź�
     19)��void NoAck(void);
              ���ͷ�Ӧ���ź�
     20)��unsigned char TestAck(void);
              ����Ӧǩ�źţ���Ӧ���źŷ���0����Ӧ���źŷ���01��
     21)��void Write8Bit(unsigned char input);
              дһ���ֽ����ݵ�I2C��·��
     22)��unsigned char Read8Bit(void);
              ��I2C���߶�ȡһ���ֽ�����
     23)��void Write24c02(unsigned char *Wdata,unsigned char RomAddress,unsigned char number);
              �Դ���EEPROM������AT24C02����ҳдģʽ����д����ֽ�
              ����˵����unsigned char *Wdata ��ָ��Դ���ݿ��׵�ַ��ָ��
                        unsigned char RomAddress��EEPROM�е�Ŀ���ַ
                        unsigned char number������д���ֽ���
     24)��void Read24c02(unsigned char *RamAddress,unsigned char RomAddress,unsigned char bytes);
              �Դ���EEPROM������AT24C02����������ֽ�
              ����˵����unsigned char *RamAddress��ָ���Ŷ������ݵı�����ָ��
                        unsigned char RomAddress��EEPROM�е�Ŀ���ַ
                        unsigned char bytes�����������ֽ���
      25)��void delay_us(int time);
           ΢����ʱ����
      26)��unsigned char ds1820_ack(void);
           ���DS1820�Ƿ���ڣ�
	   ���DS1820�����ڷ���1�����򷵻�0
      27)��void ds1820_write(unsigned char cmd);
           дROM����������DS1820
      28)��unsigned char ds1820_read(void);
           ��DS1820��1�ֽ�����
      29)��unsigned char crccheck(unsigned char *p,unsigned char len);
           CRCУ��
  4������˵��
      1)��LED  ICCAVR�еĵ������ӣ�����ΪICCAVR����
      2)��interrupt ʹ�ö�ʱ��1����жϵ�����
      3)��LCD  SL-AVRʵ�����е�2*16λLCDģ���ʹ������  
      4)��display SL-AVRʵ��������·LED���ж�̬��ʾ�����ӳ���
      5)��keyboard �����������ӳ��� keyboard.c��keyboard1.c��keyboard2.c
          keyboard.c ��ʹ��keypad�������۲����LED��ʾ�к�Ӱ��
          keyboard1.c��ʹ��scan_key�������۲����LED��ʾ�к�Ӱ��
          keyboard2.c��ʹ��keypad�������۲����LCD��ʾ�к�Ӱ��
      6)��music ����������ʾ����----���š�����ɯ������
      7)��clock ����ʱ�ӳ���----24Сʱ��ʱ��
      8)��cymometer ������Ƶ�ʼƣ�������Χ0-999999 HZ
      9)��I2C  AVR��Ƭ��ʹ��I2C���ߵ����ӣ�AVR������I2C�����ڵ�ģʽ��������������
          I2C.c �Ե��ֽ�ģʽ����I2C��·������AT24C02�����ӳ��򣬴��п���ѧϰI2C���ߵĹ�������
          AT24C02.c ���ÿ⺯����AT24C02���ж�д�������������ֽڶ�д��
      10)��Cycle.c ΪICP�����ź����ڲ�������
           Cycle_1.cΪICP�����ź�ռ�ձȲ�������
      11)��DTMF  ����T1 ��PWM��ʽ����˫��Ƶ�ź�
      12)��1WRITE ��DS1820Ϊ�����ܵ�����������Ӧ��
      13)��UARTΪRS232����ͨ�����ӳ�������ICCAVR���ն˵��Դ��ں�PC�����̣����Խ����PC������
           �����ĸ�����ֻ���ת�͵�ICCAVR���ն˵��Դ��ڡ�
      14)��pc_8515��PC������ʾ����������SL-AVR+��SL-AVRAD���������ߡ�
      15)��pc_8535��PC������ʾ����������SL-AVRAD��SL-AVR+���������ߡ�
      16)��music_8535��������ʾ����������SL-AVRAD��SL-AVR+ʹ��ԭSL-AVR������ʾ����
      17)��AD_8535_LCD��ADת����ʾ������2*16�ַ�LCD��ʾ��������SL-AVRAD��
      18)��AD_8535_LED��ADת����ʾ������6λLED��ʾ��������SL-AVRAD��
      ע�⣺a�����ϳ����в������ӳ���ʹ����SL-AVRר�ÿ�libslavr.a�������йغ���ԭ��˵���ο�
               ͷ�ļ�slavr.h��
            b���������ӳ����Ӳ���������û������˵��������˫�����ӳ�Ʒ��SL-AVR��SL-AVR+��
	       SL-AVRADʵ���ǵĳ���Ĭ�����ߡ�


       