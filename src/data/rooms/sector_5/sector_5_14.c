#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_14_Clipdata[72] = INCBIN_U8("data/rooms/sector_5/sector_5_14_clipdata.gfx");

const u8 sSector5_14_Bg2[54] = INCBIN_U8("data/rooms/sector_5/sector_5_14_bg2.gfx");

const u8 sSector5_14_Bg1[137] = INCBIN_U8("data/rooms/sector_5/sector_5_14_bg1.gfx");

const u8 sSector5_14_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	4, 11, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

