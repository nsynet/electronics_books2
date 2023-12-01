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
                            text   0030   0380 =    896. bytes (rel,con)

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
       00D7  _Icp_timer1
       0100  mpy16s
       0114  mod16u
       0116  div16u
       0133  push_gset1
       0136  pop_gset1
       0137  pop
       014A  push_gset2
       014D  push_gset3
       0150  pop_gset3
       0152  lsl8
       0158  copy_quot
       015D  long_prolog
       016C  long_epilog
       0178  NEGMANT1
       0181  NEGMANT2
       018A  TSTZERO1
       018A  tstzero1
       0190  TSTZERO2
       0190  tstzero2
       0196  div32s
       0199  div32u
       019C  mod32s
       01A0  mod32u
       01A4  SDIV
       01AF  UDIV
       01D8  __text_end

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
       0066  _count_h
       0068  _count_l
       006A  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0008 =      8. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
cycle_1.o         [ cycle_1. ]
<library>         [ mpy16s.s, div16u.s,  gpush.s, gpush2.s, gpush3.s,
                     gpop3.s,   lsl8.s, longutil,  div32.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

