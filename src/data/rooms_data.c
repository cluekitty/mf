#include "macros.h"

#include "structs/room.h"

const u16 sDestroyedDockingBayAnimatedPal[6 * 16] = INCBIN_U16("data/rooms/destroyed_docking_bay_animated.pal");

const u8 sBackground_Empty[52] = INCBIN_U8("data/rooms/background_empty.bin");

const u8 sEnemyRoomData_Empty[3] = {
	ROOM_SPRITE_DATA_TERMINATOR
};

// remove this after deblobbing sTilesetEntries
static const u8 padding[1] = {0};

// sTilesetEntries
// door entries
// test room sprite layouts
static const u8 sBlob_3bf888_3c2c4c[] = INCBIN_U8("data/Blob_3bf888_3c2c4c.bin");


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
