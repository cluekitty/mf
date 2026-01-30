#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_44_Clipdata[60] = INCBIN_U8("data/rooms/main_deck/main_deck_44_clipdata.gfx");

const u8 sMainDeck_44_Bg2[172] = INCBIN_U8("data/rooms/main_deck/main_deck_44_bg2.gfx");

const u8 sMainDeck_44_Bg1[139] = INCBIN_U8("data/rooms/main_deck/main_deck_44_bg1.gfx");

const u8 sMainDeck_44_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 8, SSP_UNINFECTED_OR_BOSS | SPRITESET_IDX(0),
	ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_44_Bg0[14] = INCBIN_U8("data/rooms/main_deck/main_deck_44_bg0.gfx");

