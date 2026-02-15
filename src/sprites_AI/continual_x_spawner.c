#include "globals.h"
#include "sprite.h"
#include "x_parasite_util.h"

#include "data/sprites/shake_trigger.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

void ContinualXSpawner()
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.samusCollision = gCurrentSprite.pose;
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
