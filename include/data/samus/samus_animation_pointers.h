#include "types.h"
#include "structs/samus.h"
#include "oam.h"
#include "constants/samus.h"

extern const u8 sSamusGenericData_Empty[40]; // 28d258
extern const struct SamusData sSamusData_Empty; // 28d280
extern const struct Equipment sEquipment_Empty; // 28d2ac

extern const struct SamusAnimData* const sSamusAnimPointers_Default[SPOSE_END][2]; // 28d2bc
extern const struct SamusAnimData* const sSamusAnimPointers_Standing[5][2]; // 28d4c4
extern const struct SamusAnimData* const sSamusAnimPointers_Turning[5][2]; // 28d4ec
extern const struct SamusAnimData* const sSamusAnimPointers_Shooting[5][2]; // 28d514
extern const struct SamusAnimData* const sSamusAnimPointers_Running[4][2]; // 28d53c
extern const struct SamusAnimData* const sSamusAnimPointers_MidAir[6][2]; // 28d55c
extern const struct SamusAnimData* const sSamusAnimPointers_TurningMidAir[6][2]; // 28d58c
extern const struct SamusAnimData* const sSamusAnimPointers_Landing[10][2]; // 28d5bc
extern const struct SamusAnimData* const sSamusAnimPointers_TurningAndCrouching[5][2]; // 28d60c
extern const struct SamusAnimData* const sSamusAnimPointers_Crouching[5][2]; // 28d634
extern const struct SamusAnimData* const sSamusAnimPointers_HangingOnLedge[2][2]; // 28d65c

extern const struct FrameData* const sArmCannonOamPointers_ScrewAttacking[2]; // 28d66c

extern const struct SamusAnimData* const sSamusAnimPointers_Skidding[2][2]; // 28d674
extern const struct SamusAnimData* const sSamusAnimPointers_Shinesparking[3][2]; // 28d684
extern const struct SamusAnimData* const sSamusAnimPointers_DelayAfterShinesparking[3][2]; // 28d69c
extern const struct SamusAnimData* const sSamusAnimPointers_ArmOutOnVerticalLadder[6][2]; // 28d6b4
extern const struct SamusAnimData* const sSamusAnimPointers_ShootingOnVerticalLadder[6][2]; // 28d6e4
extern const struct SamusAnimData* const sSamusAnimPointers_AfterShootingOnHorizontalLadder[6][2]; // 28d714
extern const struct SamusAnimData* const sSamusAnimPointers_ShootingOnHorizontalLadder[6][2]; // 28d744

extern const struct FrameData* const sArmCannonOamPointers_UnlockingSecurity[2]; // 28d774
extern const struct FrameData* const sArmCannonOamPointers_Dying[2]; // 28d77c

extern const struct SamusAnimData* const sSamusAnimPointers_HitByOmegaMetroid[2][2]; // 28d784

extern const u8 sSamusCollisionData[SPOSE_END][SCDF_COUNT]; // 28d794

extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Default[SPOSE_END][2]; // 28d8dc
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Standing[5][2]; // 28dae4
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Turning[5][2]; // 28db0c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Shooting[5][2]; // 28db34
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Running[4][2]; // 28db5c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_MidAir[6][2]; // 28db7c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_TurningMidAir[6][2]; // 28dbac
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Landing[10][2]; // 28dbdc
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_TurningAndCrouching[5][2]; // 28dc2c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Crouching[5][2]; // 28dc54
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_HangingOnLedge[2][2]; // 28dc7c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_Shinesparking[3][2]; // 28dc8c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_DelayAfterShinesparking[3][2]; // 28dca4
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_OnVerticalLadder[6][2]; // 28dcbc
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_ShootingOnVerticalLadder[6][2]; // 28dcec
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_AfterShootingOnHorizontalLadder[6][2]; // 28dd1c
extern const struct ArmCannonAnimData* const sArmCannonAnimPointers_ShootingOnHorizontalLadder[6][2]; // 28dd4c
