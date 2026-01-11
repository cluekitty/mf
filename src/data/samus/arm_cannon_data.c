#include "data/samus/arm_cannon_data.h"
#include "oam.h"
#include "macros.h"
#include "constants/samus.h"
#include "structs/samus.h"
#include "data/samus/samus_empty_data.h"

// 0x289994
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-32, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-16, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x2899a8
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x2899bc
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x2899d0
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x2899e4
static const u16 sArmCannonOam_Frame_2899e4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x2899f8
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a0c
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a20
static const u16 sArmCannonOam_Running_DiagonalUp_Left_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-36, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-20, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a34
static const u16 sArmCannonOam_Frame_289a34[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a48
static const u16 sArmCannonOam_Frame_289a48[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a5c
static const u16 sArmCannonOam_Running_Forward_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-17, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-1, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a70
static const u16 sArmCannonOam_Running_Forward_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a84
static const u16 sArmCannonOam_Running_Forward_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289a98
static const u16 sArmCannonOam_Running_Forward_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289aac
static const u16 sArmCannonOam_Running_Forward_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-18, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ac0
static const u16 sArmCannonOam_Frame_289ac0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-18, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ad4
static const u16 sArmCannonOam_Running_Forward_Left_Frame6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ae8
static const u16 sArmCannonOam_Running_Forward_Left_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-21, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-5, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289afc
static const u16 sArmCannonOam_Running_Forward_Left_Frame8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-21, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-5, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b10
static const u16 sArmCannonOam_Frame_289b10[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b24
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-31, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-15, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b38
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b4c
static const u16 sArmCannonOam_Frame_289b4c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b60
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b74
static const u16 sArmCannonOam_Frame_289b74[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-31, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-15, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b88
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-32, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-16, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289b9c
static const u16 sArmCannonOam_Frame_289b9c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289bb0
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289bc4
static const u16 sArmCannonOam_Running_DiagonalDown_Left_Frame8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289bd8
static const u16 sArmCannonOam_Frame_289bd8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-32, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-16, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289bec
static const u16 sArmCannonOam_Standing_Up_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c00
static const u16 sArmCannonOam_Frame_289c00[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c14
static const u16 sArmCannonOam_Frame_289c14[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c28
static const u16 sArmCannonOam_Shooting_Up_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c3c
static const u16 sArmCannonOam_Standing_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-36, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-20, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c50
static const u16 sArmCannonOam_Standing_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-36, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-20, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c64
static const u16 sArmCannonOam_Standing_DiagonalUp_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-36, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-20, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c78
static const u16 sArmCannonOam_Shooting_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289c8c
static const u16 sArmCannonOam_Standing_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ca0
static const u16 sArmCannonOam_Frame_289ca0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289cb4
static const u16 sArmCannonOam_Frame_289cb4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289cc8
static const u16 sArmCannonOam_Shooting_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-18, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289cdc
static const u16 sArmCannonOam_Standing_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289cf0
static const u16 sArmCannonOam_Frame_289cf0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d04
static const u16 sArmCannonOam_Frame_289d04[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d18
static const u16 sArmCannonOam_Shooting_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d2c
static const u16 sArmCannonOam_Crouching_Up_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d40
static const u16 sArmCannonOam_Crouching_Up_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d54
static const u16 sArmCannonOam_Crouching_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d68
static const u16 sArmCannonOam_Crouching_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d7c
static const u16 sArmCannonOam_Crouching_None_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289d90
static const u16 sArmCannonOam_Crouching_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-17, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-1, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289da4
static const u16 sArmCannonOam_Crouching_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289db8
static const u16 sArmCannonOam_Crouching_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289dcc
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(0, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(16, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(0, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289de0
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289df4
static const u16 sArmCannonOam_Standing_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e08
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e1c
static const u16 sArmCannonOam_Frame_289e1c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e30
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e44
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e58
static const u16 sArmCannonOam_Running_DiagonalUp_Right_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e6c
static const u16 sArmCannonOam_Frame_289e6c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e80
static const u16 sArmCannonOam_Frame_289e80[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289e94
static const u16 sArmCannonOam_Running_Forward_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-15, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(1, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ea8
static const u16 sArmCannonOam_Running_Forward_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ebc
static const u16 sArmCannonOam_Running_Forward_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ed0
static const u16 sArmCannonOam_Running_Forward_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ee4
static const u16 sArmCannonOam_Running_Forward_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-14, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(2, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ef8
static const u16 sArmCannonOam_Frame_289ef8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-14, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(2, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f0c
static const u16 sArmCannonOam_Running_Forward_Right_Frame6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f20
static const u16 sArmCannonOam_Running_Forward_Right_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(5, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(5, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f34
static const u16 sArmCannonOam_Running_Forward_Right_Frame8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f48
static const u16 sArmCannonOam_Frame_289f48[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f5c
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-1, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(15, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-1, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f70
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f84
static const u16 sArmCannonOam_Frame_289f84[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289f98
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289fac
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(0, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(16, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(0, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289fc0
static const u16 sArmCannonOam_Frame_289fc0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(0, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(16, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(0, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289fd4
static const u16 sArmCannonOam_Frame_289fd4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289fe8
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame7[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x289ffc
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a010
static const u16 sArmCannonOam_Running_DiagonalDown_Right_Frame9[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a024
static const u16 sArmCannonOam_Standing_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a032
static const u16 sArmCannonOam_Frame_28a032[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a040
static const u16 sArmCannonOam_Frame_28a040[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a04e
static const u16 sArmCannonOam_Shooting_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -47, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a05c
static const u16 sArmCannonOam_Frame_28a05c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a070
static const u16 sArmCannonOam_Frame_28a070[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a084
static const u16 sArmCannonOam_Frame_28a084[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a098
static const u16 sArmCannonOam_Shooting_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a0ac
static const u16 sArmCannonOam_Standing_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a0c0
static const u16 sArmCannonOam_Frame_28a0c0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a0d4
static const u16 sArmCannonOam_Frame_28a0d4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a0e8
static const u16 sArmCannonOam_Shooting_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a0fc
static const u16 sArmCannonOam_Standing_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a110
static const u16 sArmCannonOam_Frame_28a110[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a124
static const u16 sArmCannonOam_Frame_28a124[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a138
static const u16 sArmCannonOam_Shooting_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a14c
static const u16 sArmCannonOam_Crouching_Up_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -39, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a15a
static const u16 sArmCannonOam_Crouching_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -38, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a168
static const u16 sArmCannonOam_Crouching_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a17c
static const u16 sArmCannonOam_Crouching_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a190
static const u16 sArmCannonOam_Crouching_None_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a1a4
static const u16 sArmCannonOam_Crouching_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    #ifdef BUGFIX
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    #endif // BUGFIX
    OAM_ENTRY(1, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(11, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5f, 1, 0),
    #ifndef BUGFIX
    0
    #endif // !BUGFIX
};

// 0x28a1b8
static const u16 sArmCannonOam_Crouching_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a1cc
static const u16 sArmCannonOam_Crouching_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a1e0
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-7)
};

// 0x28a1e4
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame1 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-9)
};

// 0x28a1e8
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame2 = {
    .y = C_S8_2_S16(-28),
    .x = C_S9_2_S16(-12)
};

// 0x28a1ec
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame3 = {
    .y = C_S8_2_S16(-25),
    .x = C_S9_2_S16(-11)
};

// 0x28a1f0
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame4 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-9)
};

// 0x28a1f4
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame6 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(3)
};

// 0x28a1f8
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame7 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(0)
};

// 0x28a1fc
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame8 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-2)
};

// 0x28a200
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Left_Frame9 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-5)
};

// 0x28a204
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(-15)
};

// 0x28a208
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(-16)
};

// 0x28a20c
static const struct ArmCannonOffset sArmCannonOffset_Standing_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-18)
};

// 0x28a210
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame3 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(-18)
};

// 0x28a214
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame5 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(-16)
};

// 0x28a218
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame6 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(-17)
};

// 0x28a21c
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Left_Frame7 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-19)
};

// 0x28a220
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame0 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-15)
};

// 0x28a224
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame1 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-17)
};

// 0x28a228
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame2 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-18)
};

// 0x28a22c
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame3 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-18)
};

// 0x28a230
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame4 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-16)
};

// 0x28a234
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame6 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-17)
};

// 0x28a238
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame7 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-19)
};

// 0x28a23c
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Left_Frame8 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-19)
};

// 0x28a240
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-13)
};

// 0x28a244
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-15)
};

// 0x28a248
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame3 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-15)
};

// 0x28a24c
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame5 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-14)
};

// 0x28a250
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame7 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-16)
};

// 0x28a254
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Left_Frame8 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-16)
};

// 0x28a258
static const struct ArmCannonOffset sArmCannonOffset_Standing_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(-5)
};

// 0x28a25c
static const struct ArmCannonOffset sArmCannonOffset_Shooting_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-45),
    .x = C_S9_2_S16(-5)
};

// 0x28a260
static const struct ArmCannonOffset sArmCannonOffset_Shooting_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-17)
};

// 0x28a264
static const struct ArmCannonOffset sArmCannonOffset_Standing_None_Left_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-18)
};

// 0x28a268
static const struct ArmCannonOffset sArmCannonOffset_Shooting_None_Left_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-16)
};

// 0x28a26c
static const struct ArmCannonOffset sArmCannonOffset_Standing_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(-17)
};

// 0x28a270
static const struct ArmCannonOffset sArmCannonOffset_Shooting_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-14),
    .x = C_S9_2_S16(-16)
};

// 0x28a274
static const struct ArmCannonOffset sArmCannonOffset_Crouching_Up_Left_Frame1 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(-4)
};

// 0x28a278
static const struct ArmCannonOffset sArmCannonOffset_Crouching_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-5)
};

// 0x28a27c
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(-17)
};

// 0x28a280
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(-16)
};

// 0x28a284
static const struct ArmCannonOffset sArmCannonOffset_Crouching_None_Left_Frame1 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(-17)
};

// 0x28a288
static const struct ArmCannonOffset sArmCannonOffset_Crouching_None_Left_Frame0 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(-15)
};

// 0x28a28c
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(-17)
};

// 0x28a290
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(-16)
};

// 0x28a294
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(11)
};

// 0x28a298
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame1 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(7)
};

// 0x28a29c
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame2 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-2)
};

// 0x28a2a0
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame3 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(7)
};

// 0x28a2a4
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame4 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(9)
};

// 0x28a2a8
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame5 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(10)
};

// 0x28a2ac
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame6 = {
    .y = C_S8_2_S16(-26),
    .x = C_S9_2_S16(12)
};

// 0x28a2b0
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame7 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(14)
};

// 0x28a2b4
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame8 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(13)
};

// 0x28a2b8
static const struct ArmCannonOffset sArmCannonOffset_Running_None_Right_Frame9 = {
    .y = C_S8_2_S16(-25),
    .x = C_S9_2_S16(13)
};

// 0x28a2bc
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(15)
};

// 0x28a2c0
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame1 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(16)
};

// 0x28a2c4
static const struct ArmCannonOffset sArmCannonOffset_Standing_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(18)
};

// 0x28a2c8
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame3 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(18)
};

// 0x28a2cc
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame5 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(16)
};

// 0x28a2d0
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame6 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(17)
};

// 0x28a2d4
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalUp_Right_Frame7 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(19)
};

// 0x28a2d8
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame0 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(15)
};

// 0x28a2dc
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame1 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(17)
};

// 0x28a2e0
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame2 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(18)
};

// 0x28a2e4
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame3 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(18)
};

// 0x28a2e8
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame4 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(16)
};

// 0x28a2ec
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame6 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(17)
};

// 0x28a2f0
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame7 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(19)
};

// 0x28a2f4
static const struct ArmCannonOffset sArmCannonOffset_Running_Forward_Right_Frame8 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(19)
};

// 0x28a2f8
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(13)
};

// 0x28a2fc
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame1 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(15)
};

// 0x28a300
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame3 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(15)
};

// 0x28a304
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame4 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(14)
};

// 0x28a308
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame7 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(16)
};

// 0x28a30c
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame8 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(16)
};

// 0x28a310
static const struct ArmCannonOffset sArmCannonOffset_Running_DiagonalDown_Right_Frame9 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(15)
};

// 0x28a314
static const struct ArmCannonOffset sArmCannonOffset_Standing_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(5)
};

// 0x28a318
static const struct ArmCannonOffset sArmCannonOffset_Shooting_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-45),
    .x = C_S9_2_S16(5)
};

// 0x28a31c
static const struct ArmCannonOffset sArmCannonOffset_Shooting_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(17)
};

// 0x28a320
static const struct ArmCannonOffset sArmCannonOffset_Standing_None_Right_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(18)
};

// 0x28a324
static const struct ArmCannonOffset sArmCannonOffset_Shooting_None_Right_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(17)
};

// 0x28a328
static const struct ArmCannonOffset sArmCannonOffset_Standing_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(17)
};

// 0x28a32c
static const struct ArmCannonOffset sArmCannonOffset_Shooting_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(16)
};

// 0x28a330
static const struct ArmCannonOffset sArmCannonOffset_Crouching_Up_Right_Frame1 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(4)
};

// 0x28a334
static const struct ArmCannonOffset sArmCannonOffset_Crouching_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(4)
};

// 0x28a338
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalUp_Right_Frame1 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(16)
};

// 0x28a33c
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(15)
};

// 0x28a340
static const struct ArmCannonOffset sArmCannonOffset_Crouching_None_Right_Frame1 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(17)
};

// 0x28a344
static const struct ArmCannonOffset sArmCannonOffset_Crouching_None_Right_Frame0 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(15)
};

// 0x28a348
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalDown_Right_Frame1 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(17)
};

// 0x28a34c
static const struct ArmCannonOffset sArmCannonOffset_Crouching_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(16)
};

// 0x28a350
static const struct ArmCannonOffset sArmCannonOffset_Skidding_Left_Frame0 = {
    .y = C_S8_2_S16(-28),
    .x = C_S9_2_S16(-11)
};

// 0x28a354
static const struct ArmCannonOffset sArmCannonOffset_28a7bc_Frame23 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-10)
};

// 0x28a358
static const struct ArmCannonOffset sArmCannonOffset_28a7bc_Frame28 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-1)
};

// 0x28a35c
static const struct ArmCannonOffset sArmCannonOffset_28a35c = {
    .y = C_S8_2_S16(-14),
    .x = C_S9_2_S16(6),
};

// 0x28a360
static const struct ArmCannonOffset sArmCannonOffset_Skidding_Right_Frame0 = {
    .y = C_S8_2_S16(-26),
    .x = C_S9_2_S16(13)
};

// 0x28a364
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Left_Frame0 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(-12)
};

// 0x28a368
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Left_Frame1 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(-11)
};

// 0x28a36c
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Left_Frame2 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(-10)
};

// 0x28a370
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Right_Frame0 = {
    .y = C_S8_2_S16(-6),
    .x = C_S9_2_S16(3)
};

// 0x28a374
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Right_Frame1 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(0)
};

// 0x28a378
static const struct ArmCannonOffset sArmCannonOffset_HitByOmegaMetroid_Right_Frame2 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(-2)
};

// 0x28a37c
const struct ArmCannonAnimData sArmCannonAnim_Running_None_Left[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a3cc
const struct ArmCannonAnimData sArmCannonAnim_Running_DiagonalUp_Left[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame5,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame5
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame6,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame6
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame7,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Left_Frame6,
        .pOam = sArmCannonOam_Running_DiagonalUp_Left_Frame6
    },
};

// 0x28a41c
const struct ArmCannonAnimData sArmCannonAnim_Running_Forward_Left[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame0,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame1,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame2,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame3,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame4,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame4,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame6,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame6
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame7,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame8,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame8
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Left_Frame6,
        .pOam = sArmCannonOam_Running_Forward_Left_Frame6
    },
};

// 0x28a46c
const struct ArmCannonAnimData sArmCannonAnim_Running_DiagonalDown_Left[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame5,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame5
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame7,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame8,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame8
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Left_Frame5,
        .pOam = sArmCannonOam_Running_DiagonalDown_Left_Frame5
    },
};

// 0x28a4bc
const struct ArmCannonAnimData sArmCannonAnim_Standing_Up_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Left_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Left_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Left_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Left_Frame0
    },
};

// 0x28a4d4
const struct ArmCannonAnimData sArmCannonAnim_Shooting_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_Up_Left_Frame0,
        .pOam = sArmCannonOam_Shooting_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Left_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Left_Frame0
    },
};

// 0x28a4e4
const struct ArmCannonAnimData sArmCannonAnim_Standing_DiagonalUp_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Left_Frame2
    },
};

// 0x28a4fc
const struct ArmCannonAnimData sArmCannonAnim_Shooting_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Shooting_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Left_Frame0
    },
};

// 0x28a50c
const struct ArmCannonAnimData sArmCannonAnim_Standing_None_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_None_Left_Frame0,
        .pOam = sArmCannonOam_Standing_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Left_Frame0,
        .pOam = sArmCannonOam_Standing_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Left_Frame0,
        .pOam = sArmCannonOam_Standing_None_Left_Frame0
    },
};

// 0x28a524
const struct ArmCannonAnimData sArmCannonAnim_Shooting_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_None_Left_Frame0,
        .pOam = sArmCannonOam_Shooting_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Left_Frame0,
        .pOam = sArmCannonOam_Standing_None_Left_Frame0
    },
};

// 0x28a534
const struct ArmCannonAnimData sArmCannonAnim_Standing_DiagonalDown_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Left_Frame0
    },
};

// 0x28a54c
const struct ArmCannonAnimData sArmCannonAnim_Shooting_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Shooting_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Left_Frame0
    },
};

// 0x28a55c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_Up_Left_Frame0,
        .pOam = sArmCannonOam_Crouching_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_Up_Left_Frame1,
        .pOam = sArmCannonOam_Crouching_Up_Left_Frame1
    },
};

// 0x28a56c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Crouching_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalUp_Left_Frame1,
        .pOam = sArmCannonOam_Crouching_DiagonalUp_Left_Frame1
    },
};

// 0x28a57c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_None_Left_Frame0,
        .pOam = sArmCannonOam_Crouching_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_None_Left_Frame1,
        .pOam = sArmCannonOam_Crouching_None_Left_Frame1
    },
};

// 0x28a58c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Crouching_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Crouching_DiagonalDown_Left_Frame1
    },
};

// 0x28a59c
const struct ArmCannonAnimData sArmCannonAnim_Running_None_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a5ec
const struct ArmCannonAnimData sArmCannonAnim_Running_DiagonalUp_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame5,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame5
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame6,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame6
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame7,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalUp_Right_Frame6,
        .pOam = sArmCannonOam_Running_DiagonalUp_Right_Frame6
    },
};

// 0x28a63c
const struct ArmCannonAnimData sArmCannonAnim_Running_Forward_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame0,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame1,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame2,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame3,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame4,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame4,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame6,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame6
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame7,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame8,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame8
    },
    {
        .pOffset = &sArmCannonOffset_Running_Forward_Right_Frame6,
        .pOam = sArmCannonOam_Running_Forward_Right_Frame6
    },
};

// 0x28a68c
const struct ArmCannonAnimData sArmCannonAnim_Running_DiagonalDown_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame3,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame4,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame4,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame7,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame7
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame8,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame8
    },
    {
        .pOffset = &sArmCannonOffset_Running_DiagonalDown_Right_Frame9,
        .pOam = sArmCannonOam_Running_DiagonalDown_Right_Frame9
    },
};

// 0x28a6dc
const struct ArmCannonAnimData sArmCannonAnim_Standing_Up_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Right_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Right_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Right_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Right_Frame0
    },
};

// 0x28a6f4
const struct ArmCannonAnimData sArmCannonAnim_Shooting_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_Up_Right_Frame0,
        .pOam = sArmCannonOam_Shooting_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_Up_Right_Frame0,
        .pOam = sArmCannonOam_Standing_Up_Right_Frame0
    },
};

// 0x28a704
const struct ArmCannonAnimData sArmCannonAnim_Standing_DiagonalUp_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Right_Frame0
    },
};

// 0x28a71c
const struct ArmCannonAnimData sArmCannonAnim_Shooting_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Shooting_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalUp_Right_Frame0
    },
};

// 0x28a72c
const struct ArmCannonAnimData sArmCannonAnim_Standing_None_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_None_Right_Frame0,
        .pOam = sArmCannonOam_Standing_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Right_Frame0,
        .pOam = sArmCannonOam_Standing_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Right_Frame0,
        .pOam = sArmCannonOam_Standing_None_Right_Frame0
    },
};

// 0x28a744
const struct ArmCannonAnimData sArmCannonAnim_Shooting_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_None_Right_Frame0,
        .pOam = sArmCannonOam_Shooting_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_None_Right_Frame0,
        .pOam = sArmCannonOam_Standing_None_Right_Frame0
    },
};

// 0x28a754
const struct ArmCannonAnimData sArmCannonAnim_Standing_DiagonalDown_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Right_Frame0
    },
};

// 0x28a76c
const struct ArmCannonAnimData sArmCannonAnim_Shooting_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shooting_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Shooting_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Standing_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Standing_DiagonalDown_Right_Frame0
    },
};

// 0x28a77c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_Up_Right_Frame0,
        .pOam = sArmCannonOam_Crouching_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_Up_Right_Frame1,
        .pOam = sArmCannonOam_Crouching_Up_Right_Frame1
    },
};

// 0x28a78c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Crouching_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalUp_Right_Frame1,
        .pOam = sArmCannonOam_Crouching_DiagonalUp_Right_Frame1
    },
};

// 0x28a79c
const struct ArmCannonAnimData sArmCannonAnim_Crouching_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_None_Right_Frame0,
        .pOam = sArmCannonOam_Crouching_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_None_Right_Frame1,
        .pOam = sArmCannonOam_Crouching_None_Right_Frame1
    },
};

// 0x28a7ac
const struct ArmCannonAnimData sArmCannonAnim_Crouching_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Crouching_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Crouching_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Crouching_DiagonalDown_Right_Frame1
    },
};

// 0x28a7bc
const struct ArmCannonAnimData sArmCannonAnim_28a7bc[40] = {
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28a7bc_Frame23,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28a7bc_Frame28,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Running_None_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a8fc
const struct ArmCannonAnimData sArmCannonAnim_Skidding_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Skidding_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Skidding_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a90c
const struct ArmCannonAnimData sArmCannonAnim_Skidding_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Skidding_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Skidding_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a91c
const struct ArmCannonAnimData sArmCannonAnim_HitByOmegaMetroid_Left[8] = {
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a95c
const struct ArmCannonAnimData sArmCannonAnim_HitByOmegaMetroid_Right[8] = {
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HitByOmegaMetroid_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28a99c
static const u16 sArmCannonOam_Frame_28a99c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -49, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -49, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a9b0
static const u16 sArmCannonOam_MidAir_Up_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -50, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -50, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a9c4
static const u16 sArmCannonOam_MidAir_Up_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a9d8
static const u16 sArmCannonOam_MidAir_Up_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28a9ec
static const u16 sArmCannonOam_MidAir_Up_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa00
static const u16 sArmCannonOam_MidAir_Up_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa14
static const u16 sArmCannonOam_Landing_Up_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa28
static const u16 sArmCannonOam_MidAir_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa3c
static const u16 sArmCannonOam_MidAir_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa50
static const u16 sArmCannonOam_Frame_28aa50[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa64
static const u16 sArmCannonOam_MidAir_DiagonalUp_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa78
static const u16 sArmCannonOam_MidAir_DiagonalUp_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aa8c
static const u16 sArmCannonOam_MidAir_DiagonalUp_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aaa0
static const u16 sArmCannonOam_Landing_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aab4
static const u16 sArmCannonOam_Landing_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aac8
static const u16 sArmCannonOam_Frame_28aac8[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aadc
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aaf0
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab04
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-18, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab18
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab2c
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab40
static const u16 sArmCannonOam_MidAir_Forward_Left_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab54
static const u16 sArmCannonOam_Landing_Forward_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-18, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab68
static const u16 sArmCannonOam_Landing_Forward_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab7c
static const u16 sArmCannonOam_Frame_28ab7c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ab90
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aba4
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28abb8
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28abcc
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28abe0
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28abf4
static const u16 sArmCannonOam_MidAir_DiagonalDown_Left_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac08
static const u16 sArmCannonOam_Landing_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-33, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-17, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac1c
static const u16 sArmCannonOam_Landing_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac30
static const u16 sArmCannonOam_Frame_28ac30[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -45, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac44
static const u16 sArmCannonOam_Landing_DiagonalDown_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-36, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-20, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac58
static const u16 sArmCannonOam_Landing_DiagonalDown_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-17, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-1, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac6c
static const u16 sArmCannonOam_Frame_28ac6c[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-34, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-18, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac80
static const u16 sArmCannonOam_MidAir_Down_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ac94
static const u16 sArmCannonOam_Frame_28ac94[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-21, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aca8
static const u16 sArmCannonOam_Frame_28aca8[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -49, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28acb6
static const u16 sArmCannonOam_MidAir_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -50, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28acc4
static const u16 sArmCannonOam_MidAir_Up_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -46, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28acd2
static const u16 sArmCannonOam_MidAir_Up_Right_Frame2[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -41, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ace0
static const u16 sArmCannonOam_Landing_Up_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -45, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28acee
static const u16 sArmCannonOam_MidAir_Up_Right_Frame4[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28acfc
static const u16 sArmCannonOam_Frame_28acfc[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad0a
static const u16 sArmCannonOam_Landing_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-10, -41, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-2, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad18
static const u16 sArmCannonOam_Frame_28ad18[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -45, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad26
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad3a
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -48, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-13, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad4e
static const u16 sArmCannonOam_Frame_28ad4e[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad62
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad76
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -44, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad8a
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -47, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ad9e
static const u16 sArmCannonOam_MidAir_DiagonalUp_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -49, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28adb2
static const u16 sArmCannonOam_Landing_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28adc6
static const u16 sArmCannonOam_Landing_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28adda
static const u16 sArmCannonOam_Frame_28adda[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28adee
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae02
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae16
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-14, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(2, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae2a
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae3e
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae52
static const u16 sArmCannonOam_MidAir_Forward_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae66
static const u16 sArmCannonOam_Landing_Forward_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-14, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(2, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae7a
static const u16 sArmCannonOam_Landing_Forward_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ae8e
static const u16 sArmCannonOam_Frame_28ae8e[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aea2
static const u16 sArmCannonOam_MidAir_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aeb6
static const u16 sArmCannonOam_Frame_28aeb6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aeca
static const u16 sArmCannonOam_MidAir_DiagonalDown_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aede
static const u16 sArmCannonOam_MidAir_DiagonalDown_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28aef2
static const u16 sArmCannonOam_MidAir_DiagonalDown_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af06
static const u16 sArmCannonOam_MidAir_DiagonalDown_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af1a
static const u16 sArmCannonOam_Landing_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(1, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(17, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af2e
static const u16 sArmCannonOam_Landing_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af42
static const u16 sArmCannonOam_Frame_28af42[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -45, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af50
static const u16 sArmCannonOam_Landing_DiagonalDown_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -46, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-12, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af64
static const u16 sArmCannonOam_Landing_DiagonalDown_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-15, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(1, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af78
static const u16 sArmCannonOam_Frame_28af78[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af8c
static const u16 sArmCannonOam_MidAir_Down_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28af9a
static const u16 sArmCannonOam_Frame_28af9a[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-11, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28afa8
static const struct ArmCannonOffset sArmCannonOffset_DelayBeforeShinesparking_Left_Frame0 = {
    .y = C_S8_2_S16(-25),
    .x = C_S9_2_S16(-10)
};

// 0x28afac
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Left_Frame0 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-14)
};

// 0x28afb0
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Left_Frame1 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-13)
};

// 0x28afb4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Left_Frame2 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-12)
};

// 0x28afb8
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Left_Frame4 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-12)
};

// 0x28afbc
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Left_Frame5 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-12)
};

// 0x28afc0
static const struct ArmCannonOffset sArmCannonOffset_Landing_None_Left_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(-11)
};

// 0x28afc4
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame2 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-11)
};

// 0x28afc8
static const struct ArmCannonOffset sArmCannonOffset_28afc8 = {
    .y = C_S8_2_S16(-47),
    .x = C_S9_2_S16(-5),
};

// 0x28afcc
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-42),
    .x = C_S9_2_S16(-5)
};

// 0x28afd0
static const struct ArmCannonOffset sArmCannonOffset_28afd0 = {
    .y = C_S8_2_S16(-44),
    .x = C_S9_2_S16(-5),
};

// 0x28afd4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Up_Left_Frame2 = {
    .y = C_S8_2_S16(-40),
    .x = C_S9_2_S16(-5)
};

// 0x28afd8
static const struct ArmCannonOffset sArmCannonOffset_Landing_Up_Left_Frame1 = {
    .y = C_S8_2_S16(-43),
    .x = C_S9_2_S16(-5)
};

// 0x28afdc
static const struct ArmCannonOffset sArmCannonOffset_28afdc = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(-5),
};

// 0x28afe0
static const struct ArmCannonOffset sArmCannonOffset_Landing_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(-5)
};

// 0x28afe4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(-16)
};

// 0x28afe8
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(-17)
};

// 0x28afec
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Left_Frame2 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(-15)
};

// 0x28aff0
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Left_Frame3 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(-16)
};

// 0x28aff4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Left_Frame4 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-16)
};

// 0x28aff8
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-28),
    .x = C_S9_2_S16(-15)
};

// 0x28affc
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-32),
    .x = C_S9_2_S16(-16)
};

// 0x28b000
static const struct ArmCannonOffset sArmCannonOffset_28b000 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(-17),
};

// 0x28b004
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame0 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-18)
};

// 0x28b008
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame1 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-17)
};

// 0x28b00c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame2 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(-16)
};

// 0x28b010
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame3 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-17)
};

// 0x28b014
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame4 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-17)
};

// 0x28b018
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Left_Frame5 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-18)
};

// 0x28b01c
static const struct ArmCannonOffset sArmCannonOffset_Landing_Forward_Left_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-16)
};

// 0x28b020
static const struct ArmCannonOffset sArmCannonOffset_Landing_Forward_Left_Frame1 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(-17)
};

// 0x28b024
static const struct ArmCannonOffset sArmCannonOffset_28b024 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-15),
};

// 0x28b028
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-16)
};

// 0x28b02c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Left_Frame2 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(-15)
};

// 0x28b030
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Left_Frame3 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-16)
};

// 0x28b034
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-15)
};

// 0x28b038
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(-16)
};

// 0x28b03c
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Left_Frame3 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(-18)
};

// 0x28b040
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Left_Frame4 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(-15)
};

// 0x28b044
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Down_Left_Frame0 = {
    .y = C_S8_2_S16(-2),
    .x = C_S9_2_S16(-5)
};

// 0x28b048
static const struct ArmCannonOffset sArmCannonOffset_DelayBeforeShinesparking_Right_Frame0 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(10)
};

// 0x28b04c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame0 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(13)
};

// 0x28b050
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame1 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(11)
};

// 0x28b054
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame2 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(11)
};

// 0x28b058
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame3 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(11)
};

// 0x28b05c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame4 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(12)
};

// 0x28b060
static const struct ArmCannonOffset sArmCannonOffset_MidAir_None_Right_Frame5 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(12)
};

// 0x28b064
static const struct ArmCannonOffset sArmCannonOffset_Landing_None_Right_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(11)
};

// 0x28b068
static const struct ArmCannonOffset sArmCannonOffset_28b068 = {
    .y = C_S8_2_S16(-47),
    .x = C_S9_2_S16(5),
};

// 0x28b06c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-42),
    .x = C_S9_2_S16(5)
};

// 0x28b070
static const struct ArmCannonOffset sArmCannonOffset_28b070 = {
    .y = C_S8_2_S16(-44),
    .x = C_S9_2_S16(5),
};

// 0x28b074
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Up_Right_Frame2 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(5)
};

// 0x28b078
static const struct ArmCannonOffset sArmCannonOffset_Landing_Up_Right_Frame1 = {
    .y = C_S8_2_S16(-43),
    .x = C_S9_2_S16(5)
};

// 0x28b07c
static const struct ArmCannonOffset sArmCannonOffset_28b07c = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(5),
};

// 0x28b080
static const struct ArmCannonOffset sArmCannonOffset_Landing_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(6)
};

// 0x28b084
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame1 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(16)
};

// 0x28b088
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(17)
};

// 0x28b08c
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame2 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(15)
};

// 0x28b090
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame3 = {
    .y = C_S8_2_S16(-34),
    .x = C_S9_2_S16(16)
};

// 0x28b094
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame4 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(16)
};

// 0x28b098
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalUp_Right_Frame5 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(16)
};

// 0x28b09c
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-28),
    .x = C_S9_2_S16(15)
};

// 0x28b0a0
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalUp_Right_Frame1 = {
    .y = C_S8_2_S16(-32),
    .x = C_S9_2_S16(16)
};

// 0x28b0a4
static const struct ArmCannonOffset sArmCannonOffset_28b0a4 = {
    .y = C_S8_2_S16(-22),
    .x = C_S9_2_S16(17),
};

// 0x28b0a8
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame0 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(18)
};

// 0x28b0ac
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame1 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(17)
};

// 0x28b0b0
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame2 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(16)
};

// 0x28b0b4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame3 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(17)
};

// 0x28b0b8
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame4 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(17)
};

// 0x28b0bc
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Forward_Right_Frame5 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(18)
};

// 0x28b0c0
static const struct ArmCannonOffset sArmCannonOffset_Landing_Forward_Right_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(16)
};

// 0x28b0c4
static const struct ArmCannonOffset sArmCannonOffset_Landing_Forward_Right_Frame1 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(17)
};

// 0x28b0c8
static const struct ArmCannonOffset sArmCannonOffset_28b0c8 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(15),
};

// 0x28b0cc
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(16)
};

// 0x28b0d0
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Right_Frame2 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(15)
};

// 0x28b0d4
static const struct ArmCannonOffset sArmCannonOffset_MidAir_DiagonalDown_Right_Frame3 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(16)
};

// 0x28b0d8
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(15)
};

// 0x28b0dc
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Right_Frame1 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(16)
};

// 0x28b0e0
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Right_Frame3 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(18)
};

// 0x28b0e4
static const struct ArmCannonOffset sArmCannonOffset_Landing_DiagonalDown_Right_Frame4 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(15)
};

// 0x28b0e8
static const struct ArmCannonOffset sArmCannonOffset_MidAir_Down_Right_Frame0 = {
    .y = C_S8_2_S16(-2),
    .x = C_S9_2_S16(5)
};

// 0x28b0ec
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame0 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(0)
};

// 0x28b0f0
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame1 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(7)
};

// 0x28b0f4
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame2 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(10)
};

// 0x28b0f8
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame3 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(6)
};

// 0x28b0fc
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame4 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(0)
};

// 0x28b100
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame5 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(-7)
};

// 0x28b104
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame6 = {
    .y = C_S8_2_S16(-14),
    .x = C_S9_2_S16(-10)
};

// 0x28b108
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Left_Frame7 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(-6)
};

// 0x28b10c
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame0 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(3)
};

// 0x28b110
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame1 = {
    .y = C_S8_2_S16(-6),
    .x = C_S9_2_S16(-8)
};

// 0x28b114
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame3 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-8)
};

// 0x28b118
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame4 = {
    .y = C_S8_2_S16(-23),
    .x = C_S9_2_S16(-3)
};

// 0x28b11c
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame5 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(8)
};

// 0x28b120
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame6 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(10)
};

// 0x28b124
static const struct ArmCannonOffset sArmCannonOffset_Spinning_Right_Frame7 = {
    .y = C_S8_2_S16(-5),
    .x = C_S9_2_S16(8)
};

// 0x28b128
static const struct ArmCannonOffset sArmCannonOffset_StartingSpinJump_Left_Frame0 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(-11)
};

// 0x28b12c
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Upwards_Left_Frame0 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(-4)
};

// 0x28b130
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Upwards_Left_Frame1 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(-2)
};

// 0x28b134
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Upwards_Right_Frame0 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-2)
};

// 0x28b138
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Upwards_Right_Frame1 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(-6)
};

// 0x28b13c
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Sideways_Left_Frame0 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(5)
};

// 0x28b140
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Sideways_Left_Frame1 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(7)
};

// 0x28b144
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Sideways_Right_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-10)
};

// 0x28b148
static const struct ArmCannonOffset sArmCannonOffset_Shinesparking_Sideways_Right_Frame1 = {
    .y = C_S8_2_S16(-26),
    .x = C_S9_2_S16(-13)
};

// 0x28b14c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_None_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b17c
const struct ArmCannonAnimData sArmCannonAnim_Landing_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b18c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Up_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame2,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame4
    },
};

// 0x28b1bc
const struct ArmCannonAnimData sArmCannonAnim_Landing_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Left_Frame0,
        .pOam = sArmCannonOam_Landing_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Left_Frame1,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame3
    },
};

// 0x28b1cc
const struct ArmCannonAnimData sArmCannonAnim_MidAir_DiagonalUp_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame1,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame3,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame4,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Left_Frame4,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Left_Frame4
    },
};

// 0x28b1fc
const struct ArmCannonAnimData sArmCannonAnim_Landing_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_Landing_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalUp_Left_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalUp_Left_Frame1
    },
};

// 0x28b20c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Forward_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame1,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame2,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame3,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame4,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame5,
        .pOam = sArmCannonOam_MidAir_Forward_Left_Frame5
    },
};

// 0x28b23c
const struct ArmCannonAnimData sArmCannonAnim_Landing_Forward_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Left_Frame0,
        .pOam = sArmCannonOam_Landing_Forward_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Left_Frame1,
        .pOam = sArmCannonOam_Landing_Forward_Left_Frame1
    },
};

// 0x28b24c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_DiagonalDown_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Left_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Left_Frame3,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Left_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Left_Frame5
    },
};

// 0x28b27c
const struct ArmCannonAnimData sArmCannonAnim_Landing_DiagonalDown_Left[7] = {
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Left_Frame1,
        .pOam = sArmCannonOam_MidAir_Up_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Left_Frame3,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Left_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Left_Frame4,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Left_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Left_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
};

// 0x28b2b4
const struct ArmCannonAnimData sArmCannonAnim_MidAir_None_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b2e4
const struct ArmCannonAnimData sArmCannonAnim_Landing_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Landing_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b2f4
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Up_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame2,
        .pOam = sArmCannonOam_MidAir_Up_Right_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame0,
        .pOam = sArmCannonOam_Landing_Up_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Up_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Up_Right_Frame4
    },
};

// 0x28b324
const struct ArmCannonAnimData sArmCannonAnim_Landing_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Right_Frame0,
        .pOam = sArmCannonOam_Landing_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Right_Frame1,
        .pOam = sArmCannonOam_Landing_Up_Right_Frame1
    },
};

// 0x28b334
const struct ArmCannonAnimData sArmCannonAnim_MidAir_DiagonalUp_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame1,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame3,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame4,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalUp_Right_Frame5,
        .pOam = sArmCannonOam_MidAir_DiagonalUp_Right_Frame5
    },
};

// 0x28b364
const struct ArmCannonAnimData sArmCannonAnim_Landing_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_Landing_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalUp_Right_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalUp_Right_Frame1
    },
};

// 0x28b374
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Forward_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame1,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame2,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame3,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame4,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame5,
        .pOam = sArmCannonOam_MidAir_Forward_Right_Frame5
    },
};

// 0x28b3a4
const struct ArmCannonAnimData sArmCannonAnim_Landing_Forward_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Right_Frame0,
        .pOam = sArmCannonOam_Landing_Forward_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Right_Frame1,
        .pOam = sArmCannonOam_Landing_Forward_Right_Frame1
    },
};

// 0x28b3b4
const struct ArmCannonAnimData sArmCannonAnim_MidAir_DiagonalDown_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Right_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame2
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_DiagonalDown_Right_Frame3,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Forward_Right_Frame2,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Forward_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_DiagonalDown_Right_Frame5
    },
};

// 0x28b3e4
const struct ArmCannonAnimData sArmCannonAnim_Landing_DiagonalDown_Right[7] = {
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Landing_Up_Right_Frame1,
        .pOam = sArmCannonOam_Landing_Up_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Right_Frame3,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Right_Frame3
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Right_Frame4,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Right_Frame4
    },
    {
        .pOffset = &sArmCannonOffset_Landing_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_Landing_DiagonalDown_Right_Frame1
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
};

// 0x28b41c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Down_Left[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Left_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Left_Frame0
    },
};

// 0x28b44c
const struct ArmCannonAnimData sArmCannonAnim_MidAir_Down_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_Down_Right_Frame0,
        .pOam = sArmCannonOam_MidAir_Down_Right_Frame0
    },
};

// 0x28b47c
const struct ArmCannonAnimData sArmCannonAnim_Spinning_Left[8] = {
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b4bc
const struct ArmCannonAnimData sArmCannonAnim_Spinning_Right[8] = {
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b4fc
const struct ArmCannonAnimData sArmCannonAnim_StartingSpinJump_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_StartingSpinJump_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b504
const struct ArmCannonAnimData sArmCannonAnim_StartingSpinJump_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b50c
const struct ArmCannonAnimData sArmCannonAnim_DelayBeforeShinesparking_Left[4] = {
    {
        .pOffset = &sArmCannonOffset_DelayBeforeShinesparking_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b52c
const struct ArmCannonAnimData sArmCannonAnim_Shinesparking_Upwards_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b53c
const struct ArmCannonAnimData sArmCannonAnim_DelayBeforeShinesparking_Right[4] = {
    {
        .pOffset = &sArmCannonOffset_DelayBeforeShinesparking_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MidAir_None_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b55c
const struct ArmCannonAnimData sArmCannonAnim_Shinesparking_Upwards_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b56c
const struct ArmCannonAnimData sArmCannonAnim_Shinesparking_Sideways_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b57c
const struct ArmCannonAnimData sArmCannonAnim_Shinesparking_Sideways_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b58c
const struct ArmCannonAnimData sArmCannonAnim_DelayAfterShinesparking_Upwards_Left[9] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b5d4
const struct ArmCannonAnimData sArmCannonAnim_DelayAfterShinesparking_Upwards_Right[9] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Upwards_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b61c
const struct ArmCannonAnimData sArmCannonAnim_DelayAfterShinesparking_Sideways_Left[9] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Left_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b664
const struct ArmCannonAnimData sArmCannonAnim_DelayAfterShinesparking_Sideways_Right[9] = {
    {
        .pOffset = &sArmCannonOffset_Shinesparking_Sideways_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Spinning_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b6ac
static const u16 sArmCannonOam_Landing_9_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b6c0
static const u16 sArmCannonOam_Landing_9_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -39, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b6ce
static const u16 sArmCannonOam_Landing_7_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b6e2
static const u16 sArmCannonOam_Landing_7_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(2, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(18, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(2, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b6f6
static const u16 sArmCannonOam_Landing_5_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b70a
static const u16 sArmCannonOam_Landing_5_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -12, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b71e
static const u16 sArmCannonOam_Landing_8_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-35, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-19, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b732
static const u16 sArmCannonOam_Landing_8_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(3, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(19, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b746
static const u16 sArmCannonOam_BeingRecharged_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b75a
static const u16 sArmCannonOam_Frame_28b75a[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b76e
static const u16 sArmCannonOam_Frame_28b76e[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b782
static const u16 sArmCannonOam_Frame_28b782[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b796
static const u16 sArmCannonOam_Frame_28b796[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b7aa
static const u16 sArmCannonOam_BeingRecharged_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b7be
static const u16 sArmCannonOam_Frame_28b7be[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b7d2
static const u16 sArmCannonOam_Frame_28b7d2[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b7e6
static const u16 sArmCannonOam_Frame_28b7e6[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b7fa
static const u16 sArmCannonOam_Frame_28b7fa[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(4, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28b80e
static const struct ArmCannonOffset sArmCannonOffset_28b80e = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(-5)
};

// 0x28b812
static const struct ArmCannonOffset sArmCannonOffset_Turning_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(-3)
};

// 0x28b816
static const struct ArmCannonOffset sArmCannonOffset_Turning_Up_Left_Frame1 = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(3)
};

// 0x28b81a
static const struct ArmCannonOffset sArmCannonOffset_28b81a = {
    .y = C_S8_2_S16(-46),
    .x = C_S9_2_S16(5),
};

// 0x28b81e
static const struct ArmCannonOffset sArmCannonOffset_28b81e = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-18),
};

// 0x28b822
static const struct ArmCannonOffset sArmCannonOffset_Turning_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(-11)
};

// 0x28b826
static const struct ArmCannonOffset sArmCannonOffset_Turning_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(8)
};

// 0x28b82a
static const struct ArmCannonOffset sArmCannonOffset_28b82a = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(18),
};

// 0x28b82e
static const struct ArmCannonOffset sArmCannonOffset_28b82e = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-17),
};

// 0x28b832
static const struct ArmCannonOffset sArmCannonOffset_Turning_None_Left_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-10)
};

// 0x28b836
static const struct ArmCannonOffset sArmCannonOffset_Turning_None_Left_Frame1 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(6)
};

// 0x28b83a
static const struct ArmCannonOffset sArmCannonOffset_28b83a = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(17),
};

// 0x28b83e
static const struct ArmCannonOffset sArmCannonOffset_Landing_5_Left_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(-17)
};

// 0x28b842
static const struct ArmCannonOffset sArmCannonOffset_Turning_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-14),
    .x = C_S9_2_S16(-11)
};

// 0x28b846
static const struct ArmCannonOffset sArmCannonOffset_Turning_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-14),
    .x = C_S9_2_S16(2)
};

// 0x28b84a
static const struct ArmCannonOffset sArmCannonOffset_28b84a = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(17),
};

// 0x28b84e
static const struct ArmCannonOffset sArmCannonOffset_Landing_9_Left_Frame0 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(-4)
};

// 0x28b852
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_Up_Frame0 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(-3)
};

// 0x28b856
static const struct ArmCannonOffset sArmCannonOffset_Landing_9_Right_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(4)
};

// 0x28b85a
static const struct ArmCannonOffset sArmCannonOffset_Landing_7_Left_Frame0 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(-17)
};

// 0x28b85e
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-27),
    .x = C_S9_2_S16(-10)
};

// 0x28b862
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-27),
    .x = C_S9_2_S16(7)
};

// 0x28b866
static const struct ArmCannonOffset sArmCannonOffset_Landing_7_Right_Frame0 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(16)
};

// 0x28b86a
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_None_Left_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(-11)
};

// 0x28b86e
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_None_Left_Frame1 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(6)
};

// 0x28b872
static const struct ArmCannonOffset sArmCannonOffset_Landing_5_Right_Frame0 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(17)
};

// 0x28b876
static const struct ArmCannonOffset sArmCannonOffset_Landing_8_Left_Frame0 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(-17)
};

// 0x28b87a
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(-12)
};

// 0x28b87e
static const struct ArmCannonOffset sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(2)
};

// 0x28b882
static const struct ArmCannonOffset sArmCannonOffset_Landing_8_Right_Frame0 = {
    .y = C_S8_2_S16(-3),
    .x = C_S9_2_S16(17)
};

// 0x28b886
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-42),
    .x = C_S9_2_S16(-3)
};

// 0x28b88a
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_Up_Left_Frame1 = {
    .y = C_S8_2_S16(-42),
    .x = C_S9_2_S16(3)
};

// 0x28b88e
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-31),
    .x = C_S9_2_S16(-11)
};

// 0x28b892
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame1 = {
    .y = C_S8_2_S16(-31),
    .x = C_S9_2_S16(8)
};

// 0x28b896
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_None_Left_Frame0 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-10)
};

// 0x28b89a
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_None_Left_Frame1 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(6)
};

// 0x28b89e
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-11)
};

// 0x28b8a2
static const struct ArmCannonOffset sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(2)
};

// 0x28b8a6
static const struct ArmCannonOffset sArmCannonOffset_28b8a6 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-13),
};

// 0x28b8aa
static const struct ArmCannonOffset sArmCannonOffset_28b8aa = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(13),
};

// 0x28b8ae
static const struct ArmCannonOffset sArmCannonOffset_Unmorphing_Left_Frame2 = {
    .y = C_S8_2_S16(-6),
    .x = C_S9_2_S16(2)
};

// 0x28b8b2
static const struct ArmCannonOffset sArmCannonOffset_Morphing_Left_Frame0 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(2)
};

// 0x28b8b6
static const struct ArmCannonOffset sArmCannonOffset_Morphing_Left_Frame1 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(-1)
};

// 0x28b8ba
static const struct ArmCannonOffset sArmCannonOffset_MorphBall_Left_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(0)
};

// 0x28b8be
static const struct ArmCannonOffset sArmCannonOffset_MorphBall_Left_Frame1 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(0)
};

// 0x28b8c2
static const struct ArmCannonOffset sArmCannonOffset_MorphBall_Left_Frame2 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(0)
};

// 0x28b8c6
static const struct ArmCannonOffset sArmCannonOffset_Unmorphing_Right_Frame2 = {
    .y = C_S8_2_S16(-6),
    .x = C_S9_2_S16(-2)
};

// 0x28b8ca
static const struct ArmCannonOffset sArmCannonOffset_Morphing_Right_Frame0 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(-2)
};

// 0x28b8ce
static const struct ArmCannonOffset sArmCannonOffset_Morphing_Right_Frame1 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(1)
};

// 0x28b8d2
static const struct ArmCannonOffset sArmCannonOffset_FacingForeground_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-8)
};

// 0x28b8d6
static const struct ArmCannonOffset sArmCannonOffset_FacingBackground_Left_Frame3 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(-1)
};

// 0x28b8da
static const struct ArmCannonOffset sArmCannonOffset_FacingBackground_Left_Frame0 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(10)
};

// 0x28b8de
static const struct ArmCannonOffset sArmCannonOffset_FacingBackground_Right_Frame3 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(9)
};

// 0x28b8e2
static const struct ArmCannonOffset sArmCannonOffset_UsingElevator_Left_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-6)
};

// 0x28b8e6
static const struct ArmCannonOffset sArmCannonOffset_UsingElevator_Frame2 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-8)
};

// 0x28b8ea
static const struct ArmCannonOffset sArmCannonOffset_UsingElevator_Frame3 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-7)
};

// 0x28b8ee
static const struct ArmCannonOffset sArmCannonOffset_UsingElevator_Right_Frame0 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(-3)
};

// 0x28b8f2
static const struct ArmCannonOffset sArmCannonOffset_BeingRecharged_Left_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(-18)
};

// 0x28b8f6
static const struct ArmCannonOffset sArmCannonOffset_BeingRecharged_Right_Frame0 = {
    .y = C_S8_2_S16(-21),
    .x = C_S9_2_S16(18)
};

// 0x28b8fa
static const struct ArmCannonOffset sArmCannonOffset_UnlockingHabitationsDeck_Frame0 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(8)
};

// 0x28b8fe
static const struct ArmCannonOffset sArmCannonOffset_UnlockingHabitationsDeck_Frame1 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(6)
};

// 0x28b902
static const struct ArmCannonOffset sArmCannonOffset_UnlockingHabitationsDeck_Frame4 = {
    .y = C_S8_2_S16(-17),
    .x = C_S9_2_S16(12)
};

// 0x28b908
const struct ArmCannonAnimData sArmCannonAnim_Turning_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_Up_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_Up_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b918
const struct ArmCannonAnimData sArmCannonAnim_Turning_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_Up_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_Up_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b928
const struct ArmCannonAnimData sArmCannonAnim_Turning_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b938
const struct ArmCannonAnimData sArmCannonAnim_Turning_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b948
const struct ArmCannonAnimData sArmCannonAnim_Turning_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b958
const struct ArmCannonAnimData sArmCannonAnim_Turning_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b968
const struct ArmCannonAnimData sArmCannonAnim_Turning_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b978
const struct ArmCannonAnimData sArmCannonAnim_Turning_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b988
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_Up_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_Up_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b998
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_Up_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_Up_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9a8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9b8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9c8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9d8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9e8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28b9f8
const struct ArmCannonAnimData sArmCannonAnim_TurningAndCrouching_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningAndCrouching_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba08
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_Up_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_Up_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba18
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_Up_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_Up_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba28
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba38
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalUp_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba48
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba58
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba68
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba78
const struct ArmCannonAnimData sArmCannonAnim_TurningMidAir_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningMidAir_DiagonalDown_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ba88
const struct ArmCannonAnimData sArmCannonAnim_Landing_9_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_9_Left_Frame0,
        .pOam = sArmCannonOam_Landing_9_Left_Frame0
    },
};

// 0x28ba90
const struct ArmCannonAnimData sArmCannonAnim_Landing_9_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_9_Right_Frame0,
        .pOam = sArmCannonOam_Landing_9_Right_Frame0
    },
};

// 0x28ba98
const struct ArmCannonAnimData sArmCannonAnim_Landing_7_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_7_Left_Frame0,
        .pOam = sArmCannonOam_Landing_7_Left_Frame0
    },
};

// 0x28baa0
const struct ArmCannonAnimData sArmCannonAnim_Landing_7_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_7_Right_Frame0,
        .pOam = sArmCannonOam_Landing_7_Right_Frame0
    },
};

// 0x28baa8
const struct ArmCannonAnimData sArmCannonAnim_Landing_5_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_5_Left_Frame0,
        .pOam = sArmCannonOam_Landing_5_Left_Frame0
    },
};

// 0x28bab0
const struct ArmCannonAnimData sArmCannonAnim_Landing_5_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_5_Right_Frame0,
        .pOam = sArmCannonOam_Landing_5_Right_Frame0
    },
};

// 0x28bab8
const struct ArmCannonAnimData sArmCannonAnim_Landing_8_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_8_Left_Frame0,
        .pOam = sArmCannonOam_Landing_8_Left_Frame0
    },
};

// 0x28bac0
const struct ArmCannonAnimData sArmCannonAnim_Landing_8_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_Landing_8_Right_Frame0,
        .pOam = sArmCannonOam_Landing_8_Right_Frame0
    },
};

// 0x28bac8
const struct ArmCannonAnimData sArmCannonAnim_Morphing_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Morphing_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Morphing_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bae0
const struct ArmCannonAnimData sArmCannonAnim_MorphBall_Left[8] = {
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bb20
const struct ArmCannonAnimData sArmCannonAnim_Unmorphing_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_Morphing_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Morphing_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Unmorphing_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bb38
const struct ArmCannonAnimData sArmCannonAnim_Morphing_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Morphing_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Morphing_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bb50
const struct ArmCannonAnimData sArmCannonAnim_MorphBall_Right[8] = {
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MorphBall_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bb90
const struct ArmCannonAnimData sArmCannonAnim_Unmorphing_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_Morphing_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Morphing_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Unmorphing_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bba8
const struct ArmCannonAnimData sArmCannonAnim_OnSavePad_Left[4] = {
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bbc8
const struct ArmCannonAnimData sArmCannonAnim_OnSavePad_Right[4] = {
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bbe8
const struct ArmCannonAnimData sArmCannonAnim_FacingForeground_Left[4] = {
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bc08
const struct ArmCannonAnimData sArmCannonAnim_FacingForeground_Right[4] = {
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Turning_None_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bc28
const struct ArmCannonAnimData sArmCannonAnim_OnNavigationPad_Left[16] = {
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bca8
const struct ArmCannonAnimData sArmCannonAnim_FacingBackground_Left[4] = {
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bcc8
const struct ArmCannonAnimData sArmCannonAnim_OnNavigationPad_Right[16] = {
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bd48
const struct ArmCannonAnimData sArmCannonAnim_FacingBackground_Right[4] = {
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bd68
const struct ArmCannonAnimData sArmCannonAnim_UsingElevator_Left[5] = {
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bd90
const struct ArmCannonAnimData sArmCannonAnim_UsingElevator_Right[5] = {
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UsingElevator_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bdb8
const struct ArmCannonAnimData sArmCannonAnim_DownloadingAbility_Left[16] = {
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28be38
const struct ArmCannonAnimData sArmCannonAnim_DownloadingAbility_Right[16] = {
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingForeground_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28beb8
const struct ArmCannonAnimData sArmCannonAnim_BeingRecharged_Left[8] = {
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
};

// 0x28bef8
const struct ArmCannonAnimData sArmCannonAnim_BeingRecharged_Right[8] = {
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
};

// 0x28bf38
const struct ArmCannonAnimData sArmCannonAnim_UnlockingSecurity_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Left_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Left_Frame0
    },
};

// 0x28bf40
const struct ArmCannonAnimData sArmCannonAnim_UnlockingSecurity_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_BeingRecharged_Right_Frame0,
        .pOam = sArmCannonOam_BeingRecharged_Right_Frame0
    },
};

// 0x28bf48
const struct ArmCannonAnimData sArmCannonAnim_UnlockingHabitationsDeck[6] = {
    {
        .pOffset = &sArmCannonOffset_UnlockingHabitationsDeck_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UnlockingHabitationsDeck_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UnlockingHabitationsDeck_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_UnlockingHabitationsDeck_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_FacingBackground_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
};

// 0x28bf78
static const u16 sArmCannonOam_UsingElevator_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -1, OAM_DIMS_32x8, OAM_NO_FLIP, 0x40, 3, 0),
};

// 0x28bf80
static const u16 sArmCannonOam_UsingElevator_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -1, OAM_DIMS_32x8, OAM_NO_FLIP, 0x60, 3, 0),
};

// 0x28bf88
static const u16 sArmCannonOam_UsingElevator_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-8, -1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x44, 3, 0),
};

// 0x28bf90
static const u16 sArmCannonOam_UsingElevator_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-8, -1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x64, 3, 0),
};

// 0x28bf98
const struct FrameData sArmCannonOam_UsingElevator[5] = {
    {
        .pFrame = sArmCannonOam_UsingElevator_Frame0,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_UsingElevator_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_UsingElevator_Frame2,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_UsingElevator_Frame3,
        .timer = 2
    },
    {
        .pFrame = NULL,
        .timer = 0
    },
};

// 0x28bfc0
static const u16 sArmCannonOam_OnVerticalLadder_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-38, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-22, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-22, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28bfd4
static const u16 sArmCannonOam_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-37, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-21, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-21, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28bfe8
static const u16 sArmCannonOam_OnVerticalLadder_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-27, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-27, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-11, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28bffc
static const u16 sArmCannonOam_ShootingOnVerticalLadder_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-26, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-26, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-10, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c010
static const u16 sArmCannonOam_OnVerticalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-38, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-22, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-22, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c024
static const u16 sArmCannonOam_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-37, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-21, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c038
static const u16 sArmCannonOam_OnVerticalLadder_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(6, -42, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(22, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(6, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c04c
static const u16 sArmCannonOam_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(5, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(21, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(5, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c060
static const u16 sArmCannonOam_OnVerticalLadder_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-6, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(10, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c074
static const u16 sArmCannonOam_ShootingOnVerticalLadder_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-7, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(9, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(9, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c088
static const u16 sArmCannonOam_OnVerticalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(22, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(6, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c09c
static const u16 sArmCannonOam_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(4, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(20, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(4, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c0b0
static const u16 sArmCannonOam_AfterShootingOnHorizontalLadder_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-19, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-3, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c0c4
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_None_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-17, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-1, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c0d8
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-31, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-15, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c0ec
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-29, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-13, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-13, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c100
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_Down_Left_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-12, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c114
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_Down_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-20, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-12, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c128
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_None_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-13, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(3, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c13c
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_None_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-15, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(1, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(1, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c150
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(0, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(16, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(0, -13, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c164
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(14, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x42, 1, 0),
    OAM_ENTRY(-2, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c178
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_Down_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -15, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c186
static const u16 sArmCannonOam_ShootingOnHorizontalLadder_Down_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-12, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-4, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c194
static const u16 sArmCannonOam_OnVerticalLadder_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-9, -43, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-1, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1a2
static const u16 sArmCannonOam_ShootingOnVerticalLadder_Up_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-9, -41, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-1, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1b0
static const u16 sArmCannonOam_OnVerticalLadder_Down_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-9, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-1, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1be
static const u16 sArmCannonOam_ShootingOnVerticalLadder_Down_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_IN_FRONT,
    OAM_ENTRY(-9, -20, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-1, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1cc
static const u16 sArmCannonOam_OnVerticalLadder_Up_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-23, -43, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1da
static const u16 sArmCannonOam_ShootingOnVerticalLadder_Up_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-23, -41, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1e8
static const u16 sArmCannonOam_OnVerticalLadder_Down_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-23, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c1f6
static const u16 sArmCannonOam_ShootingOnVerticalLadder_Down_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2 | ARM_CANNON_OAM_ORDER_BEHIND,
    OAM_ENTRY(-23, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28c204
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame3 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-9)
};

// 0x28c208
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame4 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(-9)
};

// 0x28c20c
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame5 = {
    .y = C_S8_2_S16(-31),
    .x = C_S9_2_S16(-9)
};

// 0x28c210
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame0 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(-8)
};

// 0x28c214
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame1 = {
    .y = C_S8_2_S16(-33),
    .x = C_S9_2_S16(-8)
};

// 0x28c218
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Left_Frame2 = {
    .y = C_S8_2_S16(-36),
    .x = C_S9_2_S16(-8)
};

// 0x28c21c
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame0 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(9)
};

// 0x28c220
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame1 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(9)
};

// 0x28c224
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame2 = {
    .y = C_S8_2_S16(-31),
    .x = C_S9_2_S16(9)
};

// 0x28c228
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame3 = {
    .y = C_S8_2_S16(-29),
    .x = C_S9_2_S16(8)
};

// 0x28c22c
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame4 = {
    .y = C_S8_2_S16(-33),
    .x = C_S9_2_S16(8)
};

// 0x28c230
static const struct ArmCannonOffset sArmCannonOffset_HangingOnVerticalLadder_Right_Frame5 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(9)
};

// 0x28c234
static const struct ArmCannonOffset sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame0 = {
    .y = C_S8_2_S16(-25),
    .x = C_S9_2_S16(7)
};

// 0x28c238
static const struct ArmCannonOffset sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame1 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(-2)
};

// 0x28c23c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-33),
    .x = C_S9_2_S16(-21)
};

// 0x28c240
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0 = {
    .y = C_S8_2_S16(-32),
    .x = C_S9_2_S16(-20)
};

// 0x28c244
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_None_Left_Frame0 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(-25)
};

// 0x28c248
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_None_Left_Frame0 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(-24)
};

// 0x28c24c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-21)
};

// 0x28c250
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(-20)
};

// 0x28c254
static const struct ArmCannonOffset sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame0 = {
    .y = C_S8_2_S16(-26),
    .x = C_S9_2_S16(-6)
};

// 0x28c258
static const struct ArmCannonOffset sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame1 = {
    .y = C_S8_2_S16(-20),
    .x = C_S9_2_S16(2)
};

// 0x28c25c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-33),
    .x = C_S9_2_S16(21)
};

// 0x28c260
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0 = {
    .y = C_S8_2_S16(-32),
    .x = C_S9_2_S16(20)
};

// 0x28c264
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_None_Right_Frame0 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(24)
};

// 0x28c268
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_None_Right_Frame0 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(23)
};

// 0x28c26c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(21)
};

// 0x28c270
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(19)
};

// 0x28c274
static const struct ArmCannonOffset sArmCannonOffset_StartingWallJump_Left_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(-19)
};

// 0x28c278
static const struct ArmCannonOffset sArmCannonOffset_StartingWallJump_Left_Frame1 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(-11)
};

// 0x28c27c
static const struct ArmCannonOffset sArmCannonOffset_StartingWallJump_Right_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(19)
};

// 0x28c280
static const struct ArmCannonOffset sArmCannonOffset_StartingWallJump_Right_Frame1 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(11)
};

// 0x28c284
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_Default_Left_Frame1 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(-8)
};

// 0x28c288
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_Default_Left_Frame0 = {
    .y = C_S8_2_S16(-32),
    .x = C_S9_2_S16(-8)
};

// 0x28c28c
static const struct ArmCannonOffset sArmCannonOffset_PullingUpFromHanging_Left_Frame1 = {
    .y = C_S8_2_S16(-24),
    .x = C_S9_2_S16(-8)
};

// 0x28c290
static const struct ArmCannonOffset sArmCannonOffset_PullingUpFromHanging_Left_Frame2 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-6)
};

// 0x28c294
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Left_Frame0 = {
    .y = C_S8_2_S16(-12),
    .x = C_S9_2_S16(-7)
};

// 0x28c298
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Left_Frame1 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-6)
};

// 0x28c29c
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Left_Frame2 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(-10)
};

// 0x28c2a0
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Left_Frame3 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(-22)
};

// 0x28c2a4
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_Default_Right_Frame2 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(8)
};

// 0x28c2a8
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_Default_Right_Frame1 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(9)
};

// 0x28c2ac
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_Default_Right_Frame0 = {
    .y = C_S8_2_S16(-35),
    .x = C_S9_2_S16(10)
};

// 0x28c2b0
static const struct ArmCannonOffset sArmCannonOffset_PullingUpFromHanging_Right_Frame1 = {
    .y = C_S8_2_S16(-28),
    .x = C_S9_2_S16(9)
};

// 0x28c2b4
static const struct ArmCannonOffset sArmCannonOffset_PullingUpFromHanging_Right_Frame2 = {
    .y = C_S8_2_S16(-15),
    .x = C_S9_2_S16(9)
};

// 0x28c2b8
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Right_Frame0 = {
    .y = C_S8_2_S16(-13),
    .x = C_S9_2_S16(7)
};

// 0x28c2bc
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Right_Frame1 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(7)
};

// 0x28c2c0
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Right_Frame2 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(10)
};

// 0x28c2c4
static const struct ArmCannonOffset sArmCannonOffset_PullingForwardFromHanging_Right_Frame3 = {
    .y = C_S8_2_S16(-10),
    .x = C_S9_2_S16(22)
};

// 0x28c2c8
static const struct ArmCannonOffset sArmCannonOffset_PullingIntoMorphFromHanging_Left_Frame0 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(-4)
};

// 0x28c2cc
static const struct ArmCannonOffset sArmCannonOffset_PullingIntoMorphFromHanging_Right_Frame0 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(4)
};

// 0x28c2d0
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(2)
};

// 0x28c2d4
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame0 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(-6)
};

// 0x28c2d8
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame1 = {
    .y = C_S8_2_S16(-19),
    .x = C_S9_2_S16(-14)
};

// 0x28c2dc
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame2 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-8)
};

// 0x28c2e0
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame3 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-4)
};

// 0x28c2e4
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame4 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-2)
};

// 0x28c2e8
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame5 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(4)
};

// 0x28c2ec
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame6 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(7)
};

// 0x28c2f0
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame8 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(3)
};

// 0x28c2f4
static const struct ArmCannonOffset sArmCannonOffset_TurningOnHorizontalLadder_Left_Frame1 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(-2)
};

// 0x28c2f8
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9 = {
    .y = C_S8_2_S16(-9),
    .x = C_S9_2_S16(-1)
};

// 0x28c2fc
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(6)
};

// 0x28c300
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame1 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(15)
};

// 0x28c304
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame2 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(12)
};

// 0x28c308
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame3 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(8)
};

// 0x28c30c
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame4 = {
    .y = C_S8_2_S16(-38),
    .x = C_S9_2_S16(6)
};

// 0x28c310
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame6 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-3)
};

// 0x28c314
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame7 = {
    .y = C_S8_2_S16(-37),
    .x = C_S9_2_S16(-7)
};

// 0x28c318
static const struct ArmCannonOffset sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame8 = {
    .y = C_S8_2_S16(-18),
    .x = C_S9_2_S16(3)
};

// 0x28c31c
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_None_Left_Frame1 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-17)
};

// 0x28c320
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_None_Left_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-15)
};

// 0x28c324
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(-14)
};

// 0x28c328
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(-12)
};

// 0x28c32c
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_Down_Left_Frame1 = {
    .y = C_S8_2_S16(1),
    .x = C_S9_2_S16(-4)
};

// 0x28c330
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_Down_Left_Frame0 = {
    .y = C_S8_2_S16(-1),
    .x = C_S9_2_S16(-4)
};

// 0x28c334
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_None_Right_Frame1 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(17)
};

// 0x28c338
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_None_Right_Frame0 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(15)
};

// 0x28c33c
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1 = {
    .y = C_S8_2_S16(-7),
    .x = C_S9_2_S16(14)
};

// 0x28c340
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0 = {
    .y = C_S8_2_S16(-8),
    .x = C_S9_2_S16(12)
};

// 0x28c344
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_Down_Right_Frame1 = {
    .y = C_S8_2_S16(1),
    .x = C_S9_2_S16(4)
};

// 0x28c348
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnHorizontalLadder_Down_Right_Frame0 = {
    .y = C_S8_2_S16(-1),
    .x = C_S9_2_S16(4)
};

// 0x28c34c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-41),
    .x = C_S9_2_S16(7)
};

// 0x28c350
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_Up_Right_Frame0 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(7)
};

// 0x28c354
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_Down_Right_Frame0 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(7)
};

// 0x28c358
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_Down_Right_Frame0 = {
    .y = C_S8_2_S16(-6),
    .x = C_S9_2_S16(7)
};

// 0x28c35c
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-41),
    .x = C_S9_2_S16(-7)
};

// 0x28c360
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_Up_Left_Frame0 = {
    .y = C_S8_2_S16(-39),
    .x = C_S9_2_S16(-7)
};

// 0x28c364
static const struct ArmCannonOffset sArmCannonOffset_OnVerticalLadder_Down_Left_Frame0 = {
    .y = C_S8_2_S16(-2),
    .x = C_S9_2_S16(-7)
};

// 0x28c368
static const struct ArmCannonOffset sArmCannonOffset_ShootingOnVerticalLadder_Down_Left_Frame0 = {
    .y = C_S8_2_S16(-4),
    .x = C_S9_2_S16(-7)
};

// 0x28c36c
static const struct ArmCannonOffset sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0 = {
    .y = C_S8_2_S16(-30),
    .x = C_S9_2_S16(8)
};

// 0x28c370
const struct ArmCannonAnimData sArmCannonAnim_HangingOnVerticalLadder_Left[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c3a8
const struct ArmCannonAnimData sArmCannonAnim_HangingOnVerticalLadder_Right[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c3e0
const struct ArmCannonAnimData sArmCannonAnim_28c3e0[12] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c440
const struct ArmCannonAnimData sArmCannonAnim_StartingToHoldArmOutOnVerticalLadder_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c450
const struct ArmCannonAnimData sArmCannonAnim_StartingToPutArmAwayOnVerticalLadder_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c460
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_DiagonalUp_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalUp_Left_Frame0
    },
};

// 0x28c468
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_DiagonalUp_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalUp_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalUp_Left_Frame0
    },
};

// 0x28c478
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_None_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_None_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_None_Left_Frame0
    },
};

// 0x28c480
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_None_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_None_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_None_Left_Frame0
    },
};

// 0x28c490
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_DiagonalDown_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalDown_Left_Frame0
    },
};

// 0x28c498
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalDown_Left_Frame0
    },
};

// 0x28c4a8
const struct ArmCannonAnimData sArmCannonAnim_StartingToHoldArmOutOnVerticalLadder_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c4b8
const struct ArmCannonAnimData sArmCannonAnim_StartingToPutArmAwayOnVerticalLadder_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingToHoldArmOutOnVerticalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c4c8
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_DiagonalUp_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalUp_Right_Frame0
    },
};

// 0x28c4d0
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_DiagonalUp_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalUp_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalUp_Right_Frame0
    },
};

// 0x28c4e0
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_None_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_None_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_None_Right_Frame0
    },
};

// 0x28c4e8
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_None_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_None_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_None_Right_Frame0
    },
};

// 0x28c4f8
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_DiagonalDown_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalDown_Right_Frame0
    },
};

// 0x28c500
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_DiagonalDown_Right_Frame0
    },
};

// 0x28c510
const struct ArmCannonAnimData sArmCannonAnim_StartingWallJump_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingWallJump_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingWallJump_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c520
const struct ArmCannonAnimData sArmCannonAnim_StartingWallJump_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_StartingWallJump_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_StartingWallJump_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c530
const struct ArmCannonAnimData sArmCannonAnim_HangingOnLedge_Default_Left[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c568
const struct ArmCannonAnimData sArmCannonAnim_PullingUpFromHanging_Left[3] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c580
const struct ArmCannonAnimData sArmCannonAnim_PullingForwardFromHanging_Left[4] = {
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c5a0
const struct ArmCannonAnimData sArmCannonAnim_PullingIntoMorphFromHanging_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_PullingIntoMorphFromHanging_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c5a8
const struct ArmCannonAnimData sArmCannonAnim_HangingOnLedge_Default_Right[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c5e0
const struct ArmCannonAnimData sArmCannonAnim_PullingUpFromHanging_Right[3] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c5f8
const struct ArmCannonAnimData sArmCannonAnim_PullingForwardFromHanging_Right[4] = {
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c618
const struct ArmCannonAnimData sArmCannonAnim_PullingIntoMorphFromHanging_Right[5] = {
    {
        .pOffset = &sArmCannonOffset_PullingIntoMorphFromHanging_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c640
const struct ArmCannonAnimData sArmCannonAnim_MovingOnHorizontalLadder_Left[10] = {
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnVerticalLadder_Right_Frame5,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c690
const struct ArmCannonAnimData sArmCannonAnim_TurningOnHorizontalLadder_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_TurningOnHorizontalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c6a0
const struct ArmCannonAnimData sArmCannonAnim_TurningOnHorizontalLadder_Right[6] = {
    {
        .pOffset = &sArmCannonOffset_TurningOnHorizontalLadder_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_PullingForwardFromHanging_Left_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c6d0
const struct ArmCannonAnimData sArmCannonAnim_MovingOnHorizontalLadder_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame2,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame3,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Left_Frame4,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame6,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame7,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame8,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_MovingOnHorizontalLadder_Right_Frame9,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c720
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Left_Frame1,
        .pOam = sArmCannonOam_AfterShootingOnHorizontalLadder_None_Left_Frame0
    },
};

// 0x28c728
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_None_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_None_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Left_Frame1,
        .pOam = sArmCannonOam_AfterShootingOnHorizontalLadder_None_Left_Frame0
    },
};

// 0x28c738
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1
    },
};

// 0x28c740
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_DiagonalDown_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1
    },
};

// 0x28c750
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_Down_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Left_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Left_Frame1
    },
};

// 0x28c758
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_Down_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Left_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Left_Frame1
    },
};

// 0x28c768
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_None_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_None_Right_Frame1
    },
};

// 0x28c770
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_None_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_None_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_None_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_None_Right_Frame1
    },
};

// 0x28c780
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1
    },
};

// 0x28c788
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_DiagonalDown_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1
    },
};

// 0x28c798
const struct ArmCannonAnimData sArmCannonAnim_AfterShootingOnHorizontalLadder_Down_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Right_Frame1
    },
};

// 0x28c7a0
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnHorizontalLadder_Down_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_ShootingOnHorizontalLadder_Down_Right_Frame1,
        .pOam = sArmCannonOam_ShootingOnHorizontalLadder_Down_Right_Frame1
    },
};

// 0x28c7b0
const struct ArmCannonAnimData sArmCannonAnim_LoweringDownToStartHanging_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c7c0
const struct ArmCannonAnimData sArmCannonAnim_LoweringDownToStartHanging_Right[10] = {
    {
        .pOffset = &sArmCannonOffset_PullingUpFromHanging_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Right_Frame1,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c810
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_Up_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Up_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Up_Right_Frame0
    },
};

// 0x28c818
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_Up_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_Up_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_Up_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Up_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Up_Right_Frame0
    },
};

// 0x28c828
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_Down_Right[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Down_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Down_Right_Frame0
    },
};

// 0x28c830
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_Down_Right[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_Down_Right_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_Down_Right_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Down_Right_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Down_Right_Frame0
    },
};

// 0x28c840
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_Up_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Up_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Up_Left_Frame0
    },
};

// 0x28c848
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_Up_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_Up_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_Up_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Up_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Up_Left_Frame0
    },
};

// 0x28c858
const struct ArmCannonAnimData sArmCannonAnim_OnVerticalLadder_Down_Left[1] = {
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Down_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Down_Left_Frame0
    },
};

// 0x28c860
const struct ArmCannonAnimData sArmCannonAnim_ShootingOnVerticalLadder_Down_Left[2] = {
    {
        .pOffset = &sArmCannonOffset_ShootingOnVerticalLadder_Down_Left_Frame0,
        .pOam = sArmCannonOam_ShootingOnVerticalLadder_Down_Left_Frame0
    },
    {
        .pOffset = &sArmCannonOffset_OnVerticalLadder_Down_Left_Frame0,
        .pOam = sArmCannonOam_OnVerticalLadder_Down_Left_Frame0
    },
};

// 0x28c870
const struct ArmCannonAnimData sArmCannonAnim_HangingOnLedge_PushingAway_Left[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_Default_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c8a8
const struct ArmCannonAnimData sArmCannonAnim_HangingOnLedge_PushingAway_Right[7] = {
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_HangingOnLedge_PushingAway_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c8e0
static const struct ArmCannonOffset sArmCannonOffset_SpaceJumping_Left_Frame0 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(0)
};

// 0x28c8e4
const struct ArmCannonAnimData sArmCannonAnim_SpaceJumping_Left[8] = {
    {
        .pOffset = &sArmCannonOffset_SpaceJumping_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c924
const struct ArmCannonAnimData sArmCannonAnim_SpaceJumping_Right[8] = {
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c964
const struct ArmCannonAnimData sArmCannonAnim_ScrewAttacking_Left[16] = {
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
};

// 0x28c9e4
const struct ArmCannonAnimData sArmCannonAnim_ScrewAttacking_Right[16] = {
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Empty,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ca64
static const u16 sArmCannonOam_ScrewAttacking_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-14, -27, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -11, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ca72
static const u16 sArmCannonOam_ScrewAttacking_Left_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-14, -27, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-14, -11, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ca80
static const u16 sArmCannonOam_ScrewAttacking_Left_Frame2[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-13, -25, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-13, -9, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ca8e
static const u16 sArmCannonOam_ScrewAttacking_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-15, -31, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-13, -15, OAM_DIMS_8x8, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(3, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x46, 1, 0),
    OAM_ENTRY(-6, 1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x64, 1, 0),
};

// 0x28caa8
static const u16 sArmCannonOam_ScrewAttacking_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-18, -27, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -11, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cab6
static const u16 sArmCannonOam_ScrewAttacking_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-18, -27, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-18, -11, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cac4
static const u16 sArmCannonOam_ScrewAttacking_Right_Frame2[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-19, -25, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-19, -9, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cad2
static const u16 sArmCannonOam_ScrewAttacking_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -31, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(5, -15, OAM_DIMS_8x8, OAM_X_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-19, -15, OAM_DIMS_16x16, OAM_X_FLIP, 0x46, 1, 0),
    OAM_ENTRY(-10, 1, OAM_DIMS_16x8, OAM_X_FLIP, 0x64, 1, 0),
};

// 0x28caec
const struct FrameData sArmCannonOam_ScrewAttacking_Left[5] = {
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Left_Frame0,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Left_Frame1,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Left_Frame2,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Left_Frame3,
        .timer = 2
    },
    FRAME_DATA_TERMINATOR
};

// 0x28cb14
const struct FrameData sArmCannonOam_ScrewAttacking_Right[5] = {
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Right_Frame0,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Right_Frame1,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Right_Frame2,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_ScrewAttacking_Right_Frame3,
        .timer = 2
    },
    FRAME_DATA_TERMINATOR
};

// 0x28cb3c
static const struct ArmCannonOffset sArmCannonOffset_Dying_Left_Frame0 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(-11)
};

// 0x28cb40
static const struct ArmCannonOffset sArmCannonOffset_Dying_Right_Frame0 = {
    .y = C_S8_2_S16(-11),
    .x = C_S9_2_S16(11)
};

// 0x28cb44
const struct ArmCannonAnimData sArmCannonAnim_Dying_Left[9] = {
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28cb8c
const struct ArmCannonAnimData sArmCannonAnim_Dying_Right[9] = {
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Right_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28cbd4
const struct ArmCannonAnimData sArmCannonAnim_LoadingSave[28] = {
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_Dying_Left_Frame0,
        .pOam = sSamusOam_Empty
    },
};

// 0x28ccb4
static const u16 sArmCannonOam_Dying_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ccc2
static const u16 sArmCannonOam_Dying_Left_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ccd0
static const u16 sArmCannonOam_Dying_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-10, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x48, 1, 0),
};

// 0x28cce4
static const u16 sArmCannonOam_Dying_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -33, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-1, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x68, 1, 0),
};

// 0x28ccf8
static const u16 sArmCannonOam_Dying_Left_Frame4[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -33, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(0, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4a, 1, 0),
};

// 0x28cd0c
static const u16 sArmCannonOam_Dying_Left_Frame5[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-15, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28cd1a
static const u16 sArmCannonOam_Dying_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cd28
static const u16 sArmCannonOam_Dying_Right_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cd36
static const u16 sArmCannonOam_Dying_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-6, -40, OAM_DIMS_16x8, OAM_X_FLIP, 0x48, 1, 0),
};

// 0x28cd4a
static const u16 sArmCannonOam_Dying_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -33, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -17, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-15, -41, OAM_DIMS_16x8, OAM_X_FLIP, 0x68, 1, 0),
};

// 0x28cd5e
static const u16 sArmCannonOam_Dying_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -33, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -17, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-8, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x4a, 1, 0),
};

// 0x28cd72
static const u16 sArmCannonOam_Dying_Right_Frame5[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-17, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-17, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x44, 1, 0),
};

// 0x28cd80
const struct FrameData sArmCannonOam_Dying_Left[7] = {
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame0,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame1,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame2,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame3,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame4,
        .timer = 6
    },
    {
        .pFrame = sArmCannonOam_Dying_Left_Frame5,
        .timer = 12
    },
    FRAME_DATA_TERMINATOR
};

// 0x28cdb8
const struct FrameData sArmCannonOam_Dying_Right[7] = {
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame0,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame1,
        .timer = 2
    },
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame2,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame3,
        .timer = 4
    },
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame4,
        .timer = 6
    },
    {
        .pFrame = sArmCannonOam_Dying_Right_Frame5,
        .timer = 12
    },
    FRAME_DATA_TERMINATOR
};

// 0x28cdf0
static const u16 sArmCannonOam_LoadingSave_Frame16[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x48, 1, 0),
};

// 0x28ce04
static const u16 sArmCannonOam_LoadingSave_Frame18[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x48, 1, 0),
};

// 0x28ce18
static const u16 sArmCannonOam_LoadingSave_Frame20[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x48, 1, 0),
};

// 0x28ce2c
static const u16 sArmCannonOam_LoadingSave_Frame22[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ce3a
static const u16 sArmCannonOam_LoadingSave_Frame13[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce42
static const u16 sArmCannonOam_LoadingSave_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x44, 1, 0),
};

// 0x28ce4a
static const u16 sArmCannonOam_LoadingSave_Frame24[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce52
static const u16 sArmCannonOam_LoadingSave_Frame10[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce5a
static const u16 sArmCannonOam_LoadingSave_Frame12[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce62
static const u16 sArmCannonOam_LoadingSave_Frame14[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce6a
static const u16 sArmCannonOam_LoadingSave_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce72
static const u16 sArmCannonOam_LoadingSave_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce7a
static const u16 sArmCannonOam_LoadingSave_Frame4[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce82
static const u16 sArmCannonOam_LoadingSave_Frame46[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -8, OAM_DIMS_32x8, OAM_NO_FLIP, 0x40, 1, 0),
};

// 0x28ce8c
const struct FrameData sArmCannonOam_LoadingSave[49] = {
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame0,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame2,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame4,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame46,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame24,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame12,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame14,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame16,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame18,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame20,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame22,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame24,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame12,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame14,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame24,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame12,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame13,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame14,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame0,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame2,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame4,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame46,
        .timer = 1
    },
    {
        .pFrame = sArmCannonOam_LoadingSave_Frame1,
        .timer = 1
    },
    {
        .pFrame = NULL,
        .timer = 0
    },
};


// 0x28d014
static const struct ArmCannonOffset sArmCannonOffset_28d014 = {
    .y = C_S8_2_S16(-16),
    .x = C_S9_2_S16(-8)
};

// Unused?
// 0x28d018
static const struct ArmCannonAnimData sArmCannonAnim_28d018[72] = {
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
    {
        .pOffset = &sArmCannonOffset_28d014,
        .pOam = sSamusOam_Empty
    },
};
