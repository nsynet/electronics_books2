NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0022   0010 =     16. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0022  _tabel
       0022  __lit_start
       0032  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0032   0324 =    804. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0019  __text_start
       0019  __start
       0038  _exit
       0039  _port_init
       0040  _display
       005D  _adctovol
       00B1  _adc_isr
       00D0  _main
       010F  _delay_1ms
       0119  mod16u
       011B  div16u
       011C  xdiv16u
       0135  push_gset1
       0138  pop_gset1
       0139  pop
       014C  push_gset2
       014F  push_gset3
       0152  push_gset4
       0155  pop_gset4
       0157  lsr32
       0163  lsl8
       0169  long_prolog
       0177  long_epilog
       0182  tstzero1
       0188  tstzero2
       018E  mpy32u
       018E  mpy32s
       01AB  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0060   0008 =      8. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __bss_start
       0060  _ad_con
       0062  _ledbuff
       0068  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   001E =     30. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
ad_led.o          [ ad_led.c ]
<library>         [ DELAY1MS, div16u.s,  gpush.s, gpush2.s, gpush3.s,
                    gpush4.s,  gpop4.s,  lsr32.s,   lsl8.s, longutil,
                     mul32.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x22
eeprom:1.512

