#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_24_Scrolls[SCROLL_DATA_SIZE(2)] = {
	24, // Room
	2, // Number of scrolls
	
	// Scroll 0
	17, 31, // X bounds
	12, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	2, // Breakeable block direction
	2, // Breakeable block Y bound extension

	// Scroll 1
	2, 46, // X bounds
	12, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_24_Clipdata[136] = INCBIN_U8("data/rooms/main_deck/main_deck_24_clipdata.gfx");

const u8 sMainDeck_24_Bg2[388] = INCBIN_U8("data/rooms/main_deck/main_deck_24_bg2.gfx");

const u8 sMainDeck_24_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(14)] = {
	15, 18, 17,
	15, 29, 18,
	16, 6, 21,
	16, 8, 19,
	16, 10, 17,
	16, 18, 19,
	16, 29, 20,
	16, 37, 18,
	16, 39, 20,
	16, 41, 22,
	17, 18, 21,
	17, 29, 22,
	18, 24, 29,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_24_Bg1[561] = INCBIN_U8("data/rooms/main_deck/main_deck_24_bg1.gfx");

const u8 sMainDeck_24_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(13)] = {
	15, 18, 17,
	15, 29, 18,
	16, 6, 21,
	16, 8, 19,
	16, 10, 17,
	16, 18, 19,
	16, 29, 20,
	16, 37, 18,
	16, 39, 20,
	16, 41, 22,
	17, 18, 21,
	17, 29, 22,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_24_Bg0[32] = INCBIN_U8("data/rooms/main_deck/main_deck_24_bg0.gfx");

