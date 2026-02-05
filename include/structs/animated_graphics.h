#ifndef ANIMATED_GRAPHICS_STRUCT_H
#define ANIMATED_GRAPHICS_STRUCT_H

#include "types.h"

struct AnimatedPaletteAndTileset {
    u8 animatedPalette;
    u8 animatedTileset;
};

struct AnimatedPaletteTiming {
    u8 timer1;
    s8 row1;
    u8 timer2;
    s8 row2;
};

extern struct AnimatedPaletteTiming gAnimatedPaletteTiming;

extern struct AnimatedPaletteAndTileset gAnimatedPaletteAndTileset;

#endif /* ANIMATED_GRAPHICS_STRUCT_H */
