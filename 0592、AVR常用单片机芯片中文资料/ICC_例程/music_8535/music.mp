NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0022   00E8 =    232. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0022  _music_data
       0022  __lit_start
       010A  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   010A   0002 =      2. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       010A  __idata_start
       010C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   010C   02CC =    716. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0086  __text_start
       0086  __start
       00A5  _exit
       00A6  _music_init
       00B4  _timer0
       00C8  _timer1
       00D5  _sound
       011D  _main
       0149  push_gset1
       014C  pop_gset1
       014D  pop
       0160  push_gset2
       0163  push_gset3
       0166  push_gset4
       0169  pop_gset4
       016B  lpm16
       0179  neg32
       0182  long_prolog
       0190  long_epilog
       019B  tstzero1
       01A1  tstzero2
       01A7  NEGMANT2
       01B5  div32s
       01B8  div32u
       01BB  mod32s
       01BF  mod32u
       01CE  UDIV
       01EC  __text_end

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
                          vector   0000   000E =     14. bytes (abs,ovr)

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
func_lit = 0x22
eeprom:1.512

