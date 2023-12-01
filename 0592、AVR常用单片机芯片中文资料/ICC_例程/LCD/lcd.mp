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
                           idata   001E   0023 =     35. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001E  __idata_start
       0041  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0042   023C =    572. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0021  __start
       0021  __text_start
       0040  _exit
       0041  _main
       0061  _lcd_gotoxy
       0072  _delay_1ms
       007C  _delay_ms
       008A  _lcd_port_init
       0091  _delay
       009B  _write_lcd
       00BC  _read_lcd
       00D1  _lcd_init
       00E8  _lcd_putc
       0109  _lcd_puts
       011D  _lcd_clear
       0123  push_gset1
       0126  pop_gset1
       0127  pop
       013A  push_gset2
       013D  pop_gset2
       013F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0023 =     35. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0083  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
lcd.o             [    lcd.c ]
<library>         [ LCD_GOTO, DELAY1MS, DELAYMS., LCD_PORT,  DELAY.c,
                    WRITE_LC, READ_LCD, LCD_INIT, LCD_PUTC, LCD_PUTS,
                    LCD_CLEA,  gpush.s, gpush2.s,  gpop2.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

