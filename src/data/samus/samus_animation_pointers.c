#include "data/samus/samus_animation_pointers.h"
#include "macros.h"
#include "gba/keys.h"
#include "constants/connection.h"

#include "data/samus/samus_graphics.h"
#include "data/samus/arm_cannon_data.h"
#include "data/samus/arm_cannon_graphics.h"

// 0x28d258
const u8 sSamusGenericData_Empty[40] = {0};

// 0x28d280
const struct SamusData sSamusData_Empty = {
    .unk_0 = 0,
    .pose = SPOSE_FACING_FOREGROUND,
    .turning = FALSE,
    .forcedMovement = 0,
    .walljumpTimer = 0,
    .invincibilityTimer = 0,
    .speedboostingCounter = 0,
    .armCannonDirection = ACD_NONE,
    .weaponHighlighted = WH_NONE,
    .newProjectile = NEW_PROJ_NONE,
    .cooldownTimer = 0,
    .unk_B = 0,
    .chargeBeamCounter = 0,
    .diagonalAim = DIAG_AIM_NONE,
    .armRunningFlag = FALSE,
    .counter = 0,
    .lastWallTouchedMidAir = KEY_NONE,
    .direction = KEY_LEFT,
    .elevatorOrClimbingDirection = KEY_NONE,
    .xPosition = BLOCK_TO_SUB_PIXEL(1.5f),
    .yPosition = BLOCK_TO_SUB_PIXEL(8) - ONE_SUB_PIXEL,
    .xVelocity = 0,
    .yVelocity = 0,
    .slopeType = 0,
    .standingStatus = 0,
    .animationDurationCounter = 0,
    .currentAnimationFrame = 0,
    .shooting = 0,
    .drawDistanceLeft = 0,
    .drawDistanceTop = 0,
    .drawDistanceRight = 0,
    .drawDistanceBottom = 0
};

// 0x28d2ac
const struct Equipment sEquipment_Empty = {
    .currentEnergy = 99,
    .maxEnergy = 99,
    .currentMissiles = 10,
    .maxMissiles = 10,
    .currentPowerBombs = 10,
    .maxPowerBombs = 10,
    .beamStatus = BF_NONE,
    .weaponsStatus = MBF_NONE,
    .suitMiscStatus = SMF_NONE,
    .securityHatchLevel = UCHAR_MAX,
    .downloadedMaps = 1 << AREA_MAIN_DECK,
    .lowHealth = FALSE
};


// 0x28D2BC
const struct SamusAnimData* const sSamusAnimPointers_Default[SPOSE_END][2] = {
    {
        sSamusAnim_Standing_Forward_Right,
        sSamusAnim_Standing_Forward_Left
    },
    {
        sSamusAnim_Turning_Forward_Right,
        sSamusAnim_Turning_Forward_Left
    },
    {
        sSamusAnim_Shooting_Forward_Right,
        sSamusAnim_Shooting_Forward_Left
    },
    {
        sSamusAnim_Running_None_Right,
        sSamusAnim_Running_None_Left
    },
    {
        sSamusAnim_MidAir_None_Right,
        sSamusAnim_MidAir_None_Left
    },
    {
        sSamusAnim_TurningMidAir_Forward_Right,
        sSamusAnim_TurningMidAir_Forward_Left
    },
    {
        sSamusAnim_Landing_None_Right,
        sSamusAnim_Landing_None_Left
    },
    {
        sSamusAnim_Landing_5_Right,
        sSamusAnim_Landing_5_Left
    },
    {
        sSamusAnim_TurningAndCrouching_Forward_Right,
        sSamusAnim_TurningAndCrouching_Forward_Left
    },
    {
        sSamusAnim_Crouching_Forward_Right,
        sSamusAnim_Crouching_Forward_Left
    },
    {
        sSamusAnim_StartingSpinJump_Right,
        sSamusAnim_StartingSpinJump_Left
    },
    {
        sSamusAnim_Spinning_Right,
        sSamusAnim_Spinning_Left
    },
    {
        sSamusAnim_Morphing_Right,
        sSamusAnim_Morphing_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_Unmorphing_Right,
        sSamusAnim_Unmorphing_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_MidAir_None_Right,
        sSamusAnim_MidAir_None_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_MidAir_None_Right,
        sSamusAnim_MidAir_None_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_StartingWallJump_Right,
        sSamusAnim_StartingWallJump_Left
    },
    {
        sSamusAnim_Spinning_Right,
        sSamusAnim_Spinning_Left
    },
    {
        sSamusAnim_UsingElevator_Right,
        sSamusAnim_UsingElevator_Left
    },
    {
        sSamusAnim_HangingOnLedge_Default_Right,
        sSamusAnim_HangingOnLedge_Default_Left
    },
    {
        sSamusAnim_PullingUpFromHanging_Right,
        sSamusAnim_PullingUpFromHanging_Left
    },
    {
        sSamusAnim_PullingForwardFromHanging_Right,
        sSamusAnim_PullingForwardFromHanging_Left
    },
    {
        sSamusAnim_PullingIntoMorphFromHanging_Right,
        sSamusAnim_PullingIntoMorphFromHanging_Left
    },
    {
        sSamusAnim_LoweringDownToStartHanging_Right,
        sSamusAnim_LoweringDownToStartHanging_Left
    },
    {
        sSamusAnim_SpaceJumping_Right,
        sSamusAnim_SpaceJumping_Left
    },
    {
        sSamusAnim_ScrewAttacking_Right,
        sSamusAnim_ScrewAttacking_Left
    },
    {
        sSamusAnim_Skidding_Default_Right,
        sSamusAnim_Skidding_Default_Left
    },
    {
        sSamusAnim_OnSavePad_Right,
        sSamusAnim_OnSavePad_Left
    },
    {
        sSamusAnim_Standing_Forward_Right,
        sSamusAnim_Standing_Forward_Left
    },
    {
        sSamusAnim_Turning_Forward_Right,
        sSamusAnim_Turning_Forward_Left
    },
    {
        sSamusAnim_DelayBeforeShinesparking_Right,
        sSamusAnim_DelayBeforeShinesparking_Left
    },
    {
        sSamusAnim_Shinesparking_Upwards_Right,
        sSamusAnim_Shinesparking_Upwards_Left
    },
    {
        sSamusAnim_DelayAfterShinesparking_Upwards_Right,
        sSamusAnim_DelayAfterShinesparking_Upwards_Left
    },
    {
        sSamusAnim_HangingOnVerticalLadder_Right,
        sSamusAnim_HangingOnVerticalLadder_Left
    },
    {
        sSamusAnim_StartingToHoldArmOutOnVerticalLadder_Right,
        sSamusAnim_StartingToHoldArmOutOnVerticalLadder_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Right,
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_Forward_Right,
        sSamusAnim_ShootingOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_StartingToPutArmAwayOnVerticalLadder_Right,
        sSamusAnim_StartingToPutArmAwayOnVerticalLadder_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_MovingOnHorizontalLadder_Right,
        sSamusAnim_MovingOnHorizontalLadder_Left
    },
    {
        sSamusAnim_TurningOnHorizontalLadder_Right,
        sSamusAnim_TurningOnHorizontalLadder_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_Standing_Forward_Right,
        sSamusAnim_Standing_Forward_Left
    },
    {
        sSamusAnim_MidAir_None_Right,
        sSamusAnim_MidAir_None_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_UnlockingSecurity_Right,
        sSamusAnim_UnlockingSecurity_Left
    },
    {
        sSamusAnim_Saving,
        sSamusAnim_Saving
    },
    {
        sSamusAnim_OnNavigationPad_Right,
        sSamusAnim_OnNavigationPad_Left
    },
    {
        sSamusAnim_DownloadingAbility_Right,
        sSamusAnim_DownloadingAbility_Left
    },
    {
        sSamusAnim_BeingRecharged_Right,
        sSamusAnim_BeingRecharged_Left
    },
    {
        sSamusAnim_FacingForeground_Right,
        sSamusAnim_FacingForeground_Left
    },
    {
        sSamusAnim_FacingBackground_Right,
        sSamusAnim_FacingBackground_Left
    },
    {
        sSamusAnim_UnlockingHabitationsDeck,
        sSamusAnim_UnlockingHabitationsDeck
    },
    {
        sSamusAnim_MorphBall_Right,
        sSamusAnim_MorphBall_Left
    },
    {
        sSamusAnim_LoadingSave,
        sSamusAnim_LoadingSave
    },
    {
        sSamusAnim_Dying_Right,
        sSamusAnim_Dying_Left
    },
    {
        sSamusAnim_HitByOmegaMetroid_Default_Right,
        sSamusAnim_HitByOmegaMetroid_Default_Left
    },
    {
        sSamusAnim_MidAir_Down_Right,
        sSamusAnim_MidAir_Down_Left
    },
};

// 0x28D4C4
const struct SamusAnimData* const sSamusAnimPointers_Standing[5][2] = {
    {
        sSamusAnim_Standing_Forward_Right,
        sSamusAnim_Standing_Forward_Left
    },
    {
        sSamusAnim_Standing_Forward_Right,
        sSamusAnim_Standing_Forward_Left
    },
    {
        sSamusAnim_Standing_DiagonalUp_Right,
        sSamusAnim_Standing_DiagonalUp_Left
    },
    {
        sSamusAnim_Standing_DiagonalDown_Right,
        sSamusAnim_Standing_DiagonalDown_Left
    },
    {
        sSamusAnim_Standing_Up_Right,
        sSamusAnim_Standing_Up_Left
    },
};

// 0x28D4EC
const struct SamusAnimData* const sSamusAnimPointers_Turning[5][2] = {
    {
        sSamusAnim_Turning_Forward_Right,
        sSamusAnim_Turning_Forward_Left
    },
    {
        sSamusAnim_Turning_Forward_Right,
        sSamusAnim_Turning_Forward_Left
    },
    {
        sSamusAnim_Turning_DiagonalUp_Right,
        sSamusAnim_Turning_DiagonalUp_Left
    },
    {
        sSamusAnim_Turning_DiagonalDown_Right,
        sSamusAnim_Turning_DiagonalDown_Left
    },
    {
        sSamusAnim_Turning_Up_Right,
        sSamusAnim_Turning_Up_Left
    },
};

// 0x28D514
const struct SamusAnimData* const sSamusAnimPointers_Shooting[5][2] = {
    {
        sSamusAnim_Shooting_Forward_Right,
        sSamusAnim_Shooting_Forward_Left
    },
    {
        sSamusAnim_Shooting_Forward_Right,
        sSamusAnim_Shooting_Forward_Left
    },
    {
        sSamusAnim_Shooting_DiagonalUp_Right,
        sSamusAnim_Shooting_DiagonalUp_Left
    },
    {
        sSamusAnim_Shooting_DiagonalDown_Right,
        sSamusAnim_Shooting_DiagonalDown_Left
    },
    {
        sSamusAnim_Shooting_Up_Right,
        sSamusAnim_Shooting_Up_Left
    },
};

// 0x28D53C
const struct SamusAnimData* const sSamusAnimPointers_Running[4][2] = {
    {
        sSamusAnim_Running_None_Right,
        sSamusAnim_Running_None_Left
    },
    {
        sSamusAnim_Running_Forward_Right,
        sSamusAnim_Running_Forward_Left
    },
    {
        sSamusAnim_Running_DiagonalUp_Right,
        sSamusAnim_Running_DiagonalUp_Left
    },
    {
        sSamusAnim_Running_DiagonalDown_Right,
        sSamusAnim_Running_DiagonalDown_Left
    },
};

// 0x28D55C
const struct SamusAnimData* const sSamusAnimPointers_MidAir[6][2] = {
    {
        sSamusAnim_MidAir_None_Right,
        sSamusAnim_MidAir_None_Left
    },
    {
        sSamusAnim_MidAir_Forward_Right,
        sSamusAnim_MidAir_Forward_Left
    },
    {
        sSamusAnim_MidAir_DiagonalUp_Right,
        sSamusAnim_MidAir_DiagonalUp_Left
    },
    {
        sSamusAnim_MidAir_DiagonalDown_Right,
        sSamusAnim_MidAir_DiagonalDown_Left
    },
    {
        sSamusAnim_MidAir_Up_Right,
        sSamusAnim_MidAir_Up_Left
    },
    {
        sSamusAnim_MidAir_Down_Right,
        sSamusAnim_MidAir_Down_Left
    },
};

// 0x28D58C
const struct SamusAnimData* const sSamusAnimPointers_TurningMidAir[6][2] = {
    {
        sSamusAnim_TurningMidAir_Forward_Right,
        sSamusAnim_TurningMidAir_Forward_Left
    },
    {
        sSamusAnim_TurningMidAir_Forward_Right,
        sSamusAnim_TurningMidAir_Forward_Left
    },
    {
        sSamusAnim_TurningMidAir_DiagonalUp_Right,
        sSamusAnim_TurningMidAir_DiagonalUp_Left
    },
    {
        sSamusAnim_TurningMidAir_Down_Right,
        sSamusAnim_TurningMidAir_Down_Left
    },
    {
        sSamusAnim_TurningMidAir_Up_Right,
        sSamusAnim_TurningMidAir_Up_Left
    },
    {
        sSamusAnim_TurningMidAir_Down_Right,
        sSamusAnim_TurningMidAir_Down_Left
    },
};

// 0x28D5BC
const struct SamusAnimData* const sSamusAnimPointers_Landing[10][2] = {
    {
        sSamusAnim_Landing_None_Right,
        sSamusAnim_Landing_None_Left
    },
    {
        sSamusAnim_Landing_Forward_Right,
        sSamusAnim_Landing_Forward_Left
    },
    {
        sSamusAnim_Landing_DiagonalUp_Right,
        sSamusAnim_Landing_DiagonalUp_Left
    },
    {
        sSamusAnim_Landing_DiagonalDown_Right,
        sSamusAnim_Landing_DiagonalDown_Left
    },
    {
        sSamusAnim_Landing_Up_Right,
        sSamusAnim_Landing_Up_Left
    },
    {
        sSamusAnim_Landing_5_Right,
        sSamusAnim_Landing_5_Left
    },
    {
        sSamusAnim_Landing_5_Right,
        sSamusAnim_Landing_5_Left
    },
    {
        sSamusAnim_Landing_7_Right,
        sSamusAnim_Landing_7_Left
    },
    {
        sSamusAnim_Landing_8_Right,
        sSamusAnim_Landing_8_Left
    },
    {
        sSamusAnim_Landing_9_Right,
        sSamusAnim_Landing_9_Left
    },
};

// 0x28D60C
const struct SamusAnimData* const sSamusAnimPointers_TurningAndCrouching[5][2] = {
    {
        sSamusAnim_TurningAndCrouching_Forward_Right,
        sSamusAnim_TurningAndCrouching_Forward_Left
    },
    {
        sSamusAnim_TurningAndCrouching_Forward_Right,
        sSamusAnim_TurningAndCrouching_Forward_Left
    },
    {
        sSamusAnim_TurningAndCrouching_DiagonalUp_Right,
        sSamusAnim_TurningAndCrouching_DiagonalUp_Left
    },
    {
        sSamusAnim_TurningAndCrouching_DiagonalDown_Right,
        sSamusAnim_TurningAndCrouching_DiagonalDown_Left
    },
    {
        sSamusAnim_TurningAndCrouching_Up_Right,
        sSamusAnim_TurningAndCrouching_Up_Left
    },
};

// 0x28D634
const struct SamusAnimData* const sSamusAnimPointers_Crouching[5][2] = {
    {
        sSamusAnim_Crouching_Forward_Right,
        sSamusAnim_Crouching_Forward_Left
    },
    {
        sSamusAnim_Crouching_Forward_Right,
        sSamusAnim_Crouching_Forward_Left
    },
    {
        sSamusAnim_Crouching_DiagonalUp_Right,
        sSamusAnim_Crouching_DiagonalUp_Left
    },
    {
        sSamusAnim_Crouching_DiagonalDown_Right,
        sSamusAnim_Crouching_DiagonalDown_Left
    },
    {
        sSamusAnim_Crouching_Up_Right,
        sSamusAnim_Crouching_Up_Left
    },
};

// 0x28D65C
const struct SamusAnimData* const sSamusAnimPointers_HangingOnLedge[2][2] = {
    {
        sSamusAnim_HangingOnLedge_Default_Right,
        sSamusAnim_HangingOnLedge_Default_Left
    },
    {
        sSamusAnim_HangingOnLedge_PushingAway_Right,
        sSamusAnim_HangingOnLedge_PushingAway_Left
    },
};

// 0x28D66C
const struct FrameData* const sArmCannonOamPointers_ScrewAttacking[2] = {
    sArmCannonOam_ScrewAttacking_Right,
    sArmCannonOam_ScrewAttacking_Left,
};

// 0x28D674
const struct SamusAnimData* const sSamusAnimPointers_Skidding[2][2] = {
    {
        sSamusAnim_Skidding_Default_Right,
        sSamusAnim_Skidding_Default_Left
    },
    {
        sSamusAnim_Skidding_Armed_Right,
        sSamusAnim_Skidding_Armed_Left
    },
};

// 0x28D684
const struct SamusAnimData* const sSamusAnimPointers_Shinesparking[3][2] = {
    {
        sSamusAnim_Shinesparking_Upwards_Right,
        sSamusAnim_Shinesparking_Upwards_Left
    },
    {
        sSamusAnim_Shinesparking_Sideways_Right,
        sSamusAnim_Shinesparking_Sideways_Left
    },
    {
        sSamusAnim_Shinesparking_Sideways_Right,
        sSamusAnim_Shinesparking_Sideways_Left
    },
};

// 0x28D69C
const struct SamusAnimData* const sSamusAnimPointers_DelayAfterShinesparking[3][2] = {
    {
        sSamusAnim_DelayAfterShinesparking_Upwards_Right,
        sSamusAnim_DelayAfterShinesparking_Upwards_Left
    },
    {
        sSamusAnim_DelayAfterShinesparking_Sideways_Right,
        sSamusAnim_DelayAfterShinesparking_Sideways_Left
    },
    {
        sSamusAnim_DelayAfterShinesparking_Sideways_Right,
        sSamusAnim_DelayAfterShinesparking_Sideways_Left
    },
};

// 0x28D6B4
const struct SamusAnimData* const sSamusAnimPointers_ArmOutOnVerticalLadder[6][2] = {
    {
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Right,
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Right,
        sSamusAnim_ArmOutOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_DiagonalUp_Right,
        sSamusAnim_ArmOutOnVerticalLadder_DiagonalUp_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_DiagonalDown_Right,
        sSamusAnim_ArmOutOnVerticalLadder_DiagonalDown_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_Up_Right,
        sSamusAnim_ArmOutOnVerticalLadder_Up_Left
    },
    {
        sSamusAnim_ArmOutOnVerticalLadder_Down_Right,
        sSamusAnim_ArmOutOnVerticalLadder_Down_Left
    },
};

// 0x28D6E4
const struct SamusAnimData* const sSamusAnimPointers_ShootingOnVerticalLadder[6][2] = {
    {
        sSamusAnim_ShootingOnVerticalLadder_Forward_Right,
        sSamusAnim_ShootingOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_Forward_Right,
        sSamusAnim_ShootingOnVerticalLadder_Forward_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_DiagonalUp_Right,
        sSamusAnim_ShootingOnVerticalLadder_DiagonalUp_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_DiagonalDown_Right,
        sSamusAnim_ShootingOnVerticalLadder_DiagonalDown_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_Up_Right,
        sSamusAnim_ShootingOnVerticalLadder_Up_Left
    },
    {
        sSamusAnim_ShootingOnVerticalLadder_Down_Right,
        sSamusAnim_ShootingOnVerticalLadder_Down_Left
    },
};

// 0x28D714
const struct SamusAnimData* const sSamusAnimPointers_AfterShootingOnHorizontalLadder[6][2] = {
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_AfterShootingOnHorizontalLadder_Down_Right,
        sSamusAnim_AfterShootingOnHorizontalLadder_Down_Left
    },
};

// 0x28D744
const struct SamusAnimData* const sSamusAnimPointers_ShootingOnHorizontalLadder[6][2] = {
    {
        sSamusAnim_ShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_DiagonalDown_Right,
        sSamusAnim_ShootingOnHorizontalLadder_DiagonalDown_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_Default_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Default_Left
    },
    {
        sSamusAnim_ShootingOnHorizontalLadder_Down_Right,
        sSamusAnim_ShootingOnHorizontalLadder_Down_Left
    },
};

// 0x28D774
const struct FrameData* const sArmCannonOamPointers_UnlockingSecurity[2] = {
    sArmCannonOam_UnlockingSecurity_Right,
    sArmCannonOam_UnlockingSecurity_Left,
};

// 0x28D77C
const struct FrameData* const sArmCannonOamPointers_Dying[2] = {
    sArmCannonOam_Dying_Right,
    sArmCannonOam_Dying_Left,
};

// 0x28D784
const struct SamusAnimData* const sSamusAnimPointers_HitByOmegaMetroid[2][2] = {
    {
        sSamusAnim_HitByOmegaMetroid_Default_Right,
        sSamusAnim_HitByOmegaMetroid_Default_Left
    },
    {
        sSamusAnim_HitByOmegaMetroid_LookingUp_Right,
        sSamusAnim_HitByOmegaMetroid_LookingUp_Left
    },
};

// 0x28D794
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
    [SPOSE_USING_ELEVATOR] = {
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
    [SPOSE_PULLING_UP_FROM_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_FORWARD_FROM_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_PULLING_INTO_MORPH_FROM_HANGING] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_MORPHED,
        [SCDF_UNK_1] = 5,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 5,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_LOWERING_DOWN_TO_START_HANGING] = {
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
    [SPOSE_STARTING_TO_HOLD_ARM_OUT_ON_VERTICAL_LADDER] = {
        [SCDF_HITBOX] = SAMUS_HITBOX_TYPE_STANDING,
        [SCDF_UNK_1] = 0,
        [SCDF_UNK_2] = 0,
        [SCDF_UNK_3] = 0,
        [SCDF_STANDING_STATUS] = STANDING_NOT_IN_CONTROL
    },
    [SPOSE_HOLDING_ARM_OUT_ON_VERTICAL_LADDER] = {
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
    [SPOSE_STARTING_TO_PUT_ARM_AWAY_ON_VERTICAL_LADDER] = {
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

// 0x28D8DC
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Default[SPOSE_END][2] = {
    {
        sArmCannonAnim_Standing_None_Right,
        sArmCannonAnim_Standing_None_Left
    },
    {
        sArmCannonAnim_Turning_None_Right,
        sArmCannonAnim_Turning_None_Left
    },
    {
        sArmCannonAnim_Shooting_None_Right,
        sArmCannonAnim_Shooting_None_Left
    },
    {
        sArmCannonAnim_Running_None_Right,
        sArmCannonAnim_Running_None_Left
    },
    {
        sArmCannonAnim_MidAir_None_Right,
        sArmCannonAnim_MidAir_None_Left
    },
    {
        sArmCannonAnim_TurningMidAir_None_Right,
        sArmCannonAnim_TurningMidAir_None_Left
    },
    {
        sArmCannonAnim_Landing_None_Right,
        sArmCannonAnim_Landing_None_Left
    },
    {
        sArmCannonAnim_Landing_5_Right,
        sArmCannonAnim_Landing_5_Left
    },
    {
        sArmCannonAnim_TurningAndCrouching_None_Right,
        sArmCannonAnim_TurningAndCrouching_None_Left
    },
    {
        sArmCannonAnim_Crouching_None_Right,
        sArmCannonAnim_Crouching_None_Left
    },
    {
        sArmCannonAnim_StartingSpinJump_Right,
        sArmCannonAnim_StartingSpinJump_Left
    },
    {
        sArmCannonAnim_Spinning_Right,
        sArmCannonAnim_Spinning_Left
    },
    {
        sArmCannonAnim_Morphing_Right,
        sArmCannonAnim_Morphing_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_Unmorphing_Right,
        sArmCannonAnim_Unmorphing_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_MidAir_None_Right,
        sArmCannonAnim_MidAir_None_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_MidAir_None_Right,
        sArmCannonAnim_MidAir_None_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_StartingWallJump_Right,
        sArmCannonAnim_StartingWallJump_Left
    },
    {
        sArmCannonAnim_Spinning_Right,
        sArmCannonAnim_Spinning_Left
    },
    {
        sArmCannonAnim_UsingElevator_Right,
        sArmCannonAnim_UsingElevator_Left
    },
    {
        sArmCannonAnim_HangingOnLedge_Default_Right,
        sArmCannonAnim_HangingOnLedge_Default_Left
    },
    {
        sArmCannonAnim_PullingUpFromHanging_Right,
        sArmCannonAnim_PullingUpFromHanging_Left
    },
    {
        sArmCannonAnim_PullingForwardFromHanging_Right,
        sArmCannonAnim_PullingForwardFromHanging_Left
    },
    {
        sArmCannonAnim_PullingIntoMorphFromHanging_Right,
        sArmCannonAnim_PullingIntoMorphFromHanging_Left
    },
    {
        sArmCannonAnim_LoweringDownToStartHanging_Right,
        sArmCannonAnim_LoweringDownToStartHanging_Left
    },
    {
        sArmCannonAnim_SpaceJumping_Right,
        sArmCannonAnim_SpaceJumping_Left
    },
    {
        sArmCannonAnim_ScrewAttacking_Right,
        sArmCannonAnim_ScrewAttacking_Left
    },
    {
        sArmCannonAnim_Skidding_Right,
        sArmCannonAnim_Skidding_Left
    },
    {
        sArmCannonAnim_OnSavePad_Right,
        sArmCannonAnim_OnSavePad_Left
    },
    {
        sArmCannonAnim_Standing_None_Right,
        sArmCannonAnim_Standing_None_Left
    },
    {
        sArmCannonAnim_Turning_None_Right,
        sArmCannonAnim_Turning_None_Left
    },
    {
        sArmCannonAnim_DelayBeforeShinesparking_Right,
        sArmCannonAnim_DelayBeforeShinesparking_Left
    },
    {
        sArmCannonAnim_Shinesparking_Upwards_Right,
        sArmCannonAnim_Shinesparking_Upwards_Left
    },
    {
        sArmCannonAnim_DelayAfterShinesparking_Upwards_Right,
        sArmCannonAnim_DelayAfterShinesparking_Upwards_Left
    },
    {
        sArmCannonAnim_HangingOnVerticalLadder_Right,
        sArmCannonAnim_HangingOnVerticalLadder_Left
    },
    {
        sArmCannonAnim_StartingToHoldArmOutOnVerticalLadder_Right,
        sArmCannonAnim_StartingToHoldArmOutOnVerticalLadder_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_None_Right,
        sArmCannonAnim_OnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_None_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_StartingToPutArmAwayOnVerticalLadder_Right,
        sArmCannonAnim_StartingToPutArmAwayOnVerticalLadder_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_MovingOnHorizontalLadder_Right,
        sArmCannonAnim_MovingOnHorizontalLadder_Left
    },
    {
        sArmCannonAnim_TurningOnHorizontalLadder_Right,
        sArmCannonAnim_TurningOnHorizontalLadder_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_Standing_None_Right,
        sArmCannonAnim_Standing_None_Left
    },
    {
        sArmCannonAnim_MidAir_None_Right,
        sArmCannonAnim_MidAir_None_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_UnlockingSecurity_Right,
        sArmCannonAnim_UnlockingSecurity_Left
    },
    {
        sArmCannonAnim_OnSavePad_Right,
        sArmCannonAnim_OnSavePad_Left
    },
    {
        sArmCannonAnim_OnNavigationPad_Right,
        sArmCannonAnim_OnNavigationPad_Left
    },
    {
        sArmCannonAnim_DownloadingAbility_Right,
        sArmCannonAnim_DownloadingAbility_Left
    },
    {
        sArmCannonAnim_BeingRecharged_Right,
        sArmCannonAnim_BeingRecharged_Left
    },
    {
        sArmCannonAnim_FacingForeground_Right,
        sArmCannonAnim_FacingForeground_Left
    },
    {
        sArmCannonAnim_FacingBackground_Right,
        sArmCannonAnim_FacingBackground_Left
    },
    {
        sArmCannonAnim_UnlockingHabitationsDeck,
        sArmCannonAnim_UnlockingHabitationsDeck
    },
    {
        sArmCannonAnim_MorphBall_Right,
        sArmCannonAnim_MorphBall_Left
    },
    {
        sArmCannonAnim_LoadingSave,
        sArmCannonAnim_LoadingSave
    },
    {
        sArmCannonAnim_Dying_Right,
        sArmCannonAnim_Dying_Left
    },
    {
        sArmCannonAnim_HitByOmegaMetroid_Right,
        sArmCannonAnim_HitByOmegaMetroid_Left
    },
    {
        sArmCannonAnim_MidAir_Down_Right,
        sArmCannonAnim_MidAir_Down_Left
    },
};

// 0x28DAE4
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Standing[5][2] = {
    {
        sArmCannonAnim_Standing_None_Right,
        sArmCannonAnim_Standing_None_Left
    },
    {
        sArmCannonAnim_Standing_None_Right,
        sArmCannonAnim_Standing_None_Left
    },
    {
        sArmCannonAnim_Standing_DiagonalUp_Right,
        sArmCannonAnim_Standing_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Standing_DiagonalDown_Right,
        sArmCannonAnim_Standing_DiagonalDown_Left
    },
    {
        sArmCannonAnim_Standing_Up_Right,
        sArmCannonAnim_Standing_Up_Left
    },
};

// 0x28DB0C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Turning[5][2] = {
    {
        sArmCannonAnim_Turning_None_Right,
        sArmCannonAnim_Turning_None_Left
    },
    {
        sArmCannonAnim_Turning_None_Right,
        sArmCannonAnim_Turning_None_Left
    },
    {
        sArmCannonAnim_Turning_DiagonalUp_Right,
        sArmCannonAnim_Turning_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Turning_DiagonalDown_Right,
        sArmCannonAnim_Turning_DiagonalDown_Left
    },
    {
        sArmCannonAnim_Turning_Up_Right,
        sArmCannonAnim_Turning_Up_Left
    },
};

// 0x28DB34
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Shooting[5][2] = {
    {
        sArmCannonAnim_Shooting_None_Right,
        sArmCannonAnim_Shooting_None_Left
    },
    {
        sArmCannonAnim_Shooting_None_Right,
        sArmCannonAnim_Shooting_None_Left
    },
    {
        sArmCannonAnim_Shooting_DiagonalUp_Right,
        sArmCannonAnim_Shooting_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Shooting_DiagonalDown_Right,
        sArmCannonAnim_Shooting_DiagonalDown_Left
    },
    {
        sArmCannonAnim_Shooting_Up_Right,
        sArmCannonAnim_Shooting_Up_Left
    },
};

// 0x28DB5C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Running[4][2] = {
    {
        sArmCannonAnim_Running_None_Right,
        sArmCannonAnim_Running_None_Left
    },
    {
        sArmCannonAnim_Running_Forward_Right,
        sArmCannonAnim_Running_Forward_Left
    },
    {
        sArmCannonAnim_Running_DiagonalUp_Right,
        sArmCannonAnim_Running_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Running_DiagonalDown_Right,
        sArmCannonAnim_Running_DiagonalDown_Left
    },
};

// 0x28DB7C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_MidAir[6][2] = {
    {
        sArmCannonAnim_MidAir_None_Right,
        sArmCannonAnim_MidAir_None_Left
    },
    {
        sArmCannonAnim_MidAir_Forward_Right,
        sArmCannonAnim_MidAir_Forward_Left
    },
    {
        sArmCannonAnim_MidAir_DiagonalUp_Right,
        sArmCannonAnim_MidAir_DiagonalUp_Left
    },
    {
        sArmCannonAnim_MidAir_DiagonalDown_Right,
        sArmCannonAnim_MidAir_DiagonalDown_Left
    },
    {
        sArmCannonAnim_MidAir_Up_Right,
        sArmCannonAnim_MidAir_Up_Left
    },
    {
        sArmCannonAnim_MidAir_Down_Right,
        sArmCannonAnim_MidAir_Down_Left
    },
};

// 0x28DBAC
const struct ArmCannonAnimData* const sArmCannonAnimPointers_TurningMidAir[6][2] = {
    {
        sArmCannonAnim_TurningMidAir_None_Right,
        sArmCannonAnim_TurningMidAir_None_Left
    },
    {
        sArmCannonAnim_TurningMidAir_None_Right,
        sArmCannonAnim_TurningMidAir_None_Left
    },
    {
        sArmCannonAnim_TurningMidAir_DiagonalUp_Right,
        sArmCannonAnim_TurningMidAir_DiagonalUp_Left
    },
    {
        sArmCannonAnim_TurningMidAir_DiagonalDown_Right,
        sArmCannonAnim_TurningMidAir_DiagonalDown_Left
    },
    {
        sArmCannonAnim_TurningMidAir_Up_Right,
        sArmCannonAnim_TurningMidAir_Up_Left
    },
    {
        sArmCannonAnim_TurningMidAir_DiagonalDown_Right,
        sArmCannonAnim_TurningMidAir_DiagonalDown_Left
    },
};

// 0x28DBDC
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Landing[10][2] = {
    {
        sArmCannonAnim_Landing_None_Right,
        sArmCannonAnim_Landing_None_Left
    },
    {
        sArmCannonAnim_Landing_Forward_Right,
        sArmCannonAnim_Landing_Forward_Left
    },
    {
        sArmCannonAnim_Landing_DiagonalUp_Right,
        sArmCannonAnim_Landing_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Landing_DiagonalDown_Right,
        sArmCannonAnim_Landing_DiagonalDown_Left
    },
    {
        sArmCannonAnim_Landing_Up_Right,
        sArmCannonAnim_Landing_Up_Left
    },
    {
        sArmCannonAnim_Landing_5_Right,
        sArmCannonAnim_Landing_5_Left
    },
    {
        sArmCannonAnim_Landing_5_Right,
        sArmCannonAnim_Landing_5_Left
    },
    {
        sArmCannonAnim_Landing_7_Right,
        sArmCannonAnim_Landing_7_Left
    },
    {
        sArmCannonAnim_Landing_8_Right,
        sArmCannonAnim_Landing_8_Left
    },
    {
        sArmCannonAnim_Landing_9_Right,
        sArmCannonAnim_Landing_9_Left
    },
};

// 0x28DC2C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_TurningAndCrouching[5][2] = {
    {
        sArmCannonAnim_TurningAndCrouching_None_Right,
        sArmCannonAnim_TurningAndCrouching_None_Left
    },
    {
        sArmCannonAnim_TurningAndCrouching_None_Right,
        sArmCannonAnim_TurningAndCrouching_None_Left
    },
    {
        sArmCannonAnim_TurningAndCrouching_DiagonalUp_Right,
        sArmCannonAnim_TurningAndCrouching_DiagonalUp_Left
    },
    {
        sArmCannonAnim_TurningAndCrouching_DiagonalDown_Right,
        sArmCannonAnim_TurningAndCrouching_DiagonalDown_Left
    },
    {
        sArmCannonAnim_TurningAndCrouching_Up_Right,
        sArmCannonAnim_TurningAndCrouching_Up_Left
    },
};

// 0x28DC54
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Crouching[5][2] = {
    {
        sArmCannonAnim_Crouching_None_Right,
        sArmCannonAnim_Crouching_None_Left
    },
    {
        sArmCannonAnim_Crouching_None_Right,
        sArmCannonAnim_Crouching_None_Left
    },
    {
        sArmCannonAnim_Crouching_DiagonalUp_Right,
        sArmCannonAnim_Crouching_DiagonalUp_Left
    },
    {
        sArmCannonAnim_Crouching_DiagonalDown_Right,
        sArmCannonAnim_Crouching_DiagonalDown_Left
    },
    {
        sArmCannonAnim_Crouching_Up_Right,
        sArmCannonAnim_Crouching_Up_Left
    },
};

// 0x28DC7C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_HangingOnLedge[2][2] = {
    {
        sArmCannonAnim_HangingOnLedge_Default_Right,
        sArmCannonAnim_HangingOnLedge_Default_Left
    },
    {
        sArmCannonAnim_HangingOnLedge_PushingAway_Right,
        sArmCannonAnim_HangingOnLedge_PushingAway_Left
    },
};

// 0x28DC8C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_Shinesparking[3][2] = {
    {
        sArmCannonAnim_Shinesparking_Upwards_Right,
        sArmCannonAnim_Shinesparking_Upwards_Left
    },
    {
        sArmCannonAnim_Shinesparking_Sideways_Right,
        sArmCannonAnim_Shinesparking_Sideways_Left
    },
    {
        sArmCannonAnim_Shinesparking_Sideways_Right,
        sArmCannonAnim_Shinesparking_Sideways_Left
    },
};

// 0x28DCA4
const struct ArmCannonAnimData* const sArmCannonAnimPointers_DelayAfterShinesparking[3][2] = {
    {
        sArmCannonAnim_DelayAfterShinesparking_Upwards_Right,
        sArmCannonAnim_DelayAfterShinesparking_Upwards_Left
    },
    {
        sArmCannonAnim_DelayAfterShinesparking_Sideways_Right,
        sArmCannonAnim_DelayAfterShinesparking_Sideways_Left
    },
    {
        sArmCannonAnim_DelayAfterShinesparking_Sideways_Right,
        sArmCannonAnim_DelayAfterShinesparking_Sideways_Left
    },
};

// 0x28DCBC
const struct ArmCannonAnimData* const sArmCannonAnimPointers_OnVerticalLadder[6][2] = {
    {
        sArmCannonAnim_OnVerticalLadder_None_Right,
        sArmCannonAnim_OnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_None_Right,
        sArmCannonAnim_OnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_DiagonalUp_Right,
        sArmCannonAnim_OnVerticalLadder_DiagonalUp_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_DiagonalDown_Right,
        sArmCannonAnim_OnVerticalLadder_DiagonalDown_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_Up_Right,
        sArmCannonAnim_OnVerticalLadder_Up_Left
    },
    {
        sArmCannonAnim_OnVerticalLadder_Down_Right,
        sArmCannonAnim_OnVerticalLadder_Down_Left
    },
};

// 0x28DCEC
const struct ArmCannonAnimData* const sArmCannonAnimPointers_ShootingOnVerticalLadder[6][2] = {
    {
        sArmCannonAnim_ShootingOnVerticalLadder_None_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_None_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_DiagonalUp_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_DiagonalUp_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_DiagonalDown_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_DiagonalDown_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_Up_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_Up_Left
    },
    {
        sArmCannonAnim_ShootingOnVerticalLadder_Down_Right,
        sArmCannonAnim_ShootingOnVerticalLadder_Down_Left
    },
};

// 0x28DD1C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_AfterShootingOnHorizontalLadder[6][2] = {
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_AfterShootingOnHorizontalLadder_Down_Right,
        sArmCannonAnim_AfterShootingOnHorizontalLadder_Down_Left
    },
};

// 0x28DD4C
const struct ArmCannonAnimData* const sArmCannonAnimPointers_ShootingOnHorizontalLadder[6][2] = {
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_DiagonalDown_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_DiagonalDown_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_None_Left
    },
    {
        sArmCannonAnim_ShootingOnHorizontalLadder_Down_Right,
        sArmCannonAnim_ShootingOnHorizontalLadder_Down_Left
    },
};
