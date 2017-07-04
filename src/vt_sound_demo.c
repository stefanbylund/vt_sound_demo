/*******************************************************************************
 * Stefan Bylund 2016
 *
 * A simple example program for Sinclair ZX Spectrum for demonstrating how
 * to use the Vortex Tracker II player from C to play a PT3 module in the
 * background. See vt_sound.h for more information.
 ******************************************************************************/

#include <input.h>
#include <z80.h>
#include <intrinsic.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include "vt_sound.h"

#pragma output CLIB_MALLOC_HEAP_SIZE = 0

#define printCls() printf("%c", 12)
#define printAt(row, col, str) printf("\x16%c%c%s", (col + 1), (row + 1), (str))

extern uint8_t music_module[];

static void init_isr(void)
{
    // Put Z80 in IM2 mode with a 257-byte interrupt vector table located at
    // address 0xD000 filled with 0xD1 bytes. Install vt_play_isr() as an IM2
    // interrupt service routine.
    intrinsic_di();
    im2_init((void *) 0xD000);
    memset((void *) 0xD000, 0xD1, 257);
    z80_bpoke(0xD1D1, 0xC3);
    z80_wpoke(0xD1D2, (uint16_t) vt_play_isr);
    intrinsic_ei();
}

int main(void)
{
    vt_init(music_module);
    init_isr();

    printCls();
    printAt(10, 8, "Enjoy the music!\n");
    printAt(12, 5, "Press any key to exit\n");

    while (true)
    {
        if (in_inkey() != 0)
        {
            break;
        }
    }

    vt_set_play_isr_enabled(false);
    vt_mute();
    return 0;
}
