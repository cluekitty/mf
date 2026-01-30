#include "data/rooms/sector_4_rooms_data.h"
#include "macros.h"

const u8 sSector4_42_Scrolls[SCROLL_DATA_SIZE(1)] = {
	42, // Room
	1, // Number of scrolls
	
	// Scroll 0
	17, 46, // X bounds
	2, 21, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sSector4_42_Clipdata[170] = INCBIN_U8("data/rooms/sector_4/sector_4_42_clipdata.gfx");

const u8 sSector4_42_Bg2[334] = INCBIN_U8("data/rooms/sector_4/sector_4_42_bg2.gfx");

const u8 sSector4_42_Bg1[368] = INCBIN_U8("data/rooms/sector_4/sector_4_42_bg1.gfx");

const u8 sSector4_42_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	5, 31, SPRITESET_IDX(14),
	8, 23, SPRITESET_IDX(1),
	20, 43, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_42_Bg0[620] = INCBIN_U8("data/rooms/sector_4/sector_4_42_bg0.gfx");

