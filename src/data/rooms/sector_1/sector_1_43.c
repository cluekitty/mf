#include "data/rooms/sector_1_rooms_data.h"
#include "macros.h"

const u8 sSector1_43_Clipdata[74] = INCBIN_U8("data/rooms/sector_1/sector_1_43_clipdata.gfx");

const u8 sSector1_43_Bg2[105] = INCBIN_U8("data/rooms/sector_1/sector_1_43_bg2.gfx");

const u8 sSector1_43_Bg1[244] = INCBIN_U8("data/rooms/sector_1/sector_1_43_bg1.gfx");

const u8 sSector1_43_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(7)] = {
	2, 9, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	3, 6, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	4, 8, SPRITESET_IDX(1),
	6, 3, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	8, 10, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	9, 14, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	ROOM_SPRITE_DATA_TERMINATOR
};

