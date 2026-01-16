#ifndef CONNECTION_STRUCTS_H
#define CONNECTION_STRUCTS_H

#include "types.h"
#include "constants/connection.h"

struct HatchData {
    u8 exists:1;
    u8 unk_0_1:3;
    u8 unk_0_4:1;
    u8 unk_0_5:3;
    u8 state:2;
    u8 unk_1_2:1;
    u8 unk_1_3:5;
    u8 xPosition;
    u8 yPosition;
};

struct Door {
    u8 type;
    u8 srcRoom;
    u8 xStart;
    u8 xEnd;
    u8 yStart;
    u8 yEnd;
    u8 dstDoor;
    s8 xExit;
    s8 yExit;
};

struct ElevatorRoomPair {
    u8 area1;
    u8 room1;
    u8 area2;
    u8 room2;
};

struct ElevatorDisabledEvent {
    u8 eventStart;
    u8 eventEnd;
    u8 disabledElevators[ELEVATOR_END];
};

enum AreaConnectionField {
    AREA_CONNECTION_FIELD_SOURCE_AREA,
    AREA_CONNECTION_FIELD_SOURCE_DOOR,
    AREA_CONNECTION_FIELD_DESTINATION_AREA,

    AREA_CONNECTION_FIELD_COUNT
};

enum EventBasedConnectionField {
    EVENT_BASED_CONNECTION_FIELD_SOURCE_AREA,
    EVENT_BASED_CONNECTION_FIELD_SOURCE_DOOR,
    EVENT_BASED_CONNECTION_FIELD_EVENT,
    EVENT_BASED_CONNECTION_FIELD_DESTINATION_DOOR,

    EVENT_BASED_CONNECTION_FIELD_COUNT
};

#define MAX_AMOUNT_OF_HATCHES 6

extern struct HatchData gHatchData[MAX_AMOUNT_OF_HATCHES];
extern u8 gCurrentArea;
extern u8 gPreviousArea;
extern u8 gDestinationDoor;
extern u8 gCurrentRoom;
extern u8 gLastDoorUsed;
extern u8 gCurrentNavigationRoom;
extern s16 gSamusDoorPositionOffset;

extern struct RawCoordsX gDoorPositionStart;

#endif /* CONNECTION_STRUCTS_H */
