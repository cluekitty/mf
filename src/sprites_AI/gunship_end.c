#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "constants/audio.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "data/sprites/gunship.h"
#include "data/samus_data.h"

#include "structs/samus.h"
#include "structs/sprite.h"

#define GUNSHIPEND_POSE_WAITINGTOENTER 0x17
#define GUNSHIPEND_POSE_ENTERING 0x18
#define GUNSHIPEND_POSE_WAITINGFORSAMUS 0x1A
#define GUNSHIPEND_POSE_LOCKINGSAMUS 0x37
#define GUNSHIPEND_POSE_MOVINGSAMUSUP 0x38
#define GUNSHIPEND_POSE_STARTINGENGINE1 0x39
#define GUNSHIPEND_POSE_STARTINGENGINE2 0x3A
#define GUNSHIPEND_POSE_TAKINGOFF 0x3B
#define GUNSHIPEND_POSE_DONE 0x3C
#define GUNSHIPEND_BEAM_POSE_MOVINGUP 0x18

extern const u16 unk2F474E_palette_array[7][16]; //todo: 0x082F474E

void GunshipEndSpawnBeams(void)
{
    u16 yPosition;
    u16 xPosition;

    yPosition = gCurrentSprite.yPosition + BLOCK_TO_SUB_PIXEL(4.5f);
    xPosition = gCurrentSprite.xPosition;
    switch (gCurrentSprite.work2 - 6)
    {
    case 0:
        SpriteSpawnSecondary(0x79,
                             0,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(3.2f),
                             xPosition,
                             0);
        SoundPlay(0xFD); //todo: use enum value
        break;
    case 3:
        SpriteSpawnSecondary(0x79,
                             1,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(2.75f),
                             xPosition,
                             0);
        break;
    case 6:
        SpriteSpawnSecondary(0x79,
                             3,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(2.375f),
                             xPosition,
                             0);
        break;
    case 9:
        SpriteSpawnSecondary(0x79,
                             5,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(2),
                             xPosition,
                             0);
        break;
    case 12:
        SpriteSpawnSecondary(0x79,
                             7,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(1.633f),
                             xPosition,
                             0);
        break;
    case 15:
        SpriteSpawnSecondary(0x79,
                             9,
                             gCurrentSprite.spritesetGfxSlot,
                             gCurrentSprite.primarySpriteRamSlot,
                             yPosition - BLOCK_TO_SUB_PIXEL(1.25f),
                             xPosition,
                             0);
    }
}


void GunshipEndInit(void) {
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 0xC;
    gCurrentSprite.bgPriority = 3;
    gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING_WHOLE;
    gCurrentSprite.scaling = 0x90;
    gCurrentSprite.rotation = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work1 = 0x3C;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = BLOCK_TO_PIXEL(8) - 1;
    gCurrentSprite.drawDistanceBottom = BLOCK_TO_PIXEL(4);
    gCurrentSprite.drawDistanceHorizontal = BLOCK_TO_PIXEL(11);
    gCurrentSprite.hitboxTop = -BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxBottom = BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxLeft = -BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxRight = BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    gCurrentSprite.pOam = (struct FrameData* )0x0839EC68; //todo: extract oam frames
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}



void GunshipEndWaiting(void)
{
    if ((--gCurrentSprite.work1 << 0x18) == 0)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        PlayMusic(0x5B, 0xE); //todo: use enum value
        gCurrentSprite.work1 = 0x1E;
    }
}


void GunshipEndMovingUp(void)
{
    u8 tmp;
    u16 tmp2; //todo: better var names?

    if (gCurrentSprite.work1 != 0)
    {
        if ((--gCurrentSprite.work1 << 0x18) == 0)
        {
            SoundPlay_3b1c(0x249); //todo: use enum value
        }
    }
    tmp = 0;
    tmp2 = (gCurrentSprite.xPosition >> 2) - (gBg1XPosition >> 2);
    if (tmp2 <= 0x6F) //todo: block macro conversion?
    {
        gCurrentSprite.xPosition++;
    }
    else if (tmp2 > 0x80) //todo: block macro conversion?
    {
        gCurrentSprite.xPosition--;
    }
    else
    {
        tmp = 1;
    }

    tmp2 = (gCurrentSprite.yPosition >> 2) - (gBg1YPosition >> 2);
    if (tmp2 <= 0x2B) //todo: block macro conversion?
    {
        gCurrentSprite.yPosition++;
    }
    else if (tmp2 > 0x3C) //todo: block macro conversion?
    {
        gCurrentSprite.yPosition--;
    }
    else
    {
        tmp++;
    }

    if (tmp > 1)
    {
        gCurrentSprite.bgPriority = 2;
        gCurrentSprite.pose = GUNSHIPEND_POSE_WAITINGTOENTER;
        gCurrentSprite.work1 = 0x3C;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.work3 = 0;
    }
}


extern const s16 unk839AAE0[114];
void GunshipEndWaitingToEnter(void)
{
    s16 yPositionOffset;
    u8 tmp;

    tmp = gCurrentSprite.work4;
    yPositionOffset = unk839AAE0[gCurrentSprite.work4];
    if (yPositionOffset == 0x7fff)
    {
        yPositionOffset = unk839AAE0[0];
        tmp = 0;
    }

    gCurrentSprite.work4 = ++tmp;
    gCurrentSprite.yPosition += yPositionOffset;
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work1 = 0;
    }
}


//https://decomp.me/scratch/Ynus9 (88.14%)
extern s16 unk39aae0_short_array[114];
extern u16 unk39ac90_short_array[32];
void GunshipEndEntering(void)
{
    s16 sVar1;
    u8 bVar2;
    u32 uVar3;
    u8 tmp;

    tmp = gCurrentSprite.work4;
    sVar1 = unk39aae0_short_array[gCurrentSprite.work4];
    if (sVar1 == 0x7fff)
    {
        sVar1 = 0;
        tmp = 0;

    }
    gCurrentSprite.work4 = gCurrentSprite.work4 + 1;
    gCurrentSprite.yPosition = gCurrentSprite.yPosition + sVar1;
    gCurrentSprite.scaling = unk39ac90_short_array[(gCurrentSprite.work1 << 0x18) >> 0x1a];
    uVar3 = gCurrentSprite.work1;
    if (uVar3 < 0x70)
    {
        gCurrentSprite.work1 = (uVar3 + 1);
        if (((uVar3 + 1) & 1) != 0)
        {
            gCurrentSprite.yPosition = gCurrentSprite.yPosition + 1;
        }
    }
    else
    {
        gCurrentSprite.status &= ~(SPRITE_STATUS_ROTATION_SCALING_WHOLE);
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = (struct FrameData* )0x0839EB48;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.properties = gCurrentSprite.properties | SP_ALWAYS_ACTIVE;
        bVar2 = SpawnNewSecondarySprite(
            SSPRITE_7A,gCurrentSprite.roomSlot, //todo: SSPRITE_7A = GUNSHIP_END_BOTTOM, fix enum
            gCurrentSprite.spritesetGfxSlot,gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition,gCurrentSprite.xPosition,0x0);
        gCurrentSprite.work4 = bVar2;
        gSpriteData[bVar2].status &= ~(SPRITE_STATUS_NOT_DRAWN);
        gSpriteData[bVar2].pOam = (struct FrameData*) 0x0839ec30;
        gSpriteData[bVar2].animationDurationCounter = 0;
        gSpriteData[bVar2].currentAnimationFrame = 0;
        gSpriteData[bVar2].properties = gSpriteData[bVar2].properties | SP_ALWAYS_ACTIVE;
        gSpriteData[bVar2].drawOrder = 14;
        gSpriteData[bVar2].samusCollision = 0;
        gSpriteData[bVar2].drawDistanceTop = BLOCK_TO_PIXEL(.25f);
        gSpriteData[bVar2].drawDistanceBottom = BLOCK_TO_PIXEL(3.5f);
        gSpriteData[bVar2].drawDistanceHorizontal = BLOCK_TO_PIXEL(3);
        gSpriteData[bVar2].hitboxTop = -BLOCK_TO_SUB_PIXEL(1.f/16);
        gSpriteData[bVar2].hitboxBottom = BLOCK_TO_SUB_PIXEL(1.f/16);
        gSpriteData[bVar2].hitboxLeft = -BLOCK_TO_SUB_PIXEL(1.f/16);
        gSpriteData[bVar2].hitboxRight = BLOCK_TO_SUB_PIXEL(1.f/16);
        gSpriteData[bVar2].pose = SPRITE_POSE_IDLE;
        gSpriteData[bVar2].work1 = 0;
        gSpriteData[bVar2].work2 = 0;
        gSpriteData[bVar2].work3 = 0;
    }
}


void GunshipEndWaitingForSamus(void)
{
    s32 tmp;

    if (gCurrentSprite.work2 <= 0x23)
    {
        gCurrentSprite.work2++;
        GunshipEndSpawnBeams();
        return;
    }
    tmp = gCurrentSprite.xPosition - HALF_BLOCK_SIZE;
    if ((tmp < gSamusData.xPosition) &&
        ((tmp + BLOCK_SIZE) > gSamusData.xPosition) &&
        (gSamusData.yPosition == (BLOCK_TO_SUB_PIXEL(11) - 1)))
    {
        if (!SpriteUtilCheckSamusMorphed())
        {
            if (gSamusData.invincibilityTimer != 0)
            {
                gSamusData.invincibilityTimer = 0;
            }
            sSamusSetPoseFunctionPointer[gSamusData.unk_0](0x20); //todo: use decimal/enum?
            gSamusData.yPosition = gCurrentSprite.yPosition + BLOCK_TO_SUB_PIXEL(4.5f);
            gSamusData.xPosition = gCurrentSprite.xPosition;
            gCurrentSprite.pose = GUNSHIPEND_POSE_LOCKINGSAMUS;
            gCurrentSprite.work1 = 0x1E; //todo: hex value
            gCurrentSprite.drawOrder = 4;
            EventCheckAdvance(0x6D);
            return;
        }
    }
    gCurrentSprite.drawOrder = 12;
}


void GunshipEndLockingSamus(void)
{
    if ((--gCurrentSprite.work1 << 0x18) == 0)
    {
        gCurrentSprite.pose = GUNSHIPEND_POSE_MOVINGSAMUSUP;
        gCurrentSprite.work1 = 0x3B;
    }
}


void GunshipEndMovingSamusUp(void)
{
    if ((--gCurrentSprite.work1 << 0x18) == 0)
    {
        gCurrentSprite.pose = GUNSHIPEND_POSE_STARTINGENGINE1;
        gDisableDrawingSamusAndScrollingFlag = 1;
        return;
    }
    gSamusData.yPosition -= 4;
}


void GunshipEndStartingEngine1(void)
{
    u8 tmp;
    const u16* pPal;

    tmp = gCurrentSprite.work4;
    if (SpriteUtilHasCurrentAnimationEnded())
    {
        gCurrentSprite.pose = GUNSHIPEND_POSE_STARTINGENGINE2;
        gCurrentSprite.pOam = (struct FrameData* )0x0839EC68; //todo: extrace oam data
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 0x3C; //todo decimal number
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING_WHOLE;
        gCurrentSprite.scaling = 0x100; //todo: decimal number
        gCurrentSprite.rotation = 0;
        gSpriteData[tmp].status = 0;

        pPal = unk2F474E_palette_array[0];
        DMA3_COPY_16(
            pPal,
            PALRAM_OBJ + 0x136, //todo: fix magic number
            5
        );
        SoundPlay_3b1c(0x24A); //todo
    }
}



extern s16 unk839ABC4[96];
void GunshipEndStartingEngine2(void)
{
    s16 yPositionOffset;
    u8 tmp;

    tmp = gCurrentSprite.work4;
    yPositionOffset = unk839ABC4[gCurrentSprite.work4];
    if (yPositionOffset == 0x7fff)
    {
        yPositionOffset = unk839ABC4[0];
        tmp = 0;
    }

    gCurrentSprite.work4 = ++tmp;
    gCurrentSprite.yPosition += yPositionOffset;
    if (gCurrentSprite.work2 == 0) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.pOam = (struct FrameData* )0x0839EC08;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.work1 = 0x3c;
            gCurrentSprite.work2 = 1;
        }
    }
    else if (gCurrentSprite.work2 == 1) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.pOam = (struct FrameData* )0x0839EC78;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.work1 = 0x5a;
            gCurrentSprite.work2 = 2;
        }
    }
    else {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = GUNSHIPEND_POSE_TAKINGOFF;
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work2 = 0;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.status |= SPRITE_STATUS_DOUBLE_SIZE;
        }
    }
}


//todo: Extract array data
extern u16 unk839ACD0[68];
extern u8 unk839AC84[12];
void GunshipEndTakingOff(void)
{
    u8 tmp;

    if (gCurrentSprite.work1 >= 64)
    {
        gCurrentSprite.yPosition -= BLOCK_TO_SUB_PIXEL(1.f/8);
        gCurrentSprite.pose = GUNSHIPEND_POSE_DONE;
        unk_6df04();
    }
    else
    {
        if (gCurrentSprite.work1 >= 56)
        {
            gCurrentSprite.yPosition -= BLOCK_TO_SUB_PIXEL(1.f/8);
            gCurrentSprite.work1 += 4;
        }
        else if (gCurrentSprite.work1 >= 48)
        {
            gCurrentSprite.yPosition -= BLOCK_TO_SUB_PIXEL(1.f/64);
            gCurrentSprite.work1 += 4;
        }
        else if (gCurrentSprite.work1 >= 32)
        {
            gCurrentSprite.yPosition -= 1;
            gCurrentSprite.work1 += 2;
        }
        else
        {
            gCurrentSprite.work1++;
        }

    }

    gCurrentSprite.scaling = unk839ACD0[gCurrentSprite.work1];
    if (gCurrentSprite.work1 >= 32)
    {
        tmp = (gCurrentSprite.work1 - 32) >> 2;
        gCurrentSprite.rotation = unk839AC84[tmp];
    }
}



void GunshipEndDone(void)
{
    return;
}


//https://decomp.me/scratch/md50L (95.38%)
//todo: match code and extract palette array
void GunshipEndBottomIdle(void)
{
    const u16* pPal;

    gCurrentSprite.work3++;
    if (!(gCurrentSprite.work3 & 7))
    {
        // This DMA section feels wrong but matches with warnings
        pPal = unk2F474E_palette_array[gCurrentSprite.work1];
        DMA3_COPY_16(
            pPal,
            PALRAM_OBJ + 0x136, //todo: fix magic number
            5
        );

        if (gCurrentSprite.work2 != 0)
        {
            if (gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.work1--;
            }
            else
            {
                gCurrentSprite.work2 = gCurrentSprite.work1;
                gCurrentSprite.work1 = 1;
            }
        }
        else
        {
            if (gCurrentSprite.work1 > 5)
            {
                gCurrentSprite.work2 = 1;
                gCurrentSprite.work1 = 5;
            }
            else
            {
                gCurrentSprite.work1++;
            }
        }
    }
}


void GunshipEndBeamInit(void)
{
    gCurrentSprite.status = gCurrentSprite.status & ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties = gCurrentSprite.properties | SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = BLOCK_TO_PIXEL(0.25f);
    gCurrentSprite.drawDistanceBottom = BLOCK_TO_PIXEL(0.25f);
    gCurrentSprite.drawDistanceHorizontal = BLOCK_TO_PIXEL(1);
    gCurrentSprite.hitboxTop = -BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxBottom = BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxLeft = -BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.hitboxRight = BLOCK_TO_SUB_PIXEL(1.f/16);
    gCurrentSprite.pOam = sGunshipBeamOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 13;
    gCurrentSprite.work1 = 9;
}


void GunshipEndBeamMovingDown(void)
{
    u8 primarySpriteSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.roomSlot != 0)
    {
        gCurrentSprite.roomSlot -= 1;
        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(1.f/16);
        return;
    }
    gCurrentSprite.work1--;
    if ((gCurrentSprite.work1) != 0)
    {
        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(1.f/16);
    }
    else
    {
        gCurrentSprite.yPosition -= BLOCK_TO_SUB_PIXEL(0.5f);
        gCurrentSprite.work1 = 9;
    }
    if (gSpriteData[primarySpriteSlot].pose == GUNSHIPEND_POSE_LOCKINGSAMUS)
    {
        gCurrentSprite.pose = GUNSHIPEND_BEAM_POSE_MOVINGUP;
        gCurrentSprite.drawOrder = 5;
    }
}



void GunshipEndBeamMovingUp(void)
{
    u8 primarySpriteSlot = gCurrentSprite.primarySpriteRamSlot;

    gCurrentSprite.work1++;
    if (gCurrentSprite.work1 > 8)
    {
        gCurrentSprite.work1 = 0;
        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(0.5f);
    }
    else
    {
        gCurrentSprite.yPosition -= BLOCK_TO_SUB_PIXEL(1.f/16);
    }
    if (gSpriteData[primarySpriteSlot].pose == GUNSHIPEND_POSE_STARTINGENGINE1)
    {
        gCurrentSprite.status = 0;
    }
}


void GunshipEnd(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            GunshipEndInit();
            return;
        case SPRITE_POSE_IDLE_INIT:
            GunshipEndWaiting();
            return;
        case SPRITE_POSE_IDLE:
            GunshipEndMovingUp();
            return;
        case GUNSHIPEND_POSE_WAITINGTOENTER:
            GunshipEndWaitingToEnter();
            return;
        case GUNSHIPEND_POSE_ENTERING:
            GunshipEndEntering();
            return;
        case GUNSHIPEND_POSE_WAITINGFORSAMUS:
            GunshipEndWaitingForSamus();
            return;
        case GUNSHIPEND_POSE_LOCKINGSAMUS:
            GunshipEndLockingSamus();
            return;
        case GUNSHIPEND_POSE_MOVINGSAMUSUP:
            GunshipEndMovingSamusUp();
            return;
        case GUNSHIPEND_POSE_STARTINGENGINE1:
            GunshipEndStartingEngine1();
            return;
        case GUNSHIPEND_POSE_STARTINGENGINE2:
            GunshipEndStartingEngine2();
            return;
        case GUNSHIPEND_POSE_TAKINGOFF:
            GunshipEndTakingOff();
            return;
        case GUNSHIPEND_POSE_DONE:
            GunshipEndDone();
    }
}


void GunshipEndBottom(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.pose == SPRITE_POSE_IDLE)
    {
        GunshipEndBottomIdle();
    }
}


void GunshipEndBeam(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            GunshipEndBeamInit();

        case SPRITE_POSE_IDLE:
            GunshipEndBeamMovingDown();
            break;
        case GUNSHIPEND_BEAM_POSE_MOVINGUP:
            GunshipEndBeamMovingUp();
            break;
    }
    if ((gCurrentSprite.roomSlot == 0) && (gCurrentSprite.status == 0))
    {
        SoundStop(SOUND_GUNSHIP_BEAM);
    }
}
