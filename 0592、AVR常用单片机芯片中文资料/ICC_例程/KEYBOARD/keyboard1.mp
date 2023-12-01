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
                            text   0030   02BE =    702. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0018  __start
       0018  __text_start
       0037  _exit
       0038  _port_init
       0042  _display
       005F  _main
       00B3  _delay_1ms
       00BD  _delay_ms
       00CB  _scan_key
       014D  push_gset1
       0150  pop_gset1
       0151  pop
       0164  push_gset2
       0167  push_gset3
       016A  push_gset4
       016D  pop_gset2
       016F  pop_gset4
       0171  lsl8
       0177  __text_end

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
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
keyboard1.o       [ keyboard ]
<library>         [ DELAY1MS, DELAYMS., SCAN_KEY,  gpush.s, gpush2.s,
                    gpush3.s, gpush4.s,  gpop2.s,  gpop4.s,   lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

