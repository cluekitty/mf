#include "sub_event_and_music.h"
#include "globals.h"
#include "macros.h"

#include "data/event_data.h"

#include "constants/connection.h"
#include "constants/clipdata.h"
#include "constants/event.h"

#include "structs/connection.h"
#include "structs/clipdata.h"
#include "structs/event.h"

static u16 sSubEventNavConversations[22][2] = {
    {
        NAV_CONVO_UNLOCKED_LEVEL_0_HATCHES,
        SUB_EVENT_CONVERSATION_AFTER_QUARANTINE_BAY_ENDED
    },
    {
        NAV_CONVO_GO_TO_SRX1,
        SUB_EVENT_POST_ARACHNUS_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_CLEAR_ATMOSPHERIC_STABILIZERS,
        SUB_EVENT_ENTERING_SRX1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_TRO1,
        SUB_EVENT_28
    },
    {
        NAV_CONVO_FIND_SECURITY_ROOM_AND_DOWNLOAD_BOMBS,
        SUB_EVENT_ENTERING_TRO1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_AQA1,
        SUB_EVENT_LEAVING_TRO1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_DEFEAT_SERRIS,
        SUB_EVENT_ENTERING_AQA1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_PYR1,
        SUB_EVENT_LEAVING_AQA1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_NOC1,
        SUB_EVENT_LEAVING_PYR1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_DOWNLOAD_VARIA_SUIT,
        SUB_EVENT_ENTERING_NOC1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_FIND_SECURITY_ROOM_AND_DOWNLOAD_ICE_MISSILES,
        SUB_EVENT_ENTERING_ARC1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_THE_MAIN_BOILER,
        SUB_EVENT_LEAVING_ARC1_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_THE_HABITATION_DECK,
        SUB_EVENT_LEAVING_PYR2_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_DOWNLOAD_POWER_BOMBS,
        SUB_EVENT_ENTERING_ARC2_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_RETURN_TO_YOUR_SHIP,
        SUB_EVENT_LEAVING_ARC2_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_REACTIVATE_THE_AUXILIARY_POWER_SYSTEM,
        SUB_EVENT_POWER_OUTAGE_SHIP_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_FIND_SOURCE_OF_VEGETATION,
        SUB_EVENT_AFTER_AUXILIARY_POWER_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_DEFEAT_NIGHTMARE,
        SUB_EVENT_ENTERING_ARC3_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_NOC2,
        SUB_EVENT_LEAVING_AQA2_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_DEFEAT_BOX_2,
        SUB_EVENT_ENTERING_NOC2_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_METROID_BREEDING_PROGRAM,
        SUB_EVENT_RESTRICTED_LAB_CONVERSATION_ENDED
    },
    {
        NAV_CONVO_GO_TO_OPERATIONS_ROOM,
        SUB_EVENT_SELF_DESTRUCT_CONVERSATION_ENDED
    },
};

static u8 sSubEventTriggerTypes[SUB_EVENT_END] = {
    [SUB_EVENT_FIRST_CONVERSATION_STARTED] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_FIRST_CONVERSATION_LEAVING_SHIP_STARTED] = SEVENT_TTYPE_LEAVING_SHIP,
    [SUB_EVENT_ENTERED_ROOM_AFTER_FIRST_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_CONVERSATION_AFTER_QUARANTINE_BAY_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_LEFT_NAV_ROOM_AFTER_QUARANTINE_BAY] = SEVENT_TTYPE_32,
    [SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_ENDED] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_OPERATIONS_DECK_ELEVATOR_ENDED] = SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP,
    [SUB_EVENT_ENTERED_OPERATIONS_DECK_LOBBY] = SEVENT_TTYPE_32,
    [SUB_EVENT_9] = SEVENT_TTYPE_32,
    [SUB_EVENT_DOWNLOADED_MISSILES] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_ENTERED_NAV_ROOM_AFTER_MISSILES] = SEVENT_TTYPE_ENTERING_ROOM,
    [SUB_EVENT_ENTERED_DARK_VERTICAL_SHAFT_AFTER_MISSILES] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_ENTERED_ARACHNUS_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_MORPH_BALL_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_ARACHNUS_ROOM] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_POST_ARACHNUS_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_EXPLOSION] = SEVENT_TTYPE_SA_X_ENCOUNTER,
    [SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_DOOR_SHOT] = SEVENT_TTYPE_SA_X_ENCOUNTER,
    [SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_1] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_2] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_SRX1_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_SRX1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_CHARGE_BEAM_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_CHARGE_BEAM_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_CHARGE_BEAM_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_NAV_ROOM_LEAVING_SRX1] = SEVENT_TTYPE_32,
    [SUB_EVENT_28] = SEVENT_TTYPE_NONE,
    [SUB_EVENT_LEAVING_SRX1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENTERING_ROOM,
    [SUB_EVENT_STARTED_ELEVATOR_TO_TRO1] = SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_DOWN,
    [SUB_EVENT_ELEVATOR_ENTERED_TRO1] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_ENTERED_TRO1_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_TRO1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_TRO1_FIRST_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_UNLOCKED_SECURITY_LEVEL_1] = SEVENT_TTYPE_UNLOCKING_SECURITY,
    [SUB_EVENT_DOWNLOADED_BOMBS] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_ENTERED_ZAZABI_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_HI_JUMP_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_ZAZABI_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_SA_X_TRO_1_ROOM] = SEVENT_TTYPE_SA_X_ENCOUNTER,
    [SUB_EVENT_LEFT_SA_X_TRO_1_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_TRO1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_LEAVING_TRO1_ELEVATOR_MONOLOGUE_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_LEAVING_TRO1_ELEVATOR_MONOLOGUE_ENDED] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_LEAVING_TRO1_ELEVATOR_ENDED] = SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP,
    [SUB_EVENT_ENTERED_AQA1_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_AQA1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_FIRST_ROOM_IN_AQA1] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_SERRIS_TANK_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_SERRIS_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_SPEED_BOOSTER_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_SERRIS_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_AQA1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_PYR1_SECURITY_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_UNLOCKED_SECURITY_LEVEL_2] = SEVENT_TTYPE_UNLOCKING_SECURITY,
    [SUB_EVENT_LEFT_PYR1_SECURITY_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_PYR1_DATA_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_DOWNLOADED_SUPER_MISSILES] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_PYR1_DATA_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_BOX_ROOM] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_LEFT_BOX_ROOM] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_LEAVING_PYR1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_LEAVING_PYR1_FEDERATION_CONVERSATION_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_LEAVING_PYR1_FEDERATION_CONVERSATION_ENDED] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_ENTERED_NOC1_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_NOC1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_NOC1_FIRST_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_SA_X_NOC_ENTERED_ROOM] = SEVENT_TTYPE_SA_X_ENCOUNTER,
    [SUB_EVENT_SA_X_NOC_ENCOUNTER_ENDED] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_GADORA_ROOM_BEFORE_MEGA_X] = SEVENT_TTYPE_32,
    [SUB_EVENT_VARIA_SUIT_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_MEGA_X_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_ARC1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_ARC1_FIRST_COLD_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_UNLOCKED_LEVEL_3_SECURITY] = SEVENT_TTYPE_UNLOCKING_SECURITY,
    [SUB_EVENT_DOWNLOADED_ICE_MISSILES] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_EMERGENCY_IN_SECTOR_3_ALARM] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_ARC1_CONVERSATION_STARTED] = SEVENT_TTYPE_STARTING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_LEAVING_ARC1_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_WIDE_BEAM_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_COOLING_UNIT_OPERATIONAL] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_LEFT_MAIN_BOILER_CONTROL_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_PYR2_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_84] = SEVENT_TTYPE_32,
    [SUB_EVENT_85] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_HABITATION_DECK_MONOLOGUE_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_87] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_ENTERING_ARC2_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_ARC2_FIRST_COLD_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_DOWNLOADED_POWER_BOMBS] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_ENTERED_SA_X_ARC_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_SA_X_ARC_ENTERED_ROOM] = SEVENT_TTYPE_SA_X_ENCOUNTER,
    [SUB_EVENT_LEFT_SA_X_ARC_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_LEAVING_ARC2_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ELEVATOR_POWER_OUTAGE] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_ELEVATOR_TUNNEL] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_POWER_OUTAGE_SHIP_CONVERSATION_STARTED] = SEVENT_TTYPE_STARTING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_POWER_OUTAGE_SHIP_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_POWER_OUTAGE_LEAVING_SHIP_STARTED] = SEVENT_TTYPE_LEAVING_SHIP,
    [SUB_EVENT_POWER_OUTAGE_LEAVING_SHIP_ENDED] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_CENTRAL_REACTOR_CORE] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_YAKUZA_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_SPACE_JUMP_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEAVING_YAKUZA_ROOM] = SEVENT_TTYPE_NONE,
    [SUB_EVENT_LEFT_YAKUZA_ROOM] = SEVENT_TTYPE_ENTERING_ROOM,
    [SUB_EVENT_AUXILIARY_POWER_MESSAGE_STARTED] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_AUXILIARY_POWER_MESSAGE_ENDED] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_NAV_ROOM_AFTER_AUXILIARY_POWER] = SEVENT_TTYPE_32,
    [SUB_EVENT_AFTER_AUXILIARY_POWER_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_SA_X_TRO_2_1ST_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_111] = SEVENT_TTYPE_32,
    [SUB_EVENT_112] = SEVENT_TTYPE_ENTERING_ROOM,
    [SUB_EVENT_APPROACHED_SA_X_TRO_2_1ST_ROOM_DOOR] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_LEAVING_SA_X_TRO_2_2ND_ROOM] = SEVENT_TTYPE_LEAVING_ROOM,
    [SUB_EVENT_LEFT_SA_X_TRO_2_2ND_ROOM] = SEVENT_TTYPE_ENTERING_ROOM,
    [SUB_EVENT_ENTERED_NETTORI_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_PLASMA_BEAM_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_NETTORI_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_ARC3_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_ARC3_FIRST_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_NIGHTMARE_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_GRAVITY_SUIT_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_NIGHTMARE_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_LOWER_AQA] = SEVENT_TTYPE_32,
    [SUB_EVENT_UNLOCKED_SECURITY_LEVEL_4] = SEVENT_TTYPE_UNLOCKING_SECURITY,
    [SUB_EVENT_DOWNLOADED_DIFFUSION_MISSILES] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEAVING_AQA2_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_LEAVING_AQA2_ELEVATOR] = SEVENT_TTYPE_LEAVING_ROOM,
    [SUB_EVENT_LEAVING_AQA2_ELEVATOR_ENDED] = SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP,
    [SUB_EVENT_ENTERED_NOC2_NAV_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERING_NOC2_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_NOC2_FIRST_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_RESTRICTED_LAB_NO_ENTRY_ALARM] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_BOX_2_RUMBLE] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_BOX_2_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_WAVE_BEAM_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_BOX_2_ROOM] = SEVENT_TTYPE_STARTING_ROOM_LOAD,
    [SUB_EVENT_ENTERED_RESTRICTED_LAB] = SEVENT_TTYPE_32,
    [SUB_EVENT_SA_X_LAB_RUMBLE] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_SA_X_LAB_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ESCAPED_RESTRICTED_LAB] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_RESTRICTED_LAB_CUTSCENE_ENDED] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_RESTRICTED_LAB_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_RESTRICTED_LAB_ELEVATOR_MONOLOGUE_STARTED] = SEVENT_TTYPE_CUTSCENE_START,
    [SUB_EVENT_RESTRICTED_LAB_ELEVATOR_MONOLOGUE_ENDED] = SEVENT_TTYPE_CUTSCENE_END,
    [SUB_EVENT_RESTRICTED_LAB_ELEVATOR_ENDED] = SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP,
    [SUB_EVENT_ENTERED_ROOM_AFTER_RESTRICTED_LAB_ELEVATOR] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_RIDLEY_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_SCREW_ATTACK_ABILITY_RECOVERED] = SEVENT_TTYPE_GETTING_ITEM,
    [SUB_EVENT_LEFT_RIDLEY_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ENTERED_NAV_ROOM_AFTER_RIDLEY] = SEVENT_TTYPE_32,
    [SUB_EVENT_SELF_DESTRUCT_CONVERSATION_ENDED] = SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION,
    [SUB_EVENT_ENTERED_SA_X_BOSS_ROOM] = SEVENT_TTYPE_32,
    [SUB_EVENT_ORBIT_CHANGE_IMPLEMENTED] = SEVENT_TTYPE_ROOM_EVENT,
    [SUB_EVENT_ENTERED_OMEGA_METROID_ROOM] = SEVENT_TTYPE_32,
};

static u8 sBlob_79bcc0_79ecc8[] = INCBIN_U8("data/Blob_79bcc0_79ecc8.bin");

/**
 * @brief 700bc | 38 | Updates the sub event counter for an SA-X encounter
 * 
 */
void SubEventUpdateForSaXEncounter(void)
{
    u16 subEvent;

    subEvent = SUB_EVENT_FIRST_CONVERSATION_STARTED;

    if (gEventCounter == EVENT_HIGH_JUMP_ABILITY_RECOVERED)
        subEvent = SUB_EVENT_ENTERED_SA_X_TRO_1_ROOM;
    else if (gEventCounter == EVENT_NOC_SA_X_ENCOUNTER)
        subEvent = SUB_EVENT_SA_X_NOC_ENTERED_ROOM;
    else if (gEventCounter == EVENT_ARC_SA_X_ENCOUNTER)
        subEvent = SUB_EVENT_SA_X_ARC_ENTERED_ROOM;

    if (subEvent != SUB_EVENT_FIRST_CONVERSATION_STARTED)
    {
        gSubEventCounter = subEvent;
        SubEventUpdateMusic(SEVENT_TTYPE_SA_X_ENCOUNTER);
    }
}

/**
 * @brief 700f4 | 2c | Updates the sub event for an ability
 * 
 */
void SubEventUpdateForAbility(void)
{
    if (sAbilityRamValues[gAbilityCount].subEvent != SUB_EVENT_FIRST_CONVERSATION_STARTED)
    {
        gSubEventCounter = sAbilityRamValues[gAbilityCount].subEvent;
        SubEventUpdateMusic(SEVENT_TTYPE_GETTING_ITEM);
    }
}

/**
 * @brief 70120 | 44 | Updates the sub event for a navigation conversation
 * 
 */
void SubEventUpdateForNavConversation(void)
{
    u32 i;

    for (i = 0; i < ARRAY_SIZE(sSubEventNavConversations); i++)
    {
        if (gPreviousNavigationConversation == sSubEventNavConversations[i][0])
        {
            // Found nav conversation, set sub event and update music
            gSubEventCounter = sSubEventNavConversations[i][1];
            SubEventUpdateMusic(SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION);
            break;
        }

        if (gPreviousNavigationConversation < sSubEventNavConversations[i][0])
            break;
    }
}

/**
 * @brief 70164 | 1c | Sets the current sub event
 * 
 * @param subEvent Sub event
 * @param triggerType Sub event trigger type
 */
void SubEventUpdate(u8 subEvent, u8 triggerType)
{
    // Set sub event and update music
    gSubEventCounter = subEvent;
    SubEventUpdateMusic(triggerType);
}

/**
 * @brief 70180 | 142c | Updates the music for the current sub event
 * 
 * @param triggerType Sub event trigger type
 */
void SubEventUpdateMusic(u8 triggerType)
{
    u8 type;
    u8 updateSubEvent;

    if (gCurrentArea >= AREA_NORMAL_COUNT)
        return;

    if (triggerType != SEVENT_TTYPE_128)
    {
        if (sSubEventTriggerTypes[gSubEventCounter] != SEVENT_TTYPE_NONE && triggerType != sSubEventTriggerTypes[gSubEventCounter])
        {
            if (sSubEventTriggerTypes[gSubEventCounter] != SEVENT_TTYPE_32)
                return;

            if (triggerType == SEVENT_TTYPE_LEAVING_ROOM)
                type = 0x1;
            else if (triggerType == SEVENT_TTYPE_ENTERING_ROOM)
                type = 0x2;
            else
                return;
        }
    }

    updateSubEvent = FALSE;

    switch (gSubEventCounter)
    {
        case SUB_EVENT_FIRST_CONVERSATION_STARTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_FIRST_CONVERSATION_LEAVING_SHIP_STARTED:
            PlayMusic(0x1E, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ROOM_AFTER_FIRST_NAV_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                PlayMusic(0x2B, 2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_CONVERSATION_AFTER_QUARANTINE_BAY_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_NAV_ROOM_AFTER_QUARANTINE_BAY:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_0)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0x2C, 2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_STARTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_ENDED:
            FadeMusic(60 * 3);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_OPERATIONS_DECK_ELEVATOR_ENDED:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_OPERATIONS_DECK)
                break;

            PlayMusic(0x3, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_OPERATIONS_DECK_LOBBY:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 13)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 13)
            {
                PlayMusic(0x2E, 2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_9:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 60)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 60)
            {
                PlayMusic(0x1E, 2);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                updateSubEvent = TRUE + 1;
                gSubEventCounter = SUB_EVENT_ENTERED_OPERATIONS_DECK_LOBBY;
            }
            break;

        case SUB_EVENT_DOWNLOADED_MISSILES:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NAV_ROOM_AFTER_MISSILES:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_32)
                break;

            PlayMusic(0x34, 2);
            unk_38a8(0x33, 0);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_DARK_VERTICAL_SHAFT_AFTER_MISSILES:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 35)
            {
                unk_372c(0x1E, 0x2C, 0x2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_ARACHNUS_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 38)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 38)
            {
                PlayMusic(0x18, 2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_MORPH_BALL_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_ARACHNUS_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 14)
            {
                unk_372c(0x1E, 0x2C, 0x2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_POST_ARACHNUS_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_STARTED:
            unk_36c4();
            SoundStop(0xFC);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_EXPLOSION:
            PlayMusic(0x31, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_DOOR_SHOT:
            FadeMusic(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_1:
            SoundPlay_3b1c(0x229);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_2:
            PlayMusic(0x1E, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_SRX1_NAV_ROOM:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 3);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_SRX1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_CHARGE_BEAM_ROOM:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 40)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 40)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_CHARGE_BEAM_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_CHARGE_BEAM_ROOM:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor != 40)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 40)
            {
                PlayMusic(0x4, 3);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_NAV_ROOM_LEAVING_SRX1:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 3);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_28:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (triggerType == SEVENT_TTYPE_LEAVING_ROOM && gDestinationDoor == 1)
            {
                FadeMusic(60);
                updateSubEvent = TRUE;
                break;
            }
            
            if (triggerType == SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION)
            {
                gSubEventCounter = SUB_EVENT_STARTED_ELEVATOR_TO_TRO1;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_LEAVING_SRX1_CONVERSATION_ENDED:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (gCurrentRoom == 1)
            {
                PlayMusic(0x4, 0);
                gSubEventCounter = SUB_EVENT_STARTED_ELEVATOR_TO_TRO1;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_STARTED_ELEVATOR_TO_TRO1:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_2)
                break;

            FadeMusic(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ELEVATOR_ENTERED_TRO1:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 29)
            {
                unk_3778(0x1E, 0x12C, 0x4);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_TRO1_NAV_ROOM:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_3_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 4);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_TRO1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_TRO1_FIRST_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_UNLOCKED_SECURITY_LEVEL_1:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_DOWNLOADED_BOMBS:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ZAZABI_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 18)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 18)
            {
                PlayMusic(0x18, 4);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_HI_JUMP_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_ZAZABI_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor != 18)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 18)
            {
                PlayMusic(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_SA_X_TRO_1_ROOM:
            unk_372c(0x1E, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_SA_X_TRO_1_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor != 45)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 45)
            {
                PlayMusic(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_TRO1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_TRO1_ELEVATOR_MONOLOGUE_STARTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_TRO1_ELEVATOR_MONOLOGUE_ENDED:
            FadeMusic(200);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_TRO1_ELEVATOR_ENDED:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_2)
                break;

            PlayMusic(0x1E, 11);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_AQA1_NAV_ROOM:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_4_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 11);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_AQA1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_FIRST_ROOM_IN_AQA1:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0x9, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_SERRIS_TANK_ROOM:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 31)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 31)
            {
                PlayMusic(0x5F, 5);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_SERRIS_ROOM:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 42)
            {
                FadeMusic(40);
            }
            else if (type == 0x2 && gCurrentRoom == 42)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SPEED_BOOSTER_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_SERRIS_ROOM:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor != 42)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 42)
            {
                PlayMusic(0x9, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_AQA1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_PYR1_SECURITY_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 4)
            {
                FadeMusic(30);
            }
            else if (type == 0x2 && gCurrentRoom == 4)
            {
                PlayMusic(0xF, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_UNLOCKED_SECURITY_LEVEL_2:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_PYR1_SECURITY_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor != 4)
            {
                FadeMusic(30);
            }
            else if (type == 0x2 && gCurrentRoom != 4)
            {
                PlayMusic(0x7, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_PYR1_DATA_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 21)
            {
                FadeMusic(30);
            }
            else if (type == 0x2 && gCurrentRoom == 21)
            {
                PlayMusic(0xF, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_DOWNLOADED_SUPER_MISSILES:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_PYR1_DATA_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor != 21)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 21)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_BOX_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (gCurrentRoom == 23)
                updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_BOX_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (gCurrentRoom != 23)
            {
                unk_372c(0x14, 0x7, 0x0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_PYR1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_PYR1_FEDERATION_CONVERSATION_STARTED:
            FadeMusic(30);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_PYR1_FEDERATION_CONVERSATION_ENDED:
            unk_372c(0x78, 0x1E, 0xB);
            SoundPlay(0xFC);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NOC1_NAV_ROOM:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_6_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 0xB);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_NOC1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_SA_X_NOC_ENTERED_ROOM:
            unk_372c(0xA, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NOC1_FIRST_ROOM:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0xA, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SA_X_NOC_ENCOUNTER_ENDED:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 10)
            {
                FadeMusic(70);
            }
            else if (type == 0x2 && gCurrentRoom == 10)
            {
                PlayMusic(0xA, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_GADORA_ROOM_BEFORE_MEGA_X:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 12)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 12)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_VARIA_SUIT_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_MEGA_X_ROOM:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor != 13)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom != 13)
            {
                PlayMusic(0xA, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_ARC1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ARC1_FIRST_COLD_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 7)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 7)
            {
                PlayMusic(0x8, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_UNLOCKED_LEVEL_3_SECURITY:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_DOWNLOADED_ICE_MISSILES:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_EMERGENCY_IN_SECTOR_3_ALARM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(70);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0x5A, 11);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                unk_3cd4(0x2CF);
            }
            break;

        case SUB_EVENT_LEAVING_ARC1_CONVERSATION_STARTED:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_2_ROOM_2)
                break;

            unk_3cfc();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_ARC1_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_WIDE_BEAM_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_COOLING_UNIT_OPERATIONAL:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_MAIN_BOILER_CONTROL_ROOM:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 29)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 29)
            {
                PlayMusic(0x7, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_PYR2_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_84:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 46)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 46)
            {
                PlayMusic(0x5C, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_85:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                PlayMusic(0x2C, 10);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                updateSubEvent = TRUE + 1;
                gSubEventCounter = SUB_EVENT_84;
            }
            break;

        case SUB_EVENT_LEAVING_HABITATION_DECK_MONOLOGUE_STARTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_87:
            unk_372c(0x1E, 0x1E, 0x0);
            updateSubEvent = TRUE + 1;
            gSubEventCounter = SUB_EVENT_84;
            break;

        case SUB_EVENT_ENTERING_ARC2_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ARC2_FIRST_COLD_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 7)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 7)
            {
                PlayMusic(0x8, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_DOWNLOADED_POWER_BOMBS:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_SA_X_ARC_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 43)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 43)
            {
                PlayMusic(0x5F, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SA_X_ARC_ENTERED_ROOM:
            unk_372c(0xA, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_SA_X_ARC_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 22)
            {
                FadeMusic(70);
            }
            else if (type == 0x2 && gCurrentRoom == 22)
            {
                PlayMusic(0x8, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_ARC2_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ELEVATOR_POWER_OUTAGE:
            unk_372c(0x60, 0x3, 0xB);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ELEVATOR_TUNNEL:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 31)
            {
                unk_372c(0x1E, 0x5C, 0xB);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_POWER_OUTAGE_SHIP_CONVERSATION_STARTED:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_0)
                break;

            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_POWER_OUTAGE_SHIP_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_POWER_OUTAGE_LEAVING_SHIP_STARTED:
            FadeMusic(0);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_POWER_OUTAGE_LEAVING_SHIP_ENDED:
            PlayMusic(0x59, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_CENTRAL_REACTOR_CORE:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 49)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 49)
            {
                PlayMusic(0x5F, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_YAKUZA_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 86)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 86)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SPACE_JUMP_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_YAKUZA_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (triggerType != SEVENT_TTYPE_LEAVING_ROOM)
                break;

            if (gDestinationDoor == 51)
            {
                FadeMusic(60);
                gSubEventCounter = SUB_EVENT_LEFT_YAKUZA_ROOM;
                updateSubEvent = TRUE + 1;
                break;
            }

            if (gDestinationDoor == 54)
            {
                unk_372c(0x1E, 0x3, 0xA);
                gSubEventCounter = SUB_EVENT_AUXILIARY_POWER_MESSAGE_STARTED;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_LEFT_YAKUZA_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 51)
            {
                PlayMusic(0x3, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_AUXILIARY_POWER_MESSAGE_STARTED:
            unk_36c4();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_AUXILIARY_POWER_MESSAGE_ENDED:
            PlayMusic(0x2E, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NAV_ROOM_AFTER_AUXILIARY_POWER:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_56)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_AFTER_AUXILIARY_POWER_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_SA_X_TRO_2_1ST_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 24)
            {
                FadeMusic(2);
            }
            else if (type == 0x2 && gCurrentRoom == 24)
            {
                PlayMusic(0x15, 8);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_111:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 55)
            {
                FadeMusic(2);
            }
            else if (type == 0x2 && gCurrentRoom == 55)
            {
                PlayMusic(0x1E, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_112:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 24)
            {
                PlayMusic(0x15, 8);
                gSubEventCounter = SUB_EVENT_111;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_APPROACHED_SA_X_TRO_2_1ST_ROOM_DOOR:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_SA_X_TRO_2_2ND_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gDestinationDoor == 32)
            {
                if (gEventCounter == EVENT_ESCAPED_TRO_2_SA_X)
                {
                    gSubEventCounter = SUB_EVENT_ENTERED_NETTORI_ROOM;
                    updateSubEvent = TRUE + 1;
                    break;
                }

                FadeMusic(30);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEFT_SA_X_TRO_2_2ND_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 32)
            {
                PlayMusic(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_NETTORI_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 22)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 22)
            {
                PlayMusic(0x44, 7);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_PLASMA_BEAM_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_NETTORI_ROOM:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 12)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 12)
            {
                PlayMusic(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_ARC3_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ARC3_FIRST_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0x32, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_NIGHTMARE_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_GRAVITY_SUIT_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_NIGHTMARE_ROOM:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 27)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 27)
            {
                PlayMusic(0x2C, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_LOWER_AQA:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 14)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 14)
            {
                PlayMusic(0x3C, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_UNLOCKED_SECURITY_LEVEL_4:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_DOWNLOADED_DIFFUSION_MISSILES:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_AQA2_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEAVING_AQA2_ELEVATOR:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gDestinationDoor == 26)
            {
                FadeMusic(200);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_LEAVING_AQA2_ELEVATOR_ENDED:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_4)
                break;

            PlayMusic(0x1E, 11);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NOC2_NAV_ROOM:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_6_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(50);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 11);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERING_NOC2_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_NOC2_FIRST_ROOM:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                FadeMusic(50);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                PlayMusic(0xA, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_RESTRICTED_LAB_NO_ENTRY_ALARM:
            unk_3cd4(0x2C8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_BOX_2_RUMBLE:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_BOX_2_ROOM:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 16)
            {
                FadeMusic(20);
            }
            else if (type == 0x2 && gCurrentRoom == 16)
            {
                PlayMusic(0x1B, 7);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
                unk_3cfc();
            break;

        case SUB_EVENT_WAVE_BEAM_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_BOX_2_ROOM:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (gCurrentRoom != 16)
            {
                unk_3cd4(0x2C8);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_RESTRICTED_LAB:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 78)
            {
                FadeMusic(40);
                unk_3cfc();
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 78)
            {
                PlayMusic(0x5F, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SA_X_LAB_RUMBLE:
            FadeMusic(20);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_SA_X_LAB_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 79)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 79)
            {
                PlayMusic(0x17, 10);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
                unk_3cd4(0x2C9);
            break;

        case SUB_EVENT_ESCAPED_RESTRICTED_LAB:
            FadeMusic(60 * 10);
            unk_3cfc();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_RESTRICTED_LAB_CUTSCENE_ENDED:
            PlayMusic(0x3, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_RESTRICTED_LAB_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_RESTRICTED_LAB_ELEVATOR_MONOLOGUE_STARTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_RESTRICTED_LAB_ELEVATOR_MONOLOGUE_ENDED:
            FadeMusic(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_RESTRICTED_LAB_ELEVATOR_ENDED:
            if (gLastElevatorUsed != ELEVATOR_RESTRICTED_ZONE_TO_SECTOR_1)
                break;

            PlayMusic(0x1E, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_ROOM_AFTER_RESTRICTED_LAB_ELEVATOR:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 30)
            {
                FadeMusic(40);
            }
            else if (type == 0x2 && gCurrentRoom == 30)
            {
                PlayMusic(0x32, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_RIDLEY_ROOM:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 27)
            {
                FadeMusic(40);
            }
            else if (type == 0x2 && gCurrentRoom == 27)
            {
                PlayMusic(0x18, 6);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SCREW_ATTACK_ABILITY_RECOVERED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_LEFT_RIDLEY_ROOM:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 26)
            {
                FadeMusic(40);
            }
            else if (type == 0x2 && gCurrentRoom == 26)
            {
                PlayMusic(0x32, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ENTERED_NAV_ROOM_AFTER_RIDLEY:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                FadeMusic(60);
            }
            else if (type == 0x2)
            {
                PlayMusic(0xB, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_SELF_DESTRUCT_CONVERSATION_ENDED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_SA_X_BOSS_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 85)
            {
                FadeMusic(60);
            }
            else if (type == 0x2 && gCurrentRoom == 85)
            {
                PlayMusic(0x2E, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_ORBIT_CHANGE_IMPLEMENTED:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_ENTERED_OMEGA_METROID_ROOM:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 63)
            {
                FadeMusic(0);
            }
            else if (type == 0x2 && gCurrentRoom == 63)
            {
                PlayMusic(0x58, 7);
                updateSubEvent = TRUE;
            }
            break;
    }

    if (updateSubEvent == TRUE)
    {
        gPreviousSubEvent = gSubEventCounter;
        gSubEventCounter++;
    }
}
