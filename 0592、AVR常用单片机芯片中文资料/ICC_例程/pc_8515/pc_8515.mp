NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0110 =    272. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _unshifted
       001A  __lit_start
       00A2  _shifted
       012A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   012A   0011 =     17. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       012A  __idata_start
       013B  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   013C   0376 =    886. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       009E  __start
       009E  __text_start
       00BD  _exit
       00BE  _uart0_init
       00C4  _port_init
       00C9  _main
       00E1  _put_kbbuff
       00F5  _get_char
       0111  _init_kb
       011B  _decode
       0191  _int0_isr
       01CB  push_lset
       01E2  pop_lset
       01F9  push_gset1
       01FC  pop_gset1
       01FD  pop
       0210  push_gset2
       0213  push_gset3
       0216  pop_gset3
       0218  _putchar
       022D  _puts
       0242  <created procedures>
       0259  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0011 =     17. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       006F  _input
       0070  _output
       0071  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0071   0047 =     71. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0071  __bss_start
       0075  _kb_buffer
       00B5  _bitcount
       00B6  __textmode
       00B8  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
pc_8515.o         [ pc_8515. ]
kbc.o             [    kbc.c ]
<library>         [  lpush.s,  gpush.s, gpush2.s, gpush3.s,  gpop3.s,
                    putchar.,   puts.s, textmode ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

