#####################################################################
#																	 
#	Created by u'nSP IDE		12:27:30	07/11/03
#
#####################################################################




APPDIR	= C:\PROGRA~1\SUNPLUS\UNSPID~1\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"C:/Program Files/Sunplus/unSPIDE180/base_exa/DA_ch" -I"../../../Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\DA_ch.S37"

ARYFILE	= "$(OUTDIR)\DA_ch.ary"

SBMFILE	= "$(OUTDIR)\DA_ch.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "C:\Program Files\Sunplus\unSPIDE180\base_exa\DA_ch\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "C:\Program Files\Sunplus\unSPIDE180\base_exa\DA_ch\Resource.asm" 

"$(OUTDIR)\hardware.obj": "C:\Program Files\Sunplus\unSPIDE180\Include\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "C:\Program Files\Sunplus\unSPIDE180\Include\hardware.asm" 

"$(OUTDIR)\key.obj": "C:\Program Files\Sunplus\unSPIDE180\Include\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "C:\Program Files\Sunplus\unSPIDE180\Include\key.asm" 

"$(OUTDIR)\main.obj": "C:\Program Files\Sunplus\unSPIDE180\base_exa\DA_ch\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "C:\Program Files\Sunplus\unSPIDE180\base_exa\DA_ch\main.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

