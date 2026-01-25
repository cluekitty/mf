#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_18_Clipdata[236] = INCBIN_U8("data/rooms/main_deck/main_deck_18_clipdata.gfx");

const u8 sMainDeck_18_Bg2[267] = INCBIN_U8("data/rooms/main_deck/main_deck_18_bg2.gfx");

const u8 sMainDeck_18_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(3)] = {
	5, 9, 3,
	6, 13, 33,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_18_Bg1[620] = INCBIN_U8("data/rooms/main_deck/main_deck_18_bg1.gfx");

const u8 sMainDeck_18_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(1)] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_18_Bg0[14] = INCBIN_U8("data/rooms/main_deck/main_deck_18_bg0.gfx");

