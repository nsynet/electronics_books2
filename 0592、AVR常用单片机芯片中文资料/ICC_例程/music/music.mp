NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   00E8 =    232. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _music_data
       001A  __lit_start
       0102  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0102   0002 =      2. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0102  __idata_start
       0104  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0104   02CC =    716. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0082  __text_start
       0082  __start
       00A1  _exit
       00A2  _music_init
       00B0  _timer0
       00C4  _timer1
       00D1  _sound
       0119  _main
       0145  push_gset1
       0148  pop_gset1
       0149  pop
       015C  push_gset2
       015F  push_gset3
       0162  push_gset4
       0165  pop_gset4
       0167  lpm16
       0175  neg32
       017E  long_prolog
       018C  long_epilog
       0197  tstzero1
       019D  tstzero2
       01A3  NEGMANT2
       01B1  div32s
       01B4  div32u
       01B7  mod32s
       01BB  mod32u
       01CA  UDIV
       01E8  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0002 =      2. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _delay
       0060  __data_start
       0062  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   000A =     10. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
sound.o           [  sound.c ]
<library>         [  gpush.s, gpush2.s, gpush3.s, gpush4.s,  gpop4.s,
                     lpm16.s,   lneg.s, longutil,  div32.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

