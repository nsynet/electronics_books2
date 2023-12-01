CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x1a.0x2000 -dhwstk_size:16 -beeprom:1.512 -fihx_coff
FILES = delay.o display.o 

display:	$(FILES)
	$(CC) -o display $(LFLAGS) @display.lk 
delay.o:	D:\ICC-AVR\examples.sl\display\delay.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\display\delay.c
display.o: D:/ICC-AVR/include/io8515.h
display.o:	D:\ICC-AVR\examples.sl\display\display.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\display\display.c
