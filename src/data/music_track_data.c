#include "types.h"
#include "macros.h"

#include "structs/audio.h"

// FIXME: Replace pointers
const struct TrackGroupRomData sMusicTrackDataRom[8] = {
    [0] = {
        .pTrack = 0x3005530,
        .pVariables = 0x3003E10,
        .maxAmountOfTracks = 10,
        .unknown_A = 0
    },
    [1] = {
        .pTrack = 0x3005470,
        .pVariables = 0x3004130,
        .maxAmountOfTracks = 10,
        .unknown_A = 1
    },
    [2] = {
        .pTrack = 0x30055B0,
        .pVariables = 0x3004450,
        .maxAmountOfTracks = 2,
        .unknown_A = 1
    },
    [3] = {
        .pTrack = 0x3005430,
        .pVariables = 0x30044F0,
        .maxAmountOfTracks = 2,
        .unknown_A = 0
    },
    [4] = {
        .pTrack = 0x30054F0,
        .pVariables = 0x3004590,
        .maxAmountOfTracks = 2,
        .unknown_A = 1
    },
    [5] = {
        .pTrack = 0x30055F0,
        .pVariables = 0x3004630,
        .maxAmountOfTracks = 2,
        .unknown_A = 1
    },
    [6] = {
        .pTrack = 0x30054B0,
        .pVariables = 0x30046D0,
        .maxAmountOfTracks = 3,
        .unknown_A = 0
    },
    [7] = {
        .pTrack = 0x3005570,
        .pVariables = 0x30047C0,
        .maxAmountOfTracks = 1,
        .unknown_A = 1
    }
};
