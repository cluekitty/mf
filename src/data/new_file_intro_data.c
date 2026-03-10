#include "data/new_file_intro_data.h"
#include "macros.h"

const u8 sIntroSamusShipPal[] = INCBIN_U8("data/new_file_intro/samus_ship.pal");

const u8 sPal_598150[] = INCBIN_U8("data/new_file_intro/598150.pal"); // Loaded to PALRAM but not used?

static const u8 sBlob_598190_598898[] = INCBIN_U8("data/Blob_598190_598898.bin");

const u8 sIntroSamusShipFlyingTextTilemap[] = INCBIN_U8("data/new_file_intro/598898.tm.lz");

static const u8 sBlob_598a89_0x60b148[] = INCBIN_U8("data/Blob_598a89_0x60b148.bin");

const u8 sIntroSpaceTilemap[] = INCBIN_U8("data/new_file_intro/60B148.tm.lz");

const u8 sIntroBslTilemap[] = INCBIN_U8("data/new_file_intro/60B670.tm.lz");

static const u8 padding[2] = {0, 0};

const u8 sIntroBslSpaceBgGfx[] = INCBIN_U8("data/new_file_intro/60BCA4.gfx.lz");

static const u8 sBlob_6101b8_612e48[] = INCBIN_U8("data/Blob_6101b8_612e48.bin");

const u8 sIntroBslSpaceBgPal[] = INCBIN_U8("data/new_file_intro/612E48.pal");

static const u8 sBlob_612f48_613148[] = INCBIN_U8("data/Blob_612f48_613148.bin");

const u8 sNextPageArrowGfx[] = INCBIN_U8("data/new_file_intro/613148.gfx");

static const u8 sBlob_613168_6131a8[] = INCBIN_U8("data/Blob_613168_6131a8.bin");

const u8 sNextPageArrowPal[] = INCBIN_U8("data/new_file_intro/6131A8.pal");

static const u8 sBlob_6131c8_63a19c[] = INCBIN_U8("data/Blob_6131c8_63a19c.bin");

//63a19c
const u16 sCutsceneTextNone[2] = {
    0xff00, 0xff00
};

static const u8 sBlob_63a1a0_72eee0[] = INCBIN_U8("data/Blob_63a1a0_72eee0.bin");

