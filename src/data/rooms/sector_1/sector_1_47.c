#include "data/rooms/sector_1_rooms_data.h"
#include "macros.h"

const u8 sSector1_47_Clipdata[199] = INCBIN_U8("data/rooms/sector_1/sector_1_47_clipdata.gfx");

const u8 sSector1_47_Bg2[43] = INCBIN_U8("data/rooms/sector_1/sector_1_47_bg2.gfx");

const u8 sSector1_47_Bg1[366] = INCBIN_U8("data/rooms/sector_1/sector_1_47_bg1.gfx");

const u8 sSector1_47_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(3)] = {
	7, 14, SPRITESET_IDX(0),
	14, 10, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(3),
	ROOM_SPRITE_DATA_TERMINATOR
};

