#####################################################################
#																	 
#	Created by u'nSP IDE		21:12:21	07/28/03
#
#####################################################################




APPDIR	= D:\PROGRA~1\Sunplus\UNSPID~1\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"D:/Documents and Settings/ÁõÐÂÑÕ/My Documents/rf/TEST" -I"F:/tgg035/Library" -I"F:/tgg035/HeadFile" -I"D:/Program Files/Sunplus/unSPIDE180/Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\TEST.S37"

ARYFILE	= "$(OUTDIR)\TEST.ary"

SBMFILE	= "$(OUTDIR)\TEST.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "D:\Documents and Settings\ÁõÐÂÑÕ\My Documents\rf\TEST\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "D:\Documents and Settings\ÁõÐÂÑÕ\My Documents\rf\TEST\Resource.asm" 

"$(OUTDIR)\main.obj": "D:\Documents and Settings\ÁõÐÂÑÕ\My Documents\rf\TEST\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "D:\Documents and Settings\ÁõÐÂÑÕ\My Documents\rf\TEST\main.asm" 


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
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

