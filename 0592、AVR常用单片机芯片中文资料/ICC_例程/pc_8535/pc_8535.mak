CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W -O 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x22.0x2000 -dhwstk_size:16 -beeprom:1.512 -O -fihx_coff
FILES = kbc.o pc_8535.o 

pc_8535:	$(FILES)
	$(CC) -o pc_8535 $(LFLAGS) @pc_8535.lk 
kbc.o: D:/ICC-AVR/include/io8535.h D:/ICC-AVR/include/macros.h D:\ICC-AVR\examples.sl\pc_8535/pindefs.h D:\ICC-AVR\examples.sl\pc_8535/scancodes.h
kbc.o:	D:\ICC-AVR\examples.sl\pc_8535\kbc.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\pc_8535\kbc.c
pc_8535.o: D:/ICC-AVR/include/io8535.h D:/ICC-AVR/include/stdio.h D:/ICC-AVR/include/_const.h
pc_8535.o:	D:\ICC-AVR\examples.sl\pc_8535\pc_8535.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\pc_8535\pc_8535.c
