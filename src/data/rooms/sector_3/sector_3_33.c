#include "data/rooms/sector_3_rooms_data.h"
#include "macros.h"

const u8 sSector3_33_Clipdata[58] = INCBIN_U8("data/rooms/sector_3/sector_3_33_clipdata.gfx");

const u8 sSector3_33_Bg2[155] = INCBIN_U8("data/rooms/sector_3/sector_3_33_bg2.gfx");

const u8 sSector3_33_Bg1[141] = INCBIN_U8("data/rooms/sector_3/sector_3_33_bg1.gfx");

const u8 sSector3_33_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(5)] = {
	3, 11, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(5),
	6, 9, SPRITESET_IDX(1),
	8, 13, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(2),
	10, 11, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(5),
	ROOM_SPRITE_DATA_TERMINATOR
};

