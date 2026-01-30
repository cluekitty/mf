#include "data/rooms/sector_3_rooms_data.h"
#include "macros.h"

const u8 sSector3_9_Clipdata[276] = INCBIN_U8("data/rooms/sector_3/sector_3_9_clipdata.gfx");

const u8 sSector3_9_Bg2[489] = INCBIN_U8("data/rooms/sector_3/sector_3_9_bg2.gfx");

const u8 sSector3_9_Bg1[939] = INCBIN_U8("data/rooms/sector_3/sector_3_9_bg1.gfx");

const u8 sSector3_9_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(10)] = {
	14, 13, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	14, 49, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	14, 51, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	15, 30, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	16, 34, SPRITESET_IDX(2),
	18, 36, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	18, 53, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	18, 55, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	19, 26, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_9_Bg0[405] = INCBIN_U8("data/rooms/sector_3/sector_3_9_bg0.gfx");

