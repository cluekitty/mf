#include "data/rooms/sector_4_rooms_data.h"
#include "macros.h"

const u8 sSector4_31_Clipdata[105] = INCBIN_U8("data/rooms/sector_4/sector_4_31_clipdata.gfx");

const u8 sSector4_31_Bg2[242] = INCBIN_U8("data/rooms/sector_4/sector_4_31_bg2.gfx");

const u8 sSector4_31_Bg1[268] = INCBIN_U8("data/rooms/sector_4/sector_4_31_bg1.gfx");

const u8 sSector4_31_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(4)] = {
	9, 10, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(4),
	10, 17, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(4),
	10, 21, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(4),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_31_Bg0[144] = INCBIN_U8("data/rooms/sector_4/sector_4_31_bg0.gfx");

