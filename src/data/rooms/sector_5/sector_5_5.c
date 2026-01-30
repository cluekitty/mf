#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_5_Clipdata[76] = INCBIN_U8("data/rooms/sector_5/sector_5_5_clipdata.gfx");

const u8 sSector5_5_Bg2[262] = INCBIN_U8("data/rooms/sector_5/sector_5_5_bg2.gfx");

const u8 sSector5_5_Bg1[148] = INCBIN_U8("data/rooms/sector_5/sector_5_5_bg1.gfx");

const u8 sSector5_5_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 9, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

