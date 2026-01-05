#ifndef SAMUS_GRAPHICS_DATA_H
#define SAMUS_GRAPHICS_DATA_H

#include "types.h"
#include "macros.h"
#include "oam.h"
#include "structs/samus.h"
#include "constants/samus.h"

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

//
extern const struct FrameData sArmCannonUsingElevatorOam[5]; // 28bf98
extern const struct FrameData sArmCannonLoadingSaveOam[49]; // 28ce8c

extern const u8 sBlankGenericSamusData[40]; // 28d258
extern const struct SamusData sBlankSamusData; // 28d280
extern const struct Equipment sBlankEquipment; // 28d2ac

extern const struct SamusAnimData* sSamusDefaultDrawDataPointers[SPOSE_END][2]; // 28d2bc
extern const struct SamusAnimData* sSamusStandingDrawDataPointers[5][2]; // 28d4c4
extern const struct SamusAnimData* sSamusTurningDrawDataPointers[5][2]; // 28d4ec
extern const struct SamusAnimData* sSamusShootingDrawDataPointers[5][2]; // 28d514
extern const struct SamusAnimData* sSamusRunningDrawDataPointers[4][2]; // 28d53c
extern const struct SamusAnimData* sSamusJumpingOrFallingDrawDataPointers[6][2]; // 28d55c
extern const struct SamusAnimData* sSamusTurningWhileJumpingOrFallingDrawDataPointers[6][2]; // 28d58c
extern const struct SamusAnimData* sSamusLandingDrawDataPointers[10][2]; // 28d5bc
extern const struct SamusAnimData* sSamusTurningWhileCrouchingDrawDataPointers[5][2]; // 28d60c
extern const struct SamusAnimData* sSamusCrouchingDrawDataPointers[5][2]; // 28d634
extern const struct SamusAnimData* sSamusHangingFromLedgeDrawDataPointers[2][2]; // 28d65c
extern const struct FrameData* sArmCannonScrewAttackingOamPointers[2]; // 28d66c
extern const struct SamusAnimData* sSamusSkiddingDrawDataPointers[2][2]; // 28d674
extern const struct SamusAnimData* sSamusShinesparkingDrawDataPointers[3][2]; // 28d684
extern const struct SamusAnimData* sSamusDelayAfterShinesparkingDrawDataPointers[3][2]; // 28d69c
extern const struct SamusAnimData* sSamusArmOutOnVLadderDrawDataPointers[6][2]; // 28d6b4
extern const struct SamusAnimData* sSamusShootingOnVLadderDrawDataPointers[6][2]; // 28d6e4
extern const struct SamusAnimData* sSamusAfterShootingOnHLadderDrawDataPointers[6][2]; // 28d714
extern const struct SamusAnimData* sSamusShootingOnHLadderDrawDataPointers[6][2]; // 28d744
extern const struct FrameData* sArmCannonUnlockingSecurityOamPointers[2]; // 28d774
extern const struct FrameData* sArmCannonDyingOamPointers[2]; // 28d77c
extern const struct SamusAnimData* sSamusHitByOmegaMetroidDrawDataPointers[2][2]; // 28d784

extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Default[SPOSE_END][2]; // 28d8dc
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Standing[5][2]; // 28dae4
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Turning[5][2]; // 28db0c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Shooting[5][2]; // 28db34
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Running[4][2]; // 28db5c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_JumpingOrFalling[6][2]; // 28db7c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_TurningWhileJumpingOrFalling[6][2]; // 28dbac
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Landing[10][2]; // 28dbdc
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_TurningWhileCrouching[5][2]; // 28dc2c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Crouching[5][2]; // 28dc54
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_HangingFromLedge[2][2]; // 28dc7c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_Shinesparking[3][2]; // 28dc8c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_DelayAfterShinesparking[3][2]; // 28dca4
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_OnVLadder[6][2]; // 28dcbc
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_ShootingOnVLadder[6][2]; // 28dcec
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_AfterShootingOnHLadder[6][2]; // 28dd1c
extern const struct ArmCannonAnimData* sArmCannonAnimPointers_ShootingOnHLadder[6][2]; // 28dd4c

extern const u16 sFusionSuitDefaultPalette_Row0[16]; // 28dd7c
extern const u16 sGravitySuitDefaultPalette_Row0[16]; // 28ddbc
extern const u16 sSaxSuitDefaultPalette_Row0[16]; // 28dddc
extern const u16 sSamusFlashingPalette_BothRows[16]; // 28ddfc
extern const u16 sSamusDefaultPalette_Row1[16]; // 28de1c
extern const u16 sScrewAttackingPalette0_Row0[16]; // 28de3c
extern const u16 sScrewAttackingPalette_Row1[16]; // 28de7c
extern const u16 sSpeedBoostPalette0_BothRows[16]; // 28de9c
extern const u16 sSpeedBoostPalette1_BothRows[16]; // 28debc
extern const u16 sSamusDyingPalette_Row0[16]; // 28dedc
extern const u16 sSamusDyingFadePalette00_Row1[16]; // 28defc
extern const u16 sSamusFrozenPalette_Row0[16]; // 28e0fc
extern const u16 sAbsorbXPalette00_BothRows[16]; // 28e13c
extern const u16 sVariaSuitLoadingSavePalette0_Row0[16]; // 28e61c

extern const u16* sNormalSuitLoadingSavePalettePointers[28]; // 28e93c
extern const u16* sVariaSuitLoadingSavePalettePointers[28]; // 28e9ac
extern const u16* sGravitySuitLoadingSavePalettePointers[28]; // 28ea1c
extern const u16* sSaxSuitLoadingSavePalettePointers[28]; // 28ea8c

extern const u16 sFusionSuitChargingNormalBeamPalette0_BothRows[16]; // 28eafc
extern const u16 sFusionSuitChargingChargeBeamPalette0_BothRows[16]; // 28ecfc
extern const u16 sFusionSuitChargingWideBeamPalette0_BothRows[16]; // 28eefc
extern const u16 sFusionSuitChargingPlasmaBeamPalette0_BothRows[16]; // 28f0fc
extern const u16 sFusionSuitChargingWaveBeamPalette0_BothRows[16]; // 28f2fc
extern const u16 sFusionSuitChargingIceBeamPalette0_BothRows[16]; // 28f4fc
extern const u16 sFusionSuitSavingGamePalette0_Row0[16]; // 28f6fc
extern const u16 sVariaSuitSavingGamePalette0_Row0[16]; // 28f77c
extern const u16 sGravitySuitSavingGamePalette0_Row0[16]; // 28f7fc
extern const u16 sSaxSuitSavingGamePalette0_Row0[16]; // 28f87c

extern const u8* sArmCannonRightDefaultTopGfxPointers[6]; // 28f93c
extern const u8* sArmCannonRightDefaultBottomGfxPointers[6]; // 28f954
extern const u8* sArmCannonLeftDefaultTopGfxPointers[6]; // 28f96c
extern const u8* sArmCannonLeftDefaultBottomGfxPointers[6]; // 28f984
extern const u8* sArmCannonArmedRightDefaultTopGfxPointers[6]; // 28f99c
extern const u8* sArmCannonArmedRightDefaultBottomGfxPointers[6]; // 28f9b4
extern const u8* sArmCannonArmedLeftDefaultTopGfxPointers[6]; // 28f9cc
extern const u8* sArmCannonArmedLeftDefaultBottomGfxPointers[6]; // 28f9e4
extern const u8* sArmCannonRightOnHLadderTopGfxPointers[6]; // 28f9fc
extern const u8* sArmCannonRightOnHLadderBottomGfxPointers[6]; // 28fa14
extern const u8* sArmCannonLeftOnHLadderTopGfxPointers[6]; // 28fa2c
extern const u8* sArmCannonLeftOnHLadderBottomGfxPointers[6]; // 28fa44
extern const u8* sArmCannonRightOnVLadderTopGfxPointers[6]; // 28fa5c
extern const u8* sArmCannonRightOnVLadderBottomGfxPointers[6]; // 28fa74
extern const u8* sArmCannonLeftOnVLadderTopGfxPointers[6]; // 28fa8c
extern const u8* sArmCannonLeftOnVLadderBottomGfxPointers[6]; // 28faa4
extern const u8* sArmCannonScrewAttackingTopGfxPointers[4]; // 28fabc
extern const u8* sArmCannonScrewAttackingBottomGfxPointers[4]; // 28facc
extern const u8* sArmCannonLoadingSaveTopGfxPointers[48]; // 28fadc
extern const u8* sArmCannonLoadingSaveBottomGfxPointers[48]; // 28fb9c
extern const u8* sArmCannonDyingTopGfxPointers[6]; // 28fc5c
extern const u8* sArmCannonDyingBottomGfxPointers[6]; // 28fc74

extern const u8 sSamusElevatorGfx1[0xC0]; // 2de9b0
extern const u8 sSamusElevatorGfx2[0xC0]; // 2dea70
extern const u8 sSamusDyingHairTopGfx1[0x60]; // 2df730
extern const u8 sSamusDyingHairTopGfx2[0x40]; // 2df790
extern const u8 sArmCannonUnlockingSecurityTopGfx[0x200]; // 2e4250
extern const u8 sArmCannonUnlockingSecurityBottomGfx[0x200]; // 2e4450
//

// TODO: Auto gen these
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
