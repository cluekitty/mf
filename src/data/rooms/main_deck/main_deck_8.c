#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_8_Clipdata[60] = INCBIN_U8("data/rooms/main_deck/main_deck_8_clipdata.gfx");

const u8 sMainDeck_8_Bg2[164] = INCBIN_U8("data/rooms/main_deck/main_deck_8_bg2.gfx");

const u8 sMainDeck_8_Bg1[137] = INCBIN_U8("data/rooms/main_deck/main_deck_8_bg1.gfx");

const u8 sMainDeck_8_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 11, 22,
	ROOM_SPRITE_DATA_TERMINATOR
};

