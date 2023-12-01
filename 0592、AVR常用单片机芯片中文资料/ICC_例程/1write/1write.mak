CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -g -bfunc_lit:0x1c.0x1000 -dram_end:0xdf -bdata:0x60.0xdf -dhwstk_size:16 -beeprom:1.256 -fihx_coff -S2
FILES = 1wire1.o 

1write:	$(FILES)
	$(CC) -o 1write $(LFLAGS) @1write.lk   -lslavr
1wire1.o: D:/ICC-AVR/include/io8515.h D:/ICC-AVR/include/slavr.h
1wire1.o:	F:\��Ƭ��\AVR��Ƭ��+����+�鼮+�̰�+Ӧ�����\16ʵ�������\���\icc\ICCAVR~1.3C\ICC_����\1write\1wire1.c
	$(CC) -c $(CFLAGS) F:\��Ƭ��\AVR��Ƭ��+����+�鼮+�̰�+Ӧ�����\16ʵ�������\���\icc\ICCAVR~1.3C\ICC_����\1write\1wire1.c
