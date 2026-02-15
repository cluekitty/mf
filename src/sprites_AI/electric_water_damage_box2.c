#include "globals.h"
#include "sprite.h"

#include "data/sprite_data.h"
#include "data/sprites/electric_water_damage_box2.h"

#include "constants/sprite.h"
#include "constants/event.h"

#include "structs/sprite.h"



void ElectricWaterDamageBox2Init(void) {
    gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = 48;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 16;
    gCurrentSprite.hitboxTop = -128;
    gCurrentSprite.hitboxBottom = 32;
    gCurrentSprite.hitboxLeft = -32;
    gCurrentSprite.hitboxRight = 32;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sElectricWaterDamageBox2Oam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}


void ElectricWaterDamageBox2Idle(void)
{

}

void ElectricWaterDamageBox2DamagingSamus(void)
{

}

void ElectricWaterDamageBox2Stopping(void)
{

}

void ElectricWaterDamageBox2(void) {
    switch (gCurrentSprite.pose) {
    case SPRITE_POSE_UNINITIALIZED:
        ElectricWaterDamageBox2Init();
        break;

    case SPRITE_POSE_IDLE:
        ElectricWaterDamageBox2Idle();
        break;

    case 24:
        ElectricWaterDamageBox2DamagingSamus();
        break;

    case 26:
        ElectricWaterDamageBox2Stopping();
        break;
    }

    if (EVENT_EFFECT_80 & gCurrentEventBasedEffect) {
        gCurrentSprite.status = 0;
    }
}
