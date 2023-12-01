CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W 
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x1a.0x2000 -dhwstk_size:16 -beeprom:1.512 -fihx_coff
FILES = cycle_1.o 

cycle_1:	$(FILES)
	$(CC) -o cycle_1 $(LFLAGS) @cycle_1.lk 
cycle_1.o:	D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\CYCLE\cycle_1.c
