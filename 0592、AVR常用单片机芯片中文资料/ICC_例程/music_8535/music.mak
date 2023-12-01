CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x22.0x2000 -dhwstk_size:16 -beeprom:1.512 -fihx_coff
FILES = sound.o 

music:	$(FILES)
	$(CC) -o music $(LFLAGS) @music.lk 
sound.o: D:/ICC-AVR/include/io8535.h D:/ICC-AVR/include/macros.h
sound.o:	D:\ICC-AVR\examples.sl\music_8535\sound.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\music_8535\sound.c
