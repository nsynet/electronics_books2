NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0020 =     32. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _tabel
       001A  __lit_start
       003A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   003A   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       003A  __idata_start
       0040  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0040   0440 =   1088. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0020  __text_start
       0020  __start
       003F  _exit
       0040  _port_init
       0058  _display
       0075  _hextobcd
       00C0  _main
       00D3  _timer0
       0110  _timer1
       013C  _delay_1ms
       0146  _delay_ms
       0154  push_lset
       016B  pop_lset
       0182  push_gset1
       0185  pop_gset1
       0186  pop
       0199  push_gset2
       019C  push_gset3
       019F  push_gset4
       01A2  pop_gset2
       01A4  pop_gset4
       01A6  lpm32
       01BA  lsl8
       01C0  copy_quot
       01C5  long_prolog
       01D4  long_epilog
       01E0  NEGMANT1
       01E9  NEGMANT2
       01F2  tstzero1
       01F2  TSTZERO1
       01F8  TSTZERO2
       01F8  tstzero2
       01FE  div32s
       0201  div32u
       0204  mod32s
       0208  mod32u
       020C  SDIV
       0217  UDIV
       0240  __text_end

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
                             bss   0066   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0066  _timecount
       0066  __bss_start
       0068  _count
       006C  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0008 =      8. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
cymometer.o       [ cymomete ]
delay.o           [  delay.c ]
<library>         [  lpush.s,  gpush.s, gpush2.s, gpush3.s, gpush4.s,
                     gpop2.s,  gpop4.s,  lpm32.s,   lsl8.s, longutil,
                     div32.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

