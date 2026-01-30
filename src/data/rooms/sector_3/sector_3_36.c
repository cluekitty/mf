#include "data/rooms/sector_3_rooms_data.h"
#include "macros.h"

const u8 sSector3_36_Clipdata[89] = INCBIN_U8("data/rooms/sector_3/sector_3_36_clipdata.gfx");

const u8 sSector3_36_Bg2[187] = INCBIN_U8("data/rooms/sector_3/sector_3_36_bg2.gfx");

const u8 sSector3_36_Bg1[313] = INCBIN_U8("data/rooms/sector_3/sector_3_36_bg1.gfx");

const u8 sSector3_36_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(10)] = {
	3, 17, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	4, 11, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	5, 22, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(1),
	6, 16, SPRITESET_IDX(1),
	8, 6, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	8, 10, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	8, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	9, 20, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	9, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_36_Bg0[176] = INCBIN_U8("data/rooms/sector_3/sector_3_36_bg0.gfx");

