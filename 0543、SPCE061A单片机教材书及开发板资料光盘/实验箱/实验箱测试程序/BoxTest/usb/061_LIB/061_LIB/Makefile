#####################################################################
#																	 
#	Created by u'nSP IDE		18:40:00	08/21/03
#
#####################################################################




APPDIR	= E:\PROGRA~1\Sunplus\UNSPID~3\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"E:/usb/example1/061_lib/061_LIB" -I"C:/TG035/HeadFile" -I"F:/061USB/usb_lib/version1/061"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\usb061.S37"

ARYFILE	= "$(OUTDIR)\usb061.ary"

SBMFILE	= "$(OUTDIR)\usb061.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\System.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\D12CI.obj" \
	"$(OUTDIR)\chap9.obj" \
	"$(OUTDIR)\ExternInt.obj" 

"$(OUTDIR)\Resource.obj": "E:\usb\example1\061_lib\061_LIB\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\usb\example1\061_lib\061_LIB\Resource.asm" 

"$(OUTDIR)\isr.obj": "E:\usb\example1\061_lib\061_LIB\isr.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "E:\usb\example1\061_lib\061_LIB\isr.asm" 

"$(OUTDIR)\System.obj": "E:\usb\example1\061_lib\061_LIB\System.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\System.lst" -o "$(OUTDIR)\System.obj" "E:\usb\example1\061_lib\061_LIB\System.asm" 

"$(OUTDIR)\main.obj": "E:\usb\example1\061_lib\061_LIB\main.c" ".\main.h" ".\chap9.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "E:/usb/example1/061_lib/061_LIB/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\D12CI.obj": "E:\usb\example1\061_lib\061_LIB\D12CI.c" ".\D12CI.h" ".\chap9.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/D12CI.asm" "E:/usb/example1/061_lib/061_LIB/D12CI.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\D12CI.lst" -o "$(OUTDIR)\D12CI.obj" "$(OUTDIR)\D12CI.asm" 

"$(OUTDIR)\chap9.obj": "E:\usb\example1\061_lib\061_LIB\chap9.c" ".\D12CI.H" ".\chap9.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/chap9.asm" "E:/usb/example1/061_lib/061_LIB/chap9.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\chap9.lst" -o "$(OUTDIR)\chap9.obj" "$(OUTDIR)\chap9.asm" 

"$(OUTDIR)\ExternInt.obj": "E:\usb\example1\061_lib\061_LIB\ExternInt.c" ".\D12CI.h" ".\chap9.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ExternInt.asm" "E:/usb/example1/061_lib/061_LIB/ExternInt.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ExternInt.lst" -o "$(OUTDIR)\ExternInt.obj" "$(OUTDIR)\ExternInt.asm" 


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
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\System.obj" 
	$(RM) "$(OUTDIR)\System.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\D12CI.obj" 
	$(RM) "$(OUTDIR)\D12CI.lst" 
	$(RM) "$(OUTDIR)\D12CI.asm" 
	$(RM) "$(OUTDIR)\chap9.obj" 
	$(RM) "$(OUTDIR)\chap9.lst" 
	$(RM) "$(OUTDIR)\chap9.asm" 
	$(RM) "$(OUTDIR)\ExternInt.obj" 
	$(RM) "$(OUTDIR)\ExternInt.lst" 
	$(RM) "$(OUTDIR)\ExternInt.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

