#include "data/rooms/sector_4_rooms_data.h"
#include "macros.h"

const u8 sSector4_18_Clipdata[106] = INCBIN_U8("data/rooms/sector_4/sector_4_18_clipdata.gfx");

const u8 sSector4_18_Bg2[109] = INCBIN_U8("data/rooms/sector_4/sector_4_18_bg2.gfx");

const u8 sSector4_18_Bg1[214] = INCBIN_U8("data/rooms/sector_4/sector_4_18_bg1.gfx");

const u8 sSector4_18_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	3, 11, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	6, 6, SPRITESET_IDX(2),
	10, 8, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

