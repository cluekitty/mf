#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_31_Clipdata[76] = INCBIN_U8("data/rooms/main_deck/main_deck_31_clipdata.gfx");

const u8 sMainDeck_31_Bg2[315] = INCBIN_U8("data/rooms/main_deck/main_deck_31_bg2.gfx");

const u8 sMainDeck_31_Bg1[281] = INCBIN_U8("data/rooms/main_deck/main_deck_31_bg1.gfx");

const u8 sMainDeck_31_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	3, 17, 33,
	3, 24, 33,
	4, 16, 3,
	5, 22, 33,
	8, 12, 33,
	ROOM_SPRITE_DATA_TERMINATOR
};

