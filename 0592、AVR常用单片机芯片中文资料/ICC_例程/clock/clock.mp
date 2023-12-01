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
                           idata   002A   000A =     10. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       002A  __idata_start
       0034  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0034   0510 =   1296. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  __text_start
       001A  __start
       0039  _exit
       003A  _port_init
       004E  _hextobcd
       00A2  _display
       00BF  _settime
       015E  _main
       01A4  _timer1
       01BB  _delay_1ms
       01C5  _delay_ms
       01D3  _scan_key
       0255  mpy8s
       0261  mod8u
       0263  div8u
       0276  push_gset1
       0279  pop_gset1
       027A  pop
       028D  push_gset2
       0290  push_gset3
       0293  push_gset4
       0296  pop_gset2
       0298  pop_gset3
       029A  pop_gset4
       029C  lsl8
       02A2  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000A =     10. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _ledbuff
       0066  _time
       0069  _flag
       006A  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   000E =     14. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
clock.o           [  clock.c ]
<library>         [ DELAY1MS, DELAYMS., SCAN_KEY,  mpy8s.s,  div8u.s,
                     gpush.s, gpush2.s, gpush3.s, gpush4.s,  gpop2.s,
                     gpop3.s,  gpop4.s,   lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

