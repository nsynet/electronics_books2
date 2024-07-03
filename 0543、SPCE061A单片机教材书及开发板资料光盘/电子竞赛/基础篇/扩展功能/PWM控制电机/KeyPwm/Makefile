#####################################################################
#																	 
#	Created by u'nSP IDE		17:40:10	08/13/03
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

INCLUDES	= -I"F:/电子竞赛/KeyPwm" -I"F:/tgg035/Library" -I"F:/tgg035/HeadFile" -I"D:/Program Files/Sunplus/unSPIDE180/Include" -I"F:/TG035/HeadFile" -I"D:/Program Files/Sunplus/unSPIDE180/C_Lib" -I"D:/Documents and Settings/刘新颜/桌面/本周事项/0---3V电压测量表/VoltageMeasureFrom0To3"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\KeyPwm.S37"

ARYFILE	= "$(OUTDIR)\KeyPwm.ary"

SBMFILE	= "$(OUTDIR)\KeyPwm.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\pwm.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\IRQ.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\KeyPwm\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\KeyPwm\Resource.asm" 

"$(OUTDIR)\pwm.obj": "F:\电子竞赛\KeyPwm\pwm.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\pwm.lst" -o "$(OUTDIR)\pwm.obj" "F:\电子竞赛\KeyPwm\pwm.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\KeyPwm\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/KeyPwm/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\key.obj": "F:\电子竞赛\KeyPwm\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\电子竞赛\KeyPwm\key.asm" 

"$(OUTDIR)\IRQ.obj": "F:\电子竞赛\KeyPwm\IRQ.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\IRQ.lst" -o "$(OUTDIR)\IRQ.obj" "F:\电子竞赛\KeyPwm\IRQ.asm" 


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
	$(RM) "$(OUTDIR)\pwm.obj" 
	$(RM) "$(OUTDIR)\pwm.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\IRQ.obj" 
	$(RM) "$(OUTDIR)\IRQ.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

