#####################################################################
#																	 
#	Created by u'nSP IDE		15:31:18	08/14/03
#
#####################################################################




APPDIR	= E:\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"D:/2003年工作/tset/实验箱/BoxTest/自检程式" -I"E:/Program Files/Sunplus/ide180/Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\led and key test.S37"

ARYFILE	= "$(OUTDIR)\led and key test.ary"

SBMFILE	= "$(OUTDIR)\led and key test.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\1_48k.res" \
	"$(OUTDIR)\2_48k.res" \
	"$(OUTDIR)\3_48k.res" \
	"$(OUTDIR)\4_48k.res" \
	"$(OUTDIR)\5_48k.res" \
	"$(OUTDIR)\6_48k.res" \
	"$(OUTDIR)\7_48k.res" \
	"$(OUTDIR)\8_48k.res" \
	"$(OUTDIR)\9_48k.res" \
	"$(OUTDIR)\10_48k.res" \
	"$(OUTDIR)\11_48k.res" \
	"$(OUTDIR)\12_48k.res" \
	"$(OUTDIR)\13_48k.res" \
	"$(OUTDIR)\14_48k.res" \
	"$(OUTDIR)\15_48k.res" \
	"$(OUTDIR)\01_48k.res" \
	"$(OUTDIR)\16_48k.res" \
	"$(OUTDIR)\08_48K.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\key1.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\irq5.obj" \
	"$(OUTDIR)\single.obj" \
	"$(OUTDIR)\delay.obj" \
	"$(OUTDIR)\SPLC501DisplayTAB.obj" \
	"$(OUTDIR)\SPLC501Hardware.obj" \
	"$(OUTDIR)\Splc501sys.obj" \
	"$(OUTDIR)\sram.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\MICTest.obj" \
	"$(OUTDIR)\sleep.obj" \
	"$(OUTDIR)\uart.obj" \
	"$(OUTDIR)\88ledtest.obj" \
	"$(OUTDIR)\4096.obj" \
	"$(OUTDIR)\serve4096.obj" \
	"$(OUTDIR)\Rf_Received.obj" \
	"$(OUTDIR)\Splc501var.obj" 

"$(OUTDIR)\1_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\1.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\1.48k" "$(OUTDIR)\1_48k.res" RES_1_48K 

"$(OUTDIR)\2_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\2.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\2.48k" "$(OUTDIR)\2_48k.res" RES_2_48K 

"$(OUTDIR)\3_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\3.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\3.48k" "$(OUTDIR)\3_48k.res" RES_3_48K 

"$(OUTDIR)\4_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\4.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\4.48k" "$(OUTDIR)\4_48k.res" RES_4_48K 

"$(OUTDIR)\5_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\5.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\5.48k" "$(OUTDIR)\5_48k.res" RES_5_48K 

"$(OUTDIR)\6_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\6.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\6.48k" "$(OUTDIR)\6_48k.res" RES_6_48K 

"$(OUTDIR)\7_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\7.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\7.48k" "$(OUTDIR)\7_48k.res" RES_7_48K 

"$(OUTDIR)\8_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\8.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\8.48k" "$(OUTDIR)\8_48k.res" RES_8_48K 

"$(OUTDIR)\9_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\9.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\9.48k" "$(OUTDIR)\9_48k.res" RES_9_48K 

"$(OUTDIR)\10_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\10.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\10.48k" "$(OUTDIR)\10_48k.res" RES_10_48K 

"$(OUTDIR)\11_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\11.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\11.48k" "$(OUTDIR)\11_48k.res" RES_11_48K 

"$(OUTDIR)\12_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\12.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\12.48k" "$(OUTDIR)\12_48k.res" RES_12_48K 

"$(OUTDIR)\13_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\13.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\13.48k" "$(OUTDIR)\13_48k.res" RES_13_48K 

"$(OUTDIR)\14_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\14.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\14.48k" "$(OUTDIR)\14_48k.res" RES_14_48K 

"$(OUTDIR)\15_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\15.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\15.48k" "$(OUTDIR)\15_48k.res" RES_15_48K 

"$(OUTDIR)\01_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\01.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\01.48k" "$(OUTDIR)\01_48k.res" RES_01_48K 

"$(OUTDIR)\16_48k.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\16.48k"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\voice0\16.48k" "$(OUTDIR)\16_48k.res" RES_16_48K 

"$(OUTDIR)\08_48K.res": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\VOICE\08.48K"
	$(RESC) "D:\2003年工作\tset\实验箱\BoxTest\自检程式\VOICE\08.48K" "$(OUTDIR)\08_48K.res" RES_08_48K 

"$(OUTDIR)\Resource.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Resource.asm" 

"$(OUTDIR)\key.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\key.asm" 

"$(OUTDIR)\key1.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\key1.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key1.lst" -o "$(OUTDIR)\key1.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\key1.asm" 

"$(OUTDIR)\main.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\main.c" ".\hardware.h" ".\lab_parameter.h" ".\s480.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "D:/2003年工作/tset/实验箱/BoxTest/自检程式/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\irq5.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\irq5.asm" ".\S480.inc" ".\Resource.inc" ".\dvr.inc " 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\irq5.lst" -o "$(OUTDIR)\irq5.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\irq5.asm" 

"$(OUTDIR)\single.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\single.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\single.lst" -o "$(OUTDIR)\single.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\single.asm" 

"$(OUTDIR)\delay.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\delay.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\delay.lst" -o "$(OUTDIR)\delay.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\delay.asm" 

"$(OUTDIR)\SPLC501DisplayTAB.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\SPLC501DisplayTAB.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501DisplayTAB.lst" -o "$(OUTDIR)\SPLC501DisplayTAB.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\SPLC501DisplayTAB.asm" 

"$(OUTDIR)\SPLC501Hardware.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\SPLC501Hardware.asm" ".\hardware.inc" ".\splc501c_io.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501Hardware.lst" -o "$(OUTDIR)\SPLC501Hardware.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\SPLC501Hardware.asm" 

"$(OUTDIR)\Splc501sys.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Splc501sys.asm" ".\hardware.inc" ".\splc501c_io.inc" ".\splc501c.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501sys.lst" -o "$(OUTDIR)\Splc501sys.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Splc501sys.asm" 

"$(OUTDIR)\sram.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\sram.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\sram.asm" 

"$(OUTDIR)\system.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\system.asm" ".\resource.inc" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\system.asm" 

"$(OUTDIR)\hardware.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\hardware.asm" 

"$(OUTDIR)\MICTest.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\MICTest.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\MICTest.lst" -o "$(OUTDIR)\MICTest.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\MICTest.asm" 

"$(OUTDIR)\sleep.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\sleep.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sleep.lst" -o "$(OUTDIR)\sleep.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\sleep.asm" 

"$(OUTDIR)\uart.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\uart.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\uart.lst" -o "$(OUTDIR)\uart.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\uart.asm" 

"$(OUTDIR)\88ledtest.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\88ledtest.c" ".\hardware.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/88ledtest.asm" "D:/2003年工作/tset/实验箱/BoxTest/自检程式/88ledtest.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\88ledtest.lst" -o "$(OUTDIR)\88ledtest.obj" "$(OUTDIR)\88ledtest.asm" 

"$(OUTDIR)\4096.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\4096.c" ".\hardware.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/4096.asm" "D:/2003年工作/tset/实验箱/BoxTest/自检程式/4096.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\4096.lst" -o "$(OUTDIR)\4096.obj" "$(OUTDIR)\4096.asm" 

"$(OUTDIR)\serve4096.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\serve4096.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\serve4096.lst" -o "$(OUTDIR)\serve4096.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\serve4096.asm" 

"$(OUTDIR)\Rf_Received.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Rf_Received.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Rf_Received.lst" -o "$(OUTDIR)\Rf_Received.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Rf_Received.asm" 

"$(OUTDIR)\Splc501var.obj": "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Splc501var.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501var.lst" -o "$(OUTDIR)\Splc501var.obj" "D:\2003年工作\tset\实验箱\BoxTest\自检程式\Splc501var.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\1_48k.res" 
	$(RM) "$(OUTDIR)\2_48k.res" 
	$(RM) "$(OUTDIR)\3_48k.res" 
	$(RM) "$(OUTDIR)\4_48k.res" 
	$(RM) "$(OUTDIR)\5_48k.res" 
	$(RM) "$(OUTDIR)\6_48k.res" 
	$(RM) "$(OUTDIR)\7_48k.res" 
	$(RM) "$(OUTDIR)\8_48k.res" 
	$(RM) "$(OUTDIR)\9_48k.res" 
	$(RM) "$(OUTDIR)\10_48k.res" 
	$(RM) "$(OUTDIR)\11_48k.res" 
	$(RM) "$(OUTDIR)\12_48k.res" 
	$(RM) "$(OUTDIR)\13_48k.res" 
	$(RM) "$(OUTDIR)\14_48k.res" 
	$(RM) "$(OUTDIR)\15_48k.res" 
	$(RM) "$(OUTDIR)\01_48k.res" 
	$(RM) "$(OUTDIR)\16_48k.res" 
	$(RM) "$(OUTDIR)\08_48K.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\key1.obj" 
	$(RM) "$(OUTDIR)\key1.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\irq5.obj" 
	$(RM) "$(OUTDIR)\irq5.lst" 
	$(RM) "$(OUTDIR)\single.obj" 
	$(RM) "$(OUTDIR)\single.lst" 
	$(RM) "$(OUTDIR)\delay.obj" 
	$(RM) "$(OUTDIR)\delay.lst" 
	$(RM) "$(OUTDIR)\SPLC501DisplayTAB.obj" 
	$(RM) "$(OUTDIR)\SPLC501DisplayTAB.lst" 
	$(RM) "$(OUTDIR)\SPLC501Hardware.obj" 
	$(RM) "$(OUTDIR)\SPLC501Hardware.lst" 
	$(RM) "$(OUTDIR)\Splc501sys.obj" 
	$(RM) "$(OUTDIR)\Splc501sys.lst" 
	$(RM) "$(OUTDIR)\sram.obj" 
	$(RM) "$(OUTDIR)\sram.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\MICTest.obj" 
	$(RM) "$(OUTDIR)\MICTest.lst" 
	$(RM) "$(OUTDIR)\sleep.obj" 
	$(RM) "$(OUTDIR)\sleep.lst" 
	$(RM) "$(OUTDIR)\uart.obj" 
	$(RM) "$(OUTDIR)\uart.lst" 
	$(RM) "$(OUTDIR)\88ledtest.obj" 
	$(RM) "$(OUTDIR)\88ledtest.lst" 
	$(RM) "$(OUTDIR)\88ledtest.asm" 
	$(RM) "$(OUTDIR)\4096.obj" 
	$(RM) "$(OUTDIR)\4096.lst" 
	$(RM) "$(OUTDIR)\4096.asm" 
	$(RM) "$(OUTDIR)\serve4096.obj" 
	$(RM) "$(OUTDIR)\serve4096.lst" 
	$(RM) "$(OUTDIR)\Rf_Received.obj" 
	$(RM) "$(OUTDIR)\Rf_Received.lst" 
	$(RM) "$(OUTDIR)\Splc501var.obj" 
	$(RM) "$(OUTDIR)\Splc501var.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

