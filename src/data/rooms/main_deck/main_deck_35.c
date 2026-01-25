#include "data/rooms/main_deck_rooms_data.h"
#include "macros.h"

const u8 sMainDeck_35_Clipdata[459] = INCBIN_U8("data/rooms/main_deck/main_deck_35_clipdata.gfx");

const u8 sMainDeck_35_Bg2[1264] = INCBIN_U8("data/rooms/main_deck/main_deck_35_bg2.gfx");

const u8 sMainDeck_35_Bg1[1170] = INCBIN_U8("data/rooms/main_deck/main_deck_35_bg1.gfx");

const u8 sMainDeck_35_Spriteset0[ENEMY_ROOM_DATA_ARRAY_SIZE(6)] = {
	5, 14, 37,
	21, 11, 3,
	25, 12, 18,
	32, 7, 56,
	70, 11, 34,
	ROOM_SPRITE_DATA_TERMINATOR
};

