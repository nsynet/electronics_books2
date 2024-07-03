#####################################################################
#																	 
#	Created by u'nSP IDE		09:41:05	12/19/03
#
#####################################################################




APPDIR	= D:\PROGRA~1\Sunplus\UNSPID~3\unSPIDE

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/©лб╪╧Бел/EVB061Test-KEY" -I"E:/Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE061A -bfile "D:\Program Files\Sunplus\unSPIDE184\unSPIDE\Body\SPCE061A.cpt"

BINFILE	= "$(OUTDIR)\EVB061Test.S37"

ARYFILE	= "$(OUTDIR)\EVB061Test.ary"

SBMFILE	= "$(OUTDIR)\EVB061Test.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CASFLAGS	= -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\09_48k.res" \
	"$(OUTDIR)\02_48k.res" \
	"$(OUTDIR)\03_48k.res" \
	"$(OUTDIR)\04_48k.res" \
	"$(OUTDIR)\05_48k.res" \
	"$(OUTDIR)\06_48k.res" \
	"$(OUTDIR)\07_48k.res" \
	"$(OUTDIR)\08_48k.res" \
	"$(OUTDIR)\01_48k.res" \
	"$(OUTDIR)\12_48k.res" \
	"$(OUTDIR)\11_48k.res" \
	"$(OUTDIR)\10_48k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\EVB061Test.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\ad_line.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\09_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\09.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\09.48k" "$(OUTDIR)\09_48k.res" RES_09_48K 

"$(OUTDIR)\02_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\02.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\02.48k" "$(OUTDIR)\02_48k.res" RES_02_48K 

"$(OUTDIR)\03_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\03.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\03.48k" "$(OUTDIR)\03_48k.res" RES_03_48K 

"$(OUTDIR)\04_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\04.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\04.48k" "$(OUTDIR)\04_48k.res" RES_04_48K 

"$(OUTDIR)\05_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\05.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\05.48k" "$(OUTDIR)\05_48k.res" RES_05_48K 

"$(OUTDIR)\06_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\06.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\06.48k" "$(OUTDIR)\06_48k.res" RES_06_48K 

"$(OUTDIR)\07_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\07.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\07.48k" "$(OUTDIR)\07_48k.res" RES_07_48K 

"$(OUTDIR)\08_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\08.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\08.48k" "$(OUTDIR)\08_48k.res" RES_08_48K 

"$(OUTDIR)\01_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\01.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\01.48k" "$(OUTDIR)\01_48k.res" RES_01_48K 

"$(OUTDIR)\12_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\12.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\12.48k" "$(OUTDIR)\12_48k.res" RES_12_48K 

"$(OUTDIR)\11_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\11.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\11.48k" "$(OUTDIR)\11_48k.res" RES_11_48K 

"$(OUTDIR)\10_48k.res": "F:\©лб╪╧Бел\EVB061Test-KEY\voice\10.48k"
	$(RESC) "F:\©лб╪╧Бел\EVB061Test-KEY\voice\10.48k" "$(OUTDIR)\10_48k.res" RES_10_48K 

"$(OUTDIR)\Resource.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\Resource.asm" 

"$(OUTDIR)\EVB061Test.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\EVB061Test.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\EVB061Test.lst" -o "$(OUTDIR)\EVB061Test.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\EVB061Test.asm" 

"$(OUTDIR)\system.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\system.asm" ".\hardware.inc" ".\key.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\system.asm" 

"$(OUTDIR)\isr.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\isr.asm" ".\S480.inc" ".\Resource.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\isr.asm" 

"$(OUTDIR)\ad_line.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\ad_line.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ad_line.lst" -o "$(OUTDIR)\ad_line.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\ad_line.asm" 

"$(OUTDIR)\key.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\key.asm" 

"$(OUTDIR)\hardware.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\©лб╪╧Бел\EVB061Test-KEY\hardware.asm" 

"$(OUTDIR)\main.obj": "F:\©лб╪╧Бел\EVB061Test-KEY\main.c" ".\hardware.h" ".\s480.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/©лб╪╧Бел/EVB061Test-KEY/main.c" 
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\09_48k.res" 
	$(RM) "$(OUTDIR)\02_48k.res" 
	$(RM) "$(OUTDIR)\03_48k.res" 
	$(RM) "$(OUTDIR)\04_48k.res" 
	$(RM) "$(OUTDIR)\05_48k.res" 
	$(RM) "$(OUTDIR)\06_48k.res" 
	$(RM) "$(OUTDIR)\07_48k.res" 
	$(RM) "$(OUTDIR)\08_48k.res" 
	$(RM) "$(OUTDIR)\01_48k.res" 
	$(RM) "$(OUTDIR)\12_48k.res" 
	$(RM) "$(OUTDIR)\11_48k.res" 
	$(RM) "$(OUTDIR)\10_48k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\EVB061Test.obj" 
	$(RM) "$(OUTDIR)\EVB061Test.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\ad_line.obj" 
	$(RM) "$(OUTDIR)\ad_line.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

