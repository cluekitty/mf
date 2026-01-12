#include "types.h"

#define SUIT_COUNT 4

extern const u16 sSamusPal_Default_Row0_Fusion[16]; // 28dd7c
extern const u16 sSamusPal_Default_Row0_Varia[16]; // 28dd9c
extern const u16 sSamusPal_Default_Row0_Gravity[16]; // 28ddbc
extern const u16 sSamusPal_Default_Row0_SaX[16]; // 28dddc
extern const u16 sSamusPal_Flashing_BothRows[16]; // 28ddfc
extern const u16 sSamusPal_Default_Row1[16]; // 28de1c

extern const u16 sSamusPal_ScrewAttacking_Row0[2 * 16]; // 28de3c
extern const u16 sSamusPal_ScrewAttacking_Row1[16]; // 28de7c
extern const u16 sSamusPal_Speedboost0_BothRows[16]; // 28de9c
extern const u16 sSamusPal_Speedboost1_BothRows[16]; // 28debc

extern const u16 sSamusPal_Dying_Row0[16]; // 28dedc
extern const u16 sSamusPal_DyingFade_Row1[16 * 16]; // 28defc

extern const u16 sSamusPal_Frozen_Row0[2 * 16]; // 28e0fc

extern const u16 sSamusPal_AbsorbX_BothRows[24 * 16]; // 28e13c

extern const u16 sSamusPal_LoadingSave_Varia_20[16];

// TODO: Add which rows to name
extern const u16* const sSamusPalPointers_LoadingSave_Fusion[28]; // 28e93c
extern const u16* const sSamusPalPointers_LoadingSave_Varia[28]; // 28e9ac
extern const u16* const sSamusPalPointers_LoadingSave_Gravity[28]; // 28ea1c
extern const u16* const sSamusPalPointers_LoadingSave_SaX[28]; // 28ea8c

extern const u16 sSamusPal_ChargingNormalBeam_BothRows[4 * SUIT_COUNT * 16]; // 28eafc
extern const u16 sSamusPal_ChargingChargeBeam_BothRows[4 * SUIT_COUNT * 16]; // 28ecfc
extern const u16 sSamusPal_ChargingWideBeam_BothRows[4 * SUIT_COUNT * 16]; // 28eefc
extern const u16 sSamusPal_ChargingPlasmaBeam_BothRows[4 * SUIT_COUNT * 16]; // 28f0fc
extern const u16 sSamusPal_ChargingWaveBeam_BothRows[4 * SUIT_COUNT * 16]; // 28f2fc
extern const u16 sSamusPal_ChargingIceBeam_BothRows[4 * SUIT_COUNT * 16]; // 28f4fc

extern const u16 sSamusPal_SavingGame_Row0_Fusion[SUIT_COUNT * 16]; // 28f6fc
extern const u16 sSamusPal_SavingGame_Row0_Varia[SUIT_COUNT * 16]; // 28f77c
extern const u16 sSamusPal_SavingGame_Row0_Gravity[SUIT_COUNT * 16]; // 28f7fc
extern const u16 sSamusPal_SavingGame_Row0_SaX[SUIT_COUNT * 16]; // 28f87c
