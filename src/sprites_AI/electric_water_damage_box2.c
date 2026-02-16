#include "globals.h"
#include "sprite.h"

#include "data/sprite_data.h"
#include "data/sprites/electric_water_damage_box2.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/event.h"

#include "structs/samus.h"
#include "structs/sprite.h"

void ElectricWaterDamageBox2Init(void)
{
    gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = 48;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 16;
    gCurrentSprite.hitboxTop = -BLOCK_TO_SUB_PIXEL(2.f);
    gCurrentSprite.hitboxBottom = BLOCK_TO_SUB_PIXEL(0.5f);
    gCurrentSprite.hitboxLeft = -BLOCK_TO_SUB_PIXEL(0.5f);
    gCurrentSprite.hitboxRight = BLOCK_TO_SUB_PIXEL(0.5f);
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sElectricWaterDamageBox2Oam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}


void ElectricWaterDamageBox2Idle(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gSamusUnderwaterFlag)
    {
        gCurrentSprite.pose = 0x18; // TODO: replace with pose enum for ElectricWaterDamageBox2_DamagingSamus
        gCurrentSprite.work1 = 0;
    }
}


void ElectricWaterDamageBox2DamagingSamus(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.yPosition = gSamusData.yPosition;
    gCurrentSprite.xPosition = gSamusData.xPosition;

    if ((gCurrentSprite.work1 & 3) == 0)
    {
        gCurrentSprite.samusCollision = SSC_YAMEBA;
    }
    else
    {
        gCurrentSprite.samusCollision = SSC_NONE;
    }

    gCurrentSprite.work1++;
    if (!gSamusUnderwaterFlag)
    {
        gCurrentSprite.pose = 0x1a; // TODO: replace with pose enum for ElectricWaterDamageBox2_Stopping
        gCurrentSprite.pOam = sElectricWaterDamageBox2Oam_Stopping;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
    }
}


void ElectricWaterDamageBox2Stopping(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.yPosition = gSamusData.yPosition;
    gCurrentSprite.xPosition = gSamusData.xPosition;

    if (SpriteUtilHasCurrentAnimationEnded())
    {
        gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.pOam = sElectricWaterDamageBox2Oam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = 2;
    }
}


void ElectricWaterDamageBox2(void) {
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            ElectricWaterDamageBox2Init();
            break;

        case SPRITE_POSE_IDLE:
            ElectricWaterDamageBox2Idle();
            break;

        case 24: // TODO: ElectricWaterDamageBox2_DamagingSamus
            ElectricWaterDamageBox2DamagingSamus();
            break;

        case 26: // TODO: ElectricWaterDamageBox2_Stopping
            ElectricWaterDamageBox2Stopping();
            break;
    }

    if (EVENT_EFFECT_80 & gCurrentEventBasedEffect)
    {
        gCurrentSprite.status = 0;
    }
}
