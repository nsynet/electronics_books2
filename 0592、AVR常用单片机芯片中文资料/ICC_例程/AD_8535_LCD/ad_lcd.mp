NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0022   0004 =      4. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0022  _init_tabel
       0022  __lit_start
       0026  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0026   0017 =     23. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0026  __idata_start
       003D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   003E   0408 =   1032. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001F  __start
       001F  __text_start
       003E  _exit
       003F  _adctoasc
       008E  _adc_isr
       00AD  _main
       00D0  _lcd_gotoxy
       00E1  _delay_1ms
       00EB  _delay_ms
       00F9  _lcd_port_init
       0100  _delay
       010A  _write_lcd
       012B  _read_lcd
       0140  _lcd_init
       0157  _lcd_putc
       0178  _lcd_puts
       018C  _lcd_clear
       0192  mod16u
       0194  div16u
       0195  xdiv16u
       01AE  push_gset1
       01B1  pop_gset1
       01B2  pop
       01C5  push_gset2
       01C8  push_gset3
       01CB  push_gset4
       01CE  push_gset5
       01D1  pop_gset2
       01D3  pop_gset5
       01D5  lsr32
       01E1  long_prolog
       01EF  long_epilog
       01FA  tstzero1
       0200  tstzero2
       0206  mpy32s
       0206  mpy32u
       0223  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0017 =     23. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0077  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0077   0008 =      8. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0077  __bss_start
       0077  _adcval
       007D  _ad_con
       007F  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   001E =     30. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
ad_lcd.o          [ ad_lcd.c ]
<library>         [ LCD_GOTO, DELAY1MS, DELAYMS., LCD_PORT,  DELAY.c,
                    WRITE_LC, READ_LCD, LCD_INIT, LCD_PUTC, LCD_PUTS,
                    LCD_CLEA, div16u.s,  gpush.s, gpush2.s, gpush3.s,
                    gpush4.s, gpush5.s,  gpop2.s,  gpop5.s,  lsr32.s,
                    longutil,  mul32.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x22
eeprom:1.512

