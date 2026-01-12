#include "data/samus/samus_palette_data.h"
#include "macros.h"

// 0x28dd7c
const u16 sSamusPal_Default_Row0_Fusion[16] = INCBIN_U16("data/samus/palettes/default_row_0_fusion.pal");

// 0x28dd9c
const u16 sSamusPal_Default_Row0_Varia[16] = INCBIN_U16("data/samus/palettes/default_row_0_varia.pal");

// 0x28ddbc
const u16 sSamusPal_Default_Row0_Gravity[16] = INCBIN_U16("data/samus/palettes/default_row_0_gravity.pal");

// 0x28dddc
const u16 sSamusPal_Default_Row0_SaX[16] = INCBIN_U16("data/samus/palettes/default_row_0_sa_x.pal");

// 0x28ddfc
const u16 sSamusPal_Flashing_BothRows[16] = INCBIN_U16("data/samus/palettes/flashing_both_rows.pal");

// 0x28de1c
const u16 sSamusPal_Default_Row1[16] = INCBIN_U16("data/samus/palettes/default_row_1.pal");

// 0x28de3c
const u16 sSamusPal_ScrewAttacking_Row0[2 * 16] = INCBIN_U16("data/samus/palettes/screw_attacking_row0.pal");

// 0x28de7c
const u16 sSamusPal_ScrewAttacking_Row1[16] = INCBIN_U16("data/samus/palettes/screw_attacking_row_1.pal");

// 0x28de9c
const u16 sSamusPal_Speedboost0_BothRows[16] = INCBIN_U16("data/samus/palettes/speedboost_0_both_rows.pal");

// 0x28debc
const u16 sSamusPal_Speedboost1_BothRows[16] = INCBIN_U16("data/samus/palettes/speedboost_1_both_rows.pal");

// 0x28dedc
const u16 sSamusPal_Dying_Row0[16] = INCBIN_U16("data/samus/palettes/dying_row_0.pal");

// 0x28defc
const u16 sSamusPal_DyingFade_Row1[16 * 16] = INCBIN_U16("data/samus/palettes/dying_fade_row_1.pal");

// 0x28e0fc
const u16 sSamusPal_Frozen_Row0[2 * 16] = INCBIN_U16("data/samus/palettes/frozen_row_0.pal");

// 0x28e13c
const u16 sSamusPal_AbsorbX_BothRows[24 * 16] = INCBIN_U16("data/samus/palettes/absorb_x_both_rows.pal");

// 0x28e43c
static const u16 sSamusPal_LoadingSave_Fusion_0[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_0.pal");
// 0x28e45c
static const u16 sSamusPal_LoadingSave_Fusion_3[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_3.pal");
// 0x28e47c
static const u16 sSamusPal_LoadingSave_Fusion_5[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_5.pal");
// 0x28e49c
static const u16 sSamusPal_LoadingSave_Fusion_2[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_2.pal");
// 0x28e4bc
static const u16 sSamusPal_LoadingSave_Fusion_4[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_4.pal");
// 0x28e4dc
static const u16 sSamusPal_LoadingSave_Fusion_10[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_10.pal");
// 0x28e4fc
static const u16 sSamusPal_LoadingSave_Fusion_12[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_12.pal");
// 0x28e51c
static const u16 sSamusPal_LoadingSave_Fusion_14[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_14.pal");
// 0x28e53c
static const u16 sSamusPal_LoadingSave_Fusion_16[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_16.pal");
// 0x28e55c
static const u16 sSamusPal_LoadingSave_Fusion_18[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_18.pal");
// 0x28e57c
static const u16 sSamusPal_LoadingSave_Fusion_20[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_20.pal");
// 0x28e59c
static const u16 sSamusPal_LoadingSave_Fusion_22[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_22.pal");
// 0x28e5bc
static const u16 sSamusPal_LoadingSave_Fusion_24[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_24.pal");
// 0x28e5dc
static const u16 sSamusPal_LoadingSave_Fusion_26[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_26.pal");
// 0x28e5fc
static const u16 sSamusPal_LoadingSave_Fusion_11[16] = INCBIN_U16("data/samus/palettes/loading_save_fusion_11.pal");
// 0x28e61c
const u16 sSamusPal_LoadingSave_Varia_20[16] = INCBIN_U16("data/samus/palettes/loading_save_varia_20.pal");
// 0x28e63c
static const u16 sSamusPal_LoadingSave_Varia_22[16] = INCBIN_U16("data/samus/palettes/loading_save_varia_22.pal");
// 0x28e65c
static const u16 sSamusPal_LoadingSave_Varia_24[16] = INCBIN_U16("data/samus/palettes/loading_save_varia_24.pal");
// 0x28e67c
static const u16 sSamusPal_LoadingSave_Varia_26[16] = INCBIN_U16("data/samus/palettes/loading_save_varia_26.pal");
// 0x28e69c
static const u16 sSamusPal_LoadingSave_Varia_11[16] = INCBIN_U16("data/samus/palettes/loading_save_varia_11.pal");
// 0x28e6bc
static const u16 sSamusPal_LoadingSave_Gravity_20[16] = INCBIN_U16("data/samus/palettes/loading_save_gravity_20.pal");
// 0x28e6dc
static const u16 sSamusPal_LoadingSave_Gravity_22[16] = INCBIN_U16("data/samus/palettes/loading_save_gravity_22.pal");
// 0x28e6fc
static const u16 sSamusPal_LoadingSave_Gravity_24[16] = INCBIN_U16("data/samus/palettes/loading_save_gravity_24.pal");
// 0x28e71c
static const u16 sSamusPal_LoadingSave_Gravity_26[16] = INCBIN_U16("data/samus/palettes/loading_save_gravity_26.pal");
// 0x28e73c
static const u16 sSamusPal_LoadingSave_Gravity_11[16] = INCBIN_U16("data/samus/palettes/loading_save_gravity_11.pal");
// 0x28e75c
static const u16 sSamusPal_LoadingSave_SaX_0[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_0.pal");
// 0x28e77c
static const u16 sSamusPal_LoadingSave_SaX_3[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_3.pal");
// 0x28e79c
static const u16 sSamusPal_LoadingSave_SaX_5[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_5.pal");
// 0x28e7bc
static const u16 sSamusPal_LoadingSave_SaX_2[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_2.pal");
// 0x28e7dc
static const u16 sSamusPal_LoadingSave_SaX_4[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_4.pal");
// 0x28e7fc
static const u16 sSamusPal_LoadingSave_SaX_10[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_10.pal");
// 0x28e81c
static const u16 sSamusPal_LoadingSave_SaX_12[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_12.pal");
// 0x28e83c
static const u16 sSamusPal_LoadingSave_SaX_14[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_14.pal");
// 0x28e85c
static const u16 sSamusPal_LoadingSave_SaX_16[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_16.pal");
// 0x28e87c
static const u16 sSamusPal_LoadingSave_SaX_18[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_18.pal");
// 0x28e89c
static const u16 sSamusPal_LoadingSave_SaX_20[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_20.pal");
// 0x28e8bc
static const u16 sSamusPal_LoadingSave_SaX_22[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_22.pal");
// 0x28e8dc
static const u16 sSamusPal_LoadingSave_SaX_24[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_24.pal");
// 0x28e8fc
static const u16 sSamusPal_LoadingSave_SaX_26[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_26.pal");
// 0x28e91c
static const u16 sSamusPal_LoadingSave_SaX_11[16] = INCBIN_U16("data/samus/palettes/loading_save_sa_x_11.pal");

// 0x28e93c
const u16* const sSamusPalPointers_LoadingSave_Fusion[28] = {
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_3,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_5,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_12,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_14,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_16,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_18,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_20,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_22,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_24,
    sSamusPal_LoadingSave_Fusion_11,
    sSamusPal_LoadingSave_Fusion_26,
    sSamusPal_LoadingSave_Fusion_11,
};

// 0x28e9ac
const u16* const sSamusPalPointers_LoadingSave_Varia[28] = {
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_3,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_5,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Fusion_12,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Fusion_14,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Fusion_16,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Fusion_18,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Varia_20,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Varia_22,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Varia_24,
    sSamusPal_LoadingSave_Varia_11,
    sSamusPal_LoadingSave_Varia_26,
    sSamusPal_LoadingSave_Varia_11,
};

// 0x28ea1c
const u16* const sSamusPalPointers_LoadingSave_Gravity[28] = {
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_3,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_5,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_2,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Fusion_4,
    sSamusPal_LoadingSave_Fusion_10,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Fusion_12,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Fusion_14,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Fusion_16,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Fusion_18,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Gravity_20,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Gravity_22,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Gravity_24,
    sSamusPal_LoadingSave_Gravity_11,
    sSamusPal_LoadingSave_Gravity_26,
    sSamusPal_LoadingSave_Gravity_11,
};

// 0x28ea8c
const u16* const sSamusPalPointers_LoadingSave_SaX[28] = {
    sSamusPal_LoadingSave_SaX_0,
    sSamusPal_LoadingSave_Fusion_0,
    sSamusPal_LoadingSave_SaX_2,
    sSamusPal_LoadingSave_SaX_3,
    sSamusPal_LoadingSave_SaX_4,
    sSamusPal_LoadingSave_SaX_5,
    sSamusPal_LoadingSave_SaX_10,
    sSamusPal_LoadingSave_SaX_2,
    sSamusPal_LoadingSave_SaX_10,
    sSamusPal_LoadingSave_SaX_4,
    sSamusPal_LoadingSave_SaX_10,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_12,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_14,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_16,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_18,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_20,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_22,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_24,
    sSamusPal_LoadingSave_SaX_11,
    sSamusPal_LoadingSave_SaX_26,
    sSamusPal_LoadingSave_SaX_11,
};

// 0x28eafc
const u16 sSamusPal_ChargingNormalBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_normal_beam_both_rows.pal");
// 0x28ecfc
const u16 sSamusPal_ChargingChargeBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_charge_beam_both_rows.pal");
// 0x28eefc
const u16 sSamusPal_ChargingWideBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_wide_beam_both_rows.pal");
// 0x28f0fc
const u16 sSamusPal_ChargingPlasmaBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_plasma_beam_both_rows.pal");
// 0x28f2fc
const u16 sSamusPal_ChargingWaveBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_wave_beam_both_rows.pal");
// 0x28f4fc
const u16 sSamusPal_ChargingIceBeam_BothRows[4 * SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/charging_ice_beam_both_rows.pal");


// 0x28f6fc
const u16 sSamusPal_SavingGame_Row0_Fusion[SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/saving_game_row_0_fusion.pal");
// 0x28f77c
const u16 sSamusPal_SavingGame_Row0_Varia[SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/saving_game_row_0_varia.pal");
// 0x28f7fc
const u16 sSamusPal_SavingGame_Row0_Gravity[SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/saving_game_row_0_gravity.pal");
// 0x28f87c
const u16 sSamusPal_SavingGame_Row0_SaX[SUIT_COUNT * 16] = INCBIN_U16("data/samus/palettes/saving_game_row_0_sa_x.pal");


// Unused?
// 0x28f8fc
static const u16 sSamusPal_28f8fc[16] = INCBIN_U16("data/samus/palettes/28f8fc.pal");

// 0x28f91c
static const u16 sSamusPal_28f91c[16] = INCBIN_U16("data/samus/palettes/28f91c.pal");
