#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_22_Clipdata[148] = INCBIN_U8("data/rooms/main_deck/main_deck_22_clipdata.gfx");

const u8 sMainDeck_22_Bg2[432] = INCBIN_U8("data/rooms/main_deck/main_deck_22_bg2.gfx");

const u8 sMainDeck_22_Bg1[330] = INCBIN_U8("data/rooms/main_deck/main_deck_22_bg1.gfx");

const u8 sMainDeck_22_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	5, 9, 3,
	9, 12, 35,
	14, 5, 35,
	20, 12, 163,
	32, 12, 49,
	ROOM_SPRITE_DATA_TERMINATOR
};

