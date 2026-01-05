#include "macros.h"

#include "constants/connection.h"

#include "structs/connection.h"

const struct Door* sAreaDoorPointers[AREA_END] = {
    [AREA_MAIN_DECK] = (const struct Door*)0x83C0030,
    [AREA_SECTOR_1] = (const struct Door*)0x83C09D8,
    [AREA_SECTOR_2] = (const struct Door*)0x83C0F48,
    [AREA_SECTOR_3] = (const struct Door*)0x83C162C,
    [AREA_SECTOR_4] = (const struct Door*)0x83C204C,
    [AREA_SECTOR_5] = (const struct Door*)0x83C1A70,
    [AREA_SECTOR_6] = (const struct Door*)0x83C25E0,
    [AREA_TEST_1] = (const struct Door*)0x83C2A48,
    [AREA_TEST_2] = (const struct Door*)0x83C2AD8,
    [AREA_TEST_3] = (const struct Door*)0x83C2B68,
};

const struct RoomEntryRom* sAreaRoomEntryPointers[AREA_END] = {
    [AREA_MAIN_DECK] = (const struct RoomEntryRom*)0x83C2C4C,
    [AREA_SECTOR_1] = (const struct RoomEntryRom*)0x83C40B0,
    [AREA_SECTOR_2] = (const struct RoomEntryRom*)0x83C4D58,
    [AREA_SECTOR_3] = (const struct RoomEntryRom*)0x83C5BA4,
    [AREA_SECTOR_4] = (const struct RoomEntryRom*)0x83C70F8,
    [AREA_SECTOR_5] = (const struct RoomEntryRom*)0x83C64C8,
    [AREA_SECTOR_6] = (const struct RoomEntryRom*)0x83C7C38,
    [AREA_TEST_1] = (const struct RoomEntryRom*)0x83C85D4,
    [AREA_TEST_2] = (const struct RoomEntryRom*)0x83C86C4,
    [AREA_TEST_3] = (const struct RoomEntryRom*)0x83C87B4,
};

static u8 sBlob_79b8e4_79bbcc[] = INCBIN_U8("data/Blob_79b8e4_79bbcc.bin");