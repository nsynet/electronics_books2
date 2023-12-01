NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0015 =     21. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _tabel
       001A  __lit_start
       002B  _init_tabel
       002F  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   002F   0022 =     34. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       002F  __idata_start
       0051  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0052   0694 =   1684. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0029  __start
       0029  __text_start
       0048  _exit
       0049  _ds1820_match
       0061  _asc2con
       009D  _main
       0194  _ds1820_read
       01BE  _ds1820_ack
       01D6  _ds1820_write
       01FB  _delay_us
       0203  _crccheck
       0230  _lcd_gotoxy
       0241  _delay_1ms
       024B  _delay_ms
       0259  _lcd_port_init
       0260  _delay
       026A  _write_lcd
       028B  _read_lcd
       02A0  _lcd_init
       02B7  _lcd_putc
       02D8  _lcd_puts
       02EC  _lcd_clear
       02F2  mpy8s
       02FE  mod8u
       0300  div8u
       0313  mod16s
       0315  div16s
       0348  push_gset1
       034B  pop_gset1
       034C  pop
       035F  push_gset2
       0362  push_gset3
       0365  push_gset4
       0368  push_gset5
       036B  pop_gset2
       036D  pop_gset3
       036F  pop_gset4
       0371  pop_gset5
       0373  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0022 =     34. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0082  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
1wire1.o          [ .1wire1. ]
<library>         [ DS1820RD, DS1820AK, DS1820WR, DELAY_US, CRCCHECK,
                    LCD_GOTO, DELAY1MS, DELAYMS., LCD_PORT,  DELAY.c,
                    WRITE_LC, READ_LCD, LCD_INIT, LCD_PUTC, LCD_PUTS,
                    LCD_CLEA,  mpy8s.s,  div8u.s, div16s.s,  gpush.s,
                    gpush2.s, gpush3.s, gpush4.s, gpush5.s,  gpop2.s,
                     gpop3.s,  gpop4.s,  gpop5.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

