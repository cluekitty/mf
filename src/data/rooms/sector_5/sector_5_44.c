#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_44_Clipdata[334] = INCBIN_U8("data/rooms/sector_5/sector_5_44_clipdata.gfx");

const u8 sSector5_44_Bg2[361] = INCBIN_U8("data/rooms/sector_5/sector_5_44_bg2.gfx");

const u8 sSector5_44_Bg1[787] = INCBIN_U8("data/rooms/sector_5/sector_5_44_bg1.gfx");

const u8 sSector5_44_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(8)] = {
	4, 12, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(5),
	26, 11, SPRITESET_IDX(1),
	34, 9, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	41, 8, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	48, 8, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	53, 5, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(5),
	59, 12, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(5),
	ROOM_SPRITE_DATA_TERMINATOR
};

