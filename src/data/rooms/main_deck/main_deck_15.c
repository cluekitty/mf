#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_15_Clipdata[168] = INCBIN_U8("data/rooms/main_deck/main_deck_15_clipdata.gfx");

const u8 sMainDeck_15_Bg2[14] = INCBIN_U8("data/rooms/main_deck/main_deck_15_bg2.gfx");

const u8 sMainDeck_15_Bg1[366] = INCBIN_U8("data/rooms/main_deck/main_deck_15_bg1.gfx");

const u8 sMainDeck_15_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	16, 14, 164,
	17, 8, 1,
	23, 14, 163,
	33, 8, 49,
	33, 12, 49,
	ROOM_SPRITE_DATA_TERMINATOR
};

