NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0010 =     16. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _tabel
       001A  __lit_start
       002A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   002A   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       002A  __idata_start
       0030  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0030   020A =    522. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0018  __start
       0018  __text_start
       0037  _exit
       0038  _delay_1ms
       0042  _display
       005F  _hextobcd
       0087  _mcu_init
       009D  _main
       00BC  _Icp_timer1
       00D9  mod16u
       00DB  div16u
       00F8  push_gset1
       00FB  pop_gset1
       00FC  pop
       010F  push_gset2
       0112  push_gset3
       0115  pop_gset3
       0117  lsl8
       011D  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _ledbuff
       0066  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0066   0004 =      4. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0066  __bss_start
       0066  _newcount
       0068  _oldcount
       006A  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0008 =      8. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
cycle.o           [  cycle.c ]
<library>         [ div16u.s,  gpush.s, gpush2.s, gpush3.s,  gpop3.s,
                      lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

