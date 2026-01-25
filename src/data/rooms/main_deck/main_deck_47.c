#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_47_Scrolls[SCROLL_DATA_SIZE(2)] = {
	47, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 19, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	17, 91, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_47_Clipdata[157] = INCBIN_U8("data/rooms/main_deck/main_deck_47_clipdata.gfx");

const u8 sMainDeck_47_Bg2[510] = INCBIN_U8("data/rooms/main_deck/main_deck_47_bg2.gfx");

const u8 sMainDeck_47_Bg1[590] = INCBIN_U8("data/rooms/main_deck/main_deck_47_bg1.gfx");

const u8 sMainDeck_47_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(13)] = {
	4, 40, 34,
	4, 47, 34,
	4, 55, 34,
	4, 64, 34,
	4, 72, 34,
	4, 80, 34,
	4, 88, 34,
	6, 57, 3,
	8, 48, 33,
	8, 62, 33,
	8, 74, 33,
	8, 83, 33,
	ROOM_SPRITE_DATA_TERMINATOR
};

