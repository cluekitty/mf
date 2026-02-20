#include "globals.h"
#include "macros.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

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

}


void GunshipEndBeamMovingDown(void)
{

}


void GunshipEndBeamMovingUp(void)
{

}


void GunshipEnd(void)
{

}


void GunshipEndBottom(void)
{

}


void GunshipEndBeam(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
    case SPRITE_POSE_UNINITIALIZED:
        GunshipEndBeamInit();

    case SPRITE_POSE_IDLE:
        GunshipEndBeamMovingDown();
        break;
    case 24: //todo: make an enum
        GunshipEndBeamMovingUp();
        break;
    }
    if ((gCurrentSprite.roomSlot == 0) && (gCurrentSprite.status == 0))
    {
        SoundStop(0xFD);
    }
}
