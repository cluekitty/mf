#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_84_Clipdata[54] = INCBIN_U8("data/rooms/main_deck/main_deck_84_clipdata.gfx");

const u8 sMainDeck_84_Bg2[34] = INCBIN_U8("data/rooms/main_deck/main_deck_84_bg2.gfx");

const u8 sMainDeck_84_Bg1[153] = INCBIN_U8("data/rooms/main_deck/main_deck_84_bg1.gfx");

const u8 sMainDeck_84_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	7, 14, SPRITESET_IDX(2),
	ROOM_SPRITE_DATA_TERMINATOR
};

