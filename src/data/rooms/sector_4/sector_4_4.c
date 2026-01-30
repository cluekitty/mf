#include "data/rooms/sector_4_rooms_data.h"
#include "macros.h"

const u8 sSector4_4_Clipdata[60] = INCBIN_U8("data/rooms/sector_4/sector_4_4_clipdata.gfx");

const u8 sSector4_4_Bg2[277] = INCBIN_U8("data/rooms/sector_4/sector_4_4_bg2.gfx");

const u8 sSector4_4_Bg1[135] = INCBIN_U8("data/rooms/sector_4/sector_4_4_bg1.gfx");

const u8 sSector4_4_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 11, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

