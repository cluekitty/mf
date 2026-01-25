#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_10_Scrolls[SCROLL_DATA_SIZE(2)] = {
	10, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 31, // X bounds
	12, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_10_Clipdata[139] = INCBIN_U8("data/rooms/main_deck/main_deck_10_clipdata.gfx");

const u8 sMainDeck_10_Bg2[94] = INCBIN_U8("data/rooms/main_deck/main_deck_10_bg2.gfx");

const u8 sMainDeck_10_Bg1[450] = INCBIN_U8("data/rooms/main_deck/main_deck_10_bg1.gfx");

const u8 sMainDeck_10_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	10, 11, 3,
	14, 15, 55,
	16, 30, 33,
	17, 14, 34,
	18, 22, 34,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_10_Bg0[14] = INCBIN_U8("data/rooms/main_deck/main_deck_10_bg0.gfx");

