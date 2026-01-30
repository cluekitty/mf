#include "data/rooms/sector_1_rooms_data.h"
#include "macros.h"

const u8 sSector1_14_Clipdata[52] = INCBIN_U8("data/rooms/sector_1/sector_1_14_clipdata.gfx");

const u8 sSector1_14_Bg2[57] = INCBIN_U8("data/rooms/sector_1/sector_1_14_bg2.gfx");

const u8 sSector1_14_Bg1[173] = INCBIN_U8("data/rooms/sector_1/sector_1_14_bg1.gfx");

const u8 sSector1_14_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	8, 9, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

