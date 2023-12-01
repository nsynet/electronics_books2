NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   001A   000A =     10. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  __func_lit_start
       0024  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0024   0101 =    257. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0024  __lit_start
       0024  __ctype
       0125  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0125   0078 =    120. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0125  __idata_start
       019D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   019E   0642 =   1602. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       00CF  __text_start
       00CF  __start
       00EE  _exit
       00EF  _main
       0111  _islower
       011F  _toupper
       0136  mod16u
       0138  div16u
       0155  push_arg4
       0157  push_arg2
       015A  push_gset1
       015D  pop_gset1
       015E  pop
       0171  push_gset2
       0174  push_gset3
       0177  push_gset4
       017A  push_gset5
       017D  pop_gset5
       017F  _printf
       01A3  __print
       0337  _itoa
       0393  __va_start
       039B  _putchar
       03B4  _getchar
       03B9  _puts
       03CE  xicall
       03D7  _strcpy
       03E2  lpm16
       03F0  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0078 =    120. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       00D8  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   00D8   001B =     27. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       00D8  __bss_start
       00F1  __textmode
       00F3  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
uart.o            [   uart.c ]
<library>         [  ctype.s, islower., toupper., div16u.s,  asave.s,
                     gpush.s, gpush2.s, gpush3.s, gpush4.s, gpush5.s,
                     gpop5.s, printf.s,  stdio.s,   itoa.s, stdarg.s,
                    putchar., getchar.,   puts.s,  icall.s, textmode,
                    strcpy.s,  lpm16.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

