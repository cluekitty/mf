#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_78_Scrolls[SCROLL_DATA_SIZE(2)] = {
	78, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	22, 31, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 16, // X bounds
	32, 41, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_78_Clipdata[176] = INCBIN_U8("data/rooms/main_deck/main_deck_78_clipdata.gfx");

const u8 sMainDeck_78_Bg2[346] = INCBIN_U8("data/rooms/main_deck/main_deck_78_bg2.gfx");

const u8 sMainDeck_78_Bg1[461] = INCBIN_U8("data/rooms/main_deck/main_deck_78_bg1.gfx");

const u8 sMainDeck_78_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(24)] = {
	23, 9, 34,
	24, 9, 34,
	25, 5, 18,
	25, 9, 34,
	25, 13, 18,
	26, 5, 18,
	26, 9, 34,
	26, 13, 18,
	27, 5, 18,
	27, 9, 34,
	27, 13, 18,
	30, 10, 24,
	33, 9, 34,
	34, 9, 34,
	35, 5, 18,
	35, 9, 34,
	35, 13, 18,
	36, 5, 18,
	36, 9, 34,
	36, 13, 18,
	37, 5, 18,
	37, 9, 34,
	37, 13, 18,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_78_Bg0[578] = INCBIN_U8("data/rooms/main_deck/main_deck_78_bg0.gfx");

