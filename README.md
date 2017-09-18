# Demonstration of vt_sound

The **vt_sound_demo** project contains a simple example program demonstrating
how to use the [vt_sound](https://github.com/stefanbylund/vt_sound) C API for
the Vortex Tracker II player to play a PT3 module in the background.

## Download

The latest version of this program can be downloaded [here](build/vt_sound_demo.zip).
This download contains the following binaries and resources:

* vt_sound_demo/vt_sound_demo.tap
* vt_sound_demo/vt_sound_demo.c
* vt_sound_demo/sound.asm
* vt_sound_demo/music.pt3
* vt_sound_demo/readme.txt

The included readme.txt file explains how to start the program.

If you want to build the vt_sound_demo program yourself, see the "How to Build"
section below.

## How to Build

If you want to build the vt_sound_demo program yourself, follow the steps below:

1. On Windows, you need [MinGW](http://www.mingw.org/),
[UnxUtils](https://sourceforge.net/projects/unxutils/) or
[Cygwin](https://www.cygwin.com/) for the basic Unix commands. Add the chosen
set of Unix commands to your path.

2. Install the latest version of [z88dk](https://github.com/z88dk/z88dk) and
a Sinclair ZX Spectrum emulator with AY-3-8912 sound chip support, e.g.
[ZEsarUX](https://sourceforge.net/projects/zesarux/).

3. Download [vt_sound](https://github.com/stefanbylund/vt_sound/blob/master/build/vt_sound.zip)
and unpack it in a suitable place.

4. Download the vt_sound_demo repository either as a ZIP archive using the
"Clone or download" button at the top of this page or with Git using the
following command:

> git clone https://github.com/stefanbylund/vt_sound_demo.git

5. Make sure the vt_sound and vt_sound_demo directories are located in a common
parent directory.

6. Go to the vt_sound_demo directory and enter the following command:

> make all

7. Run the vt_sound_demo/bin/\<compiler-flavour\>/vt_sound_demo.tap file in your
Sinclair ZX Spectrum emulator.

**Tip:** If you don't care for makefiles or don't want to install
MinGW/UnxUtils/Cygwin on Windows, you can build vt_sound_demo manually
by using the z88dk command-line invocation located in the header of the
vt_sound_demo.c source file.

## License

This software is licensed under the terms of the MIT license.

The included PT3 example module music.pt3 is originally called Tears.pt3 and is
copyright (C) 2005 by Sergey Bulba (http://bulba.untergrund.net/).
