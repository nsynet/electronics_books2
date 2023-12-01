CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -g -bfunc_lit:0x1c.0x1000 -dram_end:0xdf -bdata:0x60.0xdf -dhwstk_size:16 -beeprom:1.256 -fihx_coff -S2
FILES = 1wire1.o 

1write:	$(FILES)
	$(CC) -o 1write $(LFLAGS) @1write.lk   -lslavr
1wire1.o: D:/ICC-AVR/include/io8515.h D:/ICC-AVR/include/slavr.h
1wire1.o:	F:\单片机\AVR单片机+程序+书籍+教案+应用设计\16实验版资料\软件\icc\ICCAVR~1.3C\ICC_例程\1write\1wire1.c
	$(CC) -c $(CFLAGS) F:\单片机\AVR单片机+程序+书籍+教案+应用设计\16实验版资料\软件\icc\ICCAVR~1.3C\ICC_例程\1write\1wire1.c
