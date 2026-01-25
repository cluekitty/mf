#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_69_Scrolls[SCROLL_DATA_SIZE(3)] = {
	69, // Room
	3, // Number of scrolls
	
	// Scroll 0
	2, 46, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 46, // X bounds
	11, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 2
	2, 46, // X bounds
	21, 31, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_69_Clipdata[318] = INCBIN_U8("data/rooms/main_deck/main_deck_69_clipdata.gfx");

const u8 sMainDeck_69_Bg2[1114] = INCBIN_U8("data/rooms/main_deck/main_deck_69_bg2.gfx");

const u8 sMainDeck_69_Bg1[853] = INCBIN_U8("data/rooms/main_deck/main_deck_69_bg1.gfx");

const u8 sMainDeck_69_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(13)] = {
	9, 10, 26,
	9, 19, 22,
	9, 20, 25,
	9, 22, 24,
	9, 23, 21,
	9, 24, 25,
	9, 26, 25,
	9, 31, 26,
	9, 39, 26,
	19, 33, 17,
	28, 18, 17,
	28, 33, 17,
	ROOM_SPRITE_DATA_TERMINATOR
};

