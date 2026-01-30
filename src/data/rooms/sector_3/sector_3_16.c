#include "data/rooms/sector_3_rooms_data.h"
#include "macros.h"

const u8 sSector3_16_Clipdata[76] = INCBIN_U8("data/rooms/sector_3/sector_3_16_clipdata.gfx");

const u8 sSector3_16_Bg2[30] = INCBIN_U8("data/rooms/sector_3/sector_3_16_bg2.gfx");

const u8 sSector3_16_Bg1[233] = INCBIN_U8("data/rooms/sector_3/sector_3_16_bg1.gfx");

const u8 sSector3_16_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	2, 9, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	5, 9, SPRITESET_IDX(0),
	8, 9, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_16_Bg0[90] = INCBIN_U8("data/rooms/sector_3/sector_3_16_bg0.gfx");

