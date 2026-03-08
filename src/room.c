#include "macros.h"

#include "constants/connection.h"
#include "structs/connection.h"
#include "data/rooms_data.h"

const struct Door* sAreaDoorPointers[AREA_END] = {
    [AREA_MAIN_DECK] = sMainDeckDoors,
    [AREA_SECTOR_1] = sSector1Doors,
    [AREA_SECTOR_2] = sSector2Doors,
    [AREA_SECTOR_3] = sSector3Doors,
    [AREA_SECTOR_4] = sSector4Doors,
    [AREA_SECTOR_5] = sSector5Doors,
    [AREA_SECTOR_6] = sSector6Doors,
    [AREA_TEST_1] = sTest1Doors,
    [AREA_TEST_2] = sTest2Doors,
    [AREA_TEST_3] = sTest3Doors
};

const struct RoomEntryRom* sAreaRoomEntryPointers[AREA_END] = {
    [AREA_MAIN_DECK] = sMainDeckRoomEntries,
    [AREA_SECTOR_1] = sSector1RoomEntries,
    [AREA_SECTOR_2] = sSector2RoomEntries,
    [AREA_SECTOR_3] = sSector3RoomEntries,
    [AREA_SECTOR_4] = sSector4RoomEntries,
    [AREA_SECTOR_5] = sSector5RoomEntries,
    [AREA_SECTOR_6] = sSector6RoomEntries,
    [AREA_TEST_1] = sTest1RoomEntries,
    [AREA_TEST_2] = sTest2RoomEntries,
    [AREA_TEST_3] = sTest3RoomEntries
};

