#include "data/rooms/sector_3_rooms_data.h"
#include "macros.h"

const u8 sSector3_18_Scrolls[SCROLL_DATA_SIZE(2)] = {
	18, // Room
	2, // Number of scrolls
	
	// Scroll 0
	2, 31, // X bounds
	12, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	16, 31, // X bounds
	2, 13, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sSector3_18_Clipdata[122] = INCBIN_U8("data/rooms/sector_3/sector_3_18_clipdata.gfx");

const u8 sSector3_18_Bg2[145] = INCBIN_U8("data/rooms/sector_3/sector_3_18_bg2.gfx");

const u8 sSector3_18_Bg1[441] = INCBIN_U8("data/rooms/sector_3/sector_3_18_bg1.gfx");

const u8 sSector3_18_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(1)] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

