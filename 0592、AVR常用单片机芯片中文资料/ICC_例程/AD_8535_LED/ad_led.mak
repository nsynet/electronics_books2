CC = iccavr
CFLAGS =  -ID:\ICC-AVR\include\ -e  -l -g -Wa-W 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LD:\ICC-AVR\lib\ -m -g -dram_end:0x25f -bdata:0x60.0x25f -Wl-W -bfunc_lit:0x22.0x2000 -dhwstk_size:16 -beeprom:1.512 -fihx_coff
FILES = ad_led.o 

ad_led:	$(FILES)
	$(CC) -o ad_led $(LFLAGS) @ad_led.lk  -lslavr
ad_led.o: D:/ICC-AVR/include/io8535.h D:/ICC-AVR/include/slavr.h D:/ICC-AVR/include/macros.h
ad_led.o:	D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
	$(CC) -c $(CFLAGS) D:\ICC-AVR\examples.sl\AD_8535_LED\ad_led.c
