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
                            text   0030   0500 =   1280. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0018  __text_start
       0018  __start
       0037  _exit
       0038  _port_init
       003F  _display
       009C  _main
       0114  _wait
       011A  _Start
       0123  _Stop
       012A  _Ack
       0130  _NoAck
       0136  _TestAck
       0142  _Write24c02
       0166  _Read8Bit
       017D  _Read24c02
       01A8  _Write8Bit
       01BD  _delay_1ms
       01C7  _delay_ms
       01D5  _scan_key
       0257  mod8u
       0259  div8u
       026C  push_gset1
       026F  pop_gset1
       0270  pop
       0283  push_gset2
       0286  push_gset3
       0289  push_gset4
       028C  pop_gset2
       028E  pop_gset3
       0290  pop_gset4
       0292  lsl8
       0298  __text_end

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
                             bss   0066   0002 =      2. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0066  __bss_start
       0066  _at24_data
       0067  _at24_add
       0068  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
AT24C02.o         [ AT24C02. ]
<library>         [   WAIT.c,  START.c,   STOP.c,    ACK.c,  NOACK.c,
                    TESTACK., WRITEP.c, READ8B.c,  READP.c, WRITE8B.,
                    DELAY1MS, DELAYMS., SCAN_KEY,  div8u.s,  gpush.s,
                    gpush2.s, gpush3.s, gpush4.s,  gpop2.s,  gpop3.s,
                     gpop4.s,   lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

