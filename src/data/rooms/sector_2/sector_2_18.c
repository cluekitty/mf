#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_18_Scrolls[SCROLL_DATA_SIZE(2)] = {
	18, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 25, // X bounds
	2, 14, // Y bounds
	25, 4, // Breakeable block position
	1, // Breakeable block direction
	46, // Breakeable block Y bound extension

	// Scroll 1
	7, 25, // X bounds
	12, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sSector2_18_Clipdata[147] = INCBIN_U8("data/rooms/sector_2/sector_2_18_clipdata.gfx");

const u8 sSector2_18_Bg2[406] = INCBIN_U8("data/rooms/sector_2/sector_2_18_bg2.gfx");

const u8 sSector2_18_Bg1[458] = INCBIN_U8("data/rooms/sector_2/sector_2_18_bg1.gfx");

const u8 sSector2_18_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	15, 17, SPRITESET_IDX(14),
	16, 16, SPRITESET_IDX(0),
	20, 20, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

