CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W -O 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x1a.0x2000 -dhwstk_size:16 -beeprom:1.512 -O -fihx_coff
FILES = pc_8515.o kbc.o 

pc_8515:	$(FILES)
	$(CC) -o pc_8515 $(LFLAGS) @pc_8515.lk 
pc_8515.o: D:/ICC-AVR/include/io8515.h D:/ICC-AVR/include/stdio.h D:/ICC-AVR/include/_const.h
pc_8515.o:	D:\ICC-AVR\examples.sl\pc_8515\pc_8515.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\pc_8515\pc_8515.c
kbc.o: D:/ICC-AVR/include/io8515.h D:/ICC-AVR/include/macros.h D:\ICC-AVR\examples.sl\pc_8515/pindefs.h D:\ICC-AVR\examples.sl\pc_8515/scancodes.h
kbc.o:	D:\ICC-AVR\examples.sl\pc_8515\kbc.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\pc_8515\kbc.c
