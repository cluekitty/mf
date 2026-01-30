#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_20_Scrolls[SCROLL_DATA_SIZE(2)] = {
	20, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 31, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	16, 31, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_20_Clipdata[214] = INCBIN_U8("data/rooms/main_deck/main_deck_20_clipdata.gfx");

const u8 sMainDeck_20_Bg2[157] = INCBIN_U8("data/rooms/main_deck/main_deck_20_bg2.gfx");

const u8 sMainDeck_20_Bg1[643] = INCBIN_U8("data/rooms/main_deck/main_deck_20_bg1.gfx");

const u8 sMainDeck_20_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(1)] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

