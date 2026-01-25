#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_26_Scrolls[SCROLL_DATA_SIZE(1)] = {
	26, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	3, // Breakeable block direction
	21, // Breakeable block Y bound extension
};

const u8 sMainDeck_26_Clipdata[142] = INCBIN_U8("data/rooms/main_deck/main_deck_26_clipdata.gfx");

const u8 sMainDeck_26_Bg2[188] = INCBIN_U8("data/rooms/main_deck/main_deck_26_bg2.gfx");

const u8 sMainDeck_26_Bg1[382] = INCBIN_U8("data/rooms/main_deck/main_deck_26_bg1.gfx");

const u8 sMainDeck_26_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(8)] = {
	4, 4, 17,
	5, 4, 18,
	6, 4, 19,
	6, 13, 22,
	7, 4, 21,
	7, 9, 26,
	9, 9, 29,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_26_Bg0[53] = INCBIN_U8("data/rooms/main_deck/main_deck_26_bg0.gfx");

