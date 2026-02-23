#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "constants/audio.h"
#include "constants/sprite.h"

#include "data/sprites/gunship.h"

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

extern u16 unk2F474E_palette_array[7][16]; //todo: 0x082F474E

void GunshipEndSpawnBeams(void)
{

}


void GunshipEndInit(void)
{

}


void GunshipEndWaiting(void)
{

}


void GunshipEndMovingUp(void)
{

}


void GunshipEndWaitingToEnter(void)
{

}


void GunshipEndEntering(void)
{

}


void GunshipEndWaitingForSamus(void)
{

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


void GunshipEndStartingEngine1(void) {
    u8 tmp;
    const u16* pal;

    tmp = gCurrentSprite.work4;
    if (SpriteUtilHasCurrentAnimationEnded()) {
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

        pal = &unk2F474E_palette_array;
        DMA3_COPY_16(
            pal,
            PALRAM_OBJ + 0x136, //todo: fix magic number
            5
        );
        SoundPlay_3b1c(0x24A); //todo
    }
}



//https://decomp.me/scratch/1V0Ot (94.18%)
extern u16 unk839ABC4[96];
void GunshipEndStartingEngine2(void)
{
    s16 yPositionOffset;
    u8 var_r3;

    var_r3 = gCurrentSprite.work4;
    yPositionOffset = unk839ABC4[gCurrentSprite.work4];
    if (yPositionOffset == 0x7fff) {
        yPositionOffset = 0;
        gCurrentSprite.work4 = 0;
    }

    gCurrentSprite.yPosition += yPositionOffset;
    gCurrentSprite.work4 = var_r3++;
    if (gCurrentSprite.work2 == 0) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.pOam = (struct FrameData* )0x0839EC08; //todo: extract oam data
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.work1 = 0x3c;
            gCurrentSprite.work2 = 1;
        }
    }
    else if (gCurrentSprite.work2 == 1) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.pOam = (struct FrameData* )0x0839EC78; //todo: extract oam data
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
    u32 palette_src;

    gCurrentSprite.work3++;
    if (!(gCurrentSprite.work3 & 7))
    {
        // This DMA section feels wrong but matches
        palette_src = unk2F474E_palette_array[gCurrentSprite.work1];
        DMA3_COPY_16(
            palette_src,
            PALRAM_OBJ + 0x136, // todo: fix magic number
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
        gCurrentSprite.yPosition -= -BLOCK_TO_SUB_PIXEL(1.f/16);
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
