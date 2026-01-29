#include "data/rooms/sector_2_rooms_data.h"
#include "macros.h"

const u8 sSector2_16_Clipdata[60] = INCBIN_U8("data/rooms/sector_2/sector_2_16_clipdata.gfx");

const u8 sSector2_16_Bg2[164] = INCBIN_U8("data/rooms/sector_2/sector_2_16_bg2.gfx");

const u8 sSector2_16_Bg1[145] = INCBIN_U8("data/rooms/sector_2/sector_2_16_bg1.gfx");

const u8 sSector2_16_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 10, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

