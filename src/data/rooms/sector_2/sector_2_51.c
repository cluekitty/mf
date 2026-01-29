#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_51_Scrolls[SCROLL_DATA_SIZE(2)] = {
	51, // Room
	2, // Number of scrolls
	
	// Scroll 0
	3, 17, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension

	// Scroll 1
	2, 31, // X bounds
	11, 20, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sSector2_51_Clipdata[159] = INCBIN_U8("data/rooms/sector_2/sector_2_51_clipdata.gfx");

const u8 sSector2_51_Bg2[359] = INCBIN_U8("data/rooms/sector_2/sector_2_51_bg2.gfx");

const u8 sSector2_51_Bg1[543] = INCBIN_U8("data/rooms/sector_2/sector_2_51_bg1.gfx");

const u8 sSector2_51_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(1)] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_51_Bg0[62] = INCBIN_U8("data/rooms/sector_2/sector_2_51_bg0.gfx");

