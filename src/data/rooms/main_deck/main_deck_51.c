#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_51_Clipdata[610] = INCBIN_U8("data/rooms/main_deck/main_deck_51_clipdata.gfx");

const u8 sMainDeck_51_Bg2[2182] = INCBIN_U8("data/rooms/main_deck/main_deck_51_bg2.gfx");

const u8 sMainDeck_51_Bg1[1078] = INCBIN_U8("data/rooms/main_deck/main_deck_51_bg1.gfx");

const u8 sMainDeck_51_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(7)] = {
	15, 9, 49,
	22, 27, 161,
	29, 21, 49,
	34, 3, 34,
	34, 11, 3,
	36, 27, 161,
	ROOM_SPRITE_DATA_TERMINATOR
};

