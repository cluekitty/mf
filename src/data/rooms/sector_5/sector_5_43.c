#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_43_Scrolls[SCROLL_DATA_SIZE(1)] = {
	43, // Room
	1, // Number of scrolls
	
	// Scroll 0
	32, 61, // X bounds
	2, 11, // Y bounds
	32, 6, // Breakeable block position
	0, // Breakeable block direction
	2, // Breakeable block Y bound extension
};

const u8 sSector5_43_Clipdata[142] = INCBIN_U8("data/rooms/sector_5/sector_5_43_clipdata.gfx");

const u8 sSector5_43_Bg2[17] = INCBIN_U8("data/rooms/sector_5/sector_5_43_bg2.gfx");

const u8 sSector5_43_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(7)] = {
	3, 42, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	3, 47, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	6, 15, SPRITESET_IDX(1),
	10, 13, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(4),
	10, 16, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(4),
	10, 19, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(4),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_43_Bg1[381] = INCBIN_U8("data/rooms/sector_5/sector_5_43_bg1.gfx");

const u8 sSector5_43_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	8, 54, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

