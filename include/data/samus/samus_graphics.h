#ifndef SAMUS_GRAPHICS_DATA_H
#define SAMUS_GRAPHICS_DATA_H

#include "types.h"
#include "macros.h"
#include "oam.h"
#include "structs/samus.h"

#define SAMUS_GFX_PART_SIZE 32
#define SAMUS_GFX_SIZE(size1, size2) (2 + size1 * SAMUS_GFX_PART_SIZE + size2 * SAMUS_GFX_PART_SIZE)

extern const struct FrameData sSamusEffectOam_UsingAnElevator[5]; // 28bf98
extern const struct FrameData sSamusEffectOam_Right_ScrewAttacking[5]; // 28cb14
extern const struct FrameData sSamusEffectOam_Right_Dying[7]; // 28cdb8
extern const struct FrameData sSamusEffectOam_LoadingSave[49]; // 28ce8c
extern const struct FrameData sSamusEffectOam_Right_UnlockingSecurity[25]; // 2e481c

extern const struct SamusAnimData sSamusAnim_Right_None_Running[11]; // 2bd628
extern const struct SamusAnimData sSamusAnim_Right_Forward_Standing[4]; // 2bd9c8
extern const struct SamusAnimData sSamusAnim_Right_Forward_Shooting[3]; // 2bda08
extern const struct SamusAnimData sSamusAnim_Right_Forward_ShootingAndCrouching[3]; // 2bdb08
extern const struct SamusAnimData sSamusAnim_Right_HitByOmegaMetroid[5]; // 2bdf48
extern const struct SamusAnimData sSamusAnim_Right_None_MidAir[7]; // 2c4348
extern const struct SamusAnimData sSamusAnim_Right_None_Landing[3]; // 2c43b8
extern const struct SamusAnimData sSamusAnim_Right_Forward_Spinning[9]; // 2c4878
extern const struct SamusAnimData sSamusAnim_Right_Forward_StartingSpinJump[2]; // 2c4928
extern const struct SamusAnimData sSamusAnim_Right_DelayBeforeShinesparking[5]; // 2c49c8
extern const struct SamusAnimData sSamusAnim_Right_Upwards_Shinespark[3]; // 2c4a18
extern const struct SamusAnimData sSamusAnim_Right_Upwards_DelayAfterShinespark[10]; // 2c4b48
extern const struct SamusAnimData sSamusAnim_Right_Forward_TurningAround[3]; // 2cafb8
extern const struct SamusAnimData sSamusAnim_Right_Forward_TurningAroundAndCrouching[3]; // 2cb138
extern const struct SamusAnimData sSamusAnim_Right_Forward_TurningAroundMidAir[3]; // 2cb2b8
extern const struct SamusAnimData sSamusAnim_Right_Morphing[4]; // 2cb558
extern const struct SamusAnimData sSamusAnim_Right_Morphball[9]; // 2cb598
extern const struct SamusAnimData sSamusAnim_Right_Unmorphing[4]; // 2cb628
extern const struct SamusAnimData sSamusAnim_Right_OnSavePad[5]; // 2cb6b8
extern const struct SamusAnimData sSamusAnim_Right_FacingForeground[5]; // 2cb758
extern const struct SamusAnimData sSamusAnim_Right_OnNavigationPad[17]; // 2cb908
extern const struct SamusAnimData sSamusAnim_Right_Forward_UsingAnElevator[6]; // 2cbac8
extern const struct SamusAnimData sSamusAnim_Right_DownloadingAbility[17]; // 2cbc38
extern const struct SamusAnimData sSamusAnim_Right_BeingRecharged[9]; // 2cbdd8
extern const struct SamusAnimData sSamusAnim_Right_UnlockingSecurity[2]; // 2cbe88
extern const struct SamusAnimData sSamusAnim_UnlockingHabitationsDeck[7]; // 2cbea8
extern const struct SamusAnimData sSamusAnim_Right_HangingOnVerticalLadder[8]; // 2d60fc
extern const struct SamusAnimData sSamusAnim_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder[3]; // 2d63ac
extern const struct SamusAnimData sSamusAnim_Right_StartingToPutAwayYourArmCannonOnVerticalLadder[3]; // 2d63dc
extern const struct SamusAnimData sSamusAnim_Right_Forward_ShootingOnVerticalLadder[3]; // 2d647c
extern const struct SamusAnimData sSamusAnim_Right_Forward_StartingWallJump[3]; // 2d652c
extern const struct SamusAnimData sSamusAnim_Right_Hanging_HangingOnLedge[8]; // 2d668c
extern const struct SamusAnimData sSamusAnim_Right_PullingYourselfUpFromHanging[4]; // 2d670c
extern const struct SamusAnimData sSamusAnim_Right_PullingYourselfForwardFromHanging[5]; // 2d674c
extern const struct SamusAnimData sSamusAnim_Right_PullingYourselfIntoMorphballTunnel[7]; // 2d679c
extern const struct SamusAnimData sSamusAnim_Right_TurningAroundOnHorizontalLadder[8]; // 2d68ec
extern const struct SamusAnimData sSamusAnim_Right_Forward_ShootingOnHorizontalLadder[3]; // 2d6b2c
extern const struct SamusAnimData sSamusAnim_Right_MovingOnHorizontalLadder[11]; // 2d696c
extern const struct SamusAnimData sSamusAnim_Right_PullingYourselfDownToStartHanging[3]; // 2d6c2c
extern const struct SamusAnimData sSamusAnim_Right_SpaceJumping[3]; // 2d8074
extern const struct SamusAnimData sSamusAnim_Right_ScrewAttacking[17]; // 2d8214
extern const struct SamusAnimData sSamusAnim_Right_Dying[11]; // 2d9158
extern const struct SamusAnimData sSamusAnim_LoadingSave[29]; // 2d9c04
extern const struct SamusAnimData sSamusAnim_Saving[73]; // 2de520

// TODO: Move
extern const struct FrameData sOam_83ecba4[];
extern const struct FrameData sOam_83ecbd4[];
extern const struct FrameData sOam_83ecc34[];
extern const struct FrameData sOam_83ecc74[];
extern const struct FrameData sOam_83eccec[];
extern const struct FrameData sOam_83ecd34[];
extern const struct FrameData sOam_83ecd5c[];
extern const struct FrameData sOam_83ecd94[];
extern const struct FrameData sOam_83ecddc[];
extern const struct FrameData sOam_83eceb4[];

#endif /* SAMUS_GRAPHICS_DATA_H */
