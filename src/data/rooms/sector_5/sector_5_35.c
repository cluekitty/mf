#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_35_Clipdata[52] = INCBIN_U8("data/rooms/sector_5/sector_5_35_clipdata.gfx");

const u8 sSector5_35_Bg2[48] = INCBIN_U8("data/rooms/sector_5/sector_5_35_bg2.gfx");

const u8 sSector5_35_Spriteset1[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	0, 17, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(4),
	6, 18, SPRITESET_IDX(1),
	8, 9, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(5),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_35_Bg1[171] = INCBIN_U8("data/rooms/sector_5/sector_5_35_bg1.gfx");

const u8 sSector5_35_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	8, 9, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

