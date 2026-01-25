#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_29_Scrolls[SCROLL_DATA_SIZE(1)] = {
	29, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	3, // Breakeable block direction
	21, // Breakeable block Y bound extension
};

const u8 sMainDeck_29_Clipdata[142] = INCBIN_U8("data/rooms/main_deck/main_deck_29_clipdata.gfx");

const u8 sMainDeck_29_Bg2[188] = INCBIN_U8("data/rooms/main_deck/main_deck_29_bg2.gfx");

const u8 sMainDeck_29_Bg1[382] = INCBIN_U8("data/rooms/main_deck/main_deck_29_bg1.gfx");

const u8 sMainDeck_29_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(8)] = {
	4, 13, 17,
	5, 13, 18,
	6, 4, 21,
	6, 13, 20,
	7, 9, 25,
	7, 13, 22,
	9, 9, 29,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_29_Bg0[53] = INCBIN_U8("data/rooms/main_deck/main_deck_29_bg0.gfx");

