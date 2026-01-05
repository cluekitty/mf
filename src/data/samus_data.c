#include "data/samus_data.h"
#include "macros.h"

#include "samus.h"

// const u8 sSamusVisualData[SPOSE_END][5];

const u8 sSamusCollisionData[SPOSE_END][SCDF_COUNT] = {
    [SPOSE_STANDING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_TURNING_AROUND] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_SHOOTING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_RUNNING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_MID_AIR] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_TURNING_AROUND_MID_AIR] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_LANDING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_CROUCHING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_CROUCHED,
        [SCDF_UNK_1] = 2,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 2,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_TURNING_AROUND_AND_CROUCHING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_CROUCHED,
        [SCDF_UNK_1] = 2,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 2,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_SHOOTING_AND_CROUCHING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_CROUCHED,
        [SCDF_UNK_1] = 2,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 2,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_STARTING_SPIN_JUMP] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_SPINNING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_MORPHING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_MORPH_BALL] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_ROLLING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_UNMORPHING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_MORPH_BALL_MID_AIR] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 6,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 6,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_GETTING_HURT] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_GETTING_HURT_IN_MORPH_BALL] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 6,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 6,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_GETTING_KNOCKED_BACK] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 6,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 6,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_STARTING_WALL_JUMP] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_WALL_JUMPING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_USING_AN_ELEVATOR] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HANGING_ON_LEDGE] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_YOURSELF_UP_FROM_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_YOURSELF_DOWN_TO_START_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_SPACE_JUMPING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_SCREW_ATTACKING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_SPINNING,
        [SCDF_UNK_1] = 4,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 4,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_SKIDDING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_ON_SAVE_PAD] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_ON_RECHARGE_OR_SECURITY_PAD] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_TURNING_AROUND_TO_RECHARGE_OR_UNLOCK_DOORS] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_DELAY_BEFORE_SHINESPARKING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_SHINESPARKING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_DELAY_AFTER_SHINESPARKING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HANGING_FROM_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_STARTING_TO_HOLD_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HOLDING_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_SHOOTING_ON_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HANGING_ON_HORIZONTAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_MOVING_ON_HORIZONTAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_DELAY_AFTER_SHOOTING_ON_HORIZONTAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_SHOOTING_ON_HORIZONTAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_HANGING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_FROZEN] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_FROZEN_AND_FALLING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_FROZEN_IN_MORPH_BALL] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_FROZEN_IN_MORPH_BALL_AND_FALLING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_MID_AIR
    },
    [SPOSE_UNLOCKING_SECURITY] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_SAVING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_ON_NAVIGATION_PAD] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_DOWNLOADING_ABILITY] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_BEING_RECHARGED] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_FACING_FOREGROUND] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_FACING_BACKGROUND] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_UNLOCKING_HABITATIONS_DECK] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_GRABBED_BY_ZAZABI] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_LOADING_SAVE] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_DYING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HIT_BY_OMEGA_METROID] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_GROUND
    },
    [SPOSE_GRABBED_BY_YAKUZA] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MID_AIR,
        [SCDF_UNK_1] = 1,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 1,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
};

// const s16 sSamusDrawDistanceOffsets[8][4];

// const s16 sSamusCollisionOffsets[7][SAMUS_HITBOX_END];

#define ABOVE_COLLISION_FAR (HALF_BLOCK_SIZE - PIXEL_SIZE / 2)
#define ABOVE_COLLISION_NEAR (EIGHTH_BLOCK_SIZE + PIXEL_SIZE / 2)

const s16 sSamusCollisionOffsetsAbove[1][4] = {
    {
        [0] = -ABOVE_COLLISION_FAR,
        [1] = -ABOVE_COLLISION_NEAR,
        [2] = ABOVE_COLLISION_NEAR,
        [3] = ABOVE_COLLISION_FAR
    }
};

const SamusUpdate_T sSamusUpdateFunctionPointer[1] = {
    SamusUpdate
};

const SamusSetPose_T sSamusSetPoseFunctionPointer[1] = {
    SamusSetPose
};

const SamusUpdateVelocityPosition_T sSamusUpdateVelocityPositionFunctionPointer[1] = {
    SamusUpdateVelocityPosition
};

const SamusCheckCollision_T sSamusCheckCollisionFunctionPointer[1] = {
    SamusCheckCollisions
};

const SamusUpdateGraphics_T sSamusUpdateGraphicsFunctionPointer[1] = {
    SamusUpdateGraphics
};

const SamusPlayLowHealthSound_T sSamusPlayLowHealthSoundFunctionPointer[1] = {
    SamusCheckPlayLowHealthSound
};

const SamusUpdateDrawDistanceAndStandingStatus_T sSamusUpdateDrawDistanceAndStandingStatusFunctionPointer[1] = {
    SamusUpdateDrawDistanceAndStandingStatus
};

const SamusUpdateArmCannonOffset_T sSamusUpdateArmCannonOffsetFunctionPointer[1] = {
    SamusUpdateArmCannonOffset
};

const struct FrameData* const sEnvEffectOamPointers[ENV_EFFECT_END - 1] = {
    // [ENV_EFFECT_WALKING_ON_WET_GROUND - 1] = ,
    // [ENV_EFFECT_WALKING_ON_BUBBLY_GROUND - 1] = ,
    // [ENV_EFFECT_WALKING_ON_DUSTY_GROUND - 1] = ,
    // [ENV_EFFECT_WALKING_ON_VERY_DUSTY_GROUND - 1] = ,
    // [ENV_EFFECT_JUMPING_IN_OR_OUT_OF_WATER - 1] = ,
    // [ENV_EFFECT_WALKING_IN_OR_OUT_OF_WATER - 1] = ,
    // [ENV_EFFECT_TAKING_DAMAGE_IN_LAVA - 1] = ,
    // [ENV_EFFECT_LANDING_ON_WET_GROUND - 1] = ,
    // [ENV_EFFECT_LANDING_ON_BUBBLY_GROUND - 1] = ,
    // [ENV_EFFECT_LANDING_ON_DUSTY_GROUND - 1] = ,
    // [ENV_EFFECT_LANDING_ON_VERY_DUSTY_GROUND - 1] = ,
    // [ENV_EFFECT_SKIDDING_ON_WET_GROUND - 1] = ,
    // [ENV_EFFECT_SKIDDING_ON_DUSTY_GROUND - 1] = ,
    // [ENV_EFFECT_BREATHING_BUBBLES - 1] = ,
};

const SamusFunc_T sSamusPoseFunctionsPointers[SPOSE_END] = {
    [SPOSE_STANDING] = SamusStanding,
    [SPOSE_TURNING_AROUND] = SamusTurningAround,
    [SPOSE_SHOOTING] = SamusStanding,
    [SPOSE_RUNNING] = SamusRunning,
    [SPOSE_MID_AIR] = SamusMidAir,
    [SPOSE_TURNING_AROUND_MID_AIR] = SamusTurningAroundMidAir,
    [SPOSE_LANDING] = SamusStanding,
    [SPOSE_CROUCHING] = SamusCrouching,
    [SPOSE_TURNING_AROUND_AND_CROUCHING] = SamusTurningAroundAndCrouching,
    [SPOSE_SHOOTING_AND_CROUCHING] = SamusCrouching,
    [SPOSE_STARTING_SPIN_JUMP] = SamusSpinning,
    [SPOSE_SPINNING] = SamusSpinning,
    [SPOSE_MORPHING] = SamusMorphing,
    [SPOSE_MORPH_BALL] = SamusMorphBall,
    [SPOSE_ROLLING] = SamusRolling,
    [SPOSE_UNMORPHING] = SamusUnmorphing,
    [SPOSE_MORPH_BALL_MID_AIR] = SamusMorphBallMidAir,
    [SPOSE_GETTING_HURT] = SamusInactivity,
    [SPOSE_GETTING_HURT_IN_MORPH_BALL] = SamusInactivity,
    [SPOSE_GETTING_KNOCKED_BACK] = SamusInactivity,
    [SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL] = SamusInactivity,
    [SPOSE_STARTING_WALL_JUMP] = SamusInactivity,
    [SPOSE_WALL_JUMPING] = SamusWallJumping,
    [SPOSE_USING_AN_ELEVATOR] = SamusUsingAnElevator,
    [SPOSE_HANGING_ON_LEDGE] = SamusHangingOnLedge,
    [SPOSE_PULLING_YOURSELF_UP_FROM_HANGING] = SamusPullingYourselfUpFromHanging,
    [SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING] = SamusPullingYourselfForwardFromHanging,
    [SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL] = SamusPullingYourselfIntoMorphballTunnel,
    [SPOSE_PULLING_YOURSELF_DOWN_TO_START_HANGING] = SamusPullingYourselfDownToStartHanging_Unused,
    [SPOSE_SPACE_JUMPING] = SamusSpinning,
    [SPOSE_SCREW_ATTACKING] = SamusSpinning,
    [SPOSE_SKIDDING] = SamusSkidding,
    [SPOSE_ON_SAVE_PAD] = SamusInactivity,
    [SPOSE_ON_RECHARGE_OR_SECURITY_PAD] = SamusInactivity,
    [SPOSE_TURNING_AROUND_TO_RECHARGE_OR_UNLOCK_DOORS] = SamusInactivity,
    [SPOSE_DELAY_BEFORE_SHINESPARKING] = SamusInactivity,
    [SPOSE_SHINESPARKING] = SamusShinesparking,
    [SPOSE_DELAY_AFTER_SHINESPARKING] = SamusInactivity,
    [SPOSE_HANGING_FROM_VERTICAL_LADDER] = SamusHangingFromVerticalLadder,
    [SPOSE_STARTING_TO_HOLD_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusStartingToHoldYourArmCannonOutOnAVerticalLadder,
    [SPOSE_HOLDING_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusHoldingYourArmCannonOutOnAVerticalLadder,
    [SPOSE_SHOOTING_ON_VERTICAL_LADDER] = SamusInactivity,
    [SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusStartingToPutAwayYourArmCannonOnVerticalLadder,
    [SPOSE_HANGING_ON_HORIZONTAL_LADDER] = SamusHangingOnHorizontalLadder,
    [SPOSE_MOVING_ON_HORIZONTAL_LADDER] = SamusMovingOnHorizontalLadder,
    [SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER] = SamusTurningAroundOnHorizontalLadder,
    [SPOSE_DELAY_AFTER_SHOOTING_ON_HORIZONTAL_LADDER] = SamusDelayAfterShootingOnHorizontalLadder,
    [SPOSE_SHOOTING_ON_HORIZONTAL_LADDER] = SamusInactivity,
    [SPOSE_FROZEN] = SamusInactivity,
    [SPOSE_FROZEN_AND_FALLING] = SamusInactivity,
    [SPOSE_FROZEN_IN_MORPH_BALL] = SamusInactivity,
    [SPOSE_FROZEN_IN_MORPH_BALL_AND_FALLING] = SamusInactivity,
    [SPOSE_UNLOCKING_SECURITY] = SamusInactivity,
    [SPOSE_SAVING] = SamusInactivity,
    [SPOSE_ON_NAVIGATION_PAD] = SamusInactivity,
    [SPOSE_DOWNLOADING_ABILITY] = SamusInactivity,
    [SPOSE_BEING_RECHARGED] = SamusInactivity,
    [SPOSE_FACING_FOREGROUND] = SamusFacingForeground,
    [SPOSE_FACING_BACKGROUND] = SamusFacingForeground,
    [SPOSE_UNLOCKING_HABITATIONS_DECK] = SamusInactivity,
    [SPOSE_GRABBED_BY_ZAZABI] = SamusInactivity,
    [SPOSE_LOADING_SAVE] = SamusLoadingSave,
    [SPOSE_DYING] = SamusDying,
    [SPOSE_HIT_BY_OMEGA_METROID] = SamusHitByOmagaMetroid,
    [SPOSE_GRABBED_BY_YAKUZA] = SamusGrabbedByYakuza
};

const SamusFunc_T sSamusPoseGfxFunctionsPointers[SPOSE_END] = {
    [SPOSE_STANDING] = SamusStandingGfx,
    [SPOSE_TURNING_AROUND] = SamusTurningAroundGfx,
    [SPOSE_SHOOTING] = SamusShootingGfx,
    [SPOSE_RUNNING] = SamusRunningGfx,
    [SPOSE_MID_AIR] = SamusMidAirGfx,
    [SPOSE_TURNING_AROUND_MID_AIR] = SamusTurningAroundMidAirGfx,
    [SPOSE_LANDING] = SamusLandingGfx,
    [SPOSE_CROUCHING] = SamusInactivity,
    [SPOSE_TURNING_AROUND_AND_CROUCHING] = SamusTurningAroundAndCrouchingGfx,
    [SPOSE_SHOOTING_AND_CROUCHING] = SamusShootingAndCrouchingGfx,
    [SPOSE_STARTING_SPIN_JUMP] = SamusStartingASpinJumpGfx,
    [SPOSE_SPINNING] = SamusSpinningGfx,
    [SPOSE_MORPHING] = SamusMorphingGfx,
    [SPOSE_MORPH_BALL] = SamusMorphBallGfx,
    [SPOSE_ROLLING] = SamusMorphBallGfx,
    [SPOSE_UNMORPHING] = SamusUnmorphingGfx,
    [SPOSE_MORPH_BALL_MID_AIR] = SamusMorphBallGfx,
    [SPOSE_GETTING_HURT] = SamusGettingHurtGfx,
    [SPOSE_GETTING_HURT_IN_MORPH_BALL] = SamusGettingHurtGfx,
    [SPOSE_GETTING_KNOCKED_BACK] = SamusGettingKnockedBackGfx,
    [SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL] = SamusGettingKnockedBackGfx,
    [SPOSE_STARTING_WALL_JUMP] = SamusStartingWallJumpGfx,
    [SPOSE_WALL_JUMPING] = SamusSpinningGfx,
    [SPOSE_USING_AN_ELEVATOR] = SamusUsingAnElevatorGfx,
    [SPOSE_HANGING_ON_LEDGE] = SamusHangingOnLedgeGfx,
    [SPOSE_PULLING_YOURSELF_UP_FROM_HANGING] = SamusPullingYourselfUpFromHangingGfx,
    [SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING] = SamusPullingYourselfForwardFromHangingGfx,
    [SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL] = SamusPullingYourselfIntoMorphballTunnelGfx,
    [SPOSE_PULLING_YOURSELF_DOWN_TO_START_HANGING] = SamusPullingYourselfDownToStartHanging_UnusedGfx,
    [SPOSE_SPACE_JUMPING] = SamusSpaceJumpingGfx,
    [SPOSE_SCREW_ATTACKING] = SamusScrewAttackingGfx,
    [SPOSE_SKIDDING] = SamusInactivity,
    [SPOSE_ON_SAVE_PAD] = SamusOnSavePadGfx,
    [SPOSE_ON_RECHARGE_OR_SECURITY_PAD] = SamusInactivity,
    [SPOSE_TURNING_AROUND_TO_RECHARGE_OR_UNLOCK_DOORS] = SamusTurningAroundToRechargeOrUnlockSecurityGfx,
    [SPOSE_DELAY_BEFORE_SHINESPARKING] = SamusDelayBeforeShinesparkingGfx,
    [SPOSE_SHINESPARKING] = SamusShinesparkingGfx,
    [SPOSE_DELAY_AFTER_SHINESPARKING] = SamusDelayAfterShinesparkingGfx,
    [SPOSE_HANGING_FROM_VERTICAL_LADDER] = SamusHangingFromVerticalLadderGfx,
    [SPOSE_STARTING_TO_HOLD_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusStartingToHoldYourArmCannonOutOnAVerticalLadderGfx,
    [SPOSE_HOLDING_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusInactivity,
    [SPOSE_SHOOTING_ON_VERTICAL_LADDER] = SamusShootingOnVerticalLadderGfx,
    [SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER] = SamusStartingToPutAwayYourArmCannonOnVerticalLadderGfx,
    [SPOSE_HANGING_ON_HORIZONTAL_LADDER] = SamusInactivity,
    [SPOSE_MOVING_ON_HORIZONTAL_LADDER] = SamusMovingOnHorizontalLadderGfx,
    [SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER] = SamusTurningAroundOnHorizontalLadderGfx,
    [SPOSE_DELAY_AFTER_SHOOTING_ON_HORIZONTAL_LADDER] = SamusInactivity,
    [SPOSE_SHOOTING_ON_HORIZONTAL_LADDER] = SamusShootingOnHorizontalLadderGfx,
    [SPOSE_FROZEN] = SamusFrozenGfx,
    [SPOSE_FROZEN_AND_FALLING] = SamusFrozenGfx,
    [SPOSE_FROZEN_IN_MORPH_BALL] = SamusFrozenInMorphBallGfx,
    [SPOSE_FROZEN_IN_MORPH_BALL_AND_FALLING] = SamusFrozenInMorphBallGfx,
    [SPOSE_UNLOCKING_SECURITY] = SamusUnlockingSecurityGfx,
    [SPOSE_SAVING] = SamusSavingGfx,
    [SPOSE_ON_NAVIGATION_PAD] = SamusOnNavigationPadGfx,
    [SPOSE_DOWNLOADING_ABILITY] = SamusDownloadingAbilityGfx,
    [SPOSE_BEING_RECHARGED] = SamusBeingRechargedGfx,
    [SPOSE_FACING_FOREGROUND] = SamusFacingForegroundGfx,
    [SPOSE_FACING_BACKGROUND] = SamusFacingForegroundGfx,
    [SPOSE_UNLOCKING_HABITATIONS_DECK] = SamusUnlockingHabitationsDeckGfx,
    [SPOSE_GRABBED_BY_ZAZABI] = SamusMorphBallGfx,
    [SPOSE_LOADING_SAVE] = SamusLoadingSaveGfx,
    [SPOSE_DYING] = SamusDyingGfx,
    [SPOSE_HIT_BY_OMEGA_METROID] = SamusHitByOmegaMetroidGfx,
    [SPOSE_GRABBED_BY_YAKUZA] = SamusInactivity
};

// TODO: Remove this when blob is updated
// static const u8 sPadding[3] = {0, 0, 0};
// static const u8 sBlob_28d8dc_28fd04[] = INCBIN_U8("data/Blob_28d8dc_28fd04.bin");

static const u8 sBlob_28fd08_28ff60[] = INCBIN_U8("data/Blob_28fd08_28ff60.bin");
