#include "data/rooms/main_deck_rooms_data.h"
#include "types.h"
#include "macros.h"

const u8 sMainDeck_0_Clipdata[56] = INCBIN_U8("data/rooms/main_deck/main_deck_0_clipdata.gfx");

const u8 sMainDeck_0_Bg2[376] = INCBIN_U8("data/rooms/main_deck/main_deck_0_bg2.gfx");

const u8 sMainDeck_0_Bg1[102] = INCBIN_U8("data/rooms/main_deck/main_deck_0_bg1.gfx");

const u8 sMainDeck_0_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(2)] = {
	10, 25, 17,
	ROOM_SPRITE_DATA_TERMINATOR
};

