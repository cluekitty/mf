#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_21_Scrolls[SCROLL_DATA_SIZE(2)] = {
	21, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 31, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 31, // X bounds
	22, 31, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_21_Clipdata[190] = INCBIN_U8("data/rooms/main_deck/main_deck_21_clipdata.gfx");

const u8 sMainDeck_21_Spriteset2[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	7, 5, 2,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_21_Bg2[253] = INCBIN_U8("data/rooms/main_deck/main_deck_21_bg2.gfx");

const u8 sMainDeck_21_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(5)] = {
	7, 5, 2,
	15, 5, 34,
	29, 27, 18,
	33, 16, 56,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_21_Bg1[619] = INCBIN_U8("data/rooms/main_deck/main_deck_21_bg1.gfx");

const u8 sMainDeck_21_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	7, 5, 2,
	15, 5, 34,
	16, 13, 36,
	29, 27, 18,
	33, 16, 56,
	ROOM_SPRITE_DATA_TERMINATOR
};

