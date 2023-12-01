NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0004 =      4. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _init_tabel
       001A  __lit_start
       001E  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   001E   0016 =     22. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001E  __idata_start
       0034  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0034   0442 =   1090. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  __start
       001A  __text_start
       0039  _exit
       003A  _main
       0071  _lcd_write_data
       008E  _lcd_gotoxy
       009F  _delay_1ms
       00A9  _delay_ms
       00B7  _lcd_port_init
       00BE  _scan_key
       0140  _keypad
       0151  _delay
       015B  _lcd_shift
       018D  _write_lcd
       01AE  _read_lcd
       01C3  _lcd_init
       01DA  _lcd_putc
       01FB  _lcd_puts
       020F  push_gset1
       0212  pop_gset1
       0213  pop
       0226  push_gset2
       0229  push_gset3
       022C  push_gset4
       022F  pop_gset2
       0231  pop_gset3
       0233  pop_gset4
       0235  lsl8
       023B  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0016 =     22. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0076  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
keyboard2.o       [ keyboard ]
<library>         [ LCD_WRIT, LCD_GOTO, DELAY1MS, DELAYMS., LCD_PORT,
                    SCAN_KEY, Keypad.c,  DELAY.c, LCD_SHIF, WRITE_LC,
                    READ_LCD, LCD_INIT, LCD_PUTC, LCD_PUTS,  gpush.s,
                    gpush2.s, gpush3.s, gpush4.s,  gpop2.s,  gpop3.s,
                     gpop4.s,   lsl8.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

