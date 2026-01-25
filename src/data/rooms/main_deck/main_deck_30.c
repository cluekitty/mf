#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_30_Scrolls[SCROLL_DATA_SIZE(1)] = {
	30, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	3, // Breakeable block direction
	21, // Breakeable block Y bound extension
};

const u8 sMainDeck_30_Clipdata[130] = INCBIN_U8("data/rooms/main_deck/main_deck_30_clipdata.gfx");

const u8 sMainDeck_30_Bg2[186] = INCBIN_U8("data/rooms/main_deck/main_deck_30_bg2.gfx");

const u8 sMainDeck_30_Bg1[386] = INCBIN_U8("data/rooms/main_deck/main_deck_30_bg1.gfx");

const u8 sMainDeck_30_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(8)] = {
	4, 13, 17,
	5, 13, 18,
	6, 13, 19,
	7, 9, 27,
	7, 13, 20,
	8, 13, 22,
	9, 9, 29,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_30_Bg0[53] = INCBIN_U8("data/rooms/main_deck/main_deck_30_bg0.gfx");

