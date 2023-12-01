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
                            text   0030   049E =   1182. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0018  __text_start
       0018  __start
       0037  _exit
       0038  _i2c_Write
       004B  _i2c_Read
       0062  _port_init
       0069  _display
       00C6  _main
       013A  _wait
       0140  _Start
       0149  _Stop
       0150  _NoAck
       0156  _TestAck
       0162  _Read8Bit
       0179  _Write8Bit
       018E  _delay_1ms
       0198  _delay_ms
       01A6  _scan_key
       0228  mod8u
       022A  div8u
       023D  push_gset1
       0240  pop_gset1
       0241  pop
       0254  push_gset2
       0257  push_gset3
       025A  push_gset4
       025D  pop_gset2
       025F  pop_gset4
       0261  lsl8
       0267  __text_end

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
I2C.o             [    I2C.c ]
<library>         [   WAIT.c,  START.c,   STOP.c,  NOACK.c, TESTACK.,
                    READ8B.c, WRITE8B., DELAY1MS, DELAYMS., SCAN_KEY,
                     div8u.s,  gpush.s, gpush2.s, gpush3.s, gpush4.s,
                     gpop2.s,  gpop4.s,   lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

