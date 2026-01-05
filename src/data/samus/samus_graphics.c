#include "data/samus/samus_graphics.h"

#define SAMUS_ANIM_TERMINATOR \
{                             \
    .pTopGfx = NULL,          \
    .pBottomGfx = NULL,       \
    .pOam = NULL,             \
    .timer = 0,               \
}

#define SAMUS_EFFECT_ANIM_TERMINATOR \
{                                    \
    .pGraphics = NULL,               \
    .pOam = NULL,                    \
    .timer = 0,                      \
}

const struct FrameData sSamusEffectOam_UsingAnElevator[5]; // 28bf98

const struct FrameData sSamusEffectOam_Right_ScrewAttacking[5]; // 28cb14

const struct FrameData sSamusEffectOam_Right_Dying[7]; // 28cdb8

const struct FrameData sSamusEffectOam_LoadingSave[49]; // 28ce8c

const struct FrameData sSamusEffectOam_Right_UnlockingSecurity[25]; // 2e481c


const struct SamusAnimData sSamusAnim_Right_None_Running[11]; // 2bd628

const struct SamusAnimData sSamusAnim_Right_Forward_Standing[4]; // 2bd9c8

const struct SamusAnimData sSamusAnim_Right_Forward_Shooting[3]; // 2bda08

const struct SamusAnimData sSamusAnim_Right_Forward_ShootingAndCrouching[3]; // 2bdb08

const struct SamusAnimData sSamusAnim_Right_HitByOmegaMetroid[5]; // 2bdf48

const struct SamusAnimData sSamusAnim_Right_None_MidAir[7]; // 2c4348

const struct SamusAnimData sSamusAnim_Right_None_Landing[3]; // 2c43b8

const struct SamusAnimData sSamusAnim_Right_Forward_Spinning[9]; // 2c4878

const struct SamusAnimData sSamusAnim_Right_Forward_StartingSpinJump[2]; // 2c4928

const struct SamusAnimData sSamusAnim_Right_DelayBeforeShinesparking[5]; // 2c49c8

const struct SamusAnimData sSamusAnim_Right_Upwards_Shinespark[3]; // 2c4a18

const struct SamusAnimData sSamusAnim_Right_Upwards_DelayAfterShinespark[10]; // 2c4b48

const struct SamusAnimData sSamusAnim_Right_Forward_TurningAround[3]; // 2cafb8

const struct SamusAnimData sSamusAnim_Right_Forward_TurningAroundAndCrouching[3]; // 2cb138

const struct SamusAnimData sSamusAnim_Right_Forward_TurningAroundMidAir[3]; // 2cb2b8

const struct SamusAnimData sSamusAnim_Right_Morphing[4]; // 2cb558

const struct SamusAnimData sSamusAnim_Right_Morphball[9]; // 2cb598

const struct SamusAnimData sSamusAnim_Right_Unmorphing[4]; // 2cb628

const struct SamusAnimData sSamusAnim_Right_OnSavePad[5]; // 2cb6b8

const struct SamusAnimData sSamusAnim_Right_FacingForeground[5]; // 2cb758

const struct SamusAnimData sSamusAnim_Right_OnNavigationPad[17]; // 2cb908

const struct SamusAnimData sSamusAnim_Right_Forward_UsingAnElevator[6]; // 2cbac8

const struct SamusAnimData sSamusAnim_Right_DownloadingAbility[17]; // 2cbc38

const struct SamusAnimData sSamusAnim_Right_BeingRecharged[9]; // 2cbdd8

const struct SamusAnimData sSamusAnim_Right_UnlockingSecurity[2]; // 2cbe88

const struct SamusAnimData sSamusAnim_UnlockingHabitationsDeck[7]; // 2cbea8

const struct SamusAnimData sSamusAnim_Right_HangingOnVerticalLadder[8]; // 2d60fc

const struct SamusAnimData sSamusAnim_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder[3]; // 2d63ac

const struct SamusAnimData sSamusAnim_Right_StartingToPutAwayYourArmCannonOnVerticalLadder[3]; // 2d63dc

const struct SamusAnimData sSamusAnim_Right_Forward_ShootingOnVerticalLadder[3]; // 2d647c

const struct SamusAnimData sSamusAnim_Right_Forward_StartingWallJump[3]; // 2d652c

const struct SamusAnimData sSamusAnim_Right_Hanging_HangingOnLedge[8]; // 2d668c

const struct SamusAnimData sSamusAnim_Right_PullingYourselfUpFromHanging[4]; // 2d670c

const struct SamusAnimData sSamusAnim_Right_PullingYourselfForwardFromHanging[5]; // 2d674c

const struct SamusAnimData sSamusAnim_Right_PullingYourselfIntoMorphballTunnel[7]; // 2d679c

const struct SamusAnimData sSamusAnim_Right_TurningAroundOnHorizontalLadder[8]; // 2d68ec

const struct SamusAnimData sSamusAnim_Right_Forward_ShootingOnHorizontalLadder[3]; // 2d6b2c

const struct SamusAnimData sSamusAnim_Right_MovingOnHorizontalLadder[11]; // 2d696c

const struct SamusAnimData sSamusAnim_Right_PullingYourselfDownToStartHanging[3]; // 2d6c2c

const struct SamusAnimData sSamusAnim_Right_SpaceJumping[3]; // 2d8074

const struct SamusAnimData sSamusAnim_Right_ScrewAttacking[17]; // 2d8214

const struct SamusAnimData sSamusAnim_Right_Dying[11]; // 2d9158

const struct SamusAnimData sSamusAnim_LoadingSave[29]; // 2d9c04

const struct SamusAnimData sSamusAnim_Saving[73]; // 2de520
