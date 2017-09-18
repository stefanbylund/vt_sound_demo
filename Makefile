################################################################################
# Stefan Bylund 2017
#
# Makefile for compiling VT player demo program for Sinclair ZX Spectrum.
# Supports both the SCCZ80 and SDCC compilers.
################################################################################

MKDIR := mkdir -p

RM := rm -rf

CP := cp

ZIP := zip -r -q

VT_SOUND := ../vt_sound

VT_SOUND_INCLUDE := $(VT_SOUND)/include

VT_SOUND_LIB_SCCZ80 := $(VT_SOUND)/lib/sccz80

VT_SOUND_LIB_SDCC_IX := $(VT_SOUND)/lib/sdcc_ix

VT_SOUND_LIB_SDCC_IY := $(VT_SOUND)/lib/sdcc_iy

SRCS := src/vt_sound_demo.c src/sound.asm

BINDIR_SCCZ80 := bin/sccz80

BINDIR_SDCC_IX := bin/sdcc_ix

BINDIR_SDCC_IY := bin/sdcc_iy

DEBUGFLAGS := --list --c-code-in-asm

all: all_sccz80 all_sdcc_ix all_sdcc_iy

all_sccz80:
	$(MKDIR) $(BINDIR_SCCZ80)
	zcc +zx -vn -O3 -startup=1 -clib=new -m $(DEBUG) -L$(VT_SOUND_LIB_SCCZ80) -lvt_sound -I$(VT_SOUND_INCLUDE) $(SRCS) -o $(BINDIR_SCCZ80)/vt_sound_demo -create-app

all_sdcc_ix:
	$(MKDIR) $(BINDIR_SDCC_IX)
	zcc +zx -vn -SO3 -startup=1 -clib=sdcc_ix -m $(DEBUG) --max-allocs-per-node200000 -L$(VT_SOUND_LIB_SDCC_IX) -lvt_sound -I$(VT_SOUND_INCLUDE) $(SRCS) -o $(BINDIR_SDCC_IX)/vt_sound_demo -create-app

all_sdcc_iy:
	$(MKDIR) $(BINDIR_SDCC_IY)
	zcc +zx -vn -SO3 -startup=1 -clib=sdcc_iy -m $(DEBUG) --max-allocs-per-node200000 -L$(VT_SOUND_LIB_SDCC_IY) -lvt_sound -I$(VT_SOUND_INCLUDE) $(SRCS) -o $(BINDIR_SDCC_IY)/vt_sound_demo -create-app

debug_sccz80: DEBUG = $(DEBUGFLAGS)

debug_sdcc_ix: DEBUG = $(DEBUGFLAGS)

debug_sdcc_iy: DEBUG = $(DEBUGFLAGS)

debug_sccz80: all_sccz80

debug_sdcc_ix: all_sdcc_ix

debug_sdcc_iy: all_sdcc_iy

distro:
	$(MAKE) clean all
	$(RM) tmp
	$(MKDIR) tmp/vt_sound_demo
	$(CP) bin/sdcc_iy/vt_sound_demo.tap tmp/vt_sound_demo
	$(CP) src/vt_sound_demo.c tmp/vt_sound_demo
	$(CP) src/sound.asm tmp/vt_sound_demo
	$(CP) src/music.pt3 tmp/vt_sound_demo
	$(CP) readme.txt tmp/vt_sound_demo
	$(RM) build/vt_sound_demo.zip
	cd tmp; $(ZIP) ../build/vt_sound_demo.zip vt_sound_demo
	$(RM) tmp

clean:
	$(RM) bin tmp zcc_opt.def zcc_proj.lst src/*.lis
