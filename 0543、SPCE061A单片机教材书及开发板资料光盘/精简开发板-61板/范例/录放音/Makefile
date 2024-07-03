#####################################################################
#																	 
#	Created by u'nSP IDE		10:26:33	05/20/03
#
#####################################################################




APPDIR	= E:\PROGRA~1\Sunplus\STUDYU~1

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/SN03-TG028/Â¼·ÅÒô"

BODY	= -body SPCE061A -bfile "$(APPDIR)\Body\SPCE061A.cpt"

BINFILE	= "$(OUTDIR)\Record.S37"

ARYFILE	= "$(OUTDIR)\Record.ary"

SBMFILE	= "$(OUTDIR)\Record.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\sram.obj" \
	"$(OUTDIR)\Flash.obj" 

"$(OUTDIR)\system.obj": "F:\SN03-TG028\Â¼·ÅÒô\system.asm" ".\resource.inc" ".\hardware.inc" ".\key.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES)  -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\SN03-TG028\Â¼·ÅÒô\system.asm" 

"$(OUTDIR)\isr.obj": "F:\SN03-TG028\Â¼·ÅÒô\isr.asm" ".\hardware.inc" ".\dvr.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES)  -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\SN03-TG028\Â¼·ÅÒô\isr.asm" 

"$(OUTDIR)\main.obj": "F:\SN03-TG028\Â¼·ÅÒô\main.c" ".\hardware.h" ".\dvr.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/SN03-TG028/Â¼·ÅÒô/main.c" 
	$(AS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\hardware.obj": "F:\SN03-TG028\Â¼·ÅÒô\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\SN03-TG028\Â¼·ÅÒô\hardware.asm" 

"$(OUTDIR)\key.obj": "F:\SN03-TG028\Â¼·ÅÒô\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\SN03-TG028\Â¼·ÅÒô\key.asm" 

"$(OUTDIR)\Resource.obj": "F:\SN03-TG028\Â¼·ÅÒô\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\SN03-TG028\Â¼·ÅÒô\Resource.asm" 

"$(OUTDIR)\sram.obj": "F:\SN03-TG028\Â¼·ÅÒô\sram.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "F:\SN03-TG028\Â¼·ÅÒô\sram.asm" 

"$(OUTDIR)\Flash.obj": "F:\SN03-TG028\Â¼·ÅÒô\Flash.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Flash.lst" -o "$(OUTDIR)\Flash.obj" "F:\SN03-TG028\Â¼·ÅÒô\Flash.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\sram.obj" 
	$(RM) "$(OUTDIR)\sram.lst" 
	$(RM) "$(OUTDIR)\Flash.obj" 
	$(RM) "$(OUTDIR)\Flash.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

