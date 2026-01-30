#include "data/rooms/sector_5_rooms_data.h"
#include "macros.h"

const u8 sSector5_48_Clipdata[60] = INCBIN_U8("data/rooms/sector_5/sector_5_48_clipdata.gfx");

const u8 sSector5_48_Bg2[164] = INCBIN_U8("data/rooms/sector_5/sector_5_48_bg2.gfx");

const u8 sSector5_48_Bg1[132] = INCBIN_U8("data/rooms/sector_5/sector_5_48_bg1.gfx");

const u8 sSector5_48_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 8, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(4),
	ROOM_SPRITE_DATA_TERMINATOR
};

