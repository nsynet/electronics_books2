NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   001A   0088 =    136. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       001A  _auc_SinParam
       001A  __lit_start
       009A  _auc_frequencyH
       009E  _auc_frequencyL
       00A2  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00A2   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       00A2  __idata_start
       00A8  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A8   0218 =    536. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __text_start
       0054  __start
       0073  _exit
       0074  _ISR_T1_Overflow
       00FA  _init
       0106  _Delay
       0110  _main
       0152  lsr16
       0159  asr16
       0160  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0006 =      6. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _x_SWa
       0060  __data_start
       0061  _x_SWb
       0062  _X_LUTaExt
       0064  _X_LUTbExt
       0066  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0066   0004 =      4. bytes (rel,con)

       Addr  Global Symbol
      -----  --------------------------------
       0066  _X_LUTb
       0066  __bss_start
       0068  _X_LUTa
       006A  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   000E =     14. bytes (abs,ovr)

Files Linked      [ module(s) ]

D:\ICC-AVR\lib\crtavr.o  [ crtavr.s ]
DTMF.o            [   DTMF.c ]
<library>         [  lsr16.s,  asr16.s ]

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

data = 0x60
func_lit = 0x1a
eeprom:1.512

