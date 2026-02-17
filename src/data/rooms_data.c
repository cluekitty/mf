#include "macros.h"

#include "structs/room.h"

#include "data/tilesets/tilesets_set0.h"
#include "data/tilesets/tilesets_set1.h"
#include "data/tilesets/tilesets_set2.h"
#include "data/tilesets/tilesets_set3.h"
#include "data/tilesets/tilesets_set4.h"
#include "data/tilesets/tilesets_set5.h"
#include "data/tilesets/tilesets_set6.h"
#include "data/tilesets/tilesets_set7.h"

#include "data/default_background_graphics.h"
#include "data/clipdata_types_tilemap.h"
#include "data/common_pals.h"

const u16 sDestroyedDockingBayAnimatedPal[6 * 16] = INCBIN_U16("data/rooms/destroyed_docking_bay_animated.pal");

const u8 sBackground_Empty[52] = INCBIN_U8("data/rooms/background_empty.bin");

const u8 sEnemyRoomData_Empty[3] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

const struct TilesetEntry sTilesetEntries[98] = {
	[0] = {
		.pTileGraphics = sTileset_0_Gfx,
		.pPalette = sTileset_0_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_0_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[1] = {
		.pTileGraphics = sTileset_1_Gfx,
		.pPalette = sTileset_1_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_1_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[2] = {
		.pTileGraphics = sTileset_2_Gfx,
		.pPalette = sTileset_2_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_2_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[3] = {
		.pTileGraphics = sTileset_3_Gfx,
		.pPalette = sTileset_3_Pal,
		.pBackgroundGraphics = sTileset_1_Bg_Gfx,
		.pTilemap = sTileset_3_Tilemap,
		.animatedTileset = 2,
		.animatedPalette = 0
	},
	[4] = {
		.pTileGraphics = sTileset_4_Gfx,
		.pPalette = sTileset_4_Pal,
		.pBackgroundGraphics = sTileset_2_Bg_Gfx,
		.pTilemap = sTileset_4_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[5] = {
		.pTileGraphics = sTileset_1_Gfx,
		.pPalette = sTileset_1_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_1_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[6] = {
		.pTileGraphics = sTileset_5_Gfx,
		.pPalette = sTileset_5_Pal,
		.pBackgroundGraphics = sTileset_3_Bg_Gfx,
		.pTilemap = sTileset_5_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[7] = {
		.pTileGraphics = sTileset_6_Gfx,
		.pPalette = sTileset_6_Pal,
		.pBackgroundGraphics = sTileset_4_Bg_Gfx,
		.pTilemap = sTileset_6_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[8] = {
		.pTileGraphics = sTileset_7_Gfx,
		.pPalette = sTileset_7_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_7_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[9] = {
		.pTileGraphics = sTileset_8_Gfx,
		.pPalette = sTileset_8_Pal,
		.pBackgroundGraphics = sTileset_6_Bg_Gfx,
		.pTilemap = sTileset_8_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[10] = {
		.pTileGraphics = sTileset_9_Gfx,
		.pPalette = sTileset_9_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_9_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 1
	},
	[11] = {
		.pTileGraphics = sTileset_10_Gfx,
		.pPalette = sTileset_10_Pal,
		.pBackgroundGraphics = sTileset_7_Bg_Gfx,
		.pTilemap = sTileset_10_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[12] = {
		.pTileGraphics = sTileset_11_Gfx,
		.pPalette = sTileset_11_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_11_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 2
	},
	[13] = {
		.pTileGraphics = sTileset_12_Gfx,
		.pPalette = sTileset_12_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_12_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 3
	},
	[14] = {
		.pTileGraphics = sTileset_13_Gfx,
		.pPalette = sTileset_13_Pal,
		.pBackgroundGraphics = sTileset_8_Bg_Gfx,
		.pTilemap = sTileset_13_Tilemap,
		.animatedTileset = 8,
		.animatedPalette = 0
	},
	[15] = {
		.pTileGraphics = sTileset_14_Gfx,
		.pPalette = sTileset_14_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_14_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 4
	},
	[16] = {
		.pTileGraphics = sTileset_15_Gfx,
		.pPalette = sTileset_15_Pal,
		.pBackgroundGraphics = sTileset_9_Bg_Gfx,
		.pTilemap = sTileset_15_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 5
	},
	[17] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_16_Pal,
		.pBackgroundGraphics = sTileset_10_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 9
	},
	[18] = {
		.pTileGraphics = sTileset_17_Gfx,
		.pPalette = sTileset_17_Pal,
		.pBackgroundGraphics = sTileset_11_Bg_Gfx,
		.pTilemap = sTileset_17_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[19] = {
		.pTileGraphics = sTileset_18_Gfx,
		.pPalette = sTileset_18_Pal,
		.pBackgroundGraphics = sTileset_12_Bg_Gfx,
		.pTilemap = sTileset_18_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[20] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_19_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[21] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_20_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[22] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_21_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[23] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_22_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[24] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_23_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[25] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_24_Pal,
		.pBackgroundGraphics = sTileset_13_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 9,
		.animatedPalette = 0
	},
	[26] = {
		.pTileGraphics = sTileset_20_Gfx,
		.pPalette = sTileset_25_Pal,
		.pBackgroundGraphics = sTileset_3_Bg_Gfx,
		.pTilemap = sTileset_20_Tilemap,
		.animatedTileset = 6,
		.animatedPalette = 7
	},
	[27] = {
		.pTileGraphics = sTileset_21_Gfx,
		.pPalette = sTileset_26_Pal,
		.pBackgroundGraphics = sTileset_10_Bg_Gfx,
		.pTilemap = sTileset_21_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[28] = {
		.pTileGraphics = sTileset_22_Gfx,
		.pPalette = sTileset_27_Pal,
		.pBackgroundGraphics = sTileset_14_Bg_Gfx,
		.pTilemap = sTileset_22_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[29] = {
		.pTileGraphics = sTileset_23_Gfx,
		.pPalette = sTileset_28_Pal,
		.pBackgroundGraphics = sTileset_15_Bg_Gfx,
		.pTilemap = sTileset_23_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 8
	},
	[30] = {
		.pTileGraphics = sTileset_10_Gfx,
		.pPalette = sTileset_10_Pal,
		.pBackgroundGraphics = sTileset_9_Bg_Gfx,
		.pTilemap = sTileset_10_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 20
	},
	[31] = {
		.pTileGraphics = sTileset_1_Gfx,
		.pPalette = sTileset_1_Pal,
		.pBackgroundGraphics = sTileset_16_Bg_Gfx,
		.pTilemap = sTileset_1_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[32] = {
		.pTileGraphics = sTileset_24_Gfx,
		.pPalette = sTileset_29_Pal,
		.pBackgroundGraphics = sTileset_17_Bg_Gfx,
		.pTilemap = sTileset_24_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[33] = {
		.pTileGraphics = sTileset_25_Gfx,
		.pPalette = sTileset_30_Pal,
		.pBackgroundGraphics = sTileset_18_Bg_Gfx,
		.pTilemap = sTileset_25_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[34] = {
		.pTileGraphics = sTileset_26_Gfx,
		.pPalette = sTileset_31_Pal,
		.pBackgroundGraphics = sTileset_19_Bg_Gfx,
		.pTilemap = sTileset_26_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[35] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_32_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 10
	},
	[36] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_33_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 11
	},
	[37] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_34_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 12
	},
	[38] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_35_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 13
	},
	[39] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_36_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 14
	},
	[40] = {
		.pTileGraphics = sTileset_27_Gfx,
		.pPalette = sTileset_37_Pal,
		.pBackgroundGraphics = sTileset_20_Bg_Gfx,
		.pTilemap = sTileset_27_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 15
	},
	[41] = {
		.pTileGraphics = sTileset_28_Gfx,
		.pPalette = sTileset_38_Pal,
		.pBackgroundGraphics = sTileset_8_Bg_Gfx,
		.pTilemap = sTileset_28_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 17
	},
	[42] = {
		.pTileGraphics = sTileset_29_Gfx,
		.pPalette = sTileset_39_Pal,
		.pBackgroundGraphics = sTileset_21_Bg_Gfx,
		.pTilemap = sTileset_29_Tilemap,
		.animatedTileset = 2,
		.animatedPalette = 16
	},
	[43] = {
		.pTileGraphics = sTileset_30_Gfx,
		.pPalette = sTileset_40_Pal,
		.pBackgroundGraphics = sTileset_22_Bg_Gfx,
		.pTilemap = sTileset_30_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[44] = {
		.pTileGraphics = sTileset_31_Gfx,
		.pPalette = sTileset_41_Pal,
		.pBackgroundGraphics = sTileset_23_Bg_Gfx,
		.pTilemap = sTileset_31_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 18
	},
	[45] = {
		.pTileGraphics = sTileset_32_Gfx,
		.pPalette = sTileset_42_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_32_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 19
	},
	[46] = {
		.pTileGraphics = sTileset_33_Gfx,
		.pPalette = sTileset_43_Pal,
		.pBackgroundGraphics = sTileset_24_Bg_Gfx,
		.pTilemap = sTileset_33_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[47] = {
		.pTileGraphics = sTileset_30_Gfx,
		.pPalette = sTileset_40_Pal,
		.pBackgroundGraphics = sTileset_22_Bg_Gfx,
		.pTilemap = sTileset_30_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 20
	},
	[48] = {
		.pTileGraphics = sTileset_34_Gfx,
		.pPalette = sTileset_44_Pal,
		.pBackgroundGraphics = sTileset_25_Bg_Gfx,
		.pTilemap = sTileset_34_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[49] = {
		.pTileGraphics = sTileset_35_Gfx,
		.pPalette = sTileset_45_Pal,
		.pBackgroundGraphics = sTileset_26_Bg_Gfx,
		.pTilemap = sTileset_35_Tilemap,
		.animatedTileset = 5,
		.animatedPalette = 0
	},
	[50] = {
		.pTileGraphics = sTileset_36_Gfx,
		.pPalette = sTileset_46_Pal,
		.pBackgroundGraphics = sTileset_27_Bg_Gfx,
		.pTilemap = sTileset_36_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 21
	},
	[51] = {
		.pTileGraphics = sTileset_37_Gfx,
		.pPalette = sTileset_47_Pal,
		.pBackgroundGraphics = sTileset_7_Bg_Gfx,
		.pTilemap = sTileset_37_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 22
	},
	[52] = {
		.pTileGraphics = sTileset_38_Gfx,
		.pPalette = sTileset_48_Pal,
		.pBackgroundGraphics = sTileset_28_Bg_Gfx,
		.pTilemap = sTileset_38_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[53] = {
		.pTileGraphics = sTileset_39_Gfx,
		.pPalette = sTileset_49_Pal,
		.pBackgroundGraphics = sTileset_29_Bg_Gfx,
		.pTilemap = sTileset_39_Tilemap,
		.animatedTileset = 4,
		.animatedPalette = 23
	},
	[54] = {
		.pTileGraphics = sTileset_40_Gfx,
		.pPalette = sTileset_50_Pal,
		.pBackgroundGraphics = sTileset_30_Bg_Gfx,
		.pTilemap = sTileset_40_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[55] = {
		.pTileGraphics = sTileset_41_Gfx,
		.pPalette = sTileset_51_Pal,
		.pBackgroundGraphics = sTileset_31_Bg_Gfx,
		.pTilemap = sTileset_41_Tilemap,
		.animatedTileset = 10,
		.animatedPalette = 27
	},
	[56] = {
		.pTileGraphics = sTileset_42_Gfx,
		.pPalette = sTileset_52_Pal,
		.pBackgroundGraphics = sTileset_32_Bg_Gfx,
		.pTilemap = sTileset_42_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 26
	},
	[57] = {
		.pTileGraphics = sTileset_43_Gfx,
		.pPalette = sTileset_53_Pal,
		.pBackgroundGraphics = sTileset_33_Bg_Gfx,
		.pTilemap = sTileset_43_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[58] = {
		.pTileGraphics = sTileset_44_Gfx,
		.pPalette = sTileset_54_Pal,
		.pBackgroundGraphics = sTileset_34_Bg_Gfx,
		.pTilemap = sTileset_44_Tilemap,
		.animatedTileset = 13,
		.animatedPalette = 0
	},
	[59] = {
		.pTileGraphics = sTileset_45_Gfx,
		.pPalette = sTileset_55_Pal,
		.pBackgroundGraphics = sTileset_35_Bg_Gfx,
		.pTilemap = sTileset_45_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[60] = {
		.pTileGraphics = sTileset_46_Gfx,
		.pPalette = sTileset_56_Pal,
		.pBackgroundGraphics = sTileset_36_Bg_Gfx,
		.pTilemap = sTileset_46_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[61] = {
		.pTileGraphics = sTileset_46_Gfx,
		.pPalette = sTileset_56_Pal,
		.pBackgroundGraphics = sTileset_37_Bg_Gfx,
		.pTilemap = sTileset_46_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[62] = {
		.pTileGraphics = sTileset_47_Gfx,
		.pPalette = sTileset_3_Pal,
		.pBackgroundGraphics = sTileset_1_Bg_Gfx,
		.pTilemap = sTileset_47_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[63] = {
		.pTileGraphics = sTileset_20_Gfx,
		.pPalette = sTileset_57_Pal,
		.pBackgroundGraphics = sTileset_3_Bg_Gfx,
		.pTilemap = sTileset_20_Tilemap,
		.animatedTileset = 6,
		.animatedPalette = 24
	},
	[64] = {
		.pTileGraphics = sTileset_8_Gfx,
		.pPalette = sTileset_8_Pal,
		.pBackgroundGraphics = sTileset_38_Bg_Gfx,
		.pTilemap = sTileset_8_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[65] = {
		.pTileGraphics = sTileset_8_Gfx,
		.pPalette = sTileset_8_Pal,
		.pBackgroundGraphics = sTileset_39_Bg_Gfx,
		.pTilemap = sTileset_8_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[66] = {
		.pTileGraphics = sTileset_48_Gfx,
		.pPalette = sTileset_58_Pal,
		.pBackgroundGraphics = sTileset_40_Bg_Gfx,
		.pTilemap = sTileset_48_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 32
	},
	[67] = {
		.pTileGraphics = sTileset_49_Gfx,
		.pPalette = sTileset_59_Pal,
		.pBackgroundGraphics = sTileset_41_Bg_Gfx,
		.pTilemap = sTileset_49_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 30
	},
	[68] = {
		.pTileGraphics = sTileset_49_Gfx,
		.pPalette = sTileset_60_Pal,
		.pBackgroundGraphics = sTileset_41_Bg_Gfx,
		.pTilemap = sTileset_49_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 31
	},
	[69] = {
		.pTileGraphics = sTileset_50_Gfx,
		.pPalette = sTileset_61_Pal,
		.pBackgroundGraphics = sTileset_42_Bg_Gfx,
		.pTilemap = sTileset_50_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[70] = {
		.pTileGraphics = sTileset_50_Gfx,
		.pPalette = sTileset_61_Pal,
		.pBackgroundGraphics = sTileset_43_Bg_Gfx,
		.pTilemap = sTileset_50_Tilemap,
		.animatedTileset = 5,
		.animatedPalette = 0
	},
	[71] = {
		.pTileGraphics = sTileset_39_Gfx,
		.pPalette = sTileset_62_Pal,
		.pBackgroundGraphics = sTileset_29_Bg_Gfx,
		.pTilemap = sTileset_39_Tilemap,
		.animatedTileset = 4,
		.animatedPalette = 25
	},
	[72] = {
		.pTileGraphics = sTileset_51_Gfx,
		.pPalette = sTileset_63_Pal,
		.pBackgroundGraphics = sTileset_44_Bg_Gfx,
		.pTilemap = sTileset_51_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[73] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_19_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[74] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_20_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[75] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_21_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[76] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_22_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[77] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_23_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[78] = {
		.pTileGraphics = sTileset_19_Gfx,
		.pPalette = sTileset_24_Pal,
		.pBackgroundGraphics = sTileset_45_Bg_Gfx,
		.pTilemap = sTileset_19_Tilemap,
		.animatedTileset = 3,
		.animatedPalette = 0
	},
	[79] = {
		.pTileGraphics = sTileset_16_Gfx,
		.pPalette = sTileset_16_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_16_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 8
	},
	[80] = {
		.pTileGraphics = sTileset_48_Gfx,
		.pPalette = sTileset_58_Pal,
		.pBackgroundGraphics = sTileset_46_Bg_Gfx,
		.pTilemap = sTileset_48_Tilemap,
		.animatedTileset = 11,
		.animatedPalette = 32
	},
	[81] = {
		.pTileGraphics = sTileset_52_Gfx,
		.pPalette = sTileset_64_Pal,
		.pBackgroundGraphics = sTileset_47_Bg_Gfx,
		.pTilemap = sTileset_52_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[82] = {
		.pTileGraphics = sTileset_39_Gfx,
		.pPalette = sTileset_49_Pal,
		.pBackgroundGraphics = sTileset_29_Bg_Gfx,
		.pTilemap = sTileset_39_Tilemap,
		.animatedTileset = 7,
		.animatedPalette = 23
	},
	[83] = {
		.pTileGraphics = sTileset_48_Gfx,
		.pPalette = sTileset_65_Pal,
		.pBackgroundGraphics = sTileset_48_Bg_Gfx,
		.pTilemap = sTileset_48_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 28
	},
	[84] = {
		.pTileGraphics = sTileset_53_Gfx,
		.pPalette = sTileset_66_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_53_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[85] = {
		.pTileGraphics = sTileset_54_Gfx,
		.pPalette = sTileset_67_Pal,
		.pBackgroundGraphics = sTileset_49_Bg_Gfx,
		.pTilemap = sTileset_54_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 28
	},
	[86] = {
		.pTileGraphics = sTileset_55_Gfx,
		.pPalette = sTileset_68_Pal,
		.pBackgroundGraphics = sTileset_22_Bg_Gfx,
		.pTilemap = sTileset_55_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[87] = {
		.pTileGraphics = sTileset_33_Gfx,
		.pPalette = sTileset_43_Pal,
		.pBackgroundGraphics = sTileset_50_Bg_Gfx,
		.pTilemap = sTileset_33_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[88] = {
		.pTileGraphics = sTileset_56_Gfx,
		.pPalette = sTileset_69_Pal,
		.pBackgroundGraphics = sTileset_51_Bg_Gfx,
		.pTilemap = sTileset_56_Tilemap,
		.animatedTileset = 12,
		.animatedPalette = 0
	},
	[89] = {
		.pTileGraphics = sTileset_57_Gfx,
		.pPalette = sTileset_70_Pal,
		.pBackgroundGraphics = sTileset_52_Bg_Gfx,
		.pTilemap = sTileset_57_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 29
	},
	[90] = {
		.pTileGraphics = sTileset_58_Gfx,
		.pPalette = sTileset_71_Pal,
		.pBackgroundGraphics = sTileset_53_Bg_Gfx,
		.pTilemap = sTileset_58_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[91] = {
		.pTileGraphics = sTileset_58_Gfx,
		.pPalette = sTileset_71_Pal,
		.pBackgroundGraphics = sTileset_22_Bg_Gfx,
		.pTilemap = sTileset_58_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[92] = {
		.pTileGraphics = sTileset_45_Gfx,
		.pPalette = sTileset_72_Pal,
		.pBackgroundGraphics = sTileset_35_Bg_Gfx,
		.pTilemap = sTileset_45_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 0
	},
	[93] = {
		.pTileGraphics = sTileset_31_Gfx,
		.pPalette = sTileset_73_Pal,
		.pBackgroundGraphics = sTileset_23_Bg_Gfx,
		.pTilemap = sTileset_31_Tilemap,
		.animatedTileset = 1,
		.animatedPalette = 20
	},
	[94] = {
		.pTileGraphics = sTileset_59_Gfx,
		.pPalette = sTileset_74_Pal,
		.pBackgroundGraphics = sTileset_5_Bg_Gfx,
		.pTilemap = sTileset_59_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[95] = {
		.pTileGraphics = sTileset_60_Gfx,
		.pPalette = sTileset_75_Pal,
		.pBackgroundGraphics = sTileset_34_Bg_Gfx,
		.pTilemap = sTileset_60_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
	[96] = {
		.pTileGraphics = sTileset_61_Gfx,
		.pPalette = sTileset_76_Pal,
		.pBackgroundGraphics = sTileset_0_Bg_Gfx,
		.pTilemap = sTileset_61_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 5
	},
	[97] = {
		.pTileGraphics = sTileset_62_Gfx,
		.pPalette = sTileset_77_Pal,
		.pBackgroundGraphics = sTileset_54_Bg_Gfx,
		.pTilemap = sTileset_62_Tilemap,
		.animatedTileset = 0,
		.animatedPalette = 0
	},
};

// door entries
// test room sprite layouts
static const u8 sBlob_3c0030_3c2c4c[] = INCBIN_U8("data/Blob_3c0030_3c2c4c.bin");

static const u8 sMainDeckRoomEntries[] = INCBIN_U8("data/Blob_3c2c4c_3c40b0.bin");

static const u8 sSector1RoomEntries[] = INCBIN_U8("data/Blob_3c40b0_3c4d58.bin");

static const u8 sSector2RoomEntries[] = INCBIN_U8("data/Blob_3c4d58_3c5ba4.bin");

static const u8 sSector3RoomEntries[] = INCBIN_U8("data/Blob_3c5ba4_3c64c8.bin");

static const u8 sSector5RoomEntries[] = INCBIN_U8("data/Blob_3c64c8_3c70f8.bin");

static const u8 sSector4RoomEntries[] = INCBIN_U8("data/Blob_3c70f8_3c7c38.bin");

static const u8 sSector6RoomEntries[] = INCBIN_U8("data/Blob_3c7c38_3c85d4.bin");

static const u8 sTest1RoomEntries[] = INCBIN_U8("data/Blob_3c85d4_3c86c4.bin");

static const u8 sTest2RoomEntries[] = INCBIN_U8("data/Blob_3c86c4_3c87b4.bin");

static const u8 sTest3RoomEntries[] = INCBIN_U8("data/Blob_3c87b4_3c88f0.bin");
