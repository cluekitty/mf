#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_45_Clipdata[69] = INCBIN_U8("data/rooms/sector_2/sector_2_45_clipdata.gfx");

const u8 sSector2_45_Bg2[107] = INCBIN_U8("data/rooms/sector_2/sector_2_45_bg2.gfx");

const u8 sSector2_45_Bg1[205] = INCBIN_U8("data/rooms/sector_2/sector_2_45_bg1.gfx");

const u8 sSector2_45_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 24, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

