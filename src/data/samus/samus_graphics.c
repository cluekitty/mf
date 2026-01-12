#include "data/samus/samus_graphics.h"
#include "data/samus/samus_empty_data.h"

#include "oam.h"

#define SAMUS_ANIM_TERMINATOR \
{                             \
    .pTopGfx = NULL,          \
    .pBottomGfx = NULL,       \
    .pOam = NULL,             \
    .timer = 0,               \
}

// 0x2b5058
static const u8 sSamusGfx_Running_None_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_0_top.gfx")
};

// 0x2b50fa
static const u8 sSamusGfx_Running_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_frame_0_bottom.gfx")
};

// 0x2b51bc
static const u8 sSamusGfx_Running_None_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_1_top.gfx")
};

// 0x2b525e
static const u8 sSamusGfx_Running_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_frame_1_bottom.gfx")
};

// 0x2b5320
static const u8 sSamusGfx_Running_None_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_2_top.gfx")
};

// 0x2b53e2
static const u8 sSamusGfx_Running_Frame2_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/running_frame_2_bottom.gfx")
};

// 0x2b54e4
static const u8 sSamusGfx_Running_None_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 3)] = {
    4, 3,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_3_top.gfx")
};

// 0x2b55c6
static const u8 sSamusGfx_Running_Frame3_Bottom[SAMUS_GFX_SIZE(6, 4)] = {
    6, 4,
    _INCBIN_U8("data/samus/graphics/body/running_frame_3_bottom.gfx")
};

// 0x2b5708
static const u8 sSamusGfx_Running_None_Left_Frame4_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_4_top.gfx")
};

// 0x2b57ca
static const u8 sSamusGfx_Running_Frame4_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/running_frame_4_bottom.gfx")
};

// 0x2b58cc
static const u8 sSamusGfx_Running_None_Left_Frame5_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_5_top.gfx")
};

// 0x2b596e
static const u8 sSamusGfx_Running_Frame5_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_frame_5_bottom.gfx")
};

// 0x2b5a30
static const u8 sSamusGfx_Running_None_Left_Frame6_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_6_top.gfx")
};

// 0x2b5ab2
static const u8 sSamusGfx_Running_Frame6_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_frame_6_bottom.gfx")
};

// 0x2b5b74
static const u8 sSamusGfx_Running_None_Left_Frame7_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_7_top.gfx")
};

// 0x2b5c16
static const u8 sSamusGfx_Running_Frame7_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/running_frame_7_bottom.gfx")
};

// 0x2b5d18
static const u8 sSamusGfx_Running_None_Left_Frame8_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_8_top.gfx")
};

// 0x2b5dba
static const u8 sSamusGfx_Running_Frame8_Bottom[SAMUS_GFX_SIZE(6, 4)] = {
    6, 4,
    _INCBIN_U8("data/samus/graphics/body/running_frame_8_bottom.gfx")
};

// 0x2b5efc
static const u8 sSamusGfx_Running_None_Left_Frame9_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_left_frame_9_top.gfx")
};

// 0x2b5f7e
static const u8 sSamusGfx_Running_Frame9_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/running_frame_9_bottom.gfx")
};

// 0x2b6080
static const u8 sSamusGfx_Running_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_left_frame_0_top.gfx")
};

// 0x2b6142
static const u8 sSamusGfx_Running_DiagonalUp_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_left_frame_1_top.gfx")
};

// 0x2b6204
static const u8 sSamusGfx_Running_DiagonalUp_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_left_frame_2_top.gfx")
};

// 0x2b62c6
static const u8 sSamusGfx_Running_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_left_frame_0_top.gfx")
};

// 0x2b6388
static const u8 sSamusGfx_Running_Forward_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_left_frame_1_top.gfx")
};

// 0x2b644a
static const u8 sSamusGfx_Running_Forward_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_left_frame_2_top.gfx")
};

// 0x2b650c
static const u8 sSamusGfx_Running_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_left_frame_0_top.gfx")
};

// 0x2b65ce
static const u8 sSamusGfx_Running_DiagonalDown_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_left_frame_1_top.gfx")
};

// 0x2b6690
static const u8 sSamusGfx_Running_DiagonalDown_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_left_frame_2_top.gfx")
};

// 0x2b6752
static const u8 sSamusGfx_Crouching_Up_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_left_frame_1_top.gfx")
};

// 0x2b67f4
static const u8 sSamusGfx_Standing_Up_Right_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_up_right_frame_0_bottom.gfx")
};

// 0x2b68f6
static const u8 sSamusGfx_Standing_Up_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_up_left_frame_0_top.gfx")
};

// 0x2b6998
static const u8 sSamusGfx_Standing_Up_Right_Frame1_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_up_right_frame_1_bottom.gfx")
};

// 0x2b6a9a
static const u8 sSamusGfx_Standing_Up_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_up_left_frame_2_top.gfx")
};

// 0x2b6b3c
static const u8 sSamusGfx_Standing_Up_Frame2_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_up_frame_2_bottom.gfx")
};

// 0x2b6c3e
static const u8 sSamusGfx_Crouching_Up_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_left_frame_0_top.gfx")
};

// 0x2b6ce0
static const u8 sSamusGfx_Shooting_Up_Left_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_up_left_frame_0_bottom.gfx")
};

// 0x2b6de2
static const u8 sSamusGfx_Standing_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_left_frame_0_top.gfx")
};

// 0x2b6ea4
static const u8 sSamusGfx_Standing_DiagonalUp_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_frame_0_bottom.gfx")
};

// 0x2b6fa6
static const u8 sSamusGfx_Standing_DiagonalUp_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_left_frame_1_top.gfx")
};

// 0x2b7068
static const u8 sSamusGfx_Standing_DiagonalUp_Frame1_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_frame_1_bottom.gfx")
};

// 0x2b716a
static const u8 sSamusGfx_Standing_DiagonalUp_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_left_frame_2_top.gfx")
};

// 0x2b722c
static const u8 sSamusGfx_Standing_DiagonalUp_Frame2_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_frame_2_bottom.gfx")
};

// 0x2b732e
static const u8 sSamusGfx_Crouching_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_left_frame_0_top.gfx")
};

// 0x2b73f0
static const u8 sSamusGfx_Standing_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_left_frame_0_top.gfx")
};

// 0x2b74b2
static const u8 sSamusGfx_Standing_Forward_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_frame_0_bottom.gfx")
};

// 0x2b75b4
static const u8 sSamusGfx_Standing_Forward_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_left_frame_1_top.gfx")
};

// 0x2b7676
static const u8 sSamusGfx_Standing_Forward_Frame1_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_frame_1_bottom.gfx")
};

// 0x2b7778
static const u8 sSamusGfx_Standing_Forward_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_left_frame_2_top.gfx")
};

// 0x2b783a
static const u8 sSamusGfx_Standing_Forward_Frame2_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_frame_2_bottom.gfx")
};

// 0x2b793c
static const u8 sSamusGfx_Crouching_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_left_frame_0_top.gfx")
};

// 0x2b79fe
static const u8 sSamusGfx_Standing_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_left_frame_0_top.gfx")
};

// 0x2b7ac0
static const u8 sSamusGfx_Standing_DiagonalDown_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_frame_0_bottom.gfx")
};

// 0x2b7bc2
static const u8 sSamusGfx_Standing_DiagonalDown_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_left_frame_1_top.gfx")
};

// 0x2b7c84
static const u8 sSamusGfx_Standing_DiagonalDown_Frame1_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_frame_1_bottom.gfx")
};

// 0x2b7d86
static const u8 sSamusGfx_Standing_DiagonalDown_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_left_frame_2_top.gfx")
};

// 0x2b7e48
static const u8 sSamusGfx_Standing_DiagonalDown_Frame2_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_frame_2_bottom.gfx")
};

// 0x2b7f4a
static const u8 sSamusGfx_Crouching_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_left_frame_0_top.gfx")
};

// 0x2b800c
static const u8 sSamusGfx_Crouching_Up_Left_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_left_frame_1_bottom.gfx")
};

// 0x2b80ce
static const u8 sSamusGfx_Crouching_Up_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_left_frame_0_bottom.gfx")
};

// 0x2b8190
static const u8 sSamusGfx_Crouching_DiagonalUp_Left_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_left_frame_1_bottom.gfx")
};

// 0x2b8252
static const u8 sSamusGfx_Crouching_DiagonalUp_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_left_frame_0_bottom.gfx")
};

// 0x2b8314
static const u8 sSamusGfx_Crouching_Forward_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_left_frame_1_top.gfx")
};

// 0x2b83d6
static const u8 sSamusGfx_Crouching_Forward_Left_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_left_frame_1_bottom.gfx")
};

// 0x2b8498
static const u8 sSamusGfx_Crouching_Forward_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_left_frame_0_bottom.gfx")
};

// 0x2b855a
static const u8 sSamusGfx_Crouching_DiagonalDown_Left_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_left_frame_1_bottom.gfx")
};

// 0x2b861c
static const u8 sSamusGfx_Crouching_DiagonalDown_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_left_frame_0_bottom.gfx")
};

// 0x2b86de
static const u8 sSamusGfx_Running_None_Right_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_0_top.gfx")
};

// 0x2b87c0
static const u8 sSamusGfx_Running_None_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_1_top.gfx")
};

// 0x2b8882
static const u8 sSamusGfx_Running_None_Right_Frame2_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_2_top.gfx")
};

// 0x2b8984
static const u8 sSamusGfx_Running_None_Right_Frame3_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_3_top.gfx")
};

// 0x2b8a66
static const u8 sSamusGfx_Running_None_Right_Frame4_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_4_top.gfx")
};

// 0x2b8b28
static const u8 sSamusGfx_Running_None_Right_Frame5_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_5_top.gfx")
};

// 0x2b8bea
static const u8 sSamusGfx_Running_None_Right_Frame6_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_6_top.gfx")
};

// 0x2b8c8c
static const u8 sSamusGfx_Running_None_Right_Frame7_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_7_top.gfx")
};

// 0x2b8d4e
static const u8 sSamusGfx_Running_None_Right_Frame8_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_8_top.gfx")
};

// 0x2b8e10
static const u8 sSamusGfx_Running_None_Right_Frame9_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_none_right_frame_9_top.gfx")
};

// 0x2b8eb2
static const u8 sSamusGfx_Running_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_right_frame_0_top.gfx")
};

// 0x2b8f34
static const u8 sSamusGfx_Running_DiagonalUp_Right_Frame1_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_right_frame_1_top.gfx")
};

// 0x2b8fb6
static const u8 sSamusGfx_Running_DiagonalUp_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_up_right_frame_2_top.gfx")
};

// 0x2b9078
static const u8 sSamusGfx_Running_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_right_frame_0_top.gfx")
};

// 0x2b911a
static const u8 sSamusGfx_Running_Forward_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_right_frame_1_top.gfx")
};

// 0x2b91bc
static const u8 sSamusGfx_Running_Forward_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_forward_right_frame_2_top.gfx")
};

// 0x2b925e
static const u8 sSamusGfx_Running_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_right_frame_0_top.gfx")
};

// 0x2b9300
static const u8 sSamusGfx_Running_DiagonalDown_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_right_frame_1_top.gfx")
};

// 0x2b93a2
static const u8 sSamusGfx_Running_DiagonalDown_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/running_diagonal_down_right_frame_2_top.gfx")
};

// 0x2b9444
static const u8 sSamusGfx_Standing_Up_Right_Frame0_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_up_right_frame_0_top.gfx")
};

// 0x2b94c6
static const u8 sSamusGfx_Standing_Up_Right_Frame1_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_up_right_frame_1_top.gfx")
};

// 0x2b9548
static const u8 sSamusGfx_Standing_Up_Right_Frame2_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_up_right_frame_2_top.gfx")
};

// 0x2b95ca
static const u8 sSamusGfx_Crouching_Up_Right_Frame0_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_right_frame_0_top.gfx")
};

// 0x2b964c
static const u8 sSamusGfx_Shooting_Up_Right_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_up_right_frame_0_bottom.gfx")
};

// 0x2b974e
static const u8 sSamusGfx_Standing_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_right_frame_0_top.gfx")
};

// 0x2b9810
static const u8 sSamusGfx_Standing_DiagonalUp_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_right_frame_1_top.gfx")
};

// 0x2b98d2
static const u8 sSamusGfx_Standing_DiagonalUp_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_up_right_frame_2_top.gfx")
};

// 0x2b9994
static const u8 sSamusGfx_Crouching_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_right_frame_0_top.gfx")
};

// 0x2b9a56
static const u8 sSamusGfx_Standing_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_right_frame_0_top.gfx")
};

// 0x2b9af8
static const u8 sSamusGfx_Standing_Forward_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_right_frame_1_top.gfx")
};

// 0x2b9b9a
static const u8 sSamusGfx_Standing_Forward_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_forward_right_frame_2_top.gfx")
};

// 0x2b9c3c
static const u8 sSamusGfx_Crouching_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_right_frame_0_top.gfx")
};

// 0x2b9cde
static const u8 sSamusGfx_Standing_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_right_frame_0_top.gfx")
};

// 0x2b9d80
static const u8 sSamusGfx_Standing_DiagonalDown_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_right_frame_1_top.gfx")
};

// 0x2b9e22
static const u8 sSamusGfx_Standing_DiagonalDown_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/standing_diagonal_down_right_frame_2_top.gfx")
};

// 0x2b9ec4
static const u8 sSamusGfx_Crouching_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_right_frame_0_top.gfx")
};

// 0x2b9f66
static const u8 sSamusGfx_Crouching_Up_Right_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_right_frame_1_bottom.gfx")
};

// 0x2ba028
static const u8 sSamusGfx_Crouching_Up_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_up_right_frame_0_bottom.gfx")
};

// 0x2ba0ea
static const u8 sSamusGfx_Crouching_DiagonalUp_Right_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_right_frame_1_bottom.gfx")
};

// 0x2ba1ac
static const u8 sSamusGfx_Crouching_DiagonalUp_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_up_right_frame_0_bottom.gfx")
};

// 0x2ba26e
static const u8 sSamusGfx_Crouching_Forward_Right_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_right_frame_1_bottom.gfx")
};

// 0x2ba330
static const u8 sSamusGfx_Crouching_Forward_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_forward_right_frame_0_bottom.gfx")
};

// 0x2ba3f2
static const u8 sSamusGfx_Crouching_DiagonalDown_Right_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_right_frame_1_bottom.gfx")
};

// 0x2ba4b4
static const u8 sSamusGfx_Crouching_DiagonalDown_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/crouching_diagonal_down_right_frame_0_bottom.gfx")
};

// 0x2ba576
static const u8 sSamusGfx_Skidding_Default_Left_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/skidding_default_left_frame_0_top.gfx")
};

// 0x2ba6f8
static const u8 sSamusGfx_Skidding_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/skidding_frame_0_bottom.gfx")
};

// 0x2ba7fa
static const u8 sSamusGfx_Skidding_Armed_Left_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/skidding_armed_left_frame_0_top.gfx")
};

// 0x2ba97c
static const u8 sSamusGfx_Skidding_Default_Right_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/skidding_default_right_frame_0_top.gfx")
};

// 0x2baafe
static const u8 sSamusGfx_Skidding_Armed_Right_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/skidding_armed_right_frame_0_top.gfx")
};

// 0x2bac80
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Left_Frame0_Top[SAMUS_GFX_SIZE(7, 6)] = {
    7, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_left_frame_0_top.gfx")
};

// 0x2bae22
static const u8 sSamusGfx_HitByOmegaMetroid_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_frame_0_bottom.gfx")
};

// 0x2baee4
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Left_Frame1_Top[SAMUS_GFX_SIZE(7, 6)] = {
    7, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_left_frame_1_top.gfx")
};

// 0x2bb086
static const u8 sSamusGfx_HitByOmegaMetroid_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_frame_1_bottom.gfx")
};

// 0x2bb148
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Left_Frame2_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_left_frame_2_top.gfx")
};

// 0x2bb2ca
static const u8 sSamusGfx_HitByOmegaMetroid_Frame2_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_frame_2_bottom.gfx")
};

// 0x2bb38c
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame0_Top[SAMUS_GFX_SIZE(7, 6)] = {
    7, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_left_frame_0_top.gfx")
};

// 0x2bb52e
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame1_Top[SAMUS_GFX_SIZE(7, 6)] = {
    7, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_left_frame_1_top.gfx")
};

// 0x2bb6d0
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame2_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_left_frame_2_top.gfx")
};

// 0x2bb852
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Right_Frame0_Top[SAMUS_GFX_SIZE(8, 6)] = {
    8, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_right_frame_0_top.gfx")
};

// 0x2bba14
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Right_Frame1_Top[SAMUS_GFX_SIZE(7, 5)] = {
    7, 5,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_right_frame_1_top.gfx")
};

// 0x2bbb96
static const u8 sSamusGfx_HitByOmegaMetroid_Default_Right_Frame2_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_default_right_frame_2_top.gfx")
};

// 0x2bbcd8
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame0_Top[SAMUS_GFX_SIZE(8, 6)] = {
    8, 6,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_right_frame_0_top.gfx")
};

// 0x2bbe9a
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame1_Top[SAMUS_GFX_SIZE(7, 5)] = {
    7, 5,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_right_frame_1_top.gfx")
};

// 0x2bc01c
static const u8 sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame2_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/hit_by_omega_metroid_looking_up_right_frame_2_top.gfx")
};

// 0x2bc15e
static const u16 sSamusOam_Running_None_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc178
static const u16 sSamusOam_Running_None_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc192
static const u16 sSamusOam_Running_None_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-14, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc1b2
static const u16 sSamusOam_Running_None_Left_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2bc1d2
static const u16 sSamusOam_Running_None_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-11, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2bc1ec
static const u16 sSamusOam_Running_None_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2bc206
static const u16 sSamusOam_Running_None_Left_Frame6[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-9, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc21a
static const u16 sSamusOam_Running_None_Left_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc23a
static const u16 sSamusOam_Running_None_Left_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc254
static const u16 sSamusOam_Running_None_Left_Frame9[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(8, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc26e
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc288
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc2a2
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-18, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc2c2
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-18, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc2dc
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc2f6
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-18, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc310
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame6[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc32a
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-19, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc34a
static const u16 sSamusOam_Running_DiagonalUp_Left_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(8, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc36a
static const u16 sSamusOam_Running_Forward_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc38a
static const u16 sSamusOam_Running_Forward_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc3aa
static const u16 sSamusOam_Running_Forward_Left_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc3d0
static const u16 sSamusOam_Running_Forward_Left_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc3f0
static const u16 sSamusOam_Running_Forward_Left_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc410
static const u16 sSamusOam_Running_Forward_Left_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc430
static const u16 sSamusOam_Running_Forward_Left_Frame7[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-11, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc456
static const u16 sSamusOam_Running_Forward_Left_Frame8[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc476
static const u16 sSamusOam_Running_Forward_Left_Frame9[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-10, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(8, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc49c
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc4b6
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc4d0
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc4f0
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc50a
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-2, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc524
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-15, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc53e
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(9, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc55e
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-15, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bc578
static const u16 sSamusOam_Running_DiagonalDown_Left_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-15, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(8, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc598
static const u16 sSamusOam_Standing_Up_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc5b8
static const u16 sSamusOam_Standing_Up_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc5d8
static const u16 sSamusOam_Standing_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-3, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-19, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc5f8
static const u16 sSamusOam_Standing_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc618
static const u16 sSamusOam_Shooting_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc638
static const u16 sSamusOam_Standing_Forward_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-20, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc65e
static const u16 sSamusOam_Standing_Forward_Left_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-12, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-20, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc684
static const u16 sSamusOam_Standing_Forward_Left_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-20, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-8, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2bc6aa
static const u16 sSamusOam_Shooting_Forward_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-12, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-12, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc6ca
static const u16 sSamusOam_Standing_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc6ea
static const u16 sSamusOam_Standing_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc70a
static const u16 sSamusOam_Standing_DiagonalDown_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-18, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc72a
static const u16 sSamusOam_Shooting_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2bc74a
static const u16 sSamusOam_Crouching_Up_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc764
static const u16 sSamusOam_Crouching_Up_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc77e
static const u16 sSamusOam_Crouching_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc798
static const u16 sSamusOam_Crouching_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc7b2
static const u16 sSamusOam_Crouching_Forward_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc7d2
static const u16 sSamusOam_Crouching_Forward_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc7ec
static const u16 sSamusOam_Crouching_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc806
static const u16 sSamusOam_Crouching_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -11, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2bc820
static const u16 sSamusOam_Running_None_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(10, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc840
static const u16 sSamusOam_Running_None_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc85a
static const u16 sSamusOam_Running_None_Right_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-10, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(6, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bc880
static const u16 sSamusOam_Running_None_Right_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(8, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bc8a0
static const u16 sSamusOam_Running_None_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc8ba
static const u16 sSamusOam_Running_None_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc8d4
static const u16 sSamusOam_Running_None_Right_Frame6[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc8ee
static const u16 sSamusOam_Running_None_Right_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(8, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc90e
static const u16 sSamusOam_Running_None_Right_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bc928
static const u16 sSamusOam_Running_None_Right_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bc948
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc95c
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc970
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bc990
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bc9aa
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc9be
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc9d2
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame6[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bc9e6
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(11, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bca06
static const u16 sSamusOam_Running_DiagonalUp_Right_Frame9[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bca20
static const u16 sSamusOam_Running_Forward_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -42, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bca3a
static const u16 sSamusOam_Running_Forward_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -43, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bca54
static const u16 sSamusOam_Running_Forward_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -43, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bca74
static const u16 sSamusOam_Running_Forward_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
    OAM_ENTRY(1, -44, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bca8e
static const u16 sSamusOam_Running_Forward_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -42, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcaa8
static const u16 sSamusOam_Running_Forward_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -42, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcac2
static const u16 sSamusOam_Running_Forward_Right_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(2, -43, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcae2
static const u16 sSamusOam_Running_Forward_Right_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
    OAM_ENTRY(2, -44, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcafc
static const u16 sSamusOam_Running_Forward_Right_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(1, -42, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcb1c
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcb36
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcb50
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcb70
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bcb8a
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcba4
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcbbe
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcbde
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -18, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -26, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bcbf8
static const u16 sSamusOam_Running_DiagonalDown_Right_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcc18
static const u16 sSamusOam_Standing_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcc32
static const u16 sSamusOam_Standing_Up_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcc4c
static const u16 sSamusOam_Shooting_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-7, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcc66
static const u16 sSamusOam_Standing_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(11, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcc86
static const u16 sSamusOam_Shooting_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcca6
static const u16 sSamusOam_Standing_Forward_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bccc6
static const u16 sSamusOam_Standing_Forward_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(0, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcce6
static const u16 sSamusOam_Shooting_Forward_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-1, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcd06
static const u16 sSamusOam_Standing_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcd26
static const u16 sSamusOam_Standing_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcd46
static const u16 sSamusOam_Shooting_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2bcd66
static const u16 sSamusOam_Crouching_Up_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcd7a
static const u16 sSamusOam_Crouching_Up_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-8, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcd8e
static const u16 sSamusOam_Crouching_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2bcda8
static const u16 sSamusOam_Crouching_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(8, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bcdc2
static const u16 sSamusOam_Crouching_Forward_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-1, -32, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcddc
static const u16 sSamusOam_Crouching_Forward_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-2, -32, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2bcdf6
static const u16 sSamusOam_Crouching_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bce10
static const u16 sSamusOam_Crouching_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-1, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bce2a
static const u16 sSamusOam_2bce2a[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-15, -34, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-7, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2bce4a
static const u16 sSamusOam_2bce4a[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2bce64
static const u16 sSamusOam_2bce64[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(7, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-18, -17, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bce84
static const u16 sSamusOam_2bce84[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -17, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -25, OAM_DIMS_16x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2bce9e
static const u16 sSamusOam_Skidding_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-16, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcec4
static const u16 sSamusOam_2bcec4[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-17, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bceea
static const u16 sSamusOam_Skidding_Default_Right_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(8, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(1, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcf10
static const u16 sSamusOam_Skidding_Armed_Right_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(8, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(1, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcf36
static const u16 sSamusOam_HitByOmegaMetroid_Default_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-11, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcf5c
static const u16 sSamusOam_HitByOmegaMetroid_Default_Left_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-7, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -5, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcf82
static const u16 sSamusOam_HitByOmegaMetroid_Default_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-12, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcfa2
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-11, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcfc8
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-11, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bcfee
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-12, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2bd00e
static const u16 sSamusOam_HitByOmegaMetroid_Default_Right_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-6, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-3, -11, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2bd034
static const u16 sSamusOam_HitByOmegaMetroid_Default_Right_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-6, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-4, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2bd05a
static const u16 sSamusOam_HitByOmegaMetroid_Default_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -18, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bd07a
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-5, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-3, -11, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2bd0a0
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-5, -17, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-4, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2bd0c6
static const u16 sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -18, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-6, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-13, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2bd0e8
const struct SamusAnimData sSamusAnim_Running_None_Left[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd198
const struct SamusAnimData sSamusAnim_Running_DiagonalUp_Left[11] = {
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Left_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd248
const struct SamusAnimData sSamusAnim_Running_Forward_Left[11] = {
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_Forward_Left_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd2f8
const struct SamusAnimData sSamusAnim_Running_DiagonalDown_Left[11] = {
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Left_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd3a8
const struct SamusAnimData sSamusAnim_Standing_Up_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame1_Bottom,
        .pOam = sSamusOam_Standing_Up_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame1_Bottom,
        .pOam = sSamusOam_Standing_Up_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Frame2_Bottom,
        .pOam = sSamusOam_Standing_Up_Left_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd3e8
const struct SamusAnimData sSamusAnim_Shooting_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shooting_Up_Left_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Up_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Up_Left_Frame2,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd418
const struct SamusAnimData sSamusAnim_Standing_DiagonalUp_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame1_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame2_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Left_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd458
const struct SamusAnimData sSamusAnim_Shooting_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd488
const struct SamusAnimData sSamusAnim_Standing_Forward_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Forward_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame1_Bottom,
        .pOam = sSamusOam_Standing_Forward_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Standing_Forward_Left_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd4c8
const struct SamusAnimData sSamusAnim_Shooting_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_Forward_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Forward_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd4f8
const struct SamusAnimData sSamusAnim_Standing_DiagonalDown_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame2_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Left_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd538
const struct SamusAnimData sSamusAnim_Shooting_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd568
const struct SamusAnimData sSamusAnim_Crouching_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Up_Left_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_Up_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Crouching_Up_Left_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_Up_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd598
const struct SamusAnimData sSamusAnim_Crouching_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalUp_Left_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalUp_Left_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalUp_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd5c8
const struct SamusAnimData sSamusAnim_Crouching_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_Forward_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Crouching_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Crouching_Forward_Left_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_Forward_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd5f8
const struct SamusAnimData sSamusAnim_Crouching_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalDown_Left_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalDown_Left_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalDown_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd628
const struct SamusAnimData sSamusAnim_Running_None_Right[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd6d8
const struct SamusAnimData sSamusAnim_Running_DiagonalUp_Right[11] = {
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_DiagonalUp_Right_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd788
const struct SamusAnimData sSamusAnim_Running_Forward_Right[11] = {
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_Forward_Right_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd838
const struct SamusAnimData sSamusAnim_Running_DiagonalDown_Right[11] = {
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame8,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Running_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_DiagonalDown_Right_Frame9,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd8e8
const struct SamusAnimData sSamusAnim_Standing_Up_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Up_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame1_Bottom,
        .pOam = sSamusOam_Standing_Up_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Frame2_Bottom,
        .pOam = sSamusOam_Standing_Up_Right_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd928
const struct SamusAnimData sSamusAnim_Shooting_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shooting_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_Shooting_Up_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Up_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd958
const struct SamusAnimData sSamusAnim_Standing_DiagonalUp_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame1_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame2_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Right_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd998
const struct SamusAnimData sSamusAnim_Shooting_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalUp_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bd9c8
const struct SamusAnimData sSamusAnim_Standing_Forward_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Forward_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame1_Bottom,
        .pOam = sSamusOam_Standing_Forward_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Standing_Forward_Right_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bda08
const struct SamusAnimData sSamusAnim_Shooting_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_Forward_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Standing_Forward_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bda38
const struct SamusAnimData sSamusAnim_Standing_DiagonalDown_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame2_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Right_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bda78
const struct SamusAnimData sSamusAnim_Shooting_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_Forward_Frame2_Bottom,
        .pOam = sSamusOam_Shooting_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Standing_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_Standing_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdaa8
const struct SamusAnimData sSamusAnim_Crouching_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_Up_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Up_Right_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_Up_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdad8
const struct SamusAnimData sSamusAnim_Crouching_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalUp_Right_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalUp_Right_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalUp_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdb08
const struct SamusAnimData sSamusAnim_Crouching_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_Forward_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_Forward_Right_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_Forward_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdb38
const struct SamusAnimData sSamusAnim_Crouching_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Crouching_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalDown_Right_Frame0_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Standing_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Crouching_DiagonalDown_Right_Frame1_Bottom,
        .pOam = sSamusOam_Crouching_DiagonalDown_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdb68
const struct SamusAnimData sSamusAnim_Unused_2bdb68[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame6,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame7,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame8,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame9,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdc18
const struct SamusAnimData sSamusAnim_Unused_2bdc18[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame6,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame7,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame8,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame9,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdcc8
const struct SamusAnimData sSamusAnim_Unused_2bdcc8[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_2bce2a,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame5,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame6,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame7,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_2bce4a,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Left_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Left_Frame9,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdd78
const struct SamusAnimData sSamusAnim_Unused_2bdd78[11] = {
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Running_Frame0_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Running_Frame1_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Running_Frame2_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Running_Frame3_Bottom,
        .pOam = sSamusOam_2bce64,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_Running_Frame4_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_Running_Frame5_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame6_Top,
        .pBottomGfx = sSamusGfx_Running_Frame6_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame6,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame7_Top,
        .pBottomGfx = sSamusGfx_Running_Frame7_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame7,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame8_Top,
        .pBottomGfx = sSamusGfx_Running_Frame8_Bottom,
        .pOam = sSamusOam_2bce84,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Running_None_Right_Frame9_Top,
        .pBottomGfx = sSamusGfx_Running_Frame9_Bottom,
        .pOam = sSamusOam_Running_None_Right_Frame9,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bde28
const struct SamusAnimData sSamusAnim_Skidding_Default_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Skidding_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Skidding_Frame0_Bottom,
        .pOam = sSamusOam_Skidding_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bde48
const struct SamusAnimData sSamusAnim_Skidding_Armed_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Skidding_Armed_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Skidding_Frame0_Bottom,
        .pOam = sSamusOam_Skidding_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bde68
const struct SamusAnimData sSamusAnim_Skidding_Default_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Skidding_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Skidding_Frame0_Bottom,
        .pOam = sSamusOam_Skidding_Default_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bde88
const struct SamusAnimData sSamusAnim_Skidding_Armed_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Skidding_Armed_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Skidding_Frame0_Bottom,
        .pOam = sSamusOam_Skidding_Armed_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdea8
const struct SamusAnimData sSamusAnim_HitByOmegaMetroid_Default_Left[5] = {
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame0_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame2_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Left_Frame2,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Left_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdef8
const struct SamusAnimData sSamusAnim_HitByOmegaMetroid_LookingUp_Left[5] = {
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame0_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame2_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame2,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Left_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdf48
const struct SamusAnimData sSamusAnim_HitByOmegaMetroid_Default_Right[5] = {
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame0_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame2_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Right_Frame2,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_Default_Right_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdf98
const struct SamusAnimData sSamusAnim_HitByOmegaMetroid_LookingUp_Right[5] = {
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame0_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame2_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame2,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HitByOmegaMetroid_LookingUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HitByOmegaMetroid_Frame1_Bottom,
        .pOam = sSamusOam_HitByOmegaMetroid_LookingUp_Right_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2bdfe8
static const u8 sSamusGfx_DelayBeforeShinesparking_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/delay_before_shinesparking_left_frame_0_top.gfx")
};

// 0x2be08a
static const u8 sSamusGfx_DelayBeforeShinesparking_Left_Frame0_Bottom[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/delay_before_shinesparking_left_frame_0_bottom.gfx")
};

// 0x2be16c
static const u8 sSamusGfx_MidAir_None_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_0_top.gfx")
};

// 0x2be26e
static const u8 sSamusGfx_MidAir_NotDown_Frame0_Bottom[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_0_bottom.gfx")
};

// 0x2be350
static const u8 sSamusGfx_MidAir_None_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_1_top.gfx")
};

// 0x2be452
static const u8 sSamusGfx_MidAir_NotDown_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_1_bottom.gfx")
};

// 0x2be514
static const u8 sSamusGfx_MidAir_None_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_2_top.gfx")
};

// 0x2be616
static const u8 sSamusGfx_MidAir_NotDown_Frame2_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_2_bottom.gfx")
};

// 0x2be6b8
static const u8 sSamusGfx_MidAir_None_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_3_top.gfx")
};

// 0x2be7ba
static const u8 sSamusGfx_MidAir_NotDown_Frame3_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_3_bottom.gfx")
};

// 0x2be87c
static const u8 sSamusGfx_MidAir_None_Left_Frame4_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_4_top.gfx")
};

// 0x2be97e
static const u8 sSamusGfx_MidAir_NotDown_Frame4_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_4_bottom.gfx")
};

// 0x2bea80
static const u8 sSamusGfx_MidAir_None_Left_Frame5_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_left_frame_5_top.gfx")
};

// 0x2beb82
static const u8 sSamusGfx_MidAir_NotDown_Frame5_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_not_down_frame_5_bottom.gfx")
};

// 0x2bec84
static const u8 sSamusGfx_Landing_None_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/landing_none_left_frame_0_top.gfx")
};

// 0x2bed86
static const u8 sSamusGfx_Landing_NotNone_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_not_none_frame_0_bottom.gfx")
};

// 0x2bee48
static const u8 sSamusGfx_Landing_None_Left_Frame1_Top[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/landing_none_left_frame_1_top.gfx")
};

// 0x2bef6a
static const u8 sSamusGfx_Landing_NotNone_Left_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_not_none_left_frame_1_bottom.gfx")
};

// 0x2bf02c
static const u8 sSamusGfx_MidAir_Up_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_left_frame_0_top.gfx")
};

// 0x2bf0ce
static const u8 sSamusGfx_MidAir_Up_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_left_frame_1_top.gfx")
};

// 0x2bf170
static const u8 sSamusGfx_MidAir_Up_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_left_frame_2_top.gfx")
};

// 0x2bf212
static const u8 sSamusGfx_MidAir_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_left_frame_0_top.gfx")
};

// 0x2bf2d4
static const u8 sSamusGfx_MidAir_DiagonalUp_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_left_frame_1_top.gfx")
};

// 0x2bf396
static const u8 sSamusGfx_MidAir_DiagonalUp_Left_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_left_frame_2_top.gfx")
};

// 0x2bf458
static const u8 sSamusGfx_MidAir_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_left_frame_0_top.gfx")
};

// 0x2bf51a
static const u8 sSamusGfx_MidAir_Forward_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_left_frame_1_top.gfx")
};

// 0x2bf5dc
static const u8 sSamusGfx_MidAir_Forward_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_left_frame_2_top.gfx")
};

// 0x2bf69e
static const u8 sSamusGfx_MidAir_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_left_frame_0_top.gfx")
};

// 0x2bf760
static const u8 sSamusGfx_MidAir_DiagonalDown_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_left_frame_1_top.gfx")
};

// 0x2bf822
static const u8 sSamusGfx_MidAir_DiagonalDown_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_left_frame_2_top.gfx")
};

// 0x2bf8e4
static const u8 sSamusGfx_2bf8e4[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/2bf8e6.gfx")
};

// 0x2bf986
static const u8 sSamusGfx_2bf986[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/2bf988.gfx")
};

// 0x2bfa48
static const u8 sSamusGfx_2bfa48[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/2bfa4a.gfx")
};

// 0x2bfb0a
static const u8 sSamusGfx_2bfb0a[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/2bfb0c.gfx")
};

// 0x2bfbcc
static const u8 sSamusGfx_MidAir_Down_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_left_frame_0_top.gfx")
};

// 0x2bfcce
static const u8 sSamusGfx_MidAir_Down_Frame0_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_frame_0_bottom.gfx")
};

// 0x2bfdd0
static const u8 sSamusGfx_MidAir_Down_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_left_frame_1_top.gfx")
};

// 0x2bfed2
static const u8 sSamusGfx_MidAir_Down_Frame1_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_frame_1_bottom.gfx")
};

// 0x2bffd4
static const u8 sSamusGfx_DelayBeforeShinesparking_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/delay_before_shinesparking_right_frame_0_top.gfx")
};

// 0x2c0096
static const u8 sSamusGfx_DelayBeforeShinesparking_Right_Frame0_Bottom[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/delay_before_shinesparking_right_frame_0_bottom.gfx")
};

// 0x2c0178
static const u8 sSamusGfx_MidAir_None_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_0_top.gfx")
};

// 0x2c027a
static const u8 sSamusGfx_MidAir_None_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_1_top.gfx")
};

// 0x2c037c
static const u8 sSamusGfx_MidAir_None_Right_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_2_top.gfx")
};

// 0x2c047e
static const u8 sSamusGfx_MidAir_None_Right_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_3_top.gfx")
};

// 0x2c0580
static const u8 sSamusGfx_MidAir_None_Right_Frame4_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_4_top.gfx")
};

// 0x2c0682
static const u8 sSamusGfx_MidAir_None_Right_Frame5_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_none_right_frame_5_top.gfx")
};

// 0x2c0784
static const u8 sSamusGfx_Landing_None_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/landing_none_right_frame_0_top.gfx")
};

// 0x2c0886
static const u8 sSamusGfx_Landing_None_Right_Frame1_Top[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/landing_none_right_frame_1_top.gfx")
};

// 0x2c09a8
static const u8 sSamusGfx_Landing_NotNone_Right_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_not_none_right_frame_1_bottom.gfx")
};

// 0x2c0a6a
static const u8 sSamusGfx_MidAir_Up_Right_Frame0_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_right_frame_0_top.gfx")
};

// 0x2c0aec
static const u8 sSamusGfx_MidAir_Up_Right_Frame1_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_right_frame_1_top.gfx")
};

// 0x2c0b6e
static const u8 sSamusGfx_MidAir_Up_Right_Frame2_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_up_right_frame_2_top.gfx")
};

// 0x2c0bf0
static const u8 sSamusGfx_MidAir_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_right_frame_0_top.gfx")
};

// 0x2c0cb2
static const u8 sSamusGfx_MidAir_DiagonalUp_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_right_frame_1_top.gfx")
};

// 0x2c0d74
static const u8 sSamusGfx_MidAir_DiagonalUp_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_up_right_frame_2_top.gfx")
};

// 0x2c0e36
static const u8 sSamusGfx_MidAir_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_right_frame_0_top.gfx")
};

// 0x2c0ed8
static const u8 sSamusGfx_MidAir_Forward_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_right_frame_1_top.gfx")
};

// 0x2c0f7a
static const u8 sSamusGfx_MidAir_Forward_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_forward_right_frame_2_top.gfx")
};

// 0x2c101c
static const u8 sSamusGfx_2c101c[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/2c101e.gfx")
};

// 0x2c10be
static const u8 sSamusGfx_MidAir_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_right_frame_0_top.gfx")
};

// 0x2c1160
static const u8 sSamusGfx_MidAir_DiagonalDown_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_right_frame_1_top.gfx")
};

// 0x2c1202
static const u8 sSamusGfx_MidAir_DiagonalDown_Right_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/mid_air_diagonal_down_right_frame_2_top.gfx")
};

// 0x2c12a4
static const u8 sSamusGfx_2c12a4[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/2c12a6.gfx")
};

// 0x2c1326
static const u8 sSamusGfx_2c1326[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/2c1328.gfx")
};

// 0x2c13e8
static const u8 sSamusGfx_2c13e8[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/2c13ea.gfx")
};

// 0x2c14aa
static const u8 sSamusGfx_2c14aa[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/2c14ac.gfx")
};

// 0x2c154c
static const u8 sSamusGfx_MidAir_Down_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_right_frame_0_top.gfx")
};

// 0x2c164e
static const u8 sSamusGfx_MidAir_Down_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/mid_air_down_right_frame_1_top.gfx")
};

// 0x2c1750
static const u8 sSamusGfx_Spinning_Left_Frame0_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/spinning_left_frame_0_top.gfx")
};

// 0x2c1952
static const u8 sSamusGfx_Spinning_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/spinning_left_frame_1_top.gfx")
};

// 0x2c1a54
static const u8 sSamusGfx_Spinning_Left_Frame2_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/spinning_left_frame_2_top.gfx")
};

// 0x2c1c56
static const u8 sSamusGfx_Spinning_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/spinning_left_frame_3_top.gfx")
};

// 0x2c1d58
static const u8 sSamusGfx_Spinning_Right_Frame0_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/spinning_right_frame_0_top.gfx")
};

// 0x2c1f5a
static const u8 sSamusGfx_Spinning_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/spinning_right_frame_1_top.gfx")
};

// 0x2c205c
static const u8 sSamusGfx_Spinning_Right_Frame2_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/spinning_right_frame_2_top.gfx")
};

// 0x2c225e
static const u8 sSamusGfx_Spinning_Right_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/spinning_right_frame_3_top.gfx")
};

// 0x2c2360
static const u8 sSamusGfx_StartingSpinJump_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/starting_spin_jump_left_frame_0_top.gfx")
};

// 0x2c2462
static const u8 sSamusGfx_StartingSpinJump_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_spin_jump_frame_0_bottom.gfx")
};

// 0x2c2524
static const u8 sSamusGfx_StartingSpinJump_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_spin_jump_right_frame_0_top.gfx")
};

// 0x2c25c6
static const u8 sSamusGfx_Shinesparking_Upwards_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_left_frame_0_top.gfx")
};

// 0x2c26c8
static const u8 sSamusGfx_Shinesparking_Upwards_Frame0_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_frame_0_bottom.gfx")
};

// 0x2c27ca
static const u8 sSamusGfx_Shinesparking_Upwards_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_left_frame_1_top.gfx")
};

// 0x2c28cc
static const u8 sSamusGfx_Shinesparking_Upwards_Frame1_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_frame_1_bottom.gfx")
};

// 0x2c29ce
static const u8 sSamusGfx_Shinesparking_Upwards_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_right_frame_0_top.gfx")
};

// 0x2c2ad0
static const u8 sSamusGfx_Shinesparking_Upwards_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_up_right_frame_1_top.gfx")
};

// 0x2c2bd2
static const u8 sSamusGfx_Shinesparking_Sideways_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_left_frame_0_top.gfx")
};

// 0x2c2d14
static const u8 sSamusGfx_Shinesparking_Sideways_Frame0_Bottom[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_frame_0_bottom.gfx")
};

// 0x2c2e16
static const u8 sSamusGfx_Shinesparking_Sideways_Left_Frame1_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_left_frame_1_top.gfx")
};

// 0x2c2f58
static const u8 sSamusGfx_Shinesparking_Sideways_Frame1_Bottom[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_frame_1_bottom.gfx")
};

// 0x2c307a
static const u8 sSamusGfx_Shinesparking_Sideways_Right_Frame0_Top[SAMUS_GFX_SIZE(7, 7)] = {
    7, 7,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_right_frame_0_top.gfx")
};

// 0x2c323c
static const u8 sSamusGfx_Shinesparking_Sideways_Right_Frame1_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/shinesparking_sideways_right_frame_1_top.gfx")
};

// 0x2c337e
static const u16 sSamusOam_DelayBeforeShinesparking_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c339e
static const u16 sSamusOam_MidAir_None_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-14, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c33be
static const u16 sSamusOam_MidAir_None_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c33d8
static const u16 sSamusOam_MidAir_None_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -4, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-13, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c33f2
static const u16 sSamusOam_MidAir_None_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c340c
static const u16 sSamusOam_MidAir_None_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c3426
static const u16 sSamusOam_MidAir_None_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-14, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c3440
static const u16 sSamusOam_Landing_None_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-13, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c345a
static const u16 sSamusOam_Landing_None_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -39, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-13, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c347a
static const u16 sSamusOam_2c347a[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -47, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c349a
static const u16 sSamusOam_MidAir_Up_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -48, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c34ba
static const u16 sSamusOam_MidAir_Up_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -45, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c34d4
static const u16 sSamusOam_MidAir_Up_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -4, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c34ee
static const u16 sSamusOam_MidAir_Up_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3508
static const u16 sSamusOam_MidAir_Up_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -47, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3522
static const u16 sSamusOam_MidAir_Up_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c353c
static const u16 sSamusOam_Landing_Up_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3556
static const u16 sSamusOam_Landing_Up_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3570
static const u16 sSamusOam_2c3570[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c3590
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c35b0
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c35ca
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -4, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c35e4
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c35fe
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3618
static const u16 sSamusOam_MidAir_DiagonalUp_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3632
static const u16 sSamusOam_Landing_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c364c
static const u16 sSamusOam_Landing_DiagonalUp_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3666
static const u16 sSamusOam_2c3666[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c368c
static const u16 sSamusOam_MidAir_Forward_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c36b2
static const u16 sSamusOam_MidAir_Forward_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c36d2
static const u16 sSamusOam_MidAir_Forward_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -4, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c36f2
static const u16 sSamusOam_MidAir_Forward_Left_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3712
static const u16 sSamusOam_MidAir_Forward_Left_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -44, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3732
static const u16 sSamusOam_MidAir_Forward_Left_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3752
static const u16 sSamusOam_Landing_Forward_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3772
static const u16 sSamusOam_Landing_Forward_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -39, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3792
static const u16 sSamusOam_2c3792[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-16, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c37b2
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-17, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c37d2
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2c37ec
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-16, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -4, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3806
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3820
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -25, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c383a
static const u16 sSamusOam_MidAir_DiagonalDown_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3854
static const u16 sSamusOam_Landing_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-16, -17, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c386e
static const u16 sSamusOam_Landing_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3888
static const u16 sSamusOam_2c3888[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -43, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c38a2
static const u16 sSamusOam_2c38a2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-11, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c38bc
static const u16 sSamusOam_2c38bc[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-11, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c38d6
static const u16 sSamusOam_2c38d6[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-17, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c38f0
static const u16 sSamusOam_MidAir_Down_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-12, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-12, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-2, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c390a
static const u16 sSamusOam_MidAir_Down_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-12, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-12, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-4, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-4, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3924
static const u16 sSamusOam_DelayBeforeShinesparking_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-3, -27, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3944
static const u16 sSamusOam_MidAir_None_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-3, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -2, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3964
static const u16 sSamusOam_MidAir_None_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-3, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c397e
static const u16 sSamusOam_MidAir_None_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-3, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -4, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3998
static const u16 sSamusOam_MidAir_None_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-3, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c39b2
static const u16 sSamusOam_MidAir_None_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c39cc
static const u16 sSamusOam_MidAir_None_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c39e6
static const u16 sSamusOam_Landing_None_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-3, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3a00
static const u16 sSamusOam_Landing_None_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-3, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -39, OAM_DIMS_8x8, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2c3a20
static const u16 sSamusOam_2c3a20[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3a3a
static const u16 sSamusOam_MidAir_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -2, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3a54
static const u16 sSamusOam_MidAir_Up_Right_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3a68
static const u16 sSamusOam_MidAir_Up_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -4, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3a7c
static const u16 sSamusOam_MidAir_Up_Right_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3a90
static const u16 sSamusOam_MidAir_Up_Right_Frame4[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3aa4
static const u16 sSamusOam_MidAir_Up_Right_Frame5[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3ab8
static const u16 sSamusOam_Landing_Up_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3acc
static const u16 sSamusOam_2c3acc[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3aec
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -2, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3b0c
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3b26
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -4, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3b40
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3b5a
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3b74
static const u16 sSamusOam_MidAir_DiagonalUp_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -27, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -11, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3b8e
static const u16 sSamusOam_Landing_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3ba8
static const u16 sSamusOam_Landing_DiagonalUp_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3bc2
static const u16 sSamusOam_2c3bc2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(0, -42, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3be2
static const u16 sSamusOam_MidAir_Forward_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(1, -44, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -2, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3c02
static const u16 sSamusOam_MidAir_Forward_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -43, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c1c
static const u16 sSamusOam_MidAir_Forward_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -38, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -4, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c36
static const u16 sSamusOam_MidAir_Forward_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c50
static const u16 sSamusOam_MidAir_Forward_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -44, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c6a
static const u16 sSamusOam_MidAir_Forward_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -43, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c84
static const u16 sSamusOam_Landing_Forward_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -36, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3c9e
static const u16 sSamusOam_Landing_Forward_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -39, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3cb8
static const u16 sSamusOam_2c3cb8[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(0, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3cd8
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -2, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3cf8
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d12
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -19, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -4, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d2c
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d46
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d60
static const u16 sSamusOam_MidAir_DiagonalDown_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d7a
static const u16 sSamusOam_Landing_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3d94
static const u16 sSamusOam_Landing_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3dae
static const u16 sSamusOam_2c3dae[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-7, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3dc2
static const u16 sSamusOam_2c3dc2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(11, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3ddc
static const u16 sSamusOam_2c3ddc[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3df6
static const u16 sSamusOam_MidAir_Down_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-4, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-4, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -30, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3e10
static const u16 sSamusOam_MidAir_Down_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-4, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-4, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -30, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-12, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3e2a
static const u16 sSamusOam_Spinning_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -29, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -13, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2c3e38
static const u16 sSamusOam_Spinning_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -21, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2c3e40
static const u16 sSamusOam_Spinning_Frame3[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -13, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c3e4e
static const u16 sSamusOam_Spinning_Frame4[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -13, OAM_DIMS_32x16, OAM_XY_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -29, OAM_DIMS_32x16, OAM_XY_FLIP, 0x4, 0, 0),
};

// 0x2c3e5c
static const u16 sSamusOam_Spinning_Frame5[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-16, -21, OAM_DIMS_32x16, OAM_XY_FLIP, 0x0, 0, 0),
};

// 0x2c3e64
static const u16 sSamusOam_Spinning_Frame7[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_XY_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_XY_FLIP, 0x2, 0, 0),
};

// 0x2c3e72
static const u16 sSamusOam_StartingSpinJump_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-12, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2c3e8c
static const u16 sSamusOam_StartingSpinJump_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -19, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3ea6
static const u16 sSamusOam_Shinesparking_Upwards_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-4, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3ec0
static const u16 sSamusOam_Shinesparking_Upwards_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-4, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2c3eda
static const u16 sSamusOam_Shinesparking_Upwards_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-11, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3ef4
static const u16 sSamusOam_Shinesparking_Upwards_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-12, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2c3f0e
static const u16 sSamusOam_Shinesparking_Sideways_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(5, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2c3f28
static const u16 sSamusOam_Shinesparking_Sideways_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(6, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(22, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x18, 0, 0),
};

// 0x2c3f48
static const u16 sSamusOam_Shinesparking_Sideways_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -20, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -20, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(3, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-21, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
};

// 0x2c3f68
static const u16 sSamusOam_Shinesparking_Sideways_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(2, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-22, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-30, -14, OAM_DIMS_8x8, OAM_X_FLIP, 0x18, 0, 0),
};

// 0x2c3f88
const struct SamusAnimData sSamusAnim_MidAir_None_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c3ff8
const struct SamusAnimData sSamusAnim_Landing_None_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Landing_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_None_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Landing_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Left_Frame1_Bottom,
        .pOam = sSamusOam_Landing_None_Left_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4028
const struct SamusAnimData sSamusAnim_MidAir_Up_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_Up_Left_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4098
const struct SamusAnimData sSamusAnim_Landing_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_Up_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Left_Frame1_Bottom,
        .pOam = sSamusOam_Landing_Up_Left_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c40c8
const struct SamusAnimData sSamusAnim_MidAir_DiagonalUp_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Left_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4138
const struct SamusAnimData sSamusAnim_Landing_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Left_Frame1_Bottom,
        .pOam = sSamusOam_Landing_DiagonalUp_Left_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4168
const struct SamusAnimData sSamusAnim_MidAir_Forward_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Left_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c41d8
const struct SamusAnimData sSamusAnim_Landing_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_Forward_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Left_Frame1_Bottom,
        .pOam = sSamusOam_Landing_Forward_Left_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4208
const struct SamusAnimData sSamusAnim_MidAir_DiagonalDown_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Left_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4278
const struct SamusAnimData sSamusAnim_Landing_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Left_Frame1_Bottom,
        .pOam = sSamusOam_Landing_DiagonalDown_Left_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c42a8
const struct SamusAnimData sSamusAnim_Unused_2c42a8[2] = {
    {
        .pTopGfx = sSamusGfx_2bf8e4,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c3888,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c42c8
const struct SamusAnimData sSamusAnim_Unused_2c42c8[2] = {
    {
        .pTopGfx = sSamusGfx_2bf986,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c38a2,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c42e8
const struct SamusAnimData sSamusAnim_Unused_2c42e8[2] = {
    {
        .pTopGfx = sSamusGfx_2bfa48,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c38bc,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4308
const struct SamusAnimData sSamusAnim_Unused_2c4308[2] = {
    {
        .pTopGfx = sSamusGfx_2bfb0a,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c38d6,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4328
const struct SamusAnimData sSamusAnim_Unused_2c4328[2] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4348
const struct SamusAnimData sSamusAnim_MidAir_None_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c43b8
const struct SamusAnimData sSamusAnim_Landing_None_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Landing_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_None_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Landing_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Right_Frame1_Bottom,
        .pOam = sSamusOam_Landing_None_Right_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c43e8
const struct SamusAnimData sSamusAnim_MidAir_Up_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4458
const struct SamusAnimData sSamusAnim_Landing_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_Up_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Up_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Right_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Up_Right_Frame3,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4488
const struct SamusAnimData sSamusAnim_MidAir_DiagonalUp_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalUp_Right_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c44f8
const struct SamusAnimData sSamusAnim_Landing_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalUp_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Right_Frame1_Bottom,
        .pOam = sSamusOam_Landing_DiagonalUp_Right_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4528
const struct SamusAnimData sSamusAnim_MidAir_Forward_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_Forward_Right_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4598
const struct SamusAnimData sSamusAnim_Landing_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_Forward_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Forward_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Right_Frame1_Bottom,
        .pOam = sSamusOam_Landing_Forward_Right_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c45c8
const struct SamusAnimData sSamusAnim_MidAir_DiagonalDown_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame4_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame5_Bottom,
        .pOam = sSamusOam_MidAir_DiagonalDown_Right_Frame5,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4638
const struct SamusAnimData sSamusAnim_Landing_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Frame0_Bottom,
        .pOam = sSamusOam_Landing_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Landing_NotNone_Right_Frame1_Bottom,
        .pOam = sSamusOam_Landing_DiagonalDown_Right_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4668
const struct SamusAnimData sSamusAnim_Unused_2c4668[2] = {
    {
        .pTopGfx = sSamusGfx_2c12a4,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c3dae,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4688
const struct SamusAnimData sSamusAnim_Unused_2c4688[2] = {
    {
        .pTopGfx = sSamusGfx_2c1326,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c3dc2,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c46a8
const struct SamusAnimData sSamusAnim_Unused_2c46a8[2] = {
    {
        .pTopGfx = sSamusGfx_2c13e8,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_2c3ddc,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c46c8
const struct SamusAnimData sSamusAnim_Unused_2c46c8[2] = {
    {
        .pTopGfx = sSamusGfx_2c14aa,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame3_Bottom,
        .pOam = sSamusOam_Landing_DiagonalDown_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c46e8
const struct SamusAnimData sSamusAnim_Unused_2c46e8[2] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4708
const struct SamusAnimData sSamusAnim_MidAir_Down_Left[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Left_Frame1,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4778
const struct SamusAnimData sSamusAnim_MidAir_Down_Right[7] = {
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_MidAir_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_Down_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_Down_Right_Frame1,
        .timer = 6
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c47e8
const struct SamusAnimData sSamusAnim_Spinning_Left[9] = {
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4878
const struct SamusAnimData sSamusAnim_Spinning_Right[9] = {
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4908
const struct SamusAnimData sSamusAnim_StartingSpinJump_Left[2] = {
    {
        .pTopGfx = sSamusGfx_StartingSpinJump_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingSpinJump_Frame0_Bottom,
        .pOam = sSamusOam_StartingSpinJump_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4928
const struct SamusAnimData sSamusAnim_StartingSpinJump_Right[2] = {
    {
        .pTopGfx = sSamusGfx_StartingSpinJump_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingSpinJump_Frame0_Bottom,
        .pOam = sSamusOam_StartingSpinJump_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4948
const struct SamusAnimData sSamusAnim_DelayBeforeShinesparking_Left[5] = {
    {
        .pTopGfx = sSamusGfx_DelayBeforeShinesparking_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_DelayBeforeShinesparking_Left_Frame0_Bottom,
        .pOam = sSamusOam_DelayBeforeShinesparking_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_None_Left_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4998
const struct SamusAnimData sSamusAnim_Shinesparking_Upwards_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame0_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Left_Frame0,
        .timer = 8
    },
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Left_Frame1,
        .timer = 255
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c49c8
const struct SamusAnimData sSamusAnim_DelayBeforeShinesparking_Right[5] = {
    {
        .pTopGfx = sSamusGfx_DelayBeforeShinesparking_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_DelayBeforeShinesparking_Right_Frame0_Bottom,
        .pOam = sSamusOam_DelayBeforeShinesparking_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame0_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame1_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_MidAir_None_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MidAir_NotDown_Frame2_Bottom,
        .pOam = sSamusOam_MidAir_None_Right_Frame2,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4a18
const struct SamusAnimData sSamusAnim_Shinesparking_Upwards_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame0_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Right_Frame0,
        .timer = 8
    },
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Right_Frame1,
        .timer = 255
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4a48
const struct SamusAnimData sSamusAnim_Shinesparking_Sideways_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame0_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Left_Frame0,
        .timer = 8
    },
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Left_Frame1,
        .timer = 255
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4a78
const struct SamusAnimData sSamusAnim_Shinesparking_Sideways_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame0_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Right_Frame0,
        .timer = 8
    },
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Right_Frame1,
        .timer = 255
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4aa8
const struct SamusAnimData sSamusAnim_DelayAfterShinesparking_Upwards_Left[10] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4b48
const struct SamusAnimData sSamusAnim_DelayAfterShinesparking_Upwards_Right[10] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Upwards_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Upwards_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Upwards_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4be8
const struct SamusAnimData sSamusAnim_DelayAfterShinesparking_Sideways_Left[10] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4c88
const struct SamusAnimData sSamusAnim_DelayAfterShinesparking_Sideways_Right[10] = {
    {
        .pTopGfx = sSamusGfx_Shinesparking_Sideways_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Shinesparking_Sideways_Frame1_Bottom,
        .pOam = sSamusOam_Shinesparking_Sideways_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame3,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame5,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame4,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Spinning_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Spinning_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2c4d28
static const u8 sSamusGfx_Landing_9_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_9_left_frame_0_top.gfx")
};

// 0x2c4dca
static const u8 sSamusGfx_2c4dca[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/2c4dcc.gfx")
};

// 0x2c4ecc
static const u8 sSamusGfx_Turning_Up_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_up_frame_0_top.gfx")
};

// 0x2c4f6e
static const u8 sSamusGfx_Turning_Up_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_up_frame_0_bottom.gfx")
};

// 0x2c5070
static const u8 sSamusGfx_Turning_Up_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_up_frame_1_top.gfx")
};

// 0x2c5112
static const u8 sSamusGfx_Landing_9_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_9_right_frame_0_top.gfx")
};

// 0x2c51b4
static const u8 sSamusGfx_Landing_7_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_7_left_frame_0_top.gfx")
};

// 0x2c5276
static const u8 sSamusGfx_2c5276[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/2c5278.gfx")
};

// 0x2c5378
static const u8 sSamusGfx_Turning_DiagonalUp_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_diagonal_up_frame_1_top.gfx")
};

// 0x2c543a
static const u8 sSamusGfx_Turning_Forward_Frame0_Bottom[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_forward_frame_0_bottom.gfx")
};

// 0x2c553c
static const u8 sSamusGfx_Turning_DiagonalUp_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_diagonal_up_frame_0_top.gfx")
};

// 0x2c55de
static const u8 sSamusGfx_Landing_7_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_7_right_frame_0_top.gfx")
};

// 0x2c56a0
static const u8 sSamusGfx_Landing_5_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_5_left_frame_0_top.gfx")
};

// 0x2c5782
static const u8 sSamusGfx_2c5782[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/2c5784.gfx")
};

// 0x2c5884
static const u8 sSamusGfx_Turning_Forward_Frame1_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_forward_frame_1_top.gfx")
};

// 0x2c5986
static const u8 sSamusGfx_Turning_Forward_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_forward_frame_0_top.gfx")
};

// 0x2c5a68
static const u8 sSamusGfx_2c5a68[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/2c5a6a.gfx")
};

// 0x2c5b4a
static const u8 sSamusGfx_Landing_8_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/landing_8_left_frame_0_top.gfx")
};

// 0x2c5c4c
static const u8 sSamusGfx_2c5c4c[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/2c5c4e.gfx")
};

// 0x2c5d4e
static const u8 sSamusGfx_Turning_DiagonalDown_Frame1_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_diagonal_down_frame_1_top.gfx")
};

// 0x2c5e50
static const u8 sSamusGfx_Turning_DiagonalDown_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_diagonal_down_frame_0_top.gfx")
};

// 0x2c5f52
static const u8 sSamusGfx_2c5f52[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/2c5f54.gfx")
};

// 0x2c6034
static const u8 sSamusGfx_Landing_9_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_9_frame_0_bottom.gfx")
};

// 0x2c60f6
static const u8 sSamusGfx_TurningAndCrouching_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_and_crouching_frame_0_bottom.gfx")
};

// 0x2c61b8
static const u8 sSamusGfx_Landing_7_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_7_frame_0_bottom.gfx")
};

// 0x2c627a
static const u8 sSamusGfx_Landing_5_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_5_frame_0_bottom.gfx")
};

// 0x2c633c
static const u8 sSamusGfx_Landing_5_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_5_right_frame_0_top.gfx")
};

// 0x2c63fe
static const u8 sSamusGfx_Landing_8_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/landing_8_frame_0_bottom.gfx")
};

// 0x2c64c0
static const u8 sSamusGfx_Landing_8_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/landing_8_right_frame_0_top.gfx")
};

// 0x2c6562
static const u8 sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_mid_air_not_diagonal_down_frame_0_bottom.gfx")
};

// 0x2c6624
static const u8 sSamusGfx_TurningMidAir_Down_Left_Frame0_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/turning_mid_air_down_left_frame_0_top.gfx")
};

// 0x2c6746
static const u8 sSamusGfx_2c6746[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2c6748.gfx")
};

// 0x2c6868
static const u8 sSamusGfx_Unmorphing_Frame2_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/unmorphing_frame_2_top.gfx")
};

// 0x2c696a
static const u8 sSamusGfx_Morphing_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/morphing_frame_0_top.gfx")
};

// 0x2c6a6c
static const u8 sSamusGfx_Morphing_Frame1_Top[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/morphing_frame_1_top.gfx")
};

// 0x2c6aee
static const u8 sSamusGfx_MorphBall_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/morph_ball_frame_0_top.gfx")
};

// 0x2c6b90
static const u8 sSamusGfx_MorphBall_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/morph_ball_frame_1_top.gfx")
};

// 0x2c6c32
static const u8 sSamusGfx_MorphBall_Frame2_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/morph_ball_frame_2_top.gfx")
};

// 0x2c6cd4
static const u8 sSamusGfx_FacingForeground_Frame0_Top[SAMUS_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/samus/graphics/body/facing_foreground_frame_0_top.gfx")
};

// 0x2c6eb6
static const u8 sSamusGfx_FacingForeground_Frame1_Top[SAMUS_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/samus/graphics/body/facing_foreground_frame_1_top.gfx")
};

// 0x2c7098
static const u8 sSamusGfx_FacingForeground_Frame2_Top[SAMUS_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/samus/graphics/body/facing_foreground_frame_2_top.gfx")
};

// 0x2c727a
static const u8 sSamusGfx_FacingBackground_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/facing_background_left_frame_3_top.gfx")
};

// 0x2c733c
static const u8 sSamusGfx_FacingBackground_Frame3_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/facing_background_frame_3_bottom.gfx")
};

// 0x2c73be
static const u8 sSamusGfx_FacingBackground_Frame0_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/facing_background_frame_0_top.gfx")
};

// 0x2c74e0
static const u8 sSamusGfx_FacingBackground_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/facing_background_frame_0_bottom.gfx")
};

// 0x2c75a2
static const u8 sSamusGfx_FacingBackground_Right_Frame3_Top[SAMUS_GFX_SIZE(6, 4)] = {
    6, 4,
    _INCBIN_U8("data/samus/graphics/body/facing_background_right_frame_3_top.gfx")
};

// 0x2c76e4
static const u8 sSamusGfx_OnNavigationPad_Frame10_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_10_top.gfx")
};

// 0x2c7806
static const u8 sSamusGfx_OnNavigationPad_Frame3_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_3_top.gfx")
};

// 0x2c7928
static const u8 sSamusGfx_OnNavigationPad_Frame11_Top[SAMUS_GFX_SIZE(7, 4)] = {
    7, 4,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_11_top.gfx")
};

// 0x2c7a8a
static const u8 sSamusGfx_OnNavigationPad_Frame7_Top[SAMUS_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_7_top.gfx")
};

// 0x2c7c0c
static const u8 sSamusGfx_OnNavigationPad_Frame14_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_14_top.gfx")
};

// 0x2c7d2e
static const u8 sSamusGfx_OnNavigationPad_Frame12_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/on_navigation_pad_frame_12_top.gfx")
};

// 0x2c7e50
static const u8 sSamusGfx_UsingElevator_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/using_elevator_left_frame_0_top.gfx")
};

// 0x2c7f12
static const u8 sSamusGfx_UsingElevator_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/using_elevator_frame_0_bottom.gfx")
};

// 0x2c7f94
static const u8 sSamusGfx_UsingElevator_Frame2_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/using_elevator_frame_2_top.gfx")
};

// 0x2c80b6
static const u8 sSamusGfx_UsingElevator_Frame2_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/using_elevator_frame_2_bottom.gfx")
};

// 0x2c8178
static const u8 sSamusGfx_2c8178[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/2c817a.gfx")
};

// 0x2c829a
static const u8 sSamusGfx_2c829a[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/2c829c.gfx")
};

// 0x2c835c
static const u8 sSamusGfx_UsingElevator_Right_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/using_elevator_right_frame_0_top.gfx")
};

// 0x2c845e
static const u8 sSamusGfx_DownloadingAbility_Frame0_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_0_top.gfx")
};

// 0x2c8580
static const u8 sSamusGfx_DownloadingAbility_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_0_bottom.gfx")
};

// 0x2c8642
static const u8 sSamusGfx_DownloadingAbility_Frame10_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_10_top.gfx")
};

// 0x2c8764
static const u8 sSamusGfx_DownloadingAbility_Frame10_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_10_bottom.gfx")
};

// 0x2c8826
static const u8 sSamusGfx_DownloadingAbility_Frame12_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_12_top.gfx")
};

// 0x2c8948
static const u8 sSamusGfx_DownloadingAbility_Frame12_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_12_bottom.gfx")
};

// 0x2c8a0a
static const u8 sSamusGfx_DownloadingAbility_Frame14_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_14_top.gfx")
};

// 0x2c8b2c
static const u8 sSamusGfx_DownloadingAbility_Frame14_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_14_bottom.gfx")
};

// 0x2c8bee
static const u8 sSamusGfx_DownloadingAbility_Frame15_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_15_top.gfx")
};

// 0x2c8d10
static const u8 sSamusGfx_DownloadingAbility_Frame15_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_15_bottom.gfx")
};

// 0x2c8dd2
static const u8 sSamusGfx_DownloadingAbility_Frame13_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_13_top.gfx")
};

// 0x2c8ef4
static const u8 sSamusGfx_DownloadingAbility_Frame13_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_13_bottom.gfx")
};

// 0x2c8fb6
static const u8 sSamusGfx_DownloadingAbility_Frame11_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_11_top.gfx")
};

// 0x2c90d8
static const u8 sSamusGfx_DownloadingAbility_Frame11_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_11_bottom.gfx")
};

// 0x2c919a
static const u8 sSamusGfx_DownloadingAbility_Frame9_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_9_top.gfx")
};

// 0x2c92bc
static const u8 sSamusGfx_DownloadingAbility_Frame9_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/downloading_ability_frame_9_bottom.gfx")
};

// 0x2c937e
static const u8 sSamusGfx_BeingRecharged_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_left_frame_0_top.gfx")
};

// 0x2c9460
static const u8 sSamusGfx_BeingRecharged_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_frame_0_bottom.gfx")
};

// 0x2c9522
static const u8 sSamusGfx_BeingRecharged_Left_Frame2_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_left_frame_2_top.gfx")
};

// 0x2c9604
static const u8 sSamusGfx_BeingRecharged_Frame2_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_frame_2_bottom.gfx")
};

// 0x2c96c6
static const u8 sSamusGfx_BeingRecharged_Left_Frame4_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_left_frame_4_top.gfx")
};

// 0x2c97a8
static const u8 sSamusGfx_BeingRecharged_Frame4_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_frame_4_bottom.gfx")
};

// 0x2c986a
static const u8 sSamusGfx_BeingRecharged_Left_Frame6_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_left_frame_6_top.gfx")
};

// 0x2c994c
static const u8 sSamusGfx_BeingRecharged_Frame6_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_frame_6_bottom.gfx")
};

// 0x2c9a0e
static const u8 sSamusGfx_BeingRecharged_Left_Frame1_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_left_frame_1_top.gfx")
};

// 0x2c9af0
static const u8 sSamusGfx_BeingRecharged_Frame1_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_frame_1_bottom.gfx")
};

// 0x2c9bb2
static const u8 sSamusGfx_BeingRecharged_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_right_frame_0_top.gfx")
};

// 0x2c9c74
static const u8 sSamusGfx_BeingRecharged_Right_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_right_frame_2_top.gfx")
};

// 0x2c9d36
static const u8 sSamusGfx_BeingRecharged_Right_Frame4_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_right_frame_4_top.gfx")
};

// 0x2c9df8
static const u8 sSamusGfx_BeingRecharged_Right_Frame6_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_right_frame_6_top.gfx")
};

// 0x2c9eba
static const u8 sSamusGfx_BeingRecharged_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/being_recharged_right_frame_1_top.gfx")
};

// 0x2c9f7c
static const u8 sSamusGfx_UnlockingSecurity_Left_Frame0_Top[SAMUS_GFX_SIZE(7, 2)] = {
    7, 2,
    _INCBIN_U8("data/samus/graphics/body/unlocking_security_left_frame_0_top.gfx")
};

// 0x2ca09e
static const u8 sSamusGfx_UnlockingSecurity_Right_Frame0_Top[SAMUS_GFX_SIZE(6, 2)] = {
    6, 2,
    _INCBIN_U8("data/samus/graphics/body/unlocking_security_right_frame_0_top.gfx")
};

// 0x2ca1a0
static const u8 sSamusGfx_UnlockingHabitationsDeck_Frame0_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/unlocking_habitations_deck_frame_0_top.gfx")
};

// 0x2ca2c2
static const u8 sSamusGfx_UnlockingHabitationsDeck_Frame0_Bottom[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/unlocking_habitations_deck_frame_0_bottom.gfx")
};

// 0x2ca384
static const u8 sSamusGfx_UnlockingHabitationsDeck_Frame1_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/unlocking_habitations_deck_frame_1_top.gfx")
};

// 0x2ca4a6
static const u8 sSamusGfx_UnlockingHabitationsDeck_Frame4_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/unlocking_habitations_deck_frame_4_top.gfx")
};

// 0x2ca5c8
static const u8 sSamusGfx_UnlockingHabitationsDeck_Frame4_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/unlocking_habitations_deck_frame_4_bottom.gfx")
};

// 0x2ca66a
static const u16 sSamusOam_2ca66a[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2ca68a
static const u16 sSamusOam_Turning_Up_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2ca6aa
static const u16 sSamusOam_Turning_Up_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2ca6ca
static const u16 sSamusOam_2ca6ca[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -46, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2ca6ea
static const u16 sSamusOam_2ca6ea[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca70a
static const u16 sSamusOam_Turning_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca72a
static const u16 sSamusOam_Turning_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca74a
static const u16 sSamusOam_2ca74a[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(11, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca76a
static const u16 sSamusOam_2ca76a[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2ca790
static const u16 sSamusOam_Turning_Forward_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca7b6
static const u16 sSamusOam_Turning_Forward_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(8, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca7dc
static const u16 sSamusOam_2ca7dc[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-7, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -41, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(9, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2ca802
static const u16 sSamusOam_2ca802[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -27, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
};

// 0x2ca822
static const u16 sSamusOam_Turning_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-13, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca848
static const u16 sSamusOam_Turning_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-8, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(8, -35, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca86e
static const u16 sSamusOam_2ca86e[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-5, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(11, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
};

// 0x2ca894
static const u16 sSamusOam_TurningAndCrouching_Up_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca8ae
static const u16 sSamusOam_TurningAndCrouching_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca8c8
static const u16 sSamusOam_Landing_9_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca8e2
static const u16 sSamusOam_Landing_7_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca8fc
static const u16 sSamusOam_TurningAndCrouching_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-15, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca916
static const u16 sSamusOam_TurningAndCrouching_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca930
static const u16 sSamusOam_Landing_7_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca94a
static const u16 sSamusOam_Landing_5_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca96a
static const u16 sSamusOam_TurningAndCrouching_Forward_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-17, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca98a
static const u16 sSamusOam_TurningAndCrouching_Forward_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(8, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca9aa
static const u16 sSamusOam_Landing_5_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2ca9c4
static const u16 sSamusOam_Landing_8_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-18, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca9de
static const u16 sSamusOam_TurningAndCrouching_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-14, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -25, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-14, -9, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-15, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2ca9fe
static const u16 sSamusOam_TurningAndCrouching_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(8, -25, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2caa1e
static const u16 sSamusOam_Landing_8_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -9, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2caa38
static const u16 sSamusOam_TurningMidAir_Up_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caa52
static const u16 sSamusOam_TurningMidAir_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -42, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2caa6c
static const u16 sSamusOam_TurningMidAir_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-8, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -34, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caa86
static const u16 sSamusOam_TurningMidAir_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -34, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2caaa0
static const u16 sSamusOam_TurningMidAir_Forward_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -36, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-16, -28, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caac0
static const u16 sSamusOam_TurningMidAir_Forward_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -37, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(8, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2caae0
static const u16 sSamusOam_TurningMidAir_Down_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-13, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -15, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-15, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 1, 0),
};

// 0x2cab06
static const u16 sSamusOam_TurningMidAir_Down_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(8, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2cab26
static const u16 sSamusOam_2cab26[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-6, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-15, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2cab4c
static const u16 sSamusOam_2cab4c[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-10, -33, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -41, OAM_DIMS_8x8, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x17, 0, 0),
    OAM_ENTRY(-1, -28, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2cab72
static const u16 sSamusOam_Unmorphing_Left_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2cab86
static const u16 sSamusOam_Morphing_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2cab9a
static const u16 sSamusOam_Morphing_Left_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-9, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2caba2
static const u16 sSamusOam_MorphBall_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2cabb0
static const u16 sSamusOam_MorphBall_Left_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2cabbe
static const u16 sSamusOam_MorphBall_Left_Frame2[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2cabcc
static const u16 sSamusOam_MorphBall_Left_Frame3[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x16, OAM_Y_FLIP, 0x0, 0, 0),
};

// 0x2cabda
static const u16 sSamusOam_MorphBall_Frame4[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -16, OAM_DIMS_16x16, OAM_Y_FLIP, 0x0, 0, 0),
};

// 0x2cabe8
static const u16 sSamusOam_MorphBall_Left_Frame5[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x16, OAM_XY_FLIP, 0x0, 0, 0),
};

// 0x2cabf6
static const u16 sSamusOam_MorphBall_Left_Frame6[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -18, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
};

// 0x2cac04
static const u16 sSamusOam_MorphBall_Left_Frame7[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-8, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
};

// 0x2cac12
static const u16 sSamusOam_Unmorphing_Right_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2cac26
static const u16 sSamusOam_Morphing_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2cac3a
static const u16 sSamusOam_Morphing_Right_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OAM_ENTRY(-7, -17, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
};

// 0x2cac42
static const u16 sSamusOam_FacingForeground_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-12, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(4, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2cac68
static const u16 sSamusOam_FacingBackground_Left_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-8, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2cac7c
static const u16 sSamusOam_FacingBackground_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-11, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(5, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caca2
static const u16 sSamusOam_FacingBackground_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
};

// 0x2cacbc
static const u16 sSamusOam_OnNavigationPad_Frame10[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-11, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-3, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cace2
static const u16 sSamusOam_OnNavigationPad_Frame11[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-19, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-3, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-3, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cad08
static const u16 sSamusOam_OnNavigationPad_Frame7[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-19, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-3, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-3, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cad2e
static const u16 sSamusOam_OnNavigationPad_Frame12[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-3, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cad54
static const u16 sSamusOam_UsingElevator_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(5, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2cad7a
static const u16 sSamusOam_2cad7a[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(7, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(6, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2cada0
static const u16 sSamusOam_UsingElevator_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2cadba
static const u16 sSamusOam_DownloadingAbility_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-12, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(4, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cade0
static const u16 sSamusOam_BeingRecharged_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-19, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2cae00
static const u16 sSamusOam_BeingRecharged_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2cae1a
static const u16 sSamusOam_BeingRecharged_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2cae34
static const u16 sSamusOam_UnlockingSecurity_Left_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-11, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-19, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-6, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-14, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-19, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2cae5a
static const u16 sSamusOam_UnlockingSecurity_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -16, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -16, OAM_DIMS_8x16, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(3, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2cae7a
static const u16 sSamusOam_UnlockingHabitationsDeck_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-13, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(3, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-11, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(5, -16, OAM_DIMS_8x16, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caea0
static const u16 sSamusOam_UnlockingHabitationsDeck_Frame4[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-9, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(7, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(7, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-9, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(7, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2caec8
const struct SamusAnimData sSamusAnim_Turning_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Up_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Up_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Up_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Up_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2caef8
const struct SamusAnimData sSamusAnim_Turning_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Up_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Up_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Up_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Up_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2caf28
const struct SamusAnimData sSamusAnim_Turning_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2caf58
const struct SamusAnimData sSamusAnim_Turning_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2caf88
const struct SamusAnimData sSamusAnim_Turning_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cafb8
const struct SamusAnimData sSamusAnim_Turning_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cafe8
const struct SamusAnimData sSamusAnim_Turning_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb018
const struct SamusAnimData sSamusAnim_Turning_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb048
const struct SamusAnimData sSamusAnim_TurningAndCrouching_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Up_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Up_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb078
const struct SamusAnimData sSamusAnim_TurningAndCrouching_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Up_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Up_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb0a8
const struct SamusAnimData sSamusAnim_TurningAndCrouching_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb0d8
const struct SamusAnimData sSamusAnim_TurningAndCrouching_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb108
const struct SamusAnimData sSamusAnim_TurningAndCrouching_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Forward_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Forward_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb138
const struct SamusAnimData sSamusAnim_TurningAndCrouching_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Forward_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Forward_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb168
const struct SamusAnimData sSamusAnim_TurningAndCrouching_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb198
const struct SamusAnimData sSamusAnim_TurningAndCrouching_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalDown_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningAndCrouching_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_DiagonalDown_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb1c8
const struct SamusAnimData sSamusAnim_TurningMidAir_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Up_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Up_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb1f8
const struct SamusAnimData sSamusAnim_TurningMidAir_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Up_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Up_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Up_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb228
const struct SamusAnimData sSamusAnim_TurningMidAir_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb258
const struct SamusAnimData sSamusAnim_TurningMidAir_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_DiagonalUp_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalUp_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_DiagonalUp_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb288
const struct SamusAnimData sSamusAnim_TurningMidAir_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Forward_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Forward_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb2b8
const struct SamusAnimData sSamusAnim_TurningMidAir_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Forward_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Forward_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb2e8
const struct SamusAnimData sSamusAnim_TurningMidAir_Down_Left[3] = {
    {
        .pTopGfx = sSamusGfx_TurningMidAir_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Down_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Down_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb318
const struct SamusAnimData sSamusAnim_TurningMidAir_Down_Right[3] = {
    {
        .pTopGfx = sSamusGfx_Turning_DiagonalDown_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Down_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_TurningMidAir_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningMidAir_NotDiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_TurningMidAir_Down_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb348
const struct SamusAnimData sSamusAnim_Landing_9_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_9_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_9_Frame0_Bottom,
        .pOam = sSamusOam_TurningAndCrouching_Up_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb368
const struct SamusAnimData sSamusAnim_Landing_9_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_9_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_9_Frame0_Bottom,
        .pOam = sSamusOam_Landing_9_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb388
const struct SamusAnimData sSamusAnim_Landing_7_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_7_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_7_Frame0_Bottom,
        .pOam = sSamusOam_Landing_7_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb3a8
const struct SamusAnimData sSamusAnim_Landing_7_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_7_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_7_Frame0_Bottom,
        .pOam = sSamusOam_Landing_7_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb3c8
const struct SamusAnimData sSamusAnim_Landing_5_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_5_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_5_Frame0_Bottom,
        .pOam = sSamusOam_Landing_5_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb3e8
const struct SamusAnimData sSamusAnim_Landing_5_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_5_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_5_Frame0_Bottom,
        .pOam = sSamusOam_Landing_5_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb408
const struct SamusAnimData sSamusAnim_Landing_8_Left[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_8_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_8_Frame0_Bottom,
        .pOam = sSamusOam_Landing_8_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb428
const struct SamusAnimData sSamusAnim_Landing_8_Right[2] = {
    {
        .pTopGfx = sSamusGfx_Landing_8_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Landing_8_Frame0_Bottom,
        .pOam = sSamusOam_Landing_8_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb448
const struct SamusAnimData sSamusAnim_Morphing_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Morphing_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Morphing_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Left_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame7,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb488
const struct SamusAnimData sSamusAnim_MorphBall_Left[9] = {
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame7,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb518
const struct SamusAnimData sSamusAnim_Unmorphing_Left[4] = {
    {
        .pTopGfx = sSamusGfx_Morphing_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Left_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Morphing_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Unmorphing_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Unmorphing_Left_Frame2,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb558
const struct SamusAnimData sSamusAnim_Morphing_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Morphing_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Morphing_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Right_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb598
const struct SamusAnimData sSamusAnim_MorphBall_Right[9] = {
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame7,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame5,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Frame4,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame3,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame2,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_MorphBall_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_MorphBall_Left_Frame1,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb628
const struct SamusAnimData sSamusAnim_Unmorphing_Right[4] = {
    {
        .pTopGfx = sSamusGfx_Morphing_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Right_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Morphing_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Morphing_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Unmorphing_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Unmorphing_Right_Frame2,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb668
const struct SamusAnimData sSamusAnim_OnSavePad_Left[5] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb6b8
const struct SamusAnimData sSamusAnim_OnSavePad_Right[5] = {
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb708
const struct SamusAnimData sSamusAnim_FacingForeground_Left[5] = {
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame1_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb758
const struct SamusAnimData sSamusAnim_FacingForeground_Right[5] = {
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_Turning_Forward_Frame0_Top,
        .pBottomGfx = sSamusGfx_Turning_Forward_Frame0_Bottom,
        .pOam = sSamusOam_Turning_Forward_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb7a8
const struct SamusAnimData sSamusAnim_OnNavigationPad_Left[17] = {
    {
        .pTopGfx = sSamusGfx_FacingBackground_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame3_Bottom,
        .pOam = sSamusOam_FacingBackground_Left_Frame3,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame7_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame7_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame12_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame12,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 12
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame14_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 30
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 8
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb8b8
const struct SamusAnimData sSamusAnim_FacingBackground_Left[5] = {
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame3_Bottom,
        .pOam = sSamusOam_FacingBackground_Left_Frame3,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cb908
const struct SamusAnimData sSamusAnim_OnNavigationPad_Right[17] = {
    {
        .pTopGfx = sSamusGfx_FacingBackground_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame3_Bottom,
        .pOam = sSamusOam_FacingBackground_Right_Frame3,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame7_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame7_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame10_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame11_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame11,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame12_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame12,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 12
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame14_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 30
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 8
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cba18
const struct SamusAnimData sSamusAnim_FacingBackground_Right[5] = {
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Frame0_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame3_Bottom,
        .pOam = sSamusOam_FacingBackground_Right_Frame3,
        .timer = 8
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cba68
const struct SamusAnimData sSamusAnim_UsingElevator_Left[6] = {
    {
        .pTopGfx = sSamusGfx_UsingElevator_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame0_Bottom,
        .pOam = sSamusOam_FacingBackground_Left_Frame3,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 255
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbac8
const struct SamusAnimData sSamusAnim_UsingElevator_Right[6] = {
    {
        .pTopGfx = sSamusGfx_UsingElevator_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame0_Bottom,
        .pOam = sSamusOam_UsingElevator_Right_Frame0,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 255
    },
    {
        .pTopGfx = sSamusGfx_UsingElevator_Frame2_Top,
        .pBottomGfx = sSamusGfx_UsingElevator_Frame2_Bottom,
        .pOam = sSamusOam_UsingElevator_Frame2,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbb28
const struct SamusAnimData sSamusAnim_DownloadingAbility_Left[17] = {
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame0_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame0_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame10_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame10_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame15_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame15_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame12_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame12_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame13_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame13_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame14_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame14_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame11_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame11_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame0_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame0_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame9_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame9_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame10_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame10_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame11_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame11_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame12_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame12_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame13_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame13_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame14_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame14_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame15_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame15_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbc38
const struct SamusAnimData sSamusAnim_DownloadingAbility_Right[17] = {
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame0_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame0_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_FacingForeground_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_FacingForeground_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame10_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame10_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame15_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame15_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame12_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame12_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame13_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame13_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame14_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame14_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame11_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame11_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame0_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame0_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame9_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame9_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame10_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame10_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame11_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame11_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame12_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame12_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame13_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame13_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame14_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame14_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_DownloadingAbility_Frame15_Top,
        .pBottomGfx = sSamusGfx_DownloadingAbility_Frame15_Bottom,
        .pOam = sSamusOam_DownloadingAbility_Frame0,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbd48
const struct SamusAnimData sSamusAnim_BeingRecharged_Left[9] = {
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame0_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame2_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame4_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame6_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame6_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Left_Frame0,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbdd8
const struct SamusAnimData sSamusAnim_BeingRecharged_Right[9] = {
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame0_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame2_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame4_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame6_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame6_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_BeingRecharged_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_BeingRecharged_Right_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbe68
const struct SamusAnimData sSamusAnim_UnlockingSecurity_Left[2] = {
    {
        .pTopGfx = sSamusGfx_UnlockingSecurity_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_UnlockingSecurity_Left_Frame0,
        .timer = 60
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbe88
const struct SamusAnimData sSamusAnim_UnlockingSecurity_Right[2] = {
    {
        .pTopGfx = sSamusGfx_UnlockingSecurity_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_BeingRecharged_Frame1_Bottom,
        .pOam = sSamusOam_UnlockingSecurity_Right_Frame0,
        .timer = 60
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbea8
const struct SamusAnimData sSamusAnim_UnlockingHabitationsDeck[7] = {
    {
        .pTopGfx = sSamusGfx_UnlockingHabitationsDeck_Frame0_Top,
        .pBottomGfx = sSamusGfx_UnlockingHabitationsDeck_Frame0_Bottom,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 8
    },
    {
        .pTopGfx = sSamusGfx_UnlockingHabitationsDeck_Frame1_Top,
        .pBottomGfx = sSamusGfx_UnlockingHabitationsDeck_Frame0_Bottom,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_UnlockingHabitationsDeck_Frame0_Top,
        .pBottomGfx = sSamusGfx_UnlockingHabitationsDeck_Frame0_Bottom,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_OnNavigationPad_Frame7_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame0_Bottom,
        .pOam = sSamusOam_OnNavigationPad_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_UnlockingHabitationsDeck_Frame4_Top,
        .pBottomGfx = sSamusGfx_UnlockingHabitationsDeck_Frame4_Bottom,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame4,
        .timer = 32
    },
    {
        .pTopGfx = sSamusGfx_FacingBackground_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_FacingBackground_Frame3_Bottom,
        .pOam = sSamusOam_FacingBackground_Right_Frame3,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2cbf18
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_3_top.gfx")
};

// 0x2cc09a
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_3_bottom.gfx")
};

// 0x2cc15c
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_4_top.gfx")
};

// 0x2cc2de
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_4_bottom.gfx")
};

// 0x2cc3a0
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_5_top.gfx")
};

// 0x2cc522
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_5_bottom.gfx")
};

// 0x2cc5e4
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_0_top.gfx")
};

// 0x2cc766
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_0_bottom.gfx")
};

// 0x2cc828
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_1_top.gfx")
};

// 0x2cc9aa
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_1_bottom.gfx")
};

// 0x2cca6c
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_2_top.gfx")
};

// 0x2ccbee
static const u8 sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_left_frame_2_bottom.gfx")
};

// 0x2cccb0
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_0_top.gfx")
};

// 0x2cce32
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame1_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_1_top.gfx")
};

// 0x2ccfb4
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame2_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_2_top.gfx")
};

// 0x2cd136
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame3_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_3_top.gfx")
};

// 0x2cd2b8
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame4_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_4_top.gfx")
};

// 0x2cd43a
static const u8 sSamusGfx_HangingOnVerticalLadder_Right_Frame5_Top[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_from_vertical_ladder_right_frame_5_top.gfx")
};

// 0x2cd55c
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Top[SAMUS_GFX_SIZE(6, 6)] = {
    6, 6,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_left_frame_0_top.gfx")
};

// 0x2cd6de
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_left_frame_0_bottom.gfx")
};

// 0x2cd7a0
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Top[SAMUS_GFX_SIZE(6, 4)] = {
    6, 4,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_left_frame_1_top.gfx")
};

// 0x2cd8e2
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_left_frame_1_bottom.gfx")
};

// 0x2cd964
static const u8 sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_diagonal_up_left_frame_0_top.gfx")
};

// 0x2cda46
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_forward_left_frame_0_bottom.gfx")
};

// 0x2cdac8
static const u8 sSamusGfx_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_diagonal_up_left_frame_0_top.gfx")
};

// 0x2cdbaa
static const u8 sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_forward_left_frame_0_bottom.gfx")
};

// 0x2cdc2c
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_forward_left_frame_0_top.gfx")
};

// 0x2cdd2e
static const u8 sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_forward_left_frame_0_top.gfx")
};

// 0x2cde30
static const u8 sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_diagonal_down_left_frame_0_top.gfx")
};

// 0x2cdf12
static const u8 sSamusGfx_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_diagonal_down_left_frame_0_top.gfx")
};

// 0x2cdff4
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_right_frame_0_top.gfx")
};

// 0x2ce0f6
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_right_frame_0_bottom.gfx")
};

// 0x2ce178
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_right_frame_1_top.gfx")
};

// 0x2ce23a
static const u8 sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/starting_to_hold_arm_out_on_vertical_ladder_right_frame_1_bottom.gfx")
};

// 0x2ce2bc
static const u8 sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_diagonal_up_right_frame_0_top.gfx")
};

// 0x2ce37e
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_forward_right_frame_0_bottom.gfx")
};

// 0x2ce400
static const u8 sSamusGfx_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_diagonal_up_right_frame_0_top.gfx")
};

// 0x2ce4c2
static const u8 sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_forward_right_frame_0_bottom.gfx")
};

// 0x2ce544
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_forward_right_frame_0_top.gfx")
};

// 0x2ce606
static const u8 sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_forward_right_frame_0_top.gfx")
};

// 0x2ce6c8
static const u8 sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 3)] = {
    4, 3,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_diagonal_down_right_frame_0_top.gfx")
};

// 0x2ce7aa
static const u8 sSamusGfx_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 3)] = {
    4, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_diagonal_down_right_frame_0_top.gfx")
};

// 0x2ce88c
static const u8 sSamusGfx_StartingWallJump_Left_Frame0_Top[SAMUS_GFX_SIZE(7, 7)] = {
    7, 7,
    _INCBIN_U8("data/samus/graphics/body/starting_wall_jump_left_frame_0_top.gfx")
};

// 0x2cea4e
static const u8 sSamusGfx_StartingWallJump_Left_Frame1_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/starting_wall_jump_left_frame_1_top.gfx")
};

// 0x2ceb70
static const u8 sSamusGfx_StartingWallJump_Right_Frame0_Top[SAMUS_GFX_SIZE(7, 7)] = {
    7, 7,
    _INCBIN_U8("data/samus/graphics/body/starting_wall_jump_right_frame_0_top.gfx")
};

// 0x2ced32
static const u8 sSamusGfx_StartingWallJump_Right_Frame1_Top[SAMUS_GFX_SIZE(6, 3)] = {
    6, 3,
    _INCBIN_U8("data/samus/graphics/body/starting_wall_jump_right_frame_1_top.gfx")
};

// 0x2cee54
static const u8 sSamusGfx_HangingOnLedge_Default_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_left_frame_2_top.gfx")
};

// 0x2cef56
static const u8 sSamusGfx_HangingOnLedge_Default_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_frame_2_bottom.gfx")
};

// 0x2cf018
static const u8 sSamusGfx_HangingOnLedge_Default_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_left_frame_3_top.gfx")
};

// 0x2cf11a
static const u8 sSamusGfx_HangingOnLedge_Default_Frame3_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_frame_3_bottom.gfx")
};

// 0x2cf1dc
static const u8 sSamusGfx_HangingOnLedge_Default_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_left_frame_1_top.gfx")
};

// 0x2cf2de
static const u8 sSamusGfx_HangingOnLedge_Default_Frame1_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_frame_1_bottom.gfx")
};

// 0x2cf380
static const u8 sSamusGfx_HangingOnLedge_Default_Left_Frame5_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_left_frame_5_top.gfx")
};

// 0x2cf482
static const u8 sSamusGfx_HangingOnLedge_Default_Frame5_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_frame_5_bottom.gfx")
};

// 0x2cf524
static const u8 sSamusGfx_HangingOnLedge_Default_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_left_frame_0_top.gfx")
};

// 0x2cf626
static const u8 sSamusGfx_HangingOnLedge_Default_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_frame_0_bottom.gfx")
};

// 0x2cf6c8
static const u8 sSamusGfx_PullingUpFromHanging_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_left_frame_1_top.gfx")
};

// 0x2cf7ca
static const u8 sSamusGfx_PullingUpFromHanging_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_frame_1_bottom.gfx")
};

// 0x2cf88c
static const u8 sSamusGfx_PullingUpFromHanging_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_left_frame_2_top.gfx")
};

// 0x2cf98e
static const u8 sSamusGfx_PullingUpFromHanging_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_frame_2_bottom.gfx")
};

// 0x2cfa50
static const u8 sSamusGfx_PullingForwardFromHanging_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_left_frame_0_top.gfx")
};

// 0x2cfb52
static const u8 sSamusGfx_PullingForwardFromHanging_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_frame_0_bottom.gfx")
};

// 0x2cfc14
static const u8 sSamusGfx_PullingForwardFromHanging_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_left_frame_1_top.gfx")
};

// 0x2cfcd6
static const u8 sSamusGfx_PullingForwardFromHanging_Frame1_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_frame_1_bottom.gfx")
};

// 0x2cfd78
static const u8 sSamusGfx_PullingForwardFromHanging_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_left_frame_2_top.gfx")
};

// 0x2cfe3a
static const u8 sSamusGfx_PullingForwardFromHanging_Left_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_left_frame_2_bottom.gfx")
};

// 0x2cfefc
static const u8 sSamusGfx_PullingForwardFromHanging_Left_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_left_frame_3_top.gfx")
};

// 0x2cfffe
static const u8 sSamusGfx_PullingForwardFromHanging_Frame3_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_frame_3_bottom.gfx")
};

// 0x2d00c0
static const u8 sSamusGfx_HangingOnLedge_Default_Right_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_right_frame_2_top.gfx")
};

// 0x2d01c2
static const u8 sSamusGfx_HangingOnLedge_Default_Right_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_right_frame_3_top.gfx")
};

// 0x2d02c4
static const u8 sSamusGfx_HangingOnLedge_Default_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_right_frame_1_top.gfx")
};

// 0x2d03c6
static const u8 sSamusGfx_HangingOnLedge_Default_Right_Frame5_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_right_frame_5_top.gfx")
};

// 0x2d04c8
static const u8 sSamusGfx_HangingOnLedge_Default_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_default_right_frame_0_top.gfx")
};

// 0x2d05ca
static const u8 sSamusGfx_PullingUpFromHanging_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_right_frame_1_top.gfx")
};

// 0x2d06cc
static const u8 sSamusGfx_PullingUpFromHanging_Right_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_up_from_hanging_right_frame_2_top.gfx")
};

// 0x2d07ce
static const u8 sSamusGfx_PullingForwardFromHanging_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_right_frame_0_top.gfx")
};

// 0x2d0890
static const u8 sSamusGfx_PullingForwardFromHanging_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_right_frame_1_top.gfx")
};

// 0x2d0952
static const u8 sSamusGfx_PullingForwardFromHanging_Right_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_right_frame_2_top.gfx")
};

// 0x2d0a54
static const u8 sSamusGfx_PullingForwardFromHanging_Right_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_right_frame_2_bottom.gfx")
};

// 0x2d0b16
static const u8 sSamusGfx_PullingForwardFromHanging_Right_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_forward_from_hanging_right_frame_3_top.gfx")
};

// 0x2d0c18
static const u8 sSamusGfx_PullingIntoMorphFromHanging_Left_Frame0_Top[SAMUS_GFX_SIZE(7, 3)] = {
    7, 3,
    _INCBIN_U8("data/samus/graphics/body/pulling_into_morph_from_hanging_left_frame_0_top.gfx")
};

// 0x2d0d5a
static const u8 sSamusGfx_PullingIntoMorphFromHanging_Right_Frame0_Top[SAMUS_GFX_SIZE(7, 4)] = {
    7, 4,
    _INCBIN_U8("data/samus/graphics/body/pulling_into_morph_from_hanging_right_frame_0_top.gfx")
};

// 0x2d0ebc
static const u8 sSamusGfx_2d0ebc[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/2d0ebe.gfx")
};

// 0x2d0fbe
static const u8 sSamusGfx_2d0fbe[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/2d0fc0.gfx")
};

// 0x2d1060
static const u8 sSamusGfx_2d1060[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/2d1062.gfx")
};

// 0x2d1162
static const u8 sSamusGfx_2d1162[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/2d1164.gfx")
};

// 0x2d1204
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame9_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_9_top.gfx")
};

// 0x2d1306
static const u8 sSamusGfx_MovingOnHorizontalLadder_Frame9_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_frame_9_bottom.gfx")
};

// 0x2d13a8
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame0_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_0_top.gfx")
};

// 0x2d14ea
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_0_bottom.gfx")
};

// 0x2d15ac
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame1_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_1_top.gfx")
};

// 0x2d168e
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_1_bottom.gfx")
};

// 0x2d1750
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame2_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_2_top.gfx")
};

// 0x2d1852
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame2_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_2_bottom.gfx")
};

// 0x2d1914
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame3_Top[SAMUS_GFX_SIZE(5, 2)] = {
    5, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_3_top.gfx")
};

// 0x2d19f6
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame3_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_3_bottom.gfx")
};

// 0x2d1ab8
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame4_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_4_top.gfx")
};

// 0x2d1bba
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame4_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_4_bottom.gfx")
};

// 0x2d1c5c
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame5_Top[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_5_top.gfx")
};

// 0x2d1d7e
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame5_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_5_bottom.gfx")
};

// 0x2d1e40
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame6_Top[SAMUS_GFX_SIZE(4, 3)] = {
    4, 3,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_6_top.gfx")
};

// 0x2d1f22
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame6_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_6_bottom.gfx")
};

// 0x2d1fe4
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame7_Top[SAMUS_GFX_SIZE(4, 3)] = {
    4, 3,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_7_top.gfx")
};

// 0x2d20c6
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame7_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_7_bottom.gfx")
};

// 0x2d2188
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame8_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_8_top.gfx")
};

// 0x2d228a
static const u8 sSamusGfx_MovingOnHorizontalLadder_Left_Frame8_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_left_frame_8_bottom.gfx")
};

// 0x2d234c
static const u8 sSamusGfx_TurningOnHorizontalLadder_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_on_horizontal_ladder_left_frame_0_top.gfx")
};

// 0x2d240e
static const u8 sSamusGfx_TurningOnHorizontalLadder_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_on_horizontal_ladder_frame_0_bottom.gfx")
};

// 0x2d24b0
static const u8 sSamusGfx_TurningOnHorizontalLadder_Left_Frame1_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/turning_on_horizontal_ladder_left_frame_1_top.gfx")
};

// 0x2d2572
static const u8 sSamusGfx_2d2572[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/2d2574.gfx")
};

// 0x2d2674
static const u8 sSamusGfx_2d2674[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/2d2676.gfx")
};

// 0x2d2776
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame9_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_9_top.gfx")
};

// 0x2d2878
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame0_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_0_top.gfx")
};

// 0x2d29ba
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame1_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_1_top.gfx")
};

// 0x2d2afc
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame2_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_2_top.gfx")
};

// 0x2d2c3e
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_3_top.gfx")
};

// 0x2d2d40
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame4_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_4_top.gfx")
};

// 0x2d2e42
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame5_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_5_top.gfx")
};

// 0x2d2f84
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame6_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_6_top.gfx")
};

// 0x2d3086
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame7_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_7_top.gfx")
};

// 0x2d3188
static const u8 sSamusGfx_MovingOnHorizontalLadder_Right_Frame8_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/moving_on_horizontal_ladder_right_frame_8_top.gfx")
};

// 0x2d328a
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_left_frame_1_top.gfx")
};

// 0x2d332c
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Frame1_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_frame_1_bottom.gfx")
};

// 0x2d33ce
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_left_frame_0_top.gfx")
};

// 0x2d3490
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_frame_0_bottom.gfx")
};

// 0x2d3552
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_left_frame_1_top.gfx")
};

// 0x2d3614
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame1_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_frame_1_bottom.gfx")
};

// 0x2d36d6
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_left_frame_0_top.gfx")
};

// 0x2d3798
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_frame_0_bottom.gfx")
};

// 0x2d385a
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Left_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_left_frame_1_top.gfx")
};

// 0x2d38fc
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Frame1_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_frame_1_bottom.gfx")
};

// 0x2d399e
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_left_frame_0_top.gfx")
};

// 0x2d3a60
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_frame_0_bottom.gfx")
};

// 0x2d3b02
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Right_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_right_frame_1_top.gfx")
};

// 0x2d3c04
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Default_Right_Frame0_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_default_right_frame_0_top.gfx")
};

// 0x2d3d06
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_right_frame_1_top.gfx")
};

// 0x2d3e48
static const u8 sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_diagonal_down_right_frame_0_top.gfx")
};

// 0x2d3f8a
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Right_Frame1_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_right_frame_1_top.gfx")
};

// 0x2d402c
static const u8 sSamusGfx_ShootingOnHorizontalLadder_Down_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_horizontal_ladder_down_right_frame_0_top.gfx")
};

// 0x2d40ee
static const u8 sSamusGfx_2d40ee[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d40f0.gfx")
};

// 0x2d4210
static const u8 sSamusGfx_2d4210[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d4212.gfx")
};

// 0x2d4332
static const u8 sSamusGfx_2d4332[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d4334.gfx")
};

// 0x2d4454
static const u8 sSamusGfx_2d4454[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d4456.gfx")
};

// 0x2d4576
static const u8 sSamusGfx_2d4576[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d4578.gfx")
};

// 0x2d4698
static const u8 sSamusGfx_2d4698[SAMUS_GFX_SIZE(5, 4)] = {
    5, 4,
    _INCBIN_U8("data/samus/graphics/body/2d469a.gfx")
};

// 0x2d47ba
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_up_right_frame_0_top.gfx")
};

// 0x2d485c
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_up_right_frame_0_bottom.gfx")
};

// 0x2d48fe
static const u8 sSamusGfx_ShootingOnVerticalLadder_Up_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_up_right_frame_0_top.gfx")
};

// 0x2d49a0
static const u8 sSamusGfx_ShootingOnVerticalLadder_Up_Right_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_up_right_frame_0_bottom.gfx")
};

// 0x2d4a42
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_down_right_frame_0_top.gfx")
};

// 0x2d4ae4
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_down_right_frame_0_bottom.gfx")
};

// 0x2d4b66
static const u8 sSamusGfx_ShootingOnVerticalLadder_Down_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_down_right_frame_0_top.gfx")
};

// 0x2d4c08
static const u8 sSamusGfx_ShootingOnVerticalLadder_Down_Right_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_down_right_frame_0_bottom.gfx")
};

// 0x2d4c8a
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_up_left_frame_0_top.gfx")
};

// 0x2d4d2c
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_up_left_frame_0_bottom.gfx")
};

// 0x2d4dce
static const u8 sSamusGfx_ShootingOnVerticalLadder_Up_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_up_left_frame_0_top.gfx")
};

// 0x2d4e70
static const u8 sSamusGfx_ShootingOnVerticalLadder_Up_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_up_left_frame_0_bottom.gfx")
};

// 0x2d4f12
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_down_left_frame_0_top.gfx")
};

// 0x2d4fb4
static const u8 sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Bottom[SAMUS_GFX_SIZE(3, 2)] = {
    3, 2,
    _INCBIN_U8("data/samus/graphics/body/arm_out_on_vertical_ladder_down_left_frame_0_bottom.gfx")
};

// 0x2d5056
static const u8 sSamusGfx_ShootingOnVerticalLadder_Down_Left_Frame0_Top[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_down_left_frame_0_top.gfx")
};

// 0x2d5118
static const u8 sSamusGfx_ShootingOnVerticalLadder_Down_Left_Frame0_Bottom[SAMUS_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/samus/graphics/body/shooting_on_vertical_ladder_down_left_frame_0_bottom.gfx")
};

// 0x2d519a
static const u8 sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_pushing_away_left_frame_0_top.gfx")
};

// 0x2d525c
static const u8 sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_pushing_away_left_frame_0_bottom.gfx")
};

// 0x2d531e
static const u8 sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top[SAMUS_GFX_SIZE(3, 3)] = {
    3, 3,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_pushing_away_right_frame_0_top.gfx")
};

// 0x2d53e0
static const u8 sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom[SAMUS_GFX_SIZE(4, 2)] = {
    4, 2,
    _INCBIN_U8("data/samus/graphics/body/hanging_on_ledge_pushing_away_right_frame_0_bottom.gfx")
};

// 0x2d54a2
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -34, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d54c2
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -36, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-12, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d54e2
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-11, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5502
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -35, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -6, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5522
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -34, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5542
static const u16 sSamusOam_HangingOnVerticalLadder_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-11, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5562
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5582
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d55a2
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -7, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d55c2
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -35, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -22, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -6, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d55e2
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-7, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5602
static const u16 sSamusOam_HangingOnVerticalLadder_Right_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(7, -31, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -36, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d5622
static const u16 sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -41, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5642
static const u16 sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d565c
static const u16 sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d5676
static const u16 sSamusOam_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2d5690
static const u16 sSamusOam_ArmOutOnVerticalLadder_Forward_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d56aa
static const u16 sSamusOam_ShootingOnVerticalLadder_Forward_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-13, -31, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d56c4
static const u16 sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d56de
static const u16 sSamusOam_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-13, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d56f8
static const u16 sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(7, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d5712
static const u16 sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(9, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d572c
static const u16 sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(6, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5746
static const u16 sSamusOam_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5760
static const u16 sSamusOam_ArmOutOnVerticalLadder_Forward_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(9, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d577a
static const u16 sSamusOam_ShootingOnVerticalLadder_Forward_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(7, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2d5794
static const u16 sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(7, -25, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d57ae
static const u16 sSamusOam_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(5, -26, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2d57c8
static const u16 sSamusOam_StartingWallJump_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-22, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(250, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-24, -17, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2d57dc
static const u16 sSamusOam_StartingWallJump_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-24, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-18, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -18, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d57f6
static const u16 sSamusOam_StartingWallJump_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-2, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(14, -34, OAM_DIMS_8x16, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-8, -18, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2d580a
static const u16 sSamusOam_StartingWallJump_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -18, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(10, -18, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(0, -26, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(16, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2d5824
static const u16 sSamusOam_HangingOnLedge_Default_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d583e
static const u16 sSamusOam_HangingOnLedge_Default_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -17, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d5858
static const u16 sSamusOam_HangingOnLedge_Default_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5872
static const u16 sSamusOam_HangingOnLedge_Default_Left_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d588c
static const u16 sSamusOam_HangingOnLedge_Default_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -19, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -3, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d58a6
static const u16 sSamusOam_PullingUpFromHanging_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d58c0
static const u16 sSamusOam_PullingUpFromHanging_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d58da
static const u16 sSamusOam_PullingForwardFromHanging_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -27, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -25, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2d58fa
static const u16 sSamusOam_PullingForwardFromHanging_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-8, -23, OAM_DIMS_8x16, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2d5914
static const u16 sSamusOam_PullingForwardFromHanging_Left_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-11, -28, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-5, -16, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-19, -12, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d592e
static const u16 sSamusOam_PullingForwardFromHanging_Left_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-17, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5948
static const u16 sSamusOam_HangingOnLedge_Default_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -17, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5962
static const u16 sSamusOam_HangingOnLedge_Default_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -17, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
};

// 0x2d597c
static const u16 sSamusOam_HangingOnLedge_Default_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -17, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5996
static const u16 sSamusOam_HangingOnLedge_Default_Right_Frame5[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -32, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -9, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-1, -17, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d59b0
static const u16 sSamusOam_HangingOnLedge_Default_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-4, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -19, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-3, -3, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d59ca
static const u16 sSamusOam_PullingUpFromHanging_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -31, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -5, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d59e4
static const u16 sSamusOam_PullingUpFromHanging_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -33, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d59fe
static const u16 sSamusOam_PullingForwardFromHanging_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-1, -28, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -31, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5a18
static const u16 sSamusOam_PullingForwardFromHanging_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -23, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -28, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -8, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5a32
static const u16 sSamusOam_PullingForwardFromHanging_Right_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5a4c
static const u16 sSamusOam_PullingForwardFromHanging_Right_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5a66
static const u16 sSamusOam_PullingIntoMorphFromHanging_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-7, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-12, -29, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-12, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -22, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(4, -6, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2d5a86
static const u16 sSamusOam_PullingIntoMorphFromHanging_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-2, -20, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-4, -29, OAM_DIMS_16x8, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-4, -21, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-12, -22, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-12, -6, OAM_DIMS_8x8, OAM_X_FLIP, 0x6, 0, 0),
};

// 0x2d5aa6
static const u16 sSamusOam_2d5aa6[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-2, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5ac6
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-2, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2d5ae6
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -24, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2d5b06
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(0, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-17, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d5b26
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(3, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-5, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5b46
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-6, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5b66
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-12, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-1, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5b86
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-15, -31, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-1, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d5ba6
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame6[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-15, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-10, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, 1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5bc6
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-11, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-10, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, 1, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d5be6
static const u16 sSamusOam_MovingOnHorizontalLadder_Left_Frame8[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(1, -23, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5c06
static const u16 sSamusOam_TurningOnHorizontalLadder_Left_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-12, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-12, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-4, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5c26
static const u16 sSamusOam_TurningOnHorizontalLadder_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5c46
static const u16 sSamusOam_2d5c46[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -24, OAM_DIMS_8x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5c66
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame9[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2d5c86
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-5, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2d5ca6
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(0, -34, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5cc6
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -30, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -15, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, 1, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5ce6
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(4, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -15, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-6, 1, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-11, -30, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-6, -30, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
};

// 0x2d5d06
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(1, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-9, -23, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5d26
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-5, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d5d46
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame6[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-8, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-2, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d5d66
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame7[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-13, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5d86
static const u16 sSamusOam_MovingOnHorizontalLadder_Right_Frame8[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-12, -23, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(1, -36, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -28, OAM_DIMS_16x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -13, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, 3, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5da6
static const u16 sSamusOam_ShootingOnHorizontalLadder_Default_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-3, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5dc0
static const u16 sSamusOam_ShootingOnHorizontalLadder_Default_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-11, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-11, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5dda
static const u16 sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-9, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5df4
static const u16 sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5e0e
static const u16 sSamusOam_ShootingOnHorizontalLadder_Down_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-2, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-1, 2, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5e28
static const u16 sSamusOam_ShootingOnHorizontalLadder_Down_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, 1, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5e42
static const u16 sSamusOam_ShootingOnHorizontalLadder_Default_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-3, -28, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2d5e62
static const u16 sSamusOam_ShootingOnHorizontalLadder_Default_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -28, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-5, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-5, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5e82
static const u16 sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-4, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-6, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2d5ea2
static const u16 sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-6, -25, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -29, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 2, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2d5ec2
static const u16 sSamusOam_ShootingOnHorizontalLadder_Down_Right_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-6, -29, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-7, -14, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, 2, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2d5edc
static const u16 sSamusOam_ShootingOnHorizontalLadder_Down_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-7, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -15, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, 1, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -37, OAM_DIMS_8x16, OAM_X_FLIP, 0x2, 0, 0),
};

// 0x2d5ef6
static const u16 sSamusOam_2d5ef6[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -33, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -18, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d5f16
static const u16 sSamusOam_2d5f16[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -33, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};
// 0x2d5f36
static const u16 sSamusOam_2d5f36[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-10, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-3, -33, OAM_DIMS_8x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-7, -33, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5f56
static const u16 sSamusOam_2d5f56[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -33, OAM_DIMS_8x8, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -32, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -18, OAM_DIMS_16x8, OAM_X_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-6, -10, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
};

// 0x2d5f76
static const u16 sSamusOam_2d5f76[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -33, OAM_DIMS_8x8, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -32, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -10, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -18, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5f96
static const u16 sSamusOam_2d5f96[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-5, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -33, OAM_DIMS_8x8, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-9, -33, OAM_DIMS_16x16, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-9, -10, OAM_DIMS_16x16, OAM_X_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-1, -18, OAM_DIMS_8x8, OAM_X_FLIP, 0x16, 0, 0),
};

// 0x2d5fb6
static const u16 sSamusOam_ShootingOnVerticalLadder_Up_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-9, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-8, -6, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5fd0
static const u16 sSamusOam_ShootingOnVerticalLadder_Down_Right_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-9, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-6, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d5fe4
static const u16 sSamusOam_ShootingOnVerticalLadder_Up_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(1, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-8, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -6, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d5ffe
static const u16 sSamusOam_ShootingOnVerticalLadder_Up_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -32, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -22, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(0, -6, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d6018
static const u16 sSamusOam_ShootingOnVerticalLadder_Down_Left_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(1, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d6032
static const u16 sSamusOam_ShootingOnVerticalLadder_Down_Left_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(0, -38, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-10, -30, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -14, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
};

// 0x2d6046
static const u16 sSamusOam_HangingOnLedge_PushingAway_Left_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-10, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-10, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
    OAM_ENTRY(-10, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(6, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d6060
static const u16 sSamusOam_HangingOnLedge_PushingAway_Right_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-14, -37, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-7, -21, OAM_DIMS_16x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-7, -5, OAM_DIMS_16x8, OAM_NO_FLIP, 0x16, 0, 0),
};

// 0x2d607c
const struct SamusAnimData sSamusAnim_HangingOnVerticalLadder_Left[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d60fc
const struct SamusAnimData sSamusAnim_HangingOnVerticalLadder_Right[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d617c
const struct SamusAnimData sSamusAnim_Unused_2d617c[7] = {
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d61ec
const struct SamusAnimData sSamusAnim_Unused_2d61ec[7] = {
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_HangingOnVerticalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnVerticalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnVerticalLadder_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d625c
const struct SamusAnimData sSamusAnim_StartingToHoldArmOutOnVerticalLadder_Left[3] = {
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d628c
const struct SamusAnimData sSamusAnim_StartingToPutArmAwayOnVerticalLadder_Left[3] = {
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d62bc
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_DiagonalUp_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d62dc
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_DiagonalUp_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d630c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Forward_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_Forward_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d632c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Forward_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Forward_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_Forward_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d635c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_DiagonalDown_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d637c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Left_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d63ac
const struct SamusAnimData sSamusAnim_StartingToHoldArmOutOnVerticalLadder_Right[3] = {
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d63dc
const struct SamusAnimData sSamusAnim_StartingToPutArmAwayOnVerticalLadder_Right[3] = {
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame1_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_StartingToHoldArmOutOnVerticalLadder_Right_Frame0_Bottom,
        .pOam = sSamusOam_StartingToHoldArmOutOnVerticalLadder_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d640c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_DiagonalUp_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d642c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_DiagonalUp_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalUp_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d645c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Forward_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_Forward_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d647c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Forward_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Forward_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_Forward_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d64ac
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_DiagonalDown_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d64cc
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Forward_Right_Frame0_Bottom,
        .pOam = sSamusOam_ArmOutOnVerticalLadder_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d64fc
const struct SamusAnimData sSamusAnim_StartingWallJump_Left[3] = {
    {
        .pTopGfx = sSamusGfx_StartingWallJump_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_StartingWallJump_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingWallJump_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_StartingWallJump_Left_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d652c
const struct SamusAnimData sSamusAnim_StartingWallJump_Right[3] = {
    {
        .pTopGfx = sSamusGfx_StartingWallJump_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_StartingWallJump_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_StartingWallJump_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_StartingWallJump_Right_Frame1,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d655c
const struct SamusAnimData sSamusAnim_HangingOnLedge_Default_Left[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame3,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame5,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d65dc
const struct SamusAnimData sSamusAnim_PullingUpFromHanging_Left[4] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame2_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Left_Frame2,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d661c
const struct SamusAnimData sSamusAnim_PullingForwardFromHanging_Left[5] = {
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame0_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Left_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Left_Frame2_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Left_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame3_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Left_Frame3,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d666c
const struct SamusAnimData sSamusAnim_PullingIntoMorphFromHanging_Left[2] = {
    {
        .pTopGfx = sSamusGfx_PullingIntoMorphFromHanging_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_PullingIntoMorphFromHanging_Left_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d668c
const struct SamusAnimData sSamusAnim_HangingOnLedge_Default_Right[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame1,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame2_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame3,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame1,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame5_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame5,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame1,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d670c
const struct SamusAnimData sSamusAnim_PullingUpFromHanging_Right[4] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame0,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame2_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Right_Frame2,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d674c
const struct SamusAnimData sSamusAnim_PullingForwardFromHanging_Right[5] = {
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame0_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Right_Frame1,
        .timer = 6
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Right_Frame2_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Right_Frame2,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_PullingForwardFromHanging_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_PullingForwardFromHanging_Frame3_Bottom,
        .pOam = sSamusOam_PullingForwardFromHanging_Right_Frame3,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d679c
const struct SamusAnimData sSamusAnim_PullingIntoMorphFromHanging_Right[2] = {
    {
        .pTopGfx = sSamusGfx_PullingIntoMorphFromHanging_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_PullingIntoMorphFromHanging_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d67bc
const struct SamusAnimData sSamusAnim_Unused_2d67bc[5] = {
    {
        .pTopGfx = sSamusGfx_2d0ebc,
        .pBottomGfx = sSamusGfx_2d0fbe,
        .pOam = sSamusOam_2d5aa6,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_2d1060,
        .pBottomGfx = sSamusGfx_2d1162,
        .pOam = sSamusOam_2d5aa6,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame9_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Frame9_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame9,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_2d1060,
        .pBottomGfx = sSamusGfx_2d1162,
        .pOam = sSamusOam_2d5aa6,
        .timer = 14
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d680c
const struct SamusAnimData sSamusAnim_MovingOnHorizontalLadder_Left[11] = {
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame1,
        .timer = 5
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame2_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame2,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame3_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame4_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame5_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame6_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame6_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame6,
        .timer = 5
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame7_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame7_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame8_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame8_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame8,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame9_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Frame9_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Left_Frame9,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d68bc
const struct SamusAnimData sSamusAnim_TurningOnHorizontalLadder_Left[3] = {
    {
        .pTopGfx = sSamusGfx_TurningOnHorizontalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningOnHorizontalLadder_Frame0_Bottom,
        .pOam = sSamusOam_TurningOnHorizontalLadder_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_TurningOnHorizontalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningOnHorizontalLadder_Frame0_Bottom,
        .pOam = sSamusOam_TurningOnHorizontalLadder_Right_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d68ec
const struct SamusAnimData sSamusAnim_TurningOnHorizontalLadder_Right[3] = {
    {
        .pTopGfx = sSamusGfx_TurningOnHorizontalLadder_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_TurningOnHorizontalLadder_Frame0_Bottom,
        .pOam = sSamusOam_TurningOnHorizontalLadder_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_TurningOnHorizontalLadder_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_TurningOnHorizontalLadder_Frame0_Bottom,
        .pOam = sSamusOam_TurningOnHorizontalLadder_Left_Frame0,
        .timer = 2
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d691c
const struct SamusAnimData sSamusAnim_Unused_2d691c[5] = {
    {
        .pTopGfx = sSamusGfx_2d2572,
        .pBottomGfx = sSamusGfx_2d0fbe,
        .pOam = sSamusOam_2d5c46,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_2d2674,
        .pBottomGfx = sSamusGfx_2d1162,
        .pOam = sSamusOam_2d5c46,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame9_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Frame9_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame9,
        .timer = 14
    },
    {
        .pTopGfx = sSamusGfx_2d2674,
        .pBottomGfx = sSamusGfx_2d1162,
        .pOam = sSamusOam_2d5c46,
        .timer = 14
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d696c
const struct SamusAnimData sSamusAnim_MovingOnHorizontalLadder_Right[11] = {
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame4_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame5_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame1,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame2_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame6_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame2,
        .timer = 5
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame3_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame7_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame3,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame4_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame8_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame4,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame5_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame0_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame5,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame6_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame1_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame6,
        .timer = 5
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame7_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame2_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame8_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Left_Frame3_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame8,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_MovingOnHorizontalLadder_Right_Frame9_Top,
        .pBottomGfx = sSamusGfx_MovingOnHorizontalLadder_Frame9_Bottom,
        .pOam = sSamusOam_MovingOnHorizontalLadder_Right_Frame9,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6a1c
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_Default_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6a3c
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_Default_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6a6c
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6a8c
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_DiagonalDown_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6abc
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_Down_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6adc
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_Down_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6b0c
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_Default_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6b2c
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_Default_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Default_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Default_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6b5c
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_DiagonalDown_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6b7c
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_DiagonalDown_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_DiagonalDown_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_DiagonalDown_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6bac
const struct SamusAnimData sSamusAnim_AfterShootingOnHorizontalLadder_Down_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6bcc
const struct SamusAnimData sSamusAnim_ShootingOnHorizontalLadder_Down_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_ShootingOnHorizontalLadder_Down_Frame1_Bottom,
        .pOam = sSamusOam_ShootingOnHorizontalLadder_Down_Right_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6bfc
const struct SamusAnimData sSamusAnim_LoweringDownToStartHanging_Left[3] = {
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Left_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Left_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Left_Frame0,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6c2c
const struct SamusAnimData sSamusAnim_LoweringDownToStartHanging_Right[3] = {
    {
        .pTopGfx = sSamusGfx_PullingUpFromHanging_Right_Frame1_Top,
        .pBottomGfx = sSamusGfx_PullingUpFromHanging_Frame1_Bottom,
        .pOam = sSamusOam_PullingUpFromHanging_Right_Frame1,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_Default_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_Default_Right_Frame0,
        .timer = 3
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6c5c
const struct SamusAnimData sSamusAnim_Unused_2d6c5c[8] = {
    {
        .pTopGfx = sSamusGfx_2d40ee,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5ef6,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d40ee,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5ef6,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d40ee,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5ef6,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d40ee,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5ef6,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4210,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_2d5f16,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4332,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame5_Bottom,
        .pOam = sSamusOam_2d5f36,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4210,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_2d5f16,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6cdc
const struct SamusAnimData sSamusAnim_Unused_2d6cdc[8] = {
    {
        .pTopGfx = sSamusGfx_2d4454,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4454,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4454,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4454,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame3_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4576,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4698,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame5_Bottom,
        .pOam = sSamusOam_2d5f96,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_2d4576,
        .pBottomGfx = sSamusGfx_HangingOnLedge_Default_Frame1_Bottom,
        .pOam = sSamusOam_2d5f56,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6d5c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Up_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6d7c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Up_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6dac
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Down_Right[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6dcc
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Down_Right[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Down_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Down_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Right_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Right_Frame0,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6dfc
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Up_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6e1c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Up_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Up_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Up_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Up_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6e4c
const struct SamusAnimData sSamusAnim_ArmOutOnVerticalLadder_Down_Left[2] = {
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6e6c
const struct SamusAnimData sSamusAnim_ShootingOnVerticalLadder_Down_Left[3] = {
    {
        .pTopGfx = sSamusGfx_ShootingOnVerticalLadder_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ShootingOnVerticalLadder_Down_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_ArmOutOnVerticalLadder_Down_Left_Frame0_Bottom,
        .pOam = sSamusOam_ShootingOnVerticalLadder_Down_Left_Frame1,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6e9c
const struct SamusAnimData sSamusAnim_HangingOnLedge_PushingAway_Left[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Left_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Left_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6f1c
const struct SamusAnimData sSamusAnim_HangingOnLedge_PushingAway_Right[8] = {
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    {
        .pTopGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Top,
        .pBottomGfx = sSamusGfx_HangingOnLedge_PushingAway_Right_Frame0_Bottom,
        .pOam = sSamusOam_HangingOnLedge_PushingAway_Right_Frame0,
        .timer = 16
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d6f9c
static const u8 sSamusGfx_SpaceJumping_Frame0_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/space_jumping_frame_0_top.gfx")
};

// 0x2d719e
static const u8 sSamusGfx_SpaceJumping_Frame1_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/space_jumping_frame_1_top.gfx")
};

// 0x2d73a0
static const u8 sSamusGfx_SpaceJumping_Frame2_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/space_jumping_frame_2_top.gfx")
};

// 0x2d75a2
static const u8 sSamusGfx_SpaceJumping_Frame3_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/space_jumping_frame_3_top.gfx")
};

// 0x2d77a4
static const u8 sSamusGfx_ScrewAttacking_Frame12_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/screw_attacking_frame_12_top.gfx")
};

// 0x2d79a6
static const u8 sSamusGfx_ScrewAttacking_Frame13_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/screw_attacking_frame_13_top.gfx")
};

// 0x2d7ba8
static const u8 sSamusGfx_ScrewAttacking_Frame10_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/screw_attacking_frame_10_top.gfx")
};

// 0x2d7daa
static const u8 sSamusGfx_ScrewAttacking_Frame11_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/screw_attacking_frame_11_top.gfx")
};

// 0x2d7fac
static const u16 sSamusOam_SpaceJumping_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -27, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -11, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d7fba
static const u16 sSamusOam_SpaceJumping_Left_Frame4[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -11, OAM_DIMS_32x16, OAM_XY_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -27, OAM_DIMS_32x16, OAM_XY_FLIP, 0x4, 0, 0),
};

// 0x2d7fc8
static const u16 sSamusOam_SpaceJumping_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -27, OAM_DIMS_32x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -11, OAM_DIMS_32x16, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2d7fd6
static const u16 sSamusOam_SpaceJumping_Right_Frame4[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -11, OAM_DIMS_32x16, OAM_Y_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -27, OAM_DIMS_32x16, OAM_Y_FLIP, 0x4, 0, 0),
};

// 0x2d7fe4
const struct SamusAnimData sSamusAnim_SpaceJumping_Left[9] = {
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d8074
const struct SamusAnimData sSamusAnim_SpaceJumping_Right[9] = {
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d8104
const struct SamusAnimData sSamusAnim_ScrewAttacking_Left[17] = {
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame12_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame12_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Left_Frame4,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d8214
const struct SamusAnimData sSamusAnim_ScrewAttacking_Right[17] = {
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_SpaceJumping_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame12_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame12_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame13_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_ScrewAttacking_Frame11_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_SpaceJumping_Right_Frame4,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d8324
static const u8 sSamusGfx_Dying_Frame0_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_0_top.gfx")
};

// 0x2d8526
static const u8 sSamusGfx_Dying_Frame1_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_1_top.gfx")
};

// 0x2d8728
static const u8 sSamusGfx_Dying_Frame2_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_2_top.gfx")
};

// 0x2d892a
static const u8 sSamusGfx_Dying_Frame4_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_4_top.gfx")
};

// 0x2d8b2c
static const u8 sSamusGfx_Dying_Frame5_Top[SAMUS_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_5_top.gfx")
};

// 0x2d8d2e
static const u8 sSamusGfx_Dying_Frame6_Top[SAMUS_GFX_SIZE(9, 8)] = {
    9, 8,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_6_top.gfx")
};

// 0x2d8f50
static const u8 sSamusGfx_Dying_Frame7_Top[SAMUS_GFX_SIZE(4, 0)] = {
    4, 0,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_7_top.gfx")
};

// 0x2d8fd2
static const u8 sSamusGfx_Dying_Frame8_Top[SAMUS_GFX_SIZE(2, 0)] = {
    2, 0,
    _INCBIN_U8("data/samus/graphics/body/dying_frame_8_top.gfx")
};

// 0x2d9014
static const u16 sSamusOam_Dying_Left_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
};

// 0x2d9022
static const u16 sSamusOam_Dying_Left_Frame6[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
};

// 0x2d9036
static const u16 sSamusOam_Dying_Left_Frame7[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-21, -34, OAM_DIMS_8x8, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(2, -34, OAM_DIMS_8x8, OAM_Y_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-18, -9, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(10, -49, OAM_DIMS_8x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d9050
static const u16 sSamusOam_Dying_Left_Frame8[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(4, -34, OAM_DIMS_8x8, OAM_XY_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-26, -26, OAM_DIMS_8x8, OAM_NO_FLIP, 0x1, 0, 0),
};

// 0x2d905e
static const u16 sSamusOam_Dying_Right_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x4, 0, 0),
};

// 0x2d906c
static const u16 sSamusOam_Dying_Right_Frame6[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_X_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_X_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -40, OAM_DIMS_8x8, OAM_X_FLIP, 0x8, 0, 0),
};

// 0x2d9080
static const u16 sSamusOam_Dying_Right_Frame7[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(13, -34, OAM_DIMS_8x8, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-10, -34, OAM_DIMS_8x8, OAM_XY_FLIP, 0x1, 0, 0),
    OAM_ENTRY(10, -9, OAM_DIMS_8x8, OAM_X_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-18, -49, OAM_DIMS_8x8, OAM_X_FLIP, 0x3, 0, 0),
};

// 0x2d909a
static const u16 sSamusOam_Dying_Right_Frame8[OAM_DATA_SIZE(2)] = {
    2,
    OAM_ENTRY(-12, -34, OAM_DIMS_8x8, OAM_Y_FLIP, 0x0, 0, 0),
    OAM_ENTRY(18, -26, OAM_DIMS_8x8, OAM_X_FLIP, 0x1, 0, 0),
};

// 0x2d90a8
const struct SamusAnimData sSamusAnim_Dying_Left[11] = {
    {
        .pTopGfx = sSamusGfx_Dying_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame4_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame5_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame6_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame7_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame8_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Left_Frame8,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame8_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d9158
const struct SamusAnimData sSamusAnim_Dying_Right[11] = {
    {
        .pTopGfx = sSamusGfx_Dying_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame0_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame4_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame5_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame0,
        .timer = 2
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame6_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame6,
        .timer = 3
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame7_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame7,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame8_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Dying_Right_Frame8,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_Dying_Frame8_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d9208
static const u8 sSamusGfx_LoadingSave_Frame1_Top[SAMUS_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_1_top.gfx")
};

// 0x2d930a
static const u8 sSamusGfx_LoadingSave_Frame3_Top[SAMUS_GFX_SIZE(5, 5)] = {
    5, 5,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_3_top.gfx")
};

// 0x2d944c
static const u8 sSamusGfx_LoadingSave_Frame5_Top[SAMUS_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_5_top.gfx")
};

// 0x2d95ee
static const u8 sSamusGfx_LoadingSave_Frame2_Top[SAMUS_GFX_SIZE(8, 6)] = {
    8, 6,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_2_top.gfx")
};

// 0x2d97b0
static const u8 sSamusGfx_LoadingSave_Frame4_Top[SAMUS_GFX_SIZE(8, 6)] = {
    8, 6,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_4_top.gfx")
};

// 0x2d9972
static const u8 sSamusGfx_LoadingSave_Frame10_Top[SAMUS_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/samus/graphics/body/loading_save_frame_10_top.gfx")
};

// 0x2d9b54
static const u16 sSamusOam_LoadingSave_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-12, -38, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-12, -22, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2d9b68
static const u16 sSamusOam_LoadingSave_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-11, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -37, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-11, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
};

// 0x2d9b7c
static const u16 sSamusOam_LoadingSave_Frame5[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-13, -39, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(3, -39, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-5, -23, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-13, -23, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-5, -7, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2d9b9c
static const u16 sSamusOam_LoadingSave_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-9, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2d9bbc
static const u16 sSamusOam_LoadingSave_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-6, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2d9bdc
static const u16 sSamusOam_LoadingSave_Frame10[OAM_DATA_SIZE(6)] = {
    6,
    OAM_ENTRY(-12, -40, OAM_DIMS_16x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(4, -40, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-12, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(4, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-12, -24, OAM_DIMS_16x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(4, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x5, 0, 0),
};

// 0x2d9c04
const struct SamusAnimData sSamusAnim_LoadingSave[29] = {
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 10
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame1_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame1,
        .timer = 7
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame2,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame3_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame3,
        .timer = 7
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame4_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame4,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame5_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame5,
        .timer = 7
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame2_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame2,
        .timer = 7
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame4_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame4,
        .timer = 7
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 4
    },
    {
        .pTopGfx = sSamusGfx_LoadingSave_Frame10_Top,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame10,
        .timer = 180
    },
    SAMUS_ANIM_TERMINATOR
};

// 0x2d9dd4
static const u8 sSamusGfx_Saving_Frame32_Top[SAMUS_GFX_SIZE(19, 1)] = {
    19, 1,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_32_top.gfx")
};

// 0x2da056
static const u8 sSamusGfx_Saving_Frame0_Bottom[SAMUS_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_0_bottom.gfx")
};

// 0x2da298
static const u8 sSamusGfx_Saving_Frame34_Top[SAMUS_GFX_SIZE(17, 2)] = {
    17, 2,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_34_top.gfx")
};

// 0x2da4fa
static const u8 sSamusGfx_Saving_Frame36_Top[SAMUS_GFX_SIZE(16, 3)] = {
    16, 3,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_36_top.gfx")
};

// 0x2da75c
static const u8 sSamusGfx_Saving_Frame38_Top[SAMUS_GFX_SIZE(16, 3)] = {
    16, 3,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_38_top.gfx")
};

// 0x2da9be
static const u8 sSamusGfx_Saving_Frame33_Top[SAMUS_GFX_SIZE(20, 16)] = {
    20, 16,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_33_top.gfx")
};

// 0x2dae40
static const u8 sSamusGfx_Saving_Frame11_Bottom[SAMUS_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_11_bottom.gfx")
};

// 0x2db0c2
static const u8 sSamusGfx_Saving_Frame35_Top[SAMUS_GFX_SIZE(20, 15)] = {
    20, 15,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_35_top.gfx")
};

// 0x2db524
static const u8 sSamusGfx_Saving_Frame37_Top[SAMUS_GFX_SIZE(20, 15)] = {
    20, 15,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_37_top.gfx")
};

// 0x2db986
static const u8 sSamusGfx_Saving_Frame39_Top[SAMUS_GFX_SIZE(20, 15)] = {
    20, 15,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_39_top.gfx")
};

// 0x2dbde8
static const u8 sSamusGfx_Saving_Frame1_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_1_top.gfx")
};

// 0x2dbeea
static const u8 sSamusGfx_Saving_Frame3_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_3_top.gfx")
};

// 0x2dbfec
static const u8 sSamusGfx_Saving_Frame5_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_5_top.gfx")
};

// 0x2dc0ee
static const u8 sSamusGfx_Saving_Frame7_Top[SAMUS_GFX_SIZE(4, 4)] = {
    4, 4,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_7_top.gfx")
};

// 0x2dc1f0
static const u8 sSamusGfx_Saving_Frame57_Top[SAMUS_GFX_SIZE(13, 5)] = {
    13, 5,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_57_top.gfx")
};

// 0x2dc432
static const u8 sSamusGfx_Saving_Frame11_Top[SAMUS_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_11_top.gfx")
};

// 0x2dc634
static const u8 sSamusGfx_Saving_Frame13_Top[SAMUS_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_13_top.gfx")
};

// 0x2dc836
static const u8 sSamusGfx_Saving_Frame15_Top[SAMUS_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_15_top.gfx")
};

// 0x2dca78
static const u8 sSamusGfx_Saving_Frame17_Top[SAMUS_GFX_SIZE(17, 9)] = {
    17, 9,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_17_top.gfx")
};

// 0x2dcdba
static const u8 sSamusGfx_Saving_Frame19_Top[SAMUS_GFX_SIZE(15, 9)] = {
    15, 9,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_19_top.gfx")
};

// 0x2dd0bc
static const u8 sSamusGfx_Saving_Frame21_Top[SAMUS_GFX_SIZE(15, 9)] = {
    15, 9,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_21_top.gfx")
};

// 0x2dd3be
static const u8 sSamusGfx_Saving_Frame23_Top[SAMUS_GFX_SIZE(16, 10)] = {
    16, 10,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_23_top.gfx")
};

// 0x2dd700
static const u8 sSamusGfx_Saving_Frame16_Top[SAMUS_GFX_SIZE(10, 0)] = {
    10, 0,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_16_top.gfx")
};

// 0x2dd842
static const u8 sSamusGfx_Saving_Frame18_Top[SAMUS_GFX_SIZE(10, 1)] = {
    10, 1,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_18_top.gfx")
};

// 0x2dd9a4
static const u8 sSamusGfx_Saving_Frame20_Top[SAMUS_GFX_SIZE(9, 2)] = {
    9, 2,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_20_top.gfx")
};

// 0x2ddb06
static const u8 sSamusGfx_Saving_Frame22_Top[SAMUS_GFX_SIZE(8, 1)] = {
    8, 1,
    _INCBIN_U8("data/samus/graphics/body/saving_frame_22_top.gfx")
};

// 0x2ddc28
static const u16 sSamusOam_Saving_Frame32[OAM_DATA_SIZE(20)] = {
    20,
    OAM_ENTRY(16, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(5, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-27, -15, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-19, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-3, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(7, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-24, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(8, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x11, 0, 0),
    OAM_ENTRY(-26, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(-10, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(0, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
};

// 0x2ddca2
static const u16 sSamusOam_Saving_Frame34[OAM_DATA_SIZE(19)] = {
    19,
    OAM_ENTRY(-24, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(-2, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(8, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(16, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(8, -27, OAM_DIMS_8x16, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-20, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(0, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-26, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-2, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-21, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-13, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(17, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
};

// 0x2ddd16
static const u16 sSamusOam_Saving_Frame36[OAM_DATA_SIZE(20)] = {
    20,
    OAM_ENTRY(-26, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-13, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(1, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(10, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(16, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-8, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(-24, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(8, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-22, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-11, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-3, -19, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-29, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-26, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
};

// 0x2ddd90
static const u16 sSamusOam_Saving_Frame38[OAM_DATA_SIZE(20)] = {
    20,
    OAM_ENTRY(-24, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(4, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(14, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(16, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-19, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-9, -34, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-1, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(7, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-23, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-7, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-25, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-17, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(14, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
};

// 0x2dde0a
static const u16 sSamusOam_Saving_Frame33[OAM_DATA_SIZE(26)] = {
    26,
    OAM_ENTRY(16, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(5, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0x13, 0, 0),
    OAM_ENTRY(-27, -15, OAM_DIMS_8x8, OAM_NO_FLIP, 0x29, 0, 0),
    OAM_ENTRY(-19, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-3, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2a, 0, 0),
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(7, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-24, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2c, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(8, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-26, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2f, 0, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2f, 0, 0),
    OAM_ENTRY(-10, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2f, 0, 0),
    OAM_ENTRY(0, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x11, 0, 0),
    OAM_ENTRY(18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2f, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2ddea8
static const u16 sSamusOam_Saving_Frame35[OAM_DATA_SIZE(25)] = {
    25,
    OAM_ENTRY(-24, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2a, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(-2, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2c, 0, 0),
    OAM_ENTRY(8, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2c, 0, 0),
    OAM_ENTRY(16, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(8, -27, OAM_DIMS_8x16, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-20, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(0, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-26, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-2, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(-21, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-13, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(17, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
};

// 0x2ddf40
static const u16 sSamusOam_Saving_Frame37[OAM_DATA_SIZE(26)] = {
    26,
    OAM_ENTRY(-26, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0x13, 0, 0),
    OAM_ENTRY(-13, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(1, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(10, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2c, 0, 0),
    OAM_ENTRY(16, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-8, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-24, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(8, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-22, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-11, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(-3, -19, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-29, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-26, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x11, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2ddfde
static const u16 sSamusOam_Saving_Frame39[OAM_DATA_SIZE(26)] = {
    26,
    OAM_ENTRY(-24, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x11, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(4, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0x12, 0, 0),
    OAM_ENTRY(14, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x13, 0, 0),
    OAM_ENTRY(16, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-19, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(-9, -34, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2b, 0, 0),
    OAM_ENTRY(-1, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(7, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2c, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-23, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(-7, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2d, 0, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(-25, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-17, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(14, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0x2e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de07c
static const u16 sSamusOam_Saving_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
};

// 0x2de096
static const u16 sSamusOam_Saving_Frame57[OAM_DATA_SIZE(18)] = {
    18,
    OAM_ENTRY(16, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(5, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-27, -15, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-19, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-3, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-26, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-10, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(0, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -16, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de104
static const u16 sSamusOam_Saving_Frame11[OAM_DATA_SIZE(18)] = {
    18,
    OAM_ENTRY(-24, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-2, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(8, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(16, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-26, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-2, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-21, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-13, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(17, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -16, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de172
static const u16 sSamusOam_Saving_Frame13[OAM_DATA_SIZE(18)] = {
    18,
    OAM_ENTRY(-26, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-13, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(1, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(10, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(16, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-29, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-26, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -16, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de1e0
static const u16 sSamusOam_Saving_Frame15[OAM_DATA_SIZE(17)] = {
    17,
    OAM_ENTRY(-24, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(4, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(14, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(16, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-25, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-17, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(14, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -16, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -8, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de248
static const u16 sSamusOam_Saving_Frame17[OAM_DATA_SIZE(19)] = {
    19,
    OAM_ENTRY(16, -29, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(5, -13, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(-27, -15, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-19, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-3, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-26, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-19, -32, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-10, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(0, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0x10, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de2bc
static const u16 sSamusOam_Saving_Frame19[OAM_DATA_SIZE(19)] = {
    19,
    OAM_ENTRY(-24, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-16, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-2, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(8, -14, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(16, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-26, -18, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-2, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-21, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-13, -37, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(17, -38, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de330
static const u16 sSamusOam_Saving_Frame21[OAM_DATA_SIZE(19)] = {
    19,
    OAM_ENTRY(-26, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0xb, 0, 0),
    OAM_ENTRY(-13, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(1, -10, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(10, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(16, -33, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-29, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-26, -28, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-18, -36, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de3a4
static const u16 sSamusOam_Saving_Frame23[OAM_DATA_SIZE(18)] = {
    18,
    OAM_ENTRY(-24, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xc, 0, 0),
    OAM_ENTRY(-10, -8, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(4, -11, OAM_DIMS_8x8, OAM_NO_FLIP, 0xd, 0, 0),
    OAM_ENTRY(14, -16, OAM_DIMS_8x8, OAM_NO_FLIP, 0xe, 0, 0),
    OAM_ENTRY(16, -38, OAM_DIMS_8x16, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-25, -24, OAM_DIMS_8x16, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-17, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-8, -40, OAM_DIMS_16x8, OAM_NO_FLIP, 0xa, 0, 0),
    OAM_ENTRY(14, -41, OAM_DIMS_8x8, OAM_NO_FLIP, 0xf, 0, 0),
    OAM_ENTRY(-16, -48, OAM_DIMS_32x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -32, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(-16, -16, OAM_DIMS_32x16, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(0, -32, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
    OAM_ENTRY(0, -24, OAM_DIMS_16x8, OAM_X_FLIP, 0x1e, 0, 0),
};

// 0x2de412
static const u16 sSamusOam_Saving_Frame16[OAM_DATA_SIZE(10)] = {
    10,
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(7, -27, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-24, -30, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-8, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(8, -21, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
};

// 0x2de450
static const u16 sSamusOam_Saving_Frame18[OAM_DATA_SIZE(9)] = {
    9,
    OAM_ENTRY(-5, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-21, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
    OAM_ENTRY(8, -27, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-20, -29, OAM_DIMS_8x8, OAM_NO_FLIP, 0x9, 0, 0),
    OAM_ENTRY(-20, -21, OAM_DIMS_16x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(0, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x7, 0, 0),
};

// 0x2de488
static const u16 sSamusOam_Saving_Frame20[OAM_DATA_SIZE(10)] = {
    10,
    OAM_ENTRY(-8, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x2, 0, 0),
    OAM_ENTRY(-24, -35, OAM_DIMS_16x8, OAM_NO_FLIP, 0x4, 0, 0),
    OAM_ENTRY(8, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-22, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(-11, -22, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(-3, -19, OAM_DIMS_8x8, OAM_NO_FLIP, 0x8, 0, 0),
    OAM_ENTRY(2, -19, OAM_DIMS_16x8, OAM_NO_FLIP, 0x6, 0, 0),
};

// 0x2de4c6
static const u16 sSamusOam_Saving_Frame22[OAM_DATA_SIZE(11)] = {
    11,
    OAM_ENTRY(-19, -35, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-9, -34, OAM_DIMS_8x8, OAM_NO_FLIP, 0x5, 0, 0),
    OAM_ENTRY(-1, -33, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1, 0, 0),
    OAM_ENTRY(7, -25, OAM_DIMS_8x8, OAM_NO_FLIP, 0x6, 0, 0),
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
    OAM_ENTRY(-23, -32, OAM_DIMS_8x16, OAM_NO_FLIP, 0x0, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(-7, -20, OAM_DIMS_8x8, OAM_NO_FLIP, 0x7, 0, 0),
    OAM_ENTRY(1, -20, OAM_DIMS_16x8, OAM_NO_FLIP, 0x3, 0, 0),
};

// 0x2de50a
static const u16 sSamusOam_Saving_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OAM_ENTRY(-16, -40, OAM_DIMS_32x16, OAM_NO_FLIP, 0x14, 0, 0),
    OAM_ENTRY(-16, -24, OAM_DIMS_32x16, OAM_NO_FLIP, 0x18, 0, 0),
    OAM_ENTRY(-8, -8, OAM_DIMS_16x8, OAM_NO_FLIP, 0x1c, 0, 0),
};

// 0x2de520
const struct SamusAnimData sSamusAnim_Saving[73] = {
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame1_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame3_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame5_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame7_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame57_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame57,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame11_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame11,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame13_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame13,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame15_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame15,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame16_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame17_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame18_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame19_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame20_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame21_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame22_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame23_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame16_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame17_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame18_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame19_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame20_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame21_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame22_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame23_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame32_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame32,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame33_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame33,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame34_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame34,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame35_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame35,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame36_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame36,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame37_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame37,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame38_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame38,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame39_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame39,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame16_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame17_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame18_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame19_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame20_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame21_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame22_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame23_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame16_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame17_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame18_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame19_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame20_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame21_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame22_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame23_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame57_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame57,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame11_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame11,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame13_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame13,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame15_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame11_Bottom,
        .pOam = sSamusOam_Saving_Frame15,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame1_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame3_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame5_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    {
        .pTopGfx = sSamusGfx_Saving_Frame7_Top,
        .pBottomGfx = sSamusGfx_Saving_Frame0_Bottom,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    SAMUS_ANIM_TERMINATOR
};
