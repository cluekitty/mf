#include "globals.h"
#include "macros.h"

#include "constants/audio.h"
#include "constants/sprite.h"

#include "data/sprites/gunship.h"

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

}


void GunshipEndMovingSamusUp(void)
{

}


void GunshipEndStartingEngine1(void)
{

}


void GunshipEndStartingEngine2(void)
{

}


void GunshipEndTakingOff(void)
{

}


void GunshipEndDone(void)
{

}


void GunshipEndBottomIdle(void)
{

}


void GunshipEndBeamInit(void)
{
    gCurrentSprite.status = gCurrentSprite.status & ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties = gCurrentSprite.properties | SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = BLOCK_TO_PIXEL(0.25f);
    gCurrentSprite.drawDistanceBottom = BLOCK_TO_PIXEL(0.25f);
    gCurrentSprite.drawDistanceHorizontal = BLOCK_TO_PIXEL(1);//0x10;
    gCurrentSprite.hitboxTop = -BLOCK_TO_SUB_PIXEL(0.0625f);
    gCurrentSprite.hitboxBottom = BLOCK_TO_SUB_PIXEL(0.0625f);
    gCurrentSprite.hitboxLeft = -BLOCK_TO_SUB_PIXEL(0.0625f);
    gCurrentSprite.hitboxRight = BLOCK_TO_SUB_PIXEL(0.0625f);
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
        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(0.0625f);
        return;
    }
    gCurrentSprite.work1--;
    if ((gCurrentSprite.work1) != 0)
    {
        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(0.0625f);
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
        gCurrentSprite.yPosition -= -BLOCK_TO_SUB_PIXEL(0.0625f);
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
