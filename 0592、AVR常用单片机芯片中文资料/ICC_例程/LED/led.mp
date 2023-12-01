NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   001A   011A =    282. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       000D  __start
       000D  __text_start
       002C  _exit
       002D  _Delay
       0038  _LED_On
       0048  _main
       007C  push_gset1
       007F  pop_gset1
       0080  pop
       0093  lsl16
       009A  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
led.o             [    led.c ]
<library>         [  gpush.s,  lsl16.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

