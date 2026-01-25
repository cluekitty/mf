#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_82_Scrolls[SCROLL_DATA_SIZE(2)] = {
	82, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 11, // Y bounds
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

const u8 sMainDeck_82_Clipdata[60] = INCBIN_U8("data/rooms/main_deck/main_deck_82_clipdata.gfx");

const u8 sMainDeck_82_Bg2[314] = INCBIN_U8("data/rooms/main_deck/main_deck_82_bg2.gfx");

const u8 sMainDeck_82_Bg1[248] = INCBIN_U8("data/rooms/main_deck/main_deck_82_bg1.gfx");

const u8 sMainDeck_82_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 9, 17,
	ROOM_SPRITE_DATA_TERMINATOR
};

