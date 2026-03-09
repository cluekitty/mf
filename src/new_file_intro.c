#include "globals.h"
#include "new_file_intro.h"
#include "data/new_file_intro_data.h"

static u8* sGfxPtr_79C3FC[8] = {
    (u8*)0x08642A30,
    (u8*)0x08643130,
    (u8*)0x08643778,
    (u8*)0x08643E08,
    (u8*)0x08643FF8,
    (u8*)0x086444A0,
    (u8*)0x08644788,
    (u8*)0x08645004
};

static u8 sBlob_79c41c_79ecc8[] = INCBIN_U8("data/Blob_79c41c_79ecc8.bin");

/**
 * @brief 87610 | f8 | Handler for intro
 * 
 */
boolu32 IntroHandler(void) 
{
    boolu32 result;

    result = FALSE;
    
    if (gChangedInput & (KEY_START | KEY_A))
    {
        if (gSubGameMode1 == 3)
        {
            if (gNonGameplayRam.intro.unk_20E != 0)
                gNonGameplayRam.intro.unk_20E = 0;
        }
        else if (gSubGameMode1 != 0 && gSubGameMode1 != 3)
        {
            if (READ_16(REG_BLDCNT) & BLDCNT_ALPHA_BLENDING_EFFECT)
                WRITE_16(REG_BLDCNT, BLDCNT_BRIGHTNESS_DECREASE_EFFECT | BLDCNT_SCREEN_FIRST_TARGET);
            
            gNonGameplayRam.intro.unk_20E = 0;
            gSubGameMode1 = 3;
            FadeAllSounds(20);
            FadeMusic(20);
        }
    }

    switch (gSubGameMode1)
    {
        case 0:
            NewFileIntroInit();
            gSubGameMode1 = 1;
            break;
        
        case 1:
            if (IntroSpaceView())
                gSubGameMode1 = 2;
            break;
        
        case 2:
            if (IntroSamusShipCrashing())
                gSubGameMode1 = 3;
            break;
        
        case 3:
            if (gNonGameplayRam.intro.unk_20E == 0)
            {
                if (gWrittenToBldy < BLDY_MAX_VALUE)
                    gWrittenToBldy++;
                else
                    result = TRUE;
            }
            else
                gNonGameplayRam.intro.unk_20E--;
            
            SpecialCutsceneDrawAllOam(); 
    }

    return result;
}

 /**
 * @brief 87708 | 218 | Handler for new file intro
 * 
 */
boolu32 NewFileIntroHandler(void) 
{
    boolu32 result;

    result = FALSE;

    switch (gSubGameMode1)
    {
        case 0:
            StopAllMusicAndSounds();
            NewFileIntroInit();

            if (gGameCompletion.introPlayed == TRUE)
                return TRUE;
            else 
                gSubGameMode1 = 1;
            break;

        case 1:
            gNonGameplayRam.intro.unk_210++;
            if (gNonGameplayRam.intro.unk_210 >= 100)
            {
                gNonGameplayRam.intro.unk_210 = 0;
                gSubGameMode1 = 2;
            }
            break;

        case 2:
            if (NewFileIntroSr388Preview())
                gSubGameMode1 = 3;
            break;

        case 3:
            if (NewFileIntroInSr388())
                gSubGameMode1 = 4;
            break;

        case 4:
            if (NewFileIntroSamusShipFlying())
                gSubGameMode1 = 5;
            break;

        case 5:
            if (NewFileIntroSamusFainting())
                gSubGameMode1 = 6;
            break;

        case 6:
            if (NewFileIntroSamusDrifting())
                gSubGameMode1 = 7;
            break;

        case 7:
            if (NewFileIntroSamusFound())
                gSubGameMode1 = 8;
            break;

        case 8:
            if (NewFileIntroSamusGettingCured())
                gSubGameMode1 = 9;
            break;

        case 9:
            if (NewFileIntroSamusCured())
                gSubGameMode1 = 10;
            break;

        case 10:
            if (NewFileIntroArrivingAtBsl())
                gSubGameMode1 = 11;
            break;

        case 11:
            if (NewFileIntroLandingOnBsl())
            {
                gNonGameplayRam.intro.unk_20E = 0;
                gSubGameMode1 = 12;
            }
            break;
        
        case 12:
            gNonGameplayRam.intro.unk_20E++;
            if (gWrittenToBldy < BLDY_MAX_VALUE)
            {
                if (gNonGameplayRam.intro.unk_20E == 1)
                {
                    gNonGameplayRam.intro.unk_20E = 0;
                    gWrittenToBldy++;
                }
            }
            else
            {
                if (gNonGameplayRam.intro.unk_20E == 1)
                {
                    Sram_ProcessIntroSave(0);
                }
                else if (gNonGameplayRam.intro.unk_20E == 2)
                {
                    Sram_ProcessIntroSave(1);
                } 
                else if (gNonGameplayRam.intro.unk_20E == 3)
                {
                    Sram_ProcessIntroSave(2);
                }
                else if (gNonGameplayRam.intro.unk_20E == 4)
                {
                    Sram_ProcessIntroSave(3);
                    gNonGameplayRam.intro.unk_210 = 0;
                    gNonGameplayRam.intro.unk_20E = 0;
                    result = TRUE;
                }
            }

            SpecialCutsceneDrawAllOam();
    }

    return result;
}

 /**
 * @brief 87920 | 50 | To document
 * 
 */
boolu32 unk_87920(void) 
{
    boolu32 result;
    boolu32 done;
    
    result = FALSE;

    switch (gCurrentCutscene)
    {
        default:
            result = TRUE;
            done = FALSE;
            break;

        case 1:
            done = IntroHandler();
            break;

        case 2:
            done = NewFileIntroHandler();
            break;

        case 3:
            done = EndingHandler();
            break;

        case 4:
            done = DiedFromSr388CollisionHandler();
    }

    if (done)
    {
        StopAllMusicAndSounds();
        result = TRUE;
    }
    
    return result;
}

 /**
 * @brief 87970 | 94 | V-blank for the new file intro Samus ship flying cutscene
 * 
 */
void NewFileIntroSamusShipFlyingVblank(void) 
{
    DMA3_COPY_32(gOamData, OAM_BASE, 256);

    WRITE_16(REG_BLDALPHA, C_16_2_8(gWrittenToBldalpha_Evb, gWrittenToBldalpha_Eva));

    WRITE_16(REG_BLDY, gWrittenToBldy);

    WRITE_16(REG_BG1HOFS, gBg1XPosition);
    WRITE_16(REG_BG1VOFS, gBg1YPosition);
    WRITE_16(REG_BG2HOFS, gBg2XPosition);
    WRITE_16(REG_BG2VOFS, gBg2YPosition);
    WRITE_16(REG_BG3HOFS, gBg3XPosition);
    WRITE_16(REG_BG3VOFS, gBg3YPosition);
}

 /**
 * @brief 87a04 | 264 | 
 * 
 */
void NewFileIntroSamusShipFlyingInit(void) 
{
    u16 i;
    
    CallbackSetVBlank(unk_99940);
    
    DMA3_FILL_32(0, &gNonGameplayRam, sizeof(gNonGameplayRam));

    for (i = 0; i < 8; i++)
    {
        LZ77UncompVram(sGfxPtr_79C3FC[i], 0x6010000 + i * 0x1000);
    }
    
    DMA3_COPY_32(&sPal_5980B0, 0x05000200, 40);
    DMA3_COPY_32(&sPal_598150, 0x05000300, 16);
    DMA3_COPY_32(&sGfx_613148, 0x06017fe0, 8);
    DMA3_COPY_32(&sPal_6131A8, 0x050003e0, 8);

    LZ77UncompWram(&sGfx_60BCA4, 0x02010000);

    DMA3_COPY_32(0x02010000, 0x6000000, 0x2000);

    LZ77UncompVram(&sTilemap_60B670, 0x0600e800);
    LZ77UncompVram(&sTilemap_60B148, 0x0600f800);

    DMA3_COPY_32(&sPal_612E48, PALRAM_BASE + 0x100, 0x40);

    WRITE_16(PALRAM_BASE, 0);

    LZ77UncompVram(&sTilemap_598898, 0x0600e000);

    WRITE_16(REG_BG0HOFS, -8);
    WRITE_16(REG_BG0VOFS, 0);
    WRITE_16(REG_BG1HOFS, 0);
    WRITE_16(REG_BG1VOFS, 0);
    WRITE_16(REG_BG2HOFS, 0);
    WRITE_16(REG_BG2VOFS, 0);
    WRITE_16(REG_BG3HOFS, 0);
    WRITE_16(REG_BG3VOFS, 0);

    gBg1XPosition = 0;
    gBg1YPosition = 0;
    gBg2XPosition = 0x30;
    gBg2YPosition = -8;
    gBg3XPosition = 0;
    gBg3YPosition = 0;

    WRITE_16(REG_BLDCNT, 0xff);
    WRITE_16(REG_BG0CNT, 0x1c08);
    WRITE_16(REG_BG2CNT, 0x5d02);
    WRITE_16(REG_BG3CNT, 0x1f03);

    NewFileIntroSetupOam(200, 0xfa, 0, 0);
    NewFileIntroSetupOam(1, (s16)gBg2XPosition, (s16)gBg2YPosition, 0);
    NewFileIntroSetupOam(2, 0xa0, 0x5a, 0);
    NewFileIntroSetupOam(4, 0, 0, 1);

    for (i = 0; i < 10; i++)
    {
        NewFileIntroSetupOam(3, (u8)SpecialCutsceneGetRandomNumber(), (u8)SpecialCutsceneGetRandomNumber(), 1);
    }

    SpecialCutsceneProcessOam();
    SpecialCutsceneDrawAllOam();

    DMA3_FILL_32(0, VRAM_BASE + 0xD000, 0x1000);

    gNonGameplayRam.intro.pText = &sCutsceneTextNone;
    WRITE_16(REG_DISPCNT, 0x1c00);

    CallbackSetVBlank(NewFileIntroSamusShipFlyingVblank);
}

