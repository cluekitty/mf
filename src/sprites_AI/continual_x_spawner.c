#include "globals.h"
#include "sprite.h"
#include "x_parasite_util.h"

#include "data/sprites/shake_trigger.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

#ifdef NON_MATCHING
void ContinualXSpawnerIdle(void)
// https://decomp.me/scratch/0CPcj (98.99%)
{
    u8 i;
    u16 xPosition;
    u16 yPosition;
    s16 xPositionOffset;
    s16 yPositionOffset;
    u8 direction;
    u32 rng;
    boolu8 spawnSprite;

    rng = gFrameCounter8Bit & 3;
    if (rng == 0) {
        xPositionOffset = 1;
        yPositionOffset = gSpriteRandomNumber * EIGHTH_BLOCK_SIZE;
        direction = 0;
    }
    else if (rng == 1) {
        xPositionOffset = (u8)-18;  // does not match without typecast
        yPositionOffset = gSpriteRandomNumber * EIGHTH_BLOCK_SIZE;
        direction = 1;
    }
    else if (rng == 2) {
        yPositionOffset = 1;
        xPositionOffset = gSpriteRandomNumber * QUARTER_BLOCK_SIZE;
        direction = 2;
    }
    else {
        yPositionOffset = (u8)-98;  // does not match without typecast
        xPositionOffset = gSpriteRandomNumber * QUARTER_BLOCK_SIZE;
        direction = 3;
    }

    yPositionOffset *= 4;
    xPositionOffset *= 4;

    gCurrentSprite.yPosition = yPositionOffset + gBg1YPosition;
    gCurrentSprite.xPosition = xPositionOffset + gBg1XPosition;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    spawnSprite = FALSE;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS) ||
            !(gSpriteData[i].properties & SP_CAN_ABSORB_X) ||
            gSpriteData[i].health == 0 ||
            gSpriteData[i].freezeTimer != 0
        )
        continue;

        spawnSprite += TRUE;
        break;
    }

    if (spawnSprite && CountPrimarySpritesThatCantAbsorbX() < 4)
    {
        if (direction == 0)
            xPosition -= BLOCK_SIZE;

        else if (direction == 1)
            xPosition += BLOCK_SIZE;

        else if (direction == 2)
            yPosition -= BLOCK_SIZE;

        else
            yPosition += BLOCK_SIZE;

        SpriteSpawnNewXParasite(
            PSPRITE_X_PARASITE,
            0,
            0,
            gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties,
            yPosition, xPosition,
            0
        );
    }
}
#else
NAKED_FUNCTION
void ContinualXSpawnerIdle(void) {
    asm("\n\
    push {r4, r5, r6, r7, lr} \n\
    sub sp, #0x10 \n\
    ldr r0, _08051804 @ =gFrameCounter8Bit \n\
    ldrb r0, [r0] \n\
    mov r5, #3 \n\
    and r5, r0 \n\
    cmp r5, #0 \n\
    bne _0805180C \n\
    mov r6, #1 \n\
    ldr r0, _08051808 @ =gFrameCounter8Bit \n\
    ldrb r0, [r0] \n\
    lsl r4, r0, #3 \n\
    mov r7, #0 \n\
    b _08051846 \n\
    .align 2, 0 \n\
_08051804: .4byte gFrameCounter8Bit \n\
_08051808: .4byte gSpriteRandomNumber \n\
_0805180C: \n\
    cmp r5, #1 \n\
    bne _08051820 \n\
    mov r6, #0xee \n\
    ldr r0, _0805181C @ =gFrameCounter8Bit \n\
    ldrb r0, [r0] \n\
    lsl r4, r0, #3 \n\
    mov r7, #1 \n\
    b _08051846 \n\
    .align 2, 0 \n\
_0805181C: .4byte gSpriteRandomNumber \n\
_08051820: \n\
    cmp r5, #2 \n\
    bne _0805183C \n\
    mov r4, #1 \n\
    ldr r0, _08051830 @ =gFrameCounter8Bit \n\
    ldrb r0, [r0] \n\
    lsl r6, r0, #4 \n\
    mov r7, #2 \n\
    b _08051846 \n\
    .align 2, 0 \n\
_08051830: .4byte gSpriteRandomNumber \n\
_08051834: \n\
    add r0, r5, #1 \n\
    lsl r0, r0, #0x18 \n\
    lsr r5, r0, #0x18 \n\
    b _080518A8 \n\
_0805183C: \n\
    mov r4, #0x9e \n\
    ldr r0, _080518C0 @ =gFrameCounter8Bit \n\
    ldrb r0, [r0] \n\
    lsl r6, r0, #4 \n\
    mov r7, #3 \n\
_08051846: \n\
    lsl r0, r4, #0x12 \n\
    lsl r1, r6, #0x12 \n\
    ldr r2, _080518C4 @ =gCurrentSprite \n\
    ldr r3, _080518C8 @ =gBg1YPosition \n\
    lsr r0, r0, #0x10 \n\
    ldrh r3, [r3] \n\
    add r0, r0, r3 \n\
    strh r0, [r2, #2] \n\
    ldr r0, _080518CC @ =gBg1XPosition \n\
    lsr r1, r1, #0x10 \n\
    ldrh r0, [r0] \n\
    add r1, r1, r0 \n\
    strh r1, [r2, #4] \n\
    ldrh r4, [r2, #2] \n\
    ldrh r6, [r2, #4] \n\
    mov r5, #0 \n\
    mov r3, #0 \n\
    ldr r0, _080518D0 @ =gSpriteData \n\
    mov ip, r0 \n\
_0805186C: \n\
    lsl r0, r3, #3 \n\
    sub r0, r0, r3 \n\
    lsl r0, r0, #3 \n\
    mov r1, ip \n\
    add r2, r0, r1 \n\
    ldrh r1, [r2] \n\
    mov r0, #1 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805189E \n\
    add r0, r2, #0 \n\
    add r0, #0x34 \n\
    ldrb r1, [r0] \n\
    mov r0, #2 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805189E \n\
    ldrh r0, [r2, #0x14] \n\
    cmp r0, #0 \n\
    beq _0805189E \n\
    add r0, r2, #0 \n\
    add r0, #0x32 \n\
    ldrb r0, [r0] \n\
    cmp r0, #0 \n\
    beq _08051834 \n\
_0805189E: \n\
    add r0, r3, #1 \n\
    lsl r0, r0, #0x18 \n\
    lsr r3, r0, #0x18 \n\
    cmp r3, #0x17 \n\
    bls _0805186C \n\
_080518A8: \n\
    cmp r5, #0 \n\
    beq _08051914 \n\
    bl CountPrimarySpritesThatCantAbsorbX \n\
    cmp r0, #3 \n\
    bgt _08051914 \n\
    cmp r7, #0 \n\
    bne _080518D4 \n\
    add r0, r6, #0 \n\
    sub r0, #0x40 \n\
    b _080518DC \n\
    .align 2, 0 \n\
_080518C0: .4byte gSpriteRandomNumber \n\
_080518C4: .4byte gCurrentSprite \n\
_080518C8: .4byte gBg1YPosition \n\
_080518CC: .4byte gBg1XPosition \n\
_080518D0: .4byte gSpriteData \n\
_080518D4: \n\
    cmp r7, #1 \n\
    bne _080518E2 \n\
    add r0, r6, #0 \n\
    add r0, #0x40 \n\
_080518DC: \n\
    lsl r0, r0, #0x10 \n\
    lsr r6, r0, #0x10 \n\
    b _080518F4 \n\
_080518E2: \n\
    cmp r7, #2 \n\
    bne _080518EC \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    b _080518F0 \n\
_080518EC: \n\
    add r0, r4, #0 \n\
    add r0, #0x40 \n\
_080518F0: \n\
    lsl r0, r0, #0x10 \n\
    lsr r4, r0, #0x10 \n\
_080518F4: \n\
    ldr r0, _0805191C @ =gCurrentSprite \n\
    add r1, r0, #0 \n\
    add r1, #0x23 \n\
    ldrb r3, [r1] \n\
    add r0, #0x2a \n\
    ldrb r0, [r0] \n\
    str r0, [sp] \n\
    str r4, [sp, #4] \n\
    str r6, [sp, #8] \n\
    mov r0, #0 \n\
    str r0, [sp, #0xc] \n\
    mov r0, #0x38 \n\
    mov r1, #0 \n\
    mov r2, #0 \n\
    bl SpriteSpawnNewXParasite \n\
_08051914: \n\
    add sp, #0x10 \n\
    pop {r4, r5, r6, r7} \n\
    pop {r0} \n\
    bx r0 \n\
    .align 2, 0 \n\
_0805191C: .4byte gCurrentSprite \n\
    ");
}
#endif


void ContinualXSpawner(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.samusCollision = 0;
            gCurrentSprite.pose = 2;
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 1;
            gCurrentSprite.hitboxTop = -BLOCK_TO_SUB_PIXEL(0.0625f);
            gCurrentSprite.hitboxBottom = BLOCK_TO_SUB_PIXEL(0.0625f);
            gCurrentSprite.hitboxLeft = -BLOCK_TO_SUB_PIXEL(0.0625f);
            gCurrentSprite.hitboxRight = BLOCK_TO_SUB_PIXEL(0.0625f);
            gCurrentSprite.pOam = sContinualXSpawnerGoldEnemyDoorLockOam;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

            if (!gDebugFlag)
                gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;

            break;

        case SPRITE_POSE_IDLE:
            ContinualXSpawnerIdle();
            break;
    }
}
