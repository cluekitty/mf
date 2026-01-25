#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_40_Scrolls[SCROLL_DATA_SIZE(1)] = {
	40, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	3, // Breakeable block direction
	21, // Breakeable block Y bound extension
};

const u8 sMainDeck_40_Clipdata[124] = INCBIN_U8("data/rooms/main_deck/main_deck_40_clipdata.gfx");

const u8 sMainDeck_40_Bg2[298] = INCBIN_U8("data/rooms/main_deck/main_deck_40_bg2.gfx");

const u8 sMainDeck_40_Bg1[468] = INCBIN_U8("data/rooms/main_deck/main_deck_40_bg1.gfx");

const u8 sMainDeck_40_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	8, 9, 17,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_40_Bg0[42] = INCBIN_U8("data/rooms/main_deck/main_deck_40_bg0.gfx");

