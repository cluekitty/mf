#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_42_Clipdata[170] = INCBIN_U8("data/rooms/sector_2/sector_2_42_clipdata.gfx");

const u8 sSector2_42_Bg2[503] = INCBIN_U8("data/rooms/sector_2/sector_2_42_bg2.gfx");

const u8 sSector2_42_Bg1[454] = INCBIN_U8("data/rooms/sector_2/sector_2_42_bg1.gfx");

const u8 sSector2_42_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(5)] = {
	16, 13, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(6),
	18, 17, SSP_X_ABSORBABLE_BY_SAMUS | SPRITESET_IDX(6),
	20, 6, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	21, 12, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

