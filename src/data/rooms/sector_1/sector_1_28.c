#include "data/rooms/sector_1_rooms_data.h"
#include "macros.h"

const u8 sSector1_28_Clipdata[52] = INCBIN_U8("data/rooms/sector_1/sector_1_28_clipdata.gfx");

const u8 sSector1_28_Bg2[130] = INCBIN_U8("data/rooms/sector_1/sector_1_28_bg2.gfx");

const u8 sSector1_28_Bg1[190] = INCBIN_U8("data/rooms/sector_1/sector_1_28_bg1.gfx");

const u8 sSector1_28_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	8, 9, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(3),
	ROOM_SPRITE_DATA_TERMINATOR
};

