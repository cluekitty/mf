#ifndef AUDIO_STRUCTS_H
#define AUDIO_STRUCTS_H

#include "types.h"
#include "constants/audio.h"

struct Envelope {
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
};

struct Voice {
    u8 instrumentType;
    u8 pitch;
    u8 unk_2;
    u8 unk_3;
    u32* pSample;
    struct Envelope envelope;
};

struct SoundChannel {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
    struct Envelope envelope;
    u8 unk_C;
    u8 unk_D;
    u8 unk_E;
    u8 unk_F;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
    u8 unk_13;
    u32* pSize;
    u32 unk_18;
    u32 unk_1C;
    u32* pSample; // Type?
    u8* pData;
    struct TrackVariables* pVariables;
    struct SoundChannel* pChannel1;
    struct SoundChannel* pChannel2;
};

struct PsgSoundData {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    struct Envelope envelope;
    u16 maybe_noteDelay;
    u8 unk_A;
    u8 unk_B;
    u8 unk_C;
    u8 unk_D;
    u8 unk_E;
    u8 unk_F;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
    u8 undefined_13;
    u16 unk_14;
    u8 unk_16;
    u8 unk_17;
    u8 unk_18;
    s8 unk_19;
    u8 unk_1A;
    u8 unk_1B;
    u8 unk_1C;
    u8 unk_1D;
    u8 unk_1E;
    u8 unk_1F;
    u32* pSample; // Type?
    struct TrackVariables* pVariables;
};

struct TrackVariables {
    u8 unk_0;
    u8 unk_1;
    u8 delay;
    u8 unk_3;
    u8 volume;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
    u8 unk_8;
    u8 unk_9;
    u8 repeatCount;
    u8 priority;
    u8 unk_C;
    u8 unk_D;
    u8 unk_E;
    u8 unk_F;
    u8 lfoSpeed;
    u8 modulationDepth;
    u8 modulationType;
    s8 unk_13;
    u8 unk_14;
    u8 unk_15;
    s8 unk_16;
    s8 unk_17;
    u8 unk_18;
    s8 pitchBend;
    u8 bendRange;
    u8 unk_1B;
    u8 keyShift;
    u8 unk_1D;
    u8 tune;
    u8 unk_1F;
    u32 unk_20;
    const u8* pRawData;
    const u8* patternStartPointers[3];
    u8 channel;
    u8 unk_35;
    u8 unk_36;
    u8 unk_37;

    u32* pSample1; // Type?
    struct Envelope envelope1;
    u32* pSample2; // Type?
    struct Envelope envelope2;

    struct SoundChannel* pChannel;
    struct PsgSoundData* pSoundPsg;
};

struct TrackData {
    u8 flags;
    u8 amountOfTracks;

    u8 undefined_2;
    u8 unk_3;
    u8 currentTrack;

    u8 maxAmountOfTracks;
    u16 maybe_volume;
    u16 fadingTimer;

    u16 unk_A;
    u16 unk_C;
    u16 unk_E;

    const u8* pHeader;
    struct Voice* pVoice;
    struct TrackVariables* pVariables;

    u8 occupied;
    u8 unk_1D;
    u8 unk_1E;
    u8 priority;
    u16 musicTrack;
    u8 maxSoundChannels;

    u8 unk_23;
    u16 unk_24;
    u16 unk_26;

    u8 queueFlags;

    u8 undefined_29;
    u8 undefined_2A;
    u8 undefined_2B;
    u8 undefined_2C;
    u8 undefined_2D;
    u8 undefined_2E;
    u8 undefined_2F;
    u8 undefined_30;
    u8 undefined_31;
    u8 undefined_32;

    u8 unk_33;
    u8 unk_34;
    u8 unk_35;

    u8 undefined_36;
    u8 undefined_37;
    u8 undefined_38;
    u8 undefined_39;
    u8 undefined_3A;
    u8 undefined_3B;
    u8 undefined_3C;
    u8 undefined_3D;
    u8 undefined_3E;
    u8 undefined_3F;
};

struct TrackGroupRomData {
    // FIXME: Use actual pointers
    u32 pTrack;
    u32 pVariables;
    u16 maxAmountOfTracks;
    u16 unknown_A;
};

struct SoundEntry {
    const u8* pHeader;
    u16 trackGroupNumber;
    u16 trackGroupNumber_2;
};

struct MusicInfo {
    u8 unk_0;
    boolu8 occupied;
    u8 unk_2;
    u8 unk_3;

    u8 reverb; // unused
    u8 maxSoundChannels;
    u8 volume;
    u8 freqIndex;

    u8 unk_8;
    u8 unk_9;
    u8 currentSoundChannel;
    u8 volumeDownFlag;
    u8 unk_C; // samplesPerFrame / 16
    u8 unk_D; // unused, number of frames to process sample?
    u8 unk_E; // 96
    u8 unk_F;
    u8 unk_10; // 95
    u8 unk_11; // (samplesPerFrame / 16) * 2
    u16 sampleRate;
    u32 unk_14; // unused, samples per frame
    u32 pitch;
    u16 musicTrack;
    u16 unk_1E;
    u8 unk_20;
    u8 priority;
    u16 musicTrackOnTransition;
    u32 musicRawData[768];
    u8 soundRawData[PCM_DMA_BUF_SIZE * 2];
    struct SoundChannel soundChannels[11];
};

struct MusicTrack {
    u16 number;
    u8 lowered;
};


typedef void (*MusicFunc_T)(struct TrackVariables*);

extern struct MusicInfo gMusicInfo;

extern struct MusicTrack gCurrentMusicTrack;

typedef void (*SoundCodeAFunc_T)(struct SoundChannel*, u32*, u8);
typedef u8* (*SoundCodeBFunc_T)(u32*, u32*, u32*, u8);
typedef u8* (*SoundCodeCFunc_T)(u32*, u32*, u8);

extern SoundCodeAFunc_T gSoundCodeAPointer;
extern u8 gSoundCodeA[1624];
extern SoundCodeBFunc_T gSoundCodeBPointer;
extern u8 gSoundCodeB[164];
extern SoundCodeCFunc_T gSoundCodeCPointer;
extern u8 gSoundCodeC[176];

extern struct PsgSoundData gUnk_300343c[];
extern struct PsgSoundData gPsgSounds[4];

#endif /* AUDIO_STRUCTS_H */
