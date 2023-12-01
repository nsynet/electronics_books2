CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W 
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x1a.0x2000 -dhwstk_size:16 -beeprom:1.512 -fihx_coff
FILES = DTMF.o 

dtmf:	$(FILES)
	$(CC) -o dtmf $(LFLAGS) @dtmf.lk 
DTMF.o:	D:\ICC-AVR\examples.sl\DTMF\DTMF.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\DTMF\DTMF.c
