#include "data/rooms/sector_1_rooms_data.h"
#include "macros.h"

const u8 sSector1_22_Scrolls[SCROLL_DATA_SIZE(1)] = {
	22, // Room
	1, // Number of scrolls
	
	// Scroll 0
	2, 31, // X bounds
	2, 11, // Y bounds
	UCHAR_MAX, UCHAR_MAX, // Breakeable block position
	UCHAR_MAX, // Breakeable block direction
	UCHAR_MAX, // Breakeable block Y bound extension
};

const u8 sSector1_22_Clipdata[84] = INCBIN_U8("data/rooms/sector_1/sector_1_22_clipdata.gfx");

const u8 sSector1_22_Bg2[14] = INCBIN_U8("data/rooms/sector_1/sector_1_22_bg2.gfx");

const u8 sSector1_22_Bg1[271] = INCBIN_U8("data/rooms/sector_1/sector_1_22_bg1.gfx");

const u8 sSector1_22_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(11)] = {
	4, 16, SPRITESET_IDX(2),
	8, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	8, 16, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(2),
	8, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	10, 6, SSP_X_UNABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	10, 10, SSP_X_UNABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	10, 14, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	10, 20, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	10, 23, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	10, 27, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	ROOM_SPRITE_DATA_TERMINATOR
};

