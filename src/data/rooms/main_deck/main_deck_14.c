#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_14_Clipdata[171] = INCBIN_U8("data/rooms/main_deck/main_deck_14_clipdata.gfx");

const u8 sMainDeck_14_Bg2[486] = INCBIN_U8("data/rooms/main_deck/main_deck_14_bg2.gfx");

const u8 sMainDeck_14_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	4, 15, 3,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_14_Bg1[461] = INCBIN_U8("data/rooms/main_deck/main_deck_14_bg1.gfx");

const u8 sMainDeck_14_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	4, 15, 3,
	10, 11, 34,
	10, 15, 34,
	ROOM_SPRITE_DATA_TERMINATOR
};

