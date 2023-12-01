NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0022   0110 =    272. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0022  _unshifted
       0022  __lit_start
       00AA  _shifted
       0132  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0132   0011 =     17. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0132  __idata_start
       0143  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0144   0376 =    886. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       00A2  __start
       00A2  __text_start
       00C1  _exit
       00C2  _put_kbbuff
       00D6  _get_char
       00F2  _init_kb
       00FC  _decode
       0172  _int0_isr
       01AC  _uart0_init
       01B2  _port_init
       01B7  _main
       01CF  push_lset
       01E6  pop_lset
       01FD  push_gset1
       0200  pop_gset1
       0201  pop
       0214  push_gset2
       0217  push_gset3
       021A  pop_gset3
       021C  _putchar
       0231  _puts
       0246  <created procedures>
       025D  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0011 =     17. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _input
       0060  __data_start
       0061  _output
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
kbc.o             [    kbc.c ]
pc_8535.o         [ pc_8535. ]
<library>         [  lpush.s,  gpush.s, gpush2.s, gpush3.s,  gpop3.s,
                    putchar.,   puts.s, textmode ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x22
eeprom:1.512

