#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_41_Clipdata[71] = INCBIN_U8("data/rooms/sector_2/sector_2_41_clipdata.gfx");

const u8 sSector2_41_Bg2[107] = INCBIN_U8("data/rooms/sector_2/sector_2_41_bg2.gfx");

const u8 sSector2_41_Bg1[205] = INCBIN_U8("data/rooms/sector_2/sector_2_41_bg1.gfx");

const u8 sSector2_41_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 24, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

