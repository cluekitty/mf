#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_7_Scrolls[SCROLL_DATA_SIZE(2)] = {
	7, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 31, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 31, // X bounds
	10, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sMainDeck_7_Clipdata[151] = INCBIN_U8("data/rooms/main_deck/main_deck_7_clipdata.gfx");

const u8 sMainDeck_7_Bg2[297] = INCBIN_U8("data/rooms/main_deck/main_deck_7_bg2.gfx");

const u8 sMainDeck_7_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	7, 17, 3,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_7_Bg1[557] = INCBIN_U8("data/rooms/main_deck/main_deck_7_bg1.gfx");

const u8 sMainDeck_7_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	7, 15, 3,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_7_Bg0[64] = INCBIN_U8("data/rooms/main_deck/main_deck_7_bg0.gfx");

