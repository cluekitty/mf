#ifndef NEW_FILE_INTRO_H
#define NEW_FILE_INTRO_H

#include "types.h"

boolu32 IntroHandler(void);
boolu32 NewFileIntroHandler(void);
boolu32 unk_87920(void);
void NewFileIntroSamusShipFlyingVblank(void);
static void NewFileIntroSamusShipFlyingInit(void);
static boolu32 NewFileIntroSamusShipFlyingProcess(void);
static boolu32 NewFileIntroSamusShipFlying(void);

extern void unk_99940(void);

#endif /* NEW_FILE_INTRO_H */
