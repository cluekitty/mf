#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_50_Clipdata[193] = INCBIN_U8("data/rooms/main_deck/main_deck_50_clipdata.gfx");

const u8 sMainDeck_50_Bg2[827] = INCBIN_U8("data/rooms/main_deck/main_deck_50_bg2.gfx");

const u8 sMainDeck_50_Bg1[480] = INCBIN_U8("data/rooms/main_deck/main_deck_50_bg1.gfx");

const u8 sMainDeck_50_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(8)] = {
	0, 31, 35,
	0, 43, 35,
	4, 21, 3,
	10, 23, 161,
	10, 47, 161,
	13, 27, 35,
	13, 41, 35,
	ROOM_SPRITE_DATA_TERMINATOR
};

