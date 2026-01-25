#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_79_Scrolls[SCROLL_DATA_SIZE(1)] = {
	79, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 16, // X bounds
	32, 41, // Y bounds
	10, 32, // Breakeable block position
	2, // Breakeable block direction
	2, // Breakeable block Y bound extension
};

const u8 sMainDeck_79_Clipdata[188] = INCBIN_U8("data/rooms/main_deck/main_deck_79_clipdata.gfx");

const u8 sMainDeck_79_Bg2[274] = INCBIN_U8("data/rooms/main_deck/main_deck_79_bg2.gfx");

const u8 sMainDeck_79_Bg1[425] = INCBIN_U8("data/rooms/main_deck/main_deck_79_bg1.gfx");

const u8 sMainDeck_79_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(15)] = {
	8, 9, 34,
	13, 12, 34,
	15, 6, 34,
	20, 9, 34,
	24, 6, 34,
	26, 12, 34,
	32, 4, 19,
	32, 6, 20,
	32, 9, 20,
	32, 12, 21,
	33, 9, 34,
	34, 9, 34,
	35, 9, 34,
	40, 9, 17,
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_79_Bg0[14] = INCBIN_U8("data/rooms/main_deck/main_deck_79_bg0.gfx");

