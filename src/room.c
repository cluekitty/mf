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

static u8 sBlob_79b8bc_79bbcc[] = INCBIN_U8("data/Blob_79b8bc_79bbcc.bin");
