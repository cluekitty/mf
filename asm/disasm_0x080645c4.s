    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LoadRoom
LoadRoom: @ 0x080645C4
	push {lr}
	bl ClipdataSetupCode
	bl RoomResetInfo
	bl LoadRoomEntry
	bl LoadTileset
	bl LoadScrollsAndEventBasedEffects
	bl LoadRoomBackgrounds
	bl RemoveNeverReformBlocksAndCollectedTanks
	ldr r1, _080646A8 @ =gPreviousXPosition
	ldr r2, _080646AC @ =gSamusData
	ldrh r0, [r2, #0x16]
	strh r0, [r1]
	ldr r1, _080646B0 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
	bl RoomEffectSetTransparency
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	bl ProcessGeneralScrolling
	ldr r1, _080646BC @ =gBg1YPosition
	ldr r2, _080646C0 @ =0x03000124
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _080646C4 @ =gBg1XPosition
	ldrh r0, [r2]
	strh r0, [r1]
	bl unk_6a7b4
	bl ProcessGeneralScrolling
	ldr r0, _080646C8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x44
	bne _08064638
	ldr r1, _080646CC @ =0x03001224
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_08064638:
	bl UpdateBackgroundsPosition
	bl LoadDoors
	movs r0, #0
	bl SetupInitialTilemap
	movs r0, #1
	bl SetupInitialTilemap
	movs r0, #2
	bl SetupInitialTilemap
	bl unk_6b890
	bl LoadAnimatedGraphics
	bl ResetTankAnimations
	bl HazeSetBackgroundEffect
	bl HazeProcess
	bl MinimapCheckOnTransition
	bl RoomEffectCheckSetCurrentEventBased
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646D0 @ =gUnk_3000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080646E0
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646AC @ =gSamusData
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #0x17
	bne _080646E0
	ldrh r0, [r2, #0x14]
	cmp r0, #0x40
	bne _080646D4
	ldrh r0, [r2, #0x18]
	adds r0, #0xc0
	b _080646D8
	.align 2, 0
_080646A8: .4byte gPreviousXPosition
_080646AC: .4byte gSamusData
_080646B0: .4byte gPreviousYPosition
_080646B4: .4byte gPauseScreenFlag
_080646B8: .4byte gIsLoadingFile
_080646BC: .4byte gBg1YPosition
_080646C0: .4byte 0x03000124
_080646C4: .4byte gBg1XPosition
_080646C8: .4byte gCurrentRoomEntry
_080646CC: .4byte 0x03001224
_080646D0: .4byte gUnk_3000be3
_080646D4:
	ldrh r0, [r2, #0x18]
	subs r0, #0xc0
_080646D8:
	strh r0, [r2, #0x18]
	ldr r1, _080646E4 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
_080646E0:
	pop {r0}
	bx r0
	.align 2, 0
_080646E4: .4byte gPreviousYPosition

	thumb_func_start LoadTileset
LoadTileset: @ 0x080646E8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r2, _0806471C @ =0x083BF888
	ldr r0, _08064720 @ =gCurrentRoomEntry
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r1, sp, #4
	adds r0, r0, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r1, _08064724 @ =gTilemapAndClipPointers
	ldr r0, [sp, #0x10]
	adds r0, #2
	str r0, [r1]
	ldr r0, _08064728 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _08064734
	ldr r0, _0806472C @ =0x083F08E4
	str r0, [r1, #4]
	ldr r0, _08064730 @ =0x083F1348
	b _0806473A
	.align 2, 0
_0806471C: .4byte 0x083BF888
_08064720: .4byte gCurrentRoomEntry
_08064724: .4byte gTilemapAndClipPointers
_08064728: .4byte gCurrentArea
_0806472C: .4byte 0x083F08E4
_08064730: .4byte 0x083F1348
_08064734:
	ldr r0, _080647DC @ =0x083F0834
	str r0, [r1, #4]
	ldr r0, _080647E0 @ =0x083F11E8
_0806473A:
	str r0, [r1, #8]
	ldr r0, [sp, #4]
	ldr r1, _080647E4 @ =0x06005800
	bl CallLZ77UncompVram
	bl WaitForDma3
	ldr r1, _080647E8 @ =0x083F28C8
	ldr r2, _080647EC @ =0x06004800
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	bl WaitForDma3
	ldr r4, _080647F0 @ =0x040000D4
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, _080647F4 @ =0x05000040
	str r0, [r4, #4]
	ldr r0, _080647F8 @ =0x800000E0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _080647FC @ =0x0840805C
	str r0, [r4]
	movs r6, #0xa0
	lsls r6, r6, #0x13
	str r6, [r4, #4]
	ldr r0, _08064800 @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r1, _08064804 @ =0x03004E28
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1]
	strh r5, [r6]
	strh r5, [r1, #2]
	ldr r0, [sp, #0xc]
	ldrb r2, [r0, #2]
	lsls r2, r2, #8
	ldrb r1, [r0, #1]
	orrs r2, r1
	ldr r1, _08064808 @ =0x0600FDE0
	subs r1, r1, r2
	bl CallLZ77UncompVram
	str r5, [sp, #0x18]
	add r0, sp, #0x18
	str r0, [r4]
	ldr r0, _0806480C @ =0x0600FFE0
	str r0, [r4, #4]
	ldr r0, _08064810 @ =0x85000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08064814 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080647D4
	ldr r2, _08064818 @ =gCurrentRoomEntry
	add r0, sp, #4
	ldrb r3, [r0, #0x10]
	strb r3, [r2, #0x1a]
	ldrb r1, [r0, #0x11]
	strb r1, [r2, #0x1b]
	ldr r0, _0806481C @ =0x03004FC8
	strb r3, [r0, #1]
	strb r1, [r0]
_080647D4:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080647DC: .4byte 0x083F0834
_080647E0: .4byte 0x083F11E8
_080647E4: .4byte 0x06005800
_080647E8: .4byte 0x083F28C8
_080647EC: .4byte 0x06004800
_080647F0: .4byte 0x040000D4
_080647F4: .4byte 0x05000040
_080647F8: .4byte 0x800000E0
_080647FC: .4byte 0x0840805C
_08064800: .4byte 0x80000030
_08064804: .4byte 0x03004E28
_08064808: .4byte 0x0600FDE0
_0806480C: .4byte 0x0600FFE0
_08064810: .4byte 0x85000008
_08064814: .4byte gPauseScreenFlag
_08064818: .4byte gCurrentRoomEntry
_0806481C: .4byte 0x03004FC8

	thumb_func_start LoadRoomEntry
LoadRoomEntry: @ 0x08064820
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r0, _080648A8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08064832
	b _08064966
_08064832:
	ldr r1, _080648AC @ =0x0879B8BC
	ldr r0, _080648B0 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080648B4 @ =gCurrentRoom
	ldrb r2, [r1]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r1, _080648B8 @ =gCurrentRoomEntry
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #1]
	strb r0, [r1, #1]
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r1, #2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r1, #3]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r1, #4]
	mov r0, sp
	ldrb r0, [r0, #0x1c]
	strb r0, [r1, #6]
	mov r0, sp
	ldrb r0, [r0, #0x1d]
	strb r0, [r1, #7]
	mov r0, sp
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	mov r0, sp
	adds r0, #0x36
	ldrb r0, [r0]
	strb r0, [r1, #0xf]
	mov r0, sp
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r1, #0x10]
	mov r0, sp
	ldrh r0, [r0, #0x3a]
	strh r0, [r1, #0x16]
	add r2, sp, #0x38
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080648BC
	lsls r2, r0, #6
	b _080648C0
	.align 2, 0
_080648A8: .4byte gPauseScreenFlag
_080648AC: .4byte 0x0879B8BC
_080648B0: .4byte gCurrentArea
_080648B4: .4byte gCurrentRoom
_080648B8: .4byte gCurrentRoomEntry
_080648BC:
	ldr r0, _08064900 @ =0x0000FFFF
	adds r2, r0, #0
_080648C0:
	movs r0, #0
	strh r2, [r1, #0x12]
	ldr r4, _08064904 @ =0x03000054
	strb r0, [r4]
	ldr r1, _08064908 @ =gCurrentRoomEntry
	mov r0, sp
	adds r0, #0x25
	ldrb r0, [r0]
	strb r0, [r1, #0xc]
	mov r0, sp
	adds r0, #0x2d
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r2, _0806490C @ =gEventCounter
	ldrb r3, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r3, r0
	blo _08064914
	cmp r0, #0
	beq _08064914
	ldr r0, [sp, #0x30]
	str r0, [r5, #8]
	ldr r1, _08064910 @ =gSpritesetNumber
	add r0, sp, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #2
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064900: .4byte 0x0000FFFF
_08064904: .4byte 0x03000054
_08064908: .4byte gCurrentRoomEntry
_0806490C: .4byte gEventCounter
_08064910: .4byte gSpritesetNumber
_08064914:
	ldrb r0, [r2]
	ldrb r1, [r5, #0xc]
	cmp r0, r1
	blo _08064938
	cmp r1, #0
	beq _08064938
	ldr r0, [sp, #0x28]
	str r0, [r5, #8]
	ldr r1, _08064934 @ =gSpritesetNumber
	add r0, sp, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #1
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064934: .4byte gSpritesetNumber
_08064938:
	ldr r0, [sp, #0x20]
	str r0, [r5, #8]
	ldr r1, _08064970 @ =gSpritesetNumber
	add r0, sp, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
_08064944:
	movs r0, #0
	movs r1, #2
	strb r1, [r5, #5]
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08064966
	ldrb r0, [r5, #1]
	cmp r0, #0x44
	bne _08064966
	ldr r1, _08064974 @ =gSaXSpawnPosition
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r1]
	strh r0, [r1, #2]
_08064966:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064970: .4byte gSpritesetNumber
_08064974: .4byte gSaXSpawnPosition

	thumb_func_start LoadRoomBackgrounds
LoadRoomBackgrounds: @ 0x08064978
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r1, _08064A18 @ =0x0879B8BC
	ldr r4, _08064A1C @ =gCurrentArea
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, _08064A20 @ =gCurrentRoom
	ldrb r2, [r5]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r0, _08064A24 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080649CA
	ldrb r0, [r4]
	cmp r0, #0
	bne _080649CA
	ldrb r0, [r5]
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _080649CA
	ldr r1, _08064A28 @ =gCurrentRoomEntry
	movs r0, #0x40
	strb r0, [r1, #1]
	ldr r0, _08064A2C @ =0x08412530
	str r0, [sp, #8]
	movs r0, #0x24
	strb r0, [r1, #7]
_080649CA:
	ldr r4, _08064A28 @ =gCurrentRoomEntry
	ldrb r1, [r4, #1]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080649DE
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
_080649DE:
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	strb r0, [r4, #0x19]
	adds r3, r1, #4
	ldr r1, _08064A30 @ =0x02032000
	adds r0, r3, #0
	bl CallLZ77UncompVram
	ldrb r1, [r4, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064A3C
	ldr r3, [sp, #8]
	ldr r1, _08064A34 @ =gBackgroundsData
	ldr r2, _08064A38 @ =0x02029000
	str r2, [r1]
	ldrb r0, [r3]
	strh r0, [r1, #4]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r1, #6]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	b _08064A52
	.align 2, 0
_08064A18: .4byte 0x0879B8BC
_08064A1C: .4byte gCurrentArea
_08064A20: .4byte gCurrentRoom
_08064A24: .4byte gEventCounter
_08064A28: .4byte gCurrentRoomEntry
_08064A2C: .4byte 0x08412530
_08064A30: .4byte 0x02032000
_08064A34: .4byte gBackgroundsData
_08064A38: .4byte 0x02029000
_08064A3C:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08064A52
	ldr r0, [sp, #8]
	adds r3, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r3, #0
	bl CallLZ77UncompVram
_08064A52:
	ldr r0, _08064AC4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064ABA
	ldr r3, [sp, #0x14]
	ldr r4, _08064AC8 @ =gBackgroundsData
	ldr r2, _08064ACC @ =0x02026000
	str r2, [r4, #0x18]
	ldrb r0, [r3]
	strh r0, [r4, #0x1c]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x1e]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r3, [sp, #0xc]
	ldr r2, _08064AD0 @ =0x0202C000
	str r2, [r4, #8]
	ldrb r0, [r3]
	strh r0, [r4, #0xc]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0xe]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r0, _08064AD4 @ =gCurrentRoomEntry
	ldrb r1, [r0, #3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064ABA
	ldr r3, [sp, #0x10]
	ldr r2, _08064AD8 @ =0x0202F000
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	strh r0, [r4, #0x14]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x16]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
_08064ABA:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064AC4: .4byte gPauseScreenFlag
_08064AC8: .4byte gBackgroundsData
_08064ACC: .4byte 0x02026000
_08064AD0: .4byte 0x0202C000
_08064AD4: .4byte gCurrentRoomEntry
_08064AD8: .4byte 0x0202F000

	thumb_func_start RemoveNeverReformBlocksAndCollectedTanks
RemoveNeverReformBlocksAndCollectedTanks: @ 0x08064ADC
	push {lr}
	bl RemoveNeverReformBlocks
	bl RemoveCollectedTanks
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RoomResetInfo
RoomResetInfo: @ 0x08064AEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08064BC4 @ =gColorFading
	movs r4, #0
	strb r4, [r3, #3]
	strb r4, [r3, #2]
	ldrb r0, [r3, #5]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #5]
	strb r4, [r3, #4]
	strb r4, [r3, #1]
	ldr r2, _08064BC8 @ =gCurrentPowerBomb
	ldrb r0, [r2]
	cmp r0, #0
	beq _08064B1C
	ldr r0, _08064BCC @ =gScreenShakeX
	ldr r1, _08064BD0 @ =0x083C88C8
	ldr r1, [r1]
	str r1, [r0]
_08064B1C:
	adds r1, r2, #0
	ldr r0, _08064BD4 @ =0x083C88B4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, _08064BD8 @ =gWrittenToBldcnt
	movs r2, #0
	strh r4, [r0]
	ldr r0, _08064BDC @ =0x03004FCC
	strb r2, [r0]
	ldr r0, _08064BE0 @ =gUnk_3000be3
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08064BB2
	movs r0, #2
	strb r0, [r3]
	ldr r0, _08064BE4 @ =0x03004DE8
	strh r1, [r0]
	strb r2, [r0, #2]
	ldr r0, _08064BE8 @ =gCurrentClipdataAffectingAction
	strb r2, [r0]
	ldr r1, _08064BEC @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08064BF0 @ =gDisableDoorsAndTanks
	strb r2, [r0]
	ldr r0, _08064BF4 @ =gCurrentCutscene
	strb r2, [r0]
	ldr r0, _08064BF8 @ =gCurrentNavigationRoom
	strb r2, [r0]
	ldr r0, _08064BFC @ =gElevatorDirection
	strb r2, [r0]
	ldr r0, _08064C00 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064B9E
	ldr r4, _08064C04 @ =gPreviousCutscene
	ldr r5, _08064C08 @ =gLastDoorUsed
	ldr r1, _08064C0C @ =gCurrentDemo
	ldr r2, _08064C10 @ =0x03000058
	movs r3, #0
	adds r0, r2, #4
_08064B78:
	strb r3, [r0]
	subs r0, #1
	cmp r0, r2
	bge _08064B78
	movs r0, #0
	strb r0, [r4]
	strb r0, [r5]
	ldrb r1, [r1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064B96
	movs r0, #0
	bl DemoLoadRam
_08064B96:
	ldr r0, _08064C14 @ =gAbilityCount
	ldrb r0, [r0]
	bl SetAbilityCount
_08064B9E:
	ldr r1, _08064C18 @ =gDoorPositionStart
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _08064C1C @ =gSecurityHatchLevel
	ldr r0, _08064C20 @ =gEquipment
	ldrb r0, [r0, #0xd]
	strb r0, [r1]
	bl SramWrite_MostRecentSaveFile
_08064BB2:
	ldr r0, _08064BC4 @ =gColorFading
	ldrb r0, [r0]
	cmp r0, #4
	beq _08064BBE
	cmp r0, #6
	bne _08064C28
_08064BBE:
	ldr r1, _08064C24 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	b _08064C2C
	.align 2, 0
_08064BC4: .4byte gColorFading
_08064BC8: .4byte gCurrentPowerBomb
_08064BCC: .4byte gScreenShakeX
_08064BD0: .4byte 0x083C88C8
_08064BD4: .4byte 0x083C88B4
_08064BD8: .4byte gWrittenToBldcnt
_08064BDC: .4byte 0x03004FCC
_08064BE0: .4byte gUnk_3000be3
_08064BE4: .4byte 0x03004DE8
_08064BE8: .4byte gCurrentClipdataAffectingAction
_08064BEC: .4byte gPreviousArea
_08064BF0: .4byte gDisableDoorsAndTanks
_08064BF4: .4byte gCurrentCutscene
_08064BF8: .4byte gCurrentNavigationRoom
_08064BFC: .4byte gElevatorDirection
_08064C00: .4byte gIsLoadingFile
_08064C04: .4byte gPreviousCutscene
_08064C08: .4byte gLastDoorUsed
_08064C0C: .4byte gCurrentDemo
_08064C10: .4byte 0x03000058
_08064C14: .4byte gAbilityCount
_08064C18: .4byte gDoorPositionStart
_08064C1C: .4byte gSecurityHatchLevel
_08064C20: .4byte gEquipment
_08064C24: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064C28:
	ldr r1, _08064D7C @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #3
_08064C2C:
	strb r0, [r1]
	ldr r0, _08064D80 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064C3A
	bl EventCheckUpdateAfterCutscene
_08064C3A:
	ldr r0, _08064D84 @ =gPauseScreenFlag
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _08064C46
	b _08064F12
_08064C46:
	ldr r0, _08064D88 @ =gDisableScrolling
	strb r2, [r0]
	ldr r0, _08064D8C @ =0x03000026
	strb r2, [r0]
	ldr r0, _08064D90 @ =0x03000050
	movs r1, #0
	strh r2, [r0]
	ldr r0, _08064D94 @ =0x0300002B
	strb r1, [r0]
	ldr r0, _08064D98 @ =gBackdropColor
	strh r2, [r0]
	ldr r0, _08064D9C @ =gQueuedEventBasedEffect
	strb r1, [r0]
	ldr r0, _08064DA0 @ =gCurrentEventBasedEffect
	strb r1, [r0]
	ldr r0, _08064DA4 @ =gEffectYPosition
	strh r2, [r0]
	ldr r0, _08064DA8 @ =0x03004E3B
	strb r1, [r0]
	ldr r0, _08064DAC @ =gDoorUnlockTimer
	strb r1, [r0]
	ldr r0, _08064DB0 @ =0x03000047
	strb r1, [r0]
	ldr r1, _08064DB4 @ =0x0879B894
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _08064DBC @ =gLastDoorUsed
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r3, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r4, #1]
	strb r0, [r3]
	ldr r1, _08064DC4 @ =0x0300002F
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r2, _08064DC8 @ =0x03000030
	ldrb r0, [r4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r1, _08064DCC @ =gDoorPositionStart
	ldrb r0, [r4, #2]
	strh r0, [r1]
	ldrb r0, [r4, #4]
	strh r0, [r1, #2]
	ldr r1, _08064DD0 @ =gSaXSpawnPosition
	ldr r0, _08064DD4 @ =0x083C88A4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08064DD8 @ =0x03004E4C
	ldr r0, _08064DDC @ =0x083C88E4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r2, _08064DE0 @ =0x03004E30
	ldr r0, _08064DE4 @ =0x083C88DC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	bl EventCheckRoomHasEventTrigger
	ldr r2, _08064DE8 @ =0x03004E60
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064CDC:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064CDC
	ldr r6, _08064DF0 @ =gScreenShakeX
	mov sb, r6
	ldr r0, _08064DF4 @ =0x083C88C8
	mov r8, r0
	ldr r1, _08064DF8 @ =gIsLoadingFile
	mov sl, r1
	ldr r3, _08064DFC @ =0x03004FB8
	ldr r5, _08064E00 @ =0x03000027
	ldr r6, _08064E04 @ =gScreenShakeY
	ldr r7, _08064E08 @ =gScreenShakeXOffset
	ldr r2, _08064E0C @ =gScreenShakeYOffset
	mov ip, r2
	ldr r2, _08064E10 @ =0x03004EE0
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064D06:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D06
	ldr r2, _08064E14 @ =0x03004FA8
	ldr r0, _08064E18 @ =0x083C88AC
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0xc
_08064D18:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D18
	movs r0, #0
	strb r0, [r3]
	strb r0, [r5]
	ldr r3, _08064E1C @ =0x02035D20
	movs r2, #0x40
	movs r1, #0
_08064D2C:
	lsls r0, r2, #1
	adds r0, r0, r3
	subs r0, #2
	strh r1, [r0]
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08064D2C
	mov r5, r8
	ldr r0, [r5]
	str r0, [r6]
	mov r6, sb
	str r0, [r6]
	strb r2, [r7]
	mov r0, ip
	strb r2, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08064E28
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D62
	b _08064F12
_08064D62:
	ldr r0, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D6C
	b _08064F12
_08064D6C:
	ldr r0, _08064E20 @ =gSamusData
	movs r1, #0xc8
	lsls r1, r1, #3
	strh r1, [r0, #0x16]
	ldr r1, _08064E24 @ =0x000002BF
	strh r1, [r0, #0x18]
	b _08064F12
	.align 2, 0
_08064D7C: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064D80: .4byte gCurrentCutscene
_08064D84: .4byte gPauseScreenFlag
_08064D88: .4byte gDisableScrolling
_08064D8C: .4byte 0x03000026
_08064D90: .4byte 0x03000050
_08064D94: .4byte 0x0300002B
_08064D98: .4byte gBackdropColor
_08064D9C: .4byte gQueuedEventBasedEffect
_08064DA0: .4byte gCurrentEventBasedEffect
_08064DA4: .4byte gEffectYPosition
_08064DA8: .4byte 0x03004E3B
_08064DAC: .4byte gDoorUnlockTimer
_08064DB0: .4byte 0x03000047
_08064DB4: .4byte 0x0879B894
_08064DB8: .4byte gCurrentArea
_08064DBC: .4byte gLastDoorUsed
_08064DC0: .4byte gCurrentRoom
_08064DC4: .4byte 0x0300002F
_08064DC8: .4byte 0x03000030
_08064DCC: .4byte gDoorPositionStart
_08064DD0: .4byte gSaXSpawnPosition
_08064DD4: .4byte 0x083C88A4
_08064DD8: .4byte 0x03004E4C
_08064DDC: .4byte 0x083C88E4
_08064DE0: .4byte 0x03004E30
_08064DE4: .4byte 0x083C88DC
_08064DE8: .4byte 0x03004E60
_08064DEC: .4byte 0x083C88A8
_08064DF0: .4byte gScreenShakeX
_08064DF4: .4byte 0x083C88C8
_08064DF8: .4byte gIsLoadingFile
_08064DFC: .4byte 0x03004FB8
_08064E00: .4byte 0x03000027
_08064E04: .4byte gScreenShakeY
_08064E08: .4byte gScreenShakeXOffset
_08064E0C: .4byte gScreenShakeYOffset
_08064E10: .4byte 0x03004EE0
_08064E14: .4byte 0x03004FA8
_08064E18: .4byte 0x083C88AC
_08064E1C: .4byte 0x02035D20
_08064E20: .4byte gSamusData
_08064E24: .4byte 0x000002BF
_08064E28:
	ldr r0, _08064E88 @ =0x03000124
	movs r1, #0
	strh r2, [r0]
	strh r2, [r0, #4]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	ldrb r2, [r4, #2]
	ldrb r0, [r4, #5]
	adds r3, r0, #1
	ldr r5, _08064E8C @ =gSamusData
	lsls r1, r2, #6
	movs r0, #7
	ldrsb r0, [r4, r0]
	adds r0, #8
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r1, r3, #6
	movs r0, #8
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	subs r1, #1
	strh r1, [r5, #0x18]
	ldr r0, _08064E90 @ =gCurrentDemo
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064E6E
	movs r0, #1
	bl DemoLoadRam
_08064E6E:
	ldr r2, _08064E94 @ =gSaXSpawnPosition
	ldrh r1, [r5, #0x16]
	strh r1, [r2]
	ldrh r0, [r5, #0x18]
	strh r0, [r2, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _08064E98
	adds r0, r1, #0
	subs r0, #0x20
	b _08064EA0
	.align 2, 0
_08064E88: .4byte 0x03000124
_08064E8C: .4byte gSamusData
_08064E90: .4byte gCurrentDemo
_08064E94: .4byte gSaXSpawnPosition
_08064E98:
	cmp r0, #0
	bge _08064EA2
	adds r0, r1, #0
	adds r0, #0x20
_08064EA0:
	strh r0, [r2]
_08064EA2:
	ldr r0, _08064EB8 @ =gSamusDoorPositionOffset
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r5, _08064EBC @ =gSamusData
	adds r4, r0, #0
	cmp r2, #0
	beq _08064EE6
	cmp r2, #0
	bge _08064EC0
	movs r0, #0
	b _08064ED8
	.align 2, 0
_08064EB8: .4byte gSamusDoorPositionOffset
_08064EBC: .4byte gSamusData
_08064EC0:
	movs r6, #0x26
	ldrsh r0, [r5, r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r3, r0
	cmp r0, #0xff
	ble _08064EDA
	movs r0, #0xff
	subs r0, r0, r3
_08064ED8:
	strh r0, [r4]
_08064EDA:
	ldrh r0, [r5, #0x18]
	ldrh r1, [r4]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r5, #0x18]
	strh r1, [r4]
_08064EE6:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08064EF4
	movs r0, #2
	strb r0, [r1]
_08064EF4:
	ldr r0, _08064F20 @ =gBg1YPosition
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08064F24 @ =gBg1XPosition
	strh r1, [r0]
	ldr r0, _08064F28 @ =0x03001224
	strh r1, [r0]
	ldr r0, _08064F2C @ =0x03001226
	strh r1, [r0]
	ldrb r0, [r5, #1]
	cmp r0, #0x17
	bne _08064F12
	ldr r1, _08064F30 @ =gDisableDoorsAndTanks
	movs r0, #0x80
	strb r0, [r1]
_08064F12:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064F20: .4byte gBg1YPosition
_08064F24: .4byte gBg1XPosition
_08064F28: .4byte 0x03001224
_08064F2C: .4byte 0x03001226
_08064F30: .4byte gDisableDoorsAndTanks

	thumb_func_start LoadScrollsAndEventBasedEffects
LoadScrollsAndEventBasedEffects: @ 0x08064F34
	push {r4, r5, r6, lr}
	bl LoadScrolls
	ldr r0, _08064F8C @ =gPauseScreenFlag
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	beq _08064F46
	b _080652B8
_08064F46:
	ldr r2, _08064F90 @ =0x03004E10
	movs r4, #0x80
	strh r4, [r2]
	strh r4, [r2, #2]
	strh r4, [r2, #6]
	strh r4, [r2, #4]
	ldr r0, _08064F94 @ =gCurrentArea
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #6
	bls _08064F60
	strh r3, [r2]
	strh r3, [r2, #2]
_08064F60:
	ldr r2, _08064F98 @ =0x03004E18
	ldr r0, _08064F9C @ =0x083C88D4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _08064FA0 @ =gCurrentRoomEntry
	ldrb r1, [r0, #6]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r1, #7
	blt _08064FAC
	cmp r1, #8
	ble _08064F80
	cmp r1, #0xa
	bne _08064FAC
_08064F80:
	ldr r0, _08064FA4 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bls _08064FA8
	movs r0, #2
	b _08064FAA
	.align 2, 0
_08064F8C: .4byte gPauseScreenFlag
_08064F90: .4byte 0x03004E10
_08064F94: .4byte gCurrentArea
_08064F98: .4byte 0x03004E18
_08064F9C: .4byte 0x083C88D4
_08064FA0: .4byte gCurrentRoomEntry
_08064FA4: .4byte gEventCounter
_08064FA8:
	movs r0, #1
_08064FAA:
	strb r0, [r6]
_08064FAC:
	ldr r3, _08064FC4 @ =0x03004E20
	ldr r0, _08064FC8 @ =0x083C88CC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2, #1]
	cmp r0, #0x47
	bne _08064FCC
	movs r0, #3
	b _08064FDC
	.align 2, 0
_08064FC4: .4byte 0x03004E20
_08064FC8: .4byte 0x083C88CC
_08064FCC:
	ldrb r0, [r2, #0x10]
	cmp r0, #1
	beq _08064FDC
	cmp r0, #5
	beq _08064FDA
	cmp r0, #6
	bne _08064FDE
_08064FDA:
	movs r0, #4
_08064FDC:
	strb r0, [r3]
_08064FDE:
	ldr r1, _08064FF4 @ =gQueuedEventBasedEffect
	movs r0, #0
	strb r0, [r1]
	adds r4, r2, #0
	ldrb r0, [r4, #1]
	adds r3, r1, #0
	cmp r0, #0x47
	bne _08064FF8
	movs r0, #1
	b _080652B6
	.align 2, 0
_08064FF4: .4byte gQueuedEventBasedEffect
_08064FF8:
	cmp r0, #0x46
	bne _08065024
	ldr r0, _08065018 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x1f
	bls _08065020
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x12]
	ldr r0, _0806501C @ =0x03004FC8
	strb r1, [r0]
	b _080652B8
	.align 2, 0
_08065018: .4byte gEventCounter
_0806501C: .4byte 0x03004FC8
_08065020:
	movs r0, #5
	b _080652B6
_08065024:
	ldrb r0, [r2]
	subs r0, #7
	cmp r0, #0x5a
	bls _0806502E
	b _080652B8
_0806502E:
	lsls r0, r0, #2
	ldr r1, _08065038 @ =_0806503C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065038: .4byte _0806503C
_0806503C: @ jump table
	.4byte _080652B0 @ case 0
	.4byte _080652B8 @ case 1
	.4byte _080652B8 @ case 2
	.4byte _080652B8 @ case 3
	.4byte _080652B8 @ case 4
	.4byte _080652B8 @ case 5
	.4byte _080652B8 @ case 6
	.4byte _080651A8 @ case 7
	.4byte _080652B8 @ case 8
	.4byte _080652B8 @ case 9
	.4byte _080651E0 @ case 10
	.4byte _080652B8 @ case 11
	.4byte _080652B8 @ case 12
	.4byte _080652B8 @ case 13
	.4byte _080652B8 @ case 14
	.4byte _080652B8 @ case 15
	.4byte _080652B8 @ case 16
	.4byte _080652B8 @ case 17
	.4byte _080652B8 @ case 18
	.4byte _080652B8 @ case 19
	.4byte _080652B8 @ case 20
	.4byte _080652B8 @ case 21
	.4byte _080652B8 @ case 22
	.4byte _080652B8 @ case 23
	.4byte _080652B8 @ case 24
	.4byte _080652B8 @ case 25
	.4byte _080652B8 @ case 26
	.4byte _080652B8 @ case 27
	.4byte _080652B8 @ case 28
	.4byte _080652B8 @ case 29
	.4byte _080652B8 @ case 30
	.4byte _080652B8 @ case 31
	.4byte _080652B8 @ case 32
	.4byte _080652B8 @ case 33
	.4byte _080651A8 @ case 34
	.4byte _080652B8 @ case 35
	.4byte _080652B8 @ case 36
	.4byte _080652B8 @ case 37
	.4byte _080652B8 @ case 38
	.4byte _080652B8 @ case 39
	.4byte _080652B8 @ case 40
	.4byte _08065294 @ case 41
	.4byte _080652B8 @ case 42
	.4byte _080652B8 @ case 43
	.4byte _080652B8 @ case 44
	.4byte _080652B8 @ case 45
	.4byte _080652B8 @ case 46
	.4byte _080652B8 @ case 47
	.4byte _08065248 @ case 48
	.4byte _080651AC @ case 49
	.4byte _080652B4 @ case 50
	.4byte _080652B8 @ case 51
	.4byte _080652B8 @ case 52
	.4byte _080652B8 @ case 53
	.4byte _080652B8 @ case 54
	.4byte _080652B8 @ case 55
	.4byte _080652B8 @ case 56
	.4byte _080652B8 @ case 57
	.4byte _080652B8 @ case 58
	.4byte _080652B8 @ case 59
	.4byte _080652B8 @ case 60
	.4byte _080652B8 @ case 61
	.4byte _080652B8 @ case 62
	.4byte _080652B8 @ case 63
	.4byte _08065240 @ case 64
	.4byte _080652B8 @ case 65
	.4byte _080652B8 @ case 66
	.4byte _080652B8 @ case 67
	.4byte _080652B8 @ case 68
	.4byte _080652B8 @ case 69
	.4byte _080652B8 @ case 70
	.4byte _080652B8 @ case 71
	.4byte _080652B8 @ case 72
	.4byte _08065260 @ case 73
	.4byte _080652B8 @ case 74
	.4byte _080652B8 @ case 75
	.4byte _08065264 @ case 76
	.4byte _080652B8 @ case 77
	.4byte _080652B8 @ case 78
	.4byte _080652B8 @ case 79
	.4byte _080652B8 @ case 80
	.4byte _080652B8 @ case 81
	.4byte _0806527C @ case 82
	.4byte _080652B8 @ case 83
	.4byte _080652B8 @ case 84
	.4byte _080652B8 @ case 85
	.4byte _08065244 @ case 86
	.4byte _080652B8 @ case 87
	.4byte _080652B8 @ case 88
	.4byte _080652B8 @ case 89
	.4byte _080652AC @ case 90
_080651A8:
	movs r0, #4
	b _080652B6
_080651AC:
	ldrb r2, [r5]
	cmp r2, #0
	beq _080651B4
	b _080652B8
_080651B4:
	ldr r0, _080651D4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x36
	beq _080651BE
	b _080652B8
_080651BE:
	ldr r0, _080651D8 @ =gEventCounter
	ldrb r1, [r0]
	cmp r1, #0x49
	bls _080651C8
	b _080652B8
_080651C8:
	ldr r0, _080651DC @ =0x03004FC8
	strb r2, [r0]
	cmp r1, #0x49
	bne _080652B8
	movs r0, #7
	b _080652B6
	.align 2, 0
_080651D4: .4byte gCurrentRoom
_080651D8: .4byte gEventCounter
_080651DC: .4byte 0x03004FC8
_080651E0:
	ldr r0, _0806520C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08065218
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065210 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _080652B8
	movs r0, #8
	strb r0, [r3]
	bl unk_6dec0
	movs r0, #0xfc
	bl SoundPlay
	ldr r1, _08065214 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_0806520C: .4byte gEventCounter
_08065210: .4byte gCurrentRoom
_08065214: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08065218:
	cmp r0, #0x46
	bne _080652B8
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065238 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _080652B8
	ldr r0, _0806523C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _080652B8
	movs r0, #0x14
	b _080652B6
	.align 2, 0
_08065238: .4byte gCurrentRoom
_0806523C: .4byte gSamusData
_08065240:
	movs r0, #0xa
	b _080652B6
_08065244:
	movs r0, #3
	b _080652B6
_08065248:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _0806525C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _080652B8
	movs r0, #0xb
	b _080652B6
	.align 2, 0
_0806525C: .4byte gCurrentRoom
_08065260:
	movs r0, #0xe
	b _080652B6
_08065264:
	ldr r0, _08065274 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _080652B8
	ldr r1, _08065278 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_08065274: .4byte gEventCounter
_08065278: .4byte 0x03004FC8
_0806527C:
	ldr r0, _08065290 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bne _080652B8
	movs r0, #0x11
	strb r0, [r3]
	movs r0, #3
	strb r0, [r6]
	b _080652B8
	.align 2, 0
_08065290: .4byte gEventCounter
_08065294:
	ldrb r0, [r5]
	cmp r0, #5
	bne _080652B8
	ldr r0, _080652A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #3
	bne _080652B8
	movs r0, #0xf
	b _080652B6
	.align 2, 0
_080652A8: .4byte gCurrentRoom
_080652AC:
	movs r0, #0x12
	b _080652B6
_080652B0:
	movs r0, #0xd
	b _080652B6
_080652B4:
	movs r0, #0x10
_080652B6:
	strb r0, [r3]
_080652B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadDoors
LoadDoors: @ 0x080652C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0806535C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080652DA
	b _080655FC
_080652DA:
	movs r0, #0
	mov ip, r0
	ldr r6, _08065360 @ =0x0879B894
	ldr r5, _08065364 @ =gCurrentArea
	ldr r0, _08065368 @ =0x083C88B0
	ldr r1, [r0]
	ldr r4, _0806536C @ =0x03004E04
	movs r2, #0
	ldr r3, _08065370 @ =gHatchData
_080652EC:
	stm r3!, {r1}
	mov r7, ip
	adds r0, r7, r4
	strb r2, [r0]
	movs r0, #1
	add ip, r0
	mov r7, ip
	cmp r7, #5
	ble _080652EC
	movs r0, #0xff
	str r0, [sp]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r7, [r0]
	movs r1, #0
	mov ip, r1
	mov sl, r1
	ldrb r1, [r7]
	cmp r1, #0
	bne _08065318
	b _08065558
_08065318:
	ldr r2, _08065374 @ =gBackgroundsData
	mov sb, r2
_0806531C:
	ldr r4, _08065378 @ =gCurrentRoom
	ldrb r0, [r4]
	ldrb r2, [r7, #1]
	cmp r0, r2
	beq _08065328
	b _0806554A
_08065328:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08065332
	b _08065544
_08065332:
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	ldrb r3, [r7, #4]
	muls r0, r3, r0
	ldrb r2, [r7, #2]
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08065384
	ldr r0, _0806537C @ =0x00007FFF
	ands r0, r5
	ldr r1, _08065380 @ =0x083BF5C0
	adds r0, r0, r1
	b _0806538A
	.align 2, 0
_0806535C: .4byte gPauseScreenFlag
_08065360: .4byte 0x0879B894
_08065364: .4byte gCurrentArea
_08065368: .4byte 0x083C88B0
_0806536C: .4byte 0x03004E04
_08065370: .4byte gHatchData
_08065374: .4byte gBackgroundsData
_08065378: .4byte gCurrentRoom
_0806537C: .4byte 0x00007FFF
_08065380: .4byte 0x083BF5C0
_08065384:
	ldr r4, _080653C0 @ =gTilemapAndClipPointers
	ldr r0, [r4, #4]
	adds r0, r0, r5
_0806538A:
	ldrb r4, [r0]
	movs r0, #1
	mov r8, r0
	cmp r4, #0xb
	beq _080653AA
	movs r1, #0
	mov r8, r1
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	muls r0, r3, r0
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #2
	ldrh r5, [r0]
_080653AA:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _080653CC
	ldr r0, _080653C4 @ =0x00007FFF
	ands r5, r0
	lsls r0, r5, #1
	ldr r1, _080653C8 @ =0x083BE3A0
	b _080653D2
	.align 2, 0
_080653C0: .4byte gTilemapAndClipPointers
_080653C4: .4byte 0x00007FFF
_080653C8: .4byte 0x083BE3A0
_080653CC:
	ldr r2, _0806542C @ =gTilemapAndClipPointers
	ldr r1, [r2, #8]
	lsls r0, r5, #1
_080653D2:
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #6
	cmp r5, #0x7e
	ble _08065402
	movs r4, #5
	cmp r5, #0x7f
	beq _08065402
	movs r4, #0
	cmp r5, #0x85
	ble _08065402
	movs r4, #1
	cmp r5, #0x8b
	ble _08065402
	movs r4, #2
	cmp r5, #0x91
	ble _08065402
	movs r4, #3
	cmp r5, #0x97
	ble _08065402
	movs r4, #6
	cmp r5, #0x9d
	bgt _08065402
	movs r4, #4
_08065402:
	cmp r4, #5
	bgt _080654AC
	cmp r4, #5
	bne _08065434
	movs r6, #0
	movs r2, #1
	rsbs r2, r2, #0
	ldr r1, _08065430 @ =gHatchData
	adds r1, #0x14
_08065414:
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0806541E
	adds r6, r4, #0
_0806541E:
	subs r1, #4
	subs r4, #1
	cmp r4, r2
	bgt _08065414
	movs r4, #5
	b _08065440
	.align 2, 0
_0806542C: .4byte gTilemapAndClipPointers
_08065430: .4byte gHatchData
_08065434:
	adds r1, r5, #0
	subs r1, #0x80
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r1, r0
_08065440:
	lsls r1, r6, #2
	ldr r0, _08065478 @ =gHatchData
	adds r3, r1, r0
	ldrb r5, [r3]
	lsls r0, r5, #0x1f
	adds r2, r1, #0
	cmp r0, #0
	bne _080654A4
	lsls r1, r4, #5
	movs r0, #0x1f
	ands r0, r5
	orrs r0, r1
	mov r4, r8
	lsls r1, r4, #4
	movs r4, #0x11
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, #4]
	strb r0, [r3, #3]
	ldrb r0, [r7, #2]
	strb r0, [r3, #2]
	mov r1, r8
	cmp r1, #0
	beq _0806547C
	adds r0, #1
	b _0806547E
	.align 2, 0
_08065478: .4byte gHatchData
_0806547C:
	subs r0, #1
_0806547E:
	strb r0, [r3, #2]
	ldr r4, _0806549C @ =gHatchData
	adds r2, r2, r4
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080654A0 @ =0x03004E04
	adds r0, r6, r1
	mov r2, sl
	strb r2, [r0]
	movs r4, #1
	add ip, r4
	b _08065534
	.align 2, 0
_0806549C: .4byte gHatchData
_080654A0: .4byte 0x03004E04
_080654A4:
	movs r0, #0xe0
	orrs r0, r5
	strb r0, [r3]
	b _08065534
_080654AC:
	ldr r0, _080654C0 @ =gHatchData
	ldrb r1, [r0, #0x14]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080654C4
	movs r6, #5
	b _080654D8
	.align 2, 0
_080654C0: .4byte gHatchData
_080654C4:
	ldr r4, _0806551C @ =gHatchData
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	bne _080654D4
	movs r6, #4
_080654D4:
	cmp r6, #0
	beq _08065534
_080654D8:
	lsls r0, r6, #2
	ldr r1, _0806551C @ =gHatchData
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #0xc0
	orrs r1, r0
	strb r1, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #3]
	ldrb r0, [r7, #2]
	strb r0, [r2, #2]
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	ldr r4, _08065520 @ =0x03004E04
	adds r0, r6, r4
	mov r1, sl
	strb r1, [r0]
	mov r4, sb
	ldrh r1, [r4, #0x1c]
	ldrb r0, [r7, #2]
	lsls r0, r0, #1
	cmp r1, r0
	ble _08065524
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	b _08065532
	.align 2, 0
_0806551C: .4byte gHatchData
_08065520: .4byte 0x03004E04
_08065524:
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
_08065532:
	strb r0, [r2]
_08065534:
	ldr r0, [sp]
	cmp r0, #0xff
	bne _08065544
	ldr r1, _0806560C @ =gLastDoorUsed
	ldrb r1, [r1]
	cmp sl, r1
	bne _08065544
	str r6, [sp]
_08065544:
	mov r2, ip
	cmp r2, #6
	beq _08065558
_0806554A:
	adds r7, #0xc
	movs r4, #1
	add sl, r4
	ldrb r1, [r7]
	cmp r1, #0
	beq _08065558
	b _0806531C
_08065558:
	ldr r7, [sp]
	cmp r7, #0xff
	beq _080655AE
	ldr r0, _08065610 @ =gUnk_3000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080655AE
	ldr r0, _08065614 @ =gHatchData
	lsls r1, r7, #2
	adds r5, r1, r0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _080655AE
	lsrs r0, r2, #5
	cmp r0, #4
	bhi _080655AE
	ldrb r1, [r5, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #1]
	movs r4, #0xf
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r5]
	ldr r0, [sp]
	bl UpdateHatchAnimation
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r5]
	ands r4, r0
	strb r4, [r5]
_080655AE:
	movs r6, #0
	movs r7, #4
	rsbs r7, r7, #0
	movs r5, #0xf
	rsbs r5, r5, #0
_080655B8:
	ldr r0, _08065614 @ =gHatchData
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	lsrs r0, r2, #5
	cmp r0, #5
	bne _080655F6
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r0, r6, #0
	bl UpdateHatchAnimation
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4]
_080655F6:
	adds r6, #1
	cmp r6, #5
	ble _080655B8
_080655FC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte gLastDoorUsed
_08065610: .4byte gUnk_3000be3
_08065614: .4byte gHatchData

	thumb_func_start unk_65618
unk_65618: @ 0x08065618
	push {r4, lr}
	movs r2, #0
	ldr r0, _0806564C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065642
	ldr r3, _08065650 @ =gHatchData
	ldrb r1, [r3, #1]
	movs r4, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065634
	movs r2, #1
_08065634:
	ldrb r1, [r3, #5]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065642
	movs r0, #2
	orrs r2, r0
_08065642:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806564C: .4byte gCurrentNavigationRoom
_08065650: .4byte gHatchData

	thumb_func_start SetupInitialTilemap
SetupInitialTilemap: @ 0x08065654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #0
	bne _08065684
	ldr r0, _08065678 @ =gCurrentRoomEntry
	ldrb r2, [r0, #1]
	ldr r0, _0806567C @ =0x03001226
	ldrh r6, [r0]
	ldr r0, _08065680 @ =0x03001224
	b _080656AE
	.align 2, 0
_08065678: .4byte gCurrentRoomEntry
_0806567C: .4byte 0x03001226
_08065680: .4byte 0x03001224
_08065684:
	ldr r0, [sp]
	cmp r0, #1
	bne _080656A4
	ldr r0, _08065698 @ =gCurrentRoomEntry
	ldrb r2, [r0, #2]
	ldr r0, _0806569C @ =gBg1YPosition
	ldrh r6, [r0]
	ldr r0, _080656A0 @ =gBg1XPosition
	b _080656AE
	.align 2, 0
_08065698: .4byte gCurrentRoomEntry
_0806569C: .4byte gBg1YPosition
_080656A0: .4byte gBg1XPosition
_080656A4:
	ldr r0, _080657E4 @ =gCurrentRoomEntry
	ldrb r2, [r0, #3]
	ldr r0, _080657E8 @ =0x0300122E
	ldrh r6, [r0]
	ldr r0, _080657EC @ =0x0300122C
_080656AE:
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _080656BA
	b _0806586C
_080656BA:
	lsrs r0, r1, #6
	movs r1, #0x15
	str r1, [sp, #0xc]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _080656CC
	movs r3, #0
_080656CC:
	ldr r7, _080657F0 @ =gBackgroundsData
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r5, r1, r7
	ldrh r4, [r5, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r4, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	ble _080656EC
	subs r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_080656EC:
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsrs r0, r6, #6
	movs r2, #0x10
	str r2, [sp, #0x10]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _08065702
	movs r3, #0
_08065702:
	ldrh r1, [r5, #6]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r1, r0
	ldr r6, [sp, #0x10]
	cmp r6, r0
	ble _08065718
	subs r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_08065718:
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0
	ldr r3, [sp, #0x10]
	cmp r1, r3
	blt _08065738
	b _0806588E
_08065738:
	ldr r4, [sp, #0x1c]
	ldr r6, _080657F0 @ =gBackgroundsData
	adds r0, r4, r6
	ldrh r0, [r0, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r7, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x14]
	adds r0, r2, #1
	str r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08065854
	ldr r3, [sp]
	lsls r3, r3, #0xc
	mov r8, r3
	movs r4, #0xf
	ands r2, r4
	lsls r2, r2, #6
	mov sl, r2
	ldr r6, _080657F4 @ =0x083BE740
	mov sb, r6
	adds r6, r1, #0
_0806576C:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	adds r5, r1, r0
	movs r1, #0x1f
	ands r1, r7
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08065784
	ldr r5, _080657F8 @ =0x06000800
	add r5, r8
_08065784:
	movs r0, #0xf
	ands r0, r1
	lsls r1, r0, #1
	mov r2, sl
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r3, ip
	lsls r0, r3, #1
	ldr r4, [sp, #4]
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080657FC
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	movs r1, #1
	orrs r2, r1
	adds r1, r2, #0
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r5]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r1]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	add r2, sb
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	add r1, sb
	b _0806583A
	.align 2, 0
_080657E4: .4byte gCurrentRoomEntry
_080657E8: .4byte 0x0300122E
_080657EC: .4byte 0x0300122C
_080657F0: .4byte gBackgroundsData
_080657F4: .4byte 0x083BE740
_080657F8: .4byte 0x06000800
_080657FC:
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r1, r2, #0
	movs r0, #1
	orrs r2, r0
	adds r3, r2, #0
	ldr r0, _08065868 @ =gTilemapAndClipPointers
	ldr r4, [r0]
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r3, r3, #1
	adds r3, r3, r4
	ldrh r0, [r3]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	adds r1, r1, r4
_0806583A:
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	subs r6, #1
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r6, #0
	bne _0806576C
_08065854:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [sp, #0x10]
	cmp r1, r3
	bge _08065864
	b _08065738
_08065864:
	b _0806588E
	.align 2, 0
_08065868: .4byte gTilemapAndClipPointers
_0806586C:
	cmp r2, #0
	bne _0806588E
	ldr r4, [sp]
	lsls r1, r4, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	movs r2, #0
	movs r3, #0x40
	ldr r1, _080658A0 @ =0x000007FF
_08065880:
	strh r3, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r5, #2
	cmp r2, r1
	bls _08065880
_0806588E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080658A0: .4byte 0x000007FF

	thumb_func_start RleDecompress
RleDecompress: @ 0x080658A4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	cmp r0, #0
	bne _080658D2
	ldrb r5, [r1]
	adds r1, #1
	cmp r5, #0
	bne _080658BE
	movs r5, #0x80
	lsls r5, r5, #4
	b _080658EE
_080658BE:
	cmp r5, #1
	beq _080658C6
	cmp r5, #2
	bne _080658CC
_080658C6:
	movs r5, #0x80
	lsls r5, r5, #5
	b _080658EE
_080658CC:
	movs r5, #0x80
	lsls r5, r5, #6
	b _080658EE
_080658D2:
	cmp r0, #1
	beq _080658EE
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
_080658EE:
	adds r6, r2, #0
	movs r4, #0
_080658F2:
	ldrb r0, [r1]
	adds r1, #1
	cmp r0, #1
	bne _0806593C
	ldrb r3, [r1]
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_08065904:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0806592E
	movs r0, #0x7f
	ands r3, r0
	cmp r3, #0
	beq _08065920
_08065914:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065914
_08065920:
	adds r1, #1
	b _08065932
_08065924:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806592E:
	cmp r3, #0
	bne _08065924
_08065932:
	ldrb r3, [r1]
	adds r1, #1
	cmp r3, #0
	bne _08065904
	b _08065992
_0806593C:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_0806594E:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806597E
	ldr r0, _08065970 @ =0x00007FFF
	ands r3, r0
	cmp r3, #0
	beq _0806596C
_08065960:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065960
_0806596C:
	adds r1, #1
	b _08065982
	.align 2, 0
_08065970: .4byte 0x00007FFF
_08065974:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806597E:
	cmp r3, #0
	bne _08065974
_08065982:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	cmp r3, #0
	bne _0806594E
_08065992:
	adds r2, r6, #1
	cmp r4, #1
	ble _080658F2
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start unk_659a0
unk_659a0: @ 0x080659A0
	push {lr}
	ldr r0, _080659D4 @ =0x03000018
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659AE
	bl ColorFadingApplyMonochrome
_080659AE:
	bl MinimapUpdate
	ldr r0, _080659D8 @ =0x03004E44
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080659C2
	bl unk_65a1c
_080659C2:
	ldr r0, _080659DC @ =gElevatorDirection
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659CE
	bl unk_659e4
_080659CE:
	pop {r0}
	bx r0
	.align 2, 0
_080659D4: .4byte 0x03000018
_080659D8: .4byte 0x03004E44
_080659DC: .4byte gElevatorDirection

	thumb_func_start unk_659e0
unk_659e0: @ 0x080659E0
	bx lr
	.align 2, 0

	thumb_func_start unk_659e4
unk_659e4: @ 0x080659E4
	push {lr}
	ldr r0, _08065A00 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08065A14
	ldr r0, _08065A04 @ =gElevatorDirection
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065A08
	movs r0, #0x42
	bl SoundEventUpdateMusic
	b _08065A0E
	.align 2, 0
_08065A00: .4byte gSamusData
_08065A04: .4byte gElevatorDirection
_08065A08:
	movs r0, #0x43
	bl SoundEventUpdateMusic
_08065A0E:
	ldr r1, _08065A18 @ =gElevatorDirection
	movs r0, #0
	strb r0, [r1]
_08065A14:
	pop {r0}
	bx r0
	.align 2, 0
_08065A18: .4byte gElevatorDirection

	thumb_func_start unk_65a1c
unk_65a1c: @ 0x08065A1C
	push {r4, r5, lr}
	ldr r0, _08065A58 @ =gWrittenToBldalpha
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08065B04
	ldr r0, _08065A5C @ =gCurrentPowerBomb
	ldrb r2, [r0]
	cmp r2, #0
	beq _08065A68
	cmp r2, #1
	bne _08065B04
	ldr r2, _08065A60 @ =0x03004E44
	strb r1, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08065A64 @ =gIoRegisters
	ldrb r0, [r0, #5]
	adds r2, r0, #2
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r5]
	b _08065B04
	.align 2, 0
_08065A58: .4byte gWrittenToBldalpha
_08065A5C: .4byte gCurrentPowerBomb
_08065A60: .4byte 0x03004E44
_08065A64: .4byte gIoRegisters
_08065A68:
	ldr r1, _08065AE0 @ =0x03004E44
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x13
	bls _08065B04
	strb r2, [r4, #1]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r0, #1
	lsls r0, r0, #4
	ldrb r1, [r4]
	movs r3, #0xf
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #4
	ands r2, r3
	orrs r2, r1
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _08065ABE
	movs r0, #1
	ands r0, r2
	movs r2, #2
	cmp r0, #0
	beq _08065ABE
	movs r2, #1
_08065ABE:
	ldr r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065ACE
	rsbs r2, r2, #0
_08065ACE:
	ldr r0, _08065AE4 @ =gIoRegisters
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	adds r0, r0, r2
	cmp r0, #0
	bge _08065AE8
	movs r0, #0
	b _08065AEE
	.align 2, 0
_08065AE0: .4byte 0x03004E44
_08065AE4: .4byte gIoRegisters
_08065AE8:
	cmp r0, #0x10
	ble _08065AEE
	movs r0, #0x10
_08065AEE:
	subs r1, r1, r2
	cmp r1, #0
	bge _08065AF8
	movs r1, #0
	b _08065AFE
_08065AF8:
	cmp r1, #0x10
	ble _08065AFE
	movs r1, #0x10
_08065AFE:
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r5]
_08065B04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateAnimatedGraphicsAndPalette
UpdateAnimatedGraphicsAndPalette: @ 0x08065B0C
	push {lr}
	movs r1, #0
	ldr r0, _08065B50 @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	beq _08065B28
	cmp r0, #3
	beq _08065B28
	movs r1, #2
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_08065B28:
	ldr r0, _08065B54 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08065B32
	movs r1, #1
_08065B32:
	cmp r1, #0
	bne _08065B60
	ldr r1, _08065B58 @ =0x03000027
	ldrb r0, [r1]
	cmp r0, #0
	bne _08065B5C
	bl UpdateAnimatedGraphics
	bl UpdateTankAnimations
	bl UpdateAnimatedPalette
	bl UpdateHatchFlashingAnimation
	b _08065B60
	.align 2, 0
_08065B50: .4byte gSubGameMode1
_08065B54: .4byte gPreventMovementTimer
_08065B58: .4byte 0x03000027
_08065B5C:
	subs r0, #1
	strb r0, [r1]
_08065B60:
	pop {r0}
	bx r0

	thumb_func_start UpdateHatchFlashingAnimation
UpdateHatchFlashingAnimation: @ 0x08065B64
	push {lr}
	ldr r0, _08065C18 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065C14
	ldr r3, _08065C1C @ =gSecurityHatchLevel
	ldrb r0, [r3]
	cmp r0, #4
	bhi _08065BBE
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065BBE
	strb r2, [r1]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08065B9C
	strb r2, [r1, #1]
_08065B9C:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #1
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C28 @ =0x08408268
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C2C @ =0x0500002C
	str r0, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065BBE:
	ldr r0, _08065C30 @ =gCurrentNavigationRoom
	ldrb r2, [r0]
	cmp r2, #0
	bne _08065C14
	ldr r0, _08065C34 @ =0x03004E3B
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065C14
	ldr r0, _08065C38 @ =gDoorUnlockTimer
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08065C14
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065C14
	strb r2, [r1, #2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _08065BFC
	strb r2, [r1, #3]
_08065BFC:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C3C @ =0x08408336
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C40 @ =0x0500005A
	str r0, [r2, #4]
	ldr r0, _08065C44 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065C14:
	pop {r0}
	bx r0
	.align 2, 0
_08065C18: .4byte gSubGameMode1
_08065C1C: .4byte gSecurityHatchLevel
_08065C20: .4byte 0x03004FC4
_08065C24: .4byte 0x040000D4
_08065C28: .4byte 0x08408268
_08065C2C: .4byte 0x0500002C
_08065C30: .4byte gCurrentNavigationRoom
_08065C34: .4byte 0x03004E3B
_08065C38: .4byte gDoorUnlockTimer
_08065C3C: .4byte 0x08408336
_08065C40: .4byte 0x0500005A
_08065C44: .4byte 0x80000003

	thumb_func_start UpdateRoom
UpdateRoom: @ 0x08065C48
	push {lr}
	ldr r0, _08065CD0 @ =gDisableScrolling
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08065CE0
	ldr r0, _08065CD4 @ =gColorFading
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08065CE0
	bl UpdateBackgroundsPosition
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08065C82
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #6
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065C82
	cmp r1, #0x1c
	ble _08065C98
_08065C82:
	movs r0, #0x10
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
_08065C98:
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065CB6
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #7
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065CB6
	cmp r1, #0x1c
	ble _08065CEA
_08065CB6:
	movs r0, #0xb
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	b _08065CEA
	.align 2, 0
_08065CD0: .4byte gDisableScrolling
_08065CD4: .4byte gColorFading
_08065CD8: .4byte 0x03004FCC
_08065CDC: .4byte 0x03000124
_08065CE0:
	ldrb r0, [r2]
	cmp r0, #2
	bne _08065CEA
	bl UpdateBackgroundsPosition
_08065CEA:
	ldr r0, _08065D44 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065D1C
	bl CheckTouchingSpecialClipdata
	bl UpdateBrokenBlocks
	bl UpdateNonReformBlocksAnimation
	bl UpdateBombChains
	bl RoomEffectUpdateEventBased
	bl UpdateHatches
	ldr r0, _08065D48 @ =gRoomEventTrigger
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08065D1C
	bl EventCheckRoomEventTrigger
_08065D1C:
	bl HazeProcess
	cmp r0, #0
	beq _08065D3A
	bl HazeProcess
	ldr r2, _08065D4C @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08065D3A
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #7]
_08065D3A:
	bl PowerBombExplosionProcess
	pop {r0}
	bx r0
	.align 2, 0
_08065D44: .4byte gSubGameMode1
_08065D48: .4byte gRoomEventTrigger
_08065D4C: .4byte gHazeInfo

	thumb_func_start UpdateBackgroundsPosition
UpdateBackgroundsPosition: @ 0x08065D50
	push {r4, r5, r6, lr}
	bl ScreenShakeUpdateVertical
	adds r5, r0, #0
	bl ScreenShakeUpdateHorizontal
	adds r4, r0, #0
	ldr r0, _08065DC0 @ =gBg1XPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _08065DC4 @ =0x000001FF
	adds r3, r0, #0
	ands r1, r3
	ldr r0, _08065DC8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	ldr r2, _08065DCC @ =gBackgroundPositions
	adds r1, r1, r4
	strh r1, [r2, #4]
	adds r0, r0, r5
	strh r0, [r2, #6]
	ldr r0, _08065DD0 @ =0x0300122C
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2, #8]
	ldr r0, _08065DD4 @ =0x0300122E
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	ldr r0, _08065DD8 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065DE8
	ldr r0, _08065DDC @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065DE0 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	strh r0, [r2]
	ldr r0, _08065DE4 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	b _08065E08
	.align 2, 0
_08065DC0: .4byte gBg1XPosition
_08065DC4: .4byte 0x000001FF
_08065DC8: .4byte gBg1YPosition
_08065DCC: .4byte gBackgroundPositions
_08065DD0: .4byte 0x0300122C
_08065DD4: .4byte 0x0300122E
_08065DD8: .4byte 0x03000050
_08065DDC: .4byte 0x03001224
_08065DE0: .4byte 0x03004E20
_08065DE4: .4byte 0x03001226
_08065DE8:
	ldr r0, _08065E3C @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065E40 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2]
	ldr r0, _08065E44 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	adds r0, r0, r5
_08065E08:
	strh r0, [r2, #2]
	ldr r0, _08065E48 @ =0x03001230
	ldrh r0, [r0]
	ldr r1, _08065E4C @ =0x03004E18
	lsrs r0, r0, #2
	ldrh r1, [r1, #4]
	adds r3, r0, r1
	ldr r0, _08065E50 @ =0x000001FF
	adds r1, r0, #0
	ands r3, r1
	ldr r0, _08065E54 @ =0x03001232
	ldrh r0, [r0]
	lsrs r2, r0, #2
	ands r2, r1
	ldr r0, _08065E58 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065E60
	ldr r0, _08065E5C @ =gBackgroundPositions
	strh r3, [r0, #0xc]
	strh r2, [r0, #0xe]
	b _08065E6E
	.align 2, 0
_08065E3C: .4byte 0x03001224
_08065E40: .4byte 0x03004E20
_08065E44: .4byte 0x03001226
_08065E48: .4byte 0x03001230
_08065E4C: .4byte 0x03004E18
_08065E50: .4byte 0x000001FF
_08065E54: .4byte 0x03001232
_08065E58: .4byte 0x03000050
_08065E5C: .4byte gBackgroundPositions
_08065E60:
	ldr r0, _08065E74 @ =gBackgroundPositions
	asrs r1, r4, #1
	adds r1, r3, r1
	strh r1, [r0, #0xc]
	asrs r1, r5, #1
	adds r1, r2, r1
	strh r1, [r0, #0xe]
_08065E6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065E74: .4byte gBackgroundPositions

	thumb_func_start UpdateVerticalTilemap
UpdateVerticalTilemap: @ 0x08065E78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	ldr r2, _08065ED8 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _08065EDC @ =0x03005138
	str r0, [sp, #0xc]
	movs r5, #0
_08065EAA:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r5, #1
	str r1, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #0xa0
	str r2, [sp, #0x18]
	cmp r0, #0
	bne _08065ECC
	bl _08066C46
_08065ECC:
	cmp r5, #0
	bne _08065EE8
	ldr r0, _08065EE0 @ =0x03001226
	ldrh r1, [r0]
	ldr r0, _08065EE4 @ =0x03001224
	b _08065F02
	.align 2, 0
_08065ED8: .4byte gCurrentRoomEntry
_08065EDC: .4byte 0x03005138
_08065EE0: .4byte 0x03001226
_08065EE4: .4byte 0x03001224
_08065EE8:
	cmp r5, #1
	bne _08065EFC
	ldr r0, _08065EF4 @ =gBg1YPosition
	ldrh r1, [r0]
	ldr r0, _08065EF8 @ =gBg1XPosition
	b _08065F02
	.align 2, 0
_08065EF4: .4byte gBg1YPosition
_08065EF8: .4byte gBg1XPosition
_08065EFC:
	ldr r0, _08065FE4 @ =0x0300122E
	ldrh r1, [r0]
	ldr r0, _08065FE8 @ =0x0300122C
_08065F02:
	ldrh r4, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	adds r0, r5, #1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0xc]
	adds r1, #0xa0
	str r1, [sp, #0x18]
	cmp r3, #0
	bge _08065F26
	bl _08066C46
_08065F26:
	ldr r1, _08065FEC @ =gBackgroundsData
	lsls r0, r5, #3
	adds r5, r0, r1
	ldrh r0, [r5, #6]
	cmp r3, r0
	ble _08065F36
	bl _08066C46
_08065F36:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08065F48
	movs r2, #0
_08065F48:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	movs r1, #0x13
	mov sb, r1
	ldrh r0, [r5, #4]
	cmp r0, #0x13
	bge _08065F58
	mov sb, r0
_08065F58:
	mov r2, sb
	lsls r2, r2, #2
	mov sb, r2
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	ldrh r0, [r5, #4]
	ldr r2, [sp, #0xc]
	ldrh r1, [r2, #4]
	muls r0, r1, r0
	ldrh r1, [r2, #2]
	adds r6, r0, r1
	movs r4, #0
	cmp r4, sb
	blt _08065F78
	bl _08066C46
_08065F78:
	mov r8, r5
	movs r2, #0x80
	lsls r2, r2, #8
	mov sl, r2
	ldr r0, _08065FF0 @ =0x083BE740
	mov ip, r0
	ldr r7, _08065FF4 @ =gTilemapAndClipPointers
	ldr r1, [sp, #0xc]
	adds r1, #6
	str r1, [sp, #0x10]
_08065F8C:
	mov r2, r8
	ldr r0, [r2]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08065FFC
	ldr r0, _08065FF8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066046
	.align 2, 0
_08065FE4: .4byte 0x0300122E
_08065FE8: .4byte 0x0300122C
_08065FEC: .4byte gBackgroundsData
_08065FF0: .4byte 0x083BE740
_08065FF4: .4byte gTilemapAndClipPointers
_08065FF8: .4byte 0x00007FFF
_08065FFC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066046:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	adds r6, #1
	cmp r4, sb
	blt _0806605A
	bl _08066C46
_0806605A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080660B4
	ldr r0, _080660B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080660F6
	.align 2, 0
_080660B0: .4byte 0x00007FFF
_080660B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080660F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066106
	bl _08066C46
_08066106:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066160
	ldr r0, _0806615C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080661A2
	.align 2, 0
_0806615C: .4byte 0x00007FFF
_08066160:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080661A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080661B2
	bl _08066C46
_080661B2:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806620C
	ldr r0, _08066208 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806624E
	.align 2, 0
_08066208: .4byte 0x00007FFF
_0806620C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806624E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806625E
	bl _08066C46
_0806625E:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080662B8
	ldr r0, _080662B4 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080662FA
	.align 2, 0
_080662B4: .4byte 0x00007FFF
_080662B8:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080662FA:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806630A
	bl _08066C46
_0806630A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066364
	ldr r0, _08066360 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080663A6
	.align 2, 0
_08066360: .4byte 0x00007FFF
_08066364:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080663A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080663B6
	bl _08066C46
_080663B6:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066410
	ldr r0, _0806640C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066452
	.align 2, 0
_0806640C: .4byte 0x00007FFF
_08066410:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066452:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066462
	bl _08066C46
_08066462:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080664BC
	ldr r0, _080664B8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080664FE
	.align 2, 0
_080664B8: .4byte 0x00007FFF
_080664BC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080664FE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806650C
	b _08066C46
_0806650C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066564
	ldr r0, _08066560 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080665A6
	.align 2, 0
_08066560: .4byte 0x00007FFF
_08066564:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080665A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080665B4
	b _08066C46
_080665B4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806660C
	ldr r0, _08066608 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806664E
	.align 2, 0
_08066608: .4byte 0x00007FFF
_0806660C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806664E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806665C
	b _08066C46
_0806665C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080666B4
	ldr r0, _080666B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080666F6
	.align 2, 0
_080666B0: .4byte 0x00007FFF
_080666B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080666F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066704
	b _08066C46
_08066704:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806675C
	ldr r0, _08066758 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806679E
	.align 2, 0
_08066758: .4byte 0x00007FFF
_0806675C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806679E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080667AC
	b _08066C46
_080667AC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066804
	ldr r0, _08066800 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066846
	.align 2, 0
_08066800: .4byte 0x00007FFF
_08066804:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066846:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066854
	b _08066C46
_08066854:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080668AC
	ldr r0, _080668A8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080668EE
	.align 2, 0
_080668A8: .4byte 0x00007FFF
_080668AC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080668EE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080668FC
	b _08066C46
_080668FC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066954
	ldr r0, _08066950 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066996
	.align 2, 0
_08066950: .4byte 0x00007FFF
_08066954:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066996:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080669A4
	b _08066C46
_080669A4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080669FC
	ldr r0, _080669F8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066A3E
	.align 2, 0
_080669F8: .4byte 0x00007FFF
_080669FC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066A3E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066A4C
	b _08066C46
_08066A4C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066AA4
	ldr r0, _08066AA0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066AE6
	.align 2, 0
_08066AA0: .4byte 0x00007FFF
_08066AA4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066AE6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066AF4
	b _08066C46
_08066AF4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066B4C
	ldr r0, _08066B48 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066B8E
	.align 2, 0
_08066B48: .4byte 0x00007FFF
_08066B4C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066B8E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066BF4
	ldr r0, _08066BF0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066C36
	.align 2, 0
_08066BF0: .4byte 0x00007FFF
_08066BF4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066C36:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	bl _08065F8C
_08066C46:
	ldr r5, [sp, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	cmp r5, #2
	bgt _08066C54
	bl _08065EAA
_08066C54:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendVerticalTilemap
SendVerticalTilemap: @ 0x08066C64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08067018 @ =0x03005138
	str r0, [sp]
	movs r0, #0
_08066C76:
	ldr r1, [sp]
	ldrb r1, [r1]
	mov ip, r1
	adds r2, r0, #1
	str r2, [sp, #8]
	ldr r1, [sp]
	adds r1, #0xa0
	str r1, [sp, #4]
	mov r2, ip
	cmp r2, #0
	bne _08066C8E
	b _0806728C
_08066C8E:
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r7, r0, r1
	ldr r2, [sp]
	ldrh r1, [r2, #4]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #7
	adds r7, r7, r0
	ldrh r5, [r2, #2]
	movs r4, #0
	cmp r4, ip
	blt _08066CAC
	b _0806728C
_08066CAC:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08066CB2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066CC6
	add r1, r8
_08066CC6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	ldr r2, [sp]
	adds r2, #6
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r3, r1, #0
	adds r3, #0x40
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r3]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	adds r6, r2, #0
	cmp r4, ip
	blt _08066D06
	b _0806728C
_08066D06:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D1A
	add r1, r8
_08066D1A:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066D54
	b _0806728C
_08066D54:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D68
	add r1, r8
_08066D68:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DA2
	b _0806728C
_08066DA2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066DB6
	add r1, r8
_08066DB6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DF0
	b _0806728C
_08066DF0:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E04
	add r1, r8
_08066E04:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E3E
	b _0806728C
_08066E3E:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E52
	add r1, r8
_08066E52:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E8C
	b _0806728C
_08066E8C:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EA0
	add r1, r8
_08066EA0:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066EDA
	b _0806728C
_08066EDA:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EEE
	add r1, r8
_08066EEE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F28
	b _0806728C
_08066F28:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066F3C
	add r1, r8
_08066F3C:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F76
	b _0806728C
_08066F76:
	movs r0, #0xf
	mov sl, r0
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	movs r2, #0x10
	mov sb, r2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08066F90
	add r1, r8
_08066F90:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066FCA
	b _0806728C
_08066FCA:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08066FDE
	add r1, r8
_08066FDE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r3, r6, #0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	b _0806701C
	.align 2, 0
_08067018: .4byte 0x03005138
_0806701C:
	cmp r4, ip
	blt _08067022
	b _0806728C
_08067022:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067036
	add r1, r8
_08067036:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08067070
	b _0806728C
_08067070:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067084
	add r1, r8
_08067084:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _080670BE
	b _0806728C
_080670BE:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080670D2
	add r1, r8
_080670D2:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806710C
	b _0806728C
_0806710C:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067120
	add r1, r8
_08067120:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806715A
	b _0806728C
_0806715A:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0806716E
	add r1, r8
_0806716E:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080671BA
	add r1, r8
_080671BA:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067206
	add r1, r8
_08067206:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067252
	add r1, r8
_08067252:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	b _08066CB2
_0806728C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	str r1, [sp]
	cmp r0, #2
	bgt _08067298
	b _08066C76
_08067298:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UpdateHorizontalTilemap
UpdateHorizontalTilemap: @ 0x080672A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	ldr r2, _08067308 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _0806730C @ =0x03004FD0
	str r0, [sp, #0xc]
	movs r3, #0
_080672DA:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r2, [sp, #0xc]
	adds r2, #0x78
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080672FC
	bl _08067D86
_080672FC:
	cmp r3, #0
	bne _08067318
	ldr r0, _08067310 @ =0x03001226
	ldrh r4, [r0]
	ldr r0, _08067314 @ =0x03001224
	b _08067332
	.align 2, 0
_08067308: .4byte gCurrentRoomEntry
_0806730C: .4byte 0x03004FD0
_08067310: .4byte 0x03001226
_08067314: .4byte 0x03001224
_08067318:
	cmp r3, #1
	bne _0806732C
	ldr r0, _08067324 @ =gBg1YPosition
	ldrh r4, [r0]
	ldr r0, _08067328 @ =gBg1XPosition
	b _08067332
	.align 2, 0
_08067324: .4byte gBg1YPosition
_08067328: .4byte gBg1XPosition
_0806732C:
	ldr r0, _08067414 @ =0x0300122E
	ldrh r4, [r0]
	ldr r0, _08067418 @ =0x0300122C
_08067332:
	ldrh r1, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r1, [sp, #0xc]
	adds r1, #0x78
	str r1, [sp, #0x1c]
	cmp r0, #0
	bge _08067356
	bl _08067D86
_08067356:
	ldr r7, _0806741C @ =gBackgroundsData
	lsls r5, r3, #3
	adds r3, r5, r7
	ldrh r1, [r3, #4]
	cmp r0, r1
	ble _08067366
	bl _08067D86
_08067366:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08067378
	movs r2, #0
_08067378:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	movs r2, #0xe
	mov sb, r2
	ldrh r0, [r3, #6]
	cmp r0, #0xe
	bge _08067388
	mov sb, r0
_08067388:
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldrh r0, [r3, #4]
	ldrh r1, [r1, #4]
	muls r0, r1, r0
	ldr r2, [sp, #0xc]
	ldrh r2, [r2, #2]
	adds r6, r0, r2
	movs r4, #0
	cmp r4, sb
	blt _080673A8
	bl _08067D86
_080673A8:
	mov r8, r5
	str r3, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #8
	mov sl, r0
	ldr r1, _08067420 @ =0x083BE740
	mov ip, r1
	ldr r7, _08067424 @ =gTilemapAndClipPointers
	ldr r2, [sp, #0xc]
	adds r2, #6
	str r2, [sp, #0x14]
_080673BE:
	ldr r1, [sp, #0x10]
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806742C
	ldr r0, _08067428 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067476
	.align 2, 0
_08067414: .4byte 0x0300122E
_08067418: .4byte 0x0300122C
_0806741C: .4byte gBackgroundsData
_08067420: .4byte 0x083BE740
_08067424: .4byte gTilemapAndClipPointers
_08067428: .4byte 0x00007FFF
_0806742C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067476:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	ldr r1, _080674E4 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067490
	bl _08067D86
_08067490:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080674EC
	ldr r0, _080674E8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806752E
	.align 2, 0
_080674E4: .4byte gBackgroundsData
_080674E8: .4byte 0x00007FFF
_080674EC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806752E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067598 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067544
	bl _08067D86
_08067544:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080675A0
	ldr r0, _0806759C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080675E2
	.align 2, 0
_08067598: .4byte gBackgroundsData
_0806759C: .4byte 0x00007FFF
_080675A0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080675E2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067648 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080675F6
	b _08067D86
_080675F6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067650
	ldr r0, _0806764C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067692
	.align 2, 0
_08067648: .4byte gBackgroundsData
_0806764C: .4byte 0x00007FFF
_08067650:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067692:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080676F8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080676A6
	b _08067D86
_080676A6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067700
	ldr r0, _080676FC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067742
	.align 2, 0
_080676F8: .4byte gBackgroundsData
_080676FC: .4byte 0x00007FFF
_08067700:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067742:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080677A8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067756
	b _08067D86
_08067756:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080677B0
	ldr r0, _080677AC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080677F2
	.align 2, 0
_080677A8: .4byte gBackgroundsData
_080677AC: .4byte 0x00007FFF
_080677B0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080677F2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067858 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067806
	b _08067D86
_08067806:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067860
	ldr r0, _0806785C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080678A2
	.align 2, 0
_08067858: .4byte gBackgroundsData
_0806785C: .4byte 0x00007FFF
_08067860:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080678A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067908 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080678B6
	b _08067D86
_080678B6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067910
	ldr r0, _0806790C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067952
	.align 2, 0
_08067908: .4byte gBackgroundsData
_0806790C: .4byte 0x00007FFF
_08067910:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067952:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080679B8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067966
	b _08067D86
_08067966:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080679C0
	ldr r0, _080679BC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067A02
	.align 2, 0
_080679B8: .4byte gBackgroundsData
_080679BC: .4byte 0x00007FFF
_080679C0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067A02:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067A68 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067A16
	b _08067D86
_08067A16:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067A70
	ldr r0, _08067A6C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067AB2
	.align 2, 0
_08067A68: .4byte gBackgroundsData
_08067A6C: .4byte 0x00007FFF
_08067A70:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067AB2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067B18 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067AC6
	b _08067D86
_08067AC6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067B20
	ldr r0, _08067B1C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067B62
	.align 2, 0
_08067B18: .4byte gBackgroundsData
_08067B1C: .4byte 0x00007FFF
_08067B20:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067B62:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067BC8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067B76
	b _08067D86
_08067B76:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067BD0
	ldr r0, _08067BCC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067C12
	.align 2, 0
_08067BC8: .4byte gBackgroundsData
_08067BCC: .4byte 0x00007FFF
_08067BD0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067C12:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067C78 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067C26
	b _08067D86
_08067C26:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067C80
	ldr r0, _08067C7C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067CC2
	.align 2, 0
_08067C78: .4byte gBackgroundsData
_08067C7C: .4byte 0x00007FFF
_08067C80:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067CC2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067D28 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067D30
	ldr r0, _08067D2C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067D72
	.align 2, 0
_08067D28: .4byte gBackgroundsData
_08067D2C: .4byte 0x00007FFF
_08067D30:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067D72:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	bl _080673BE
_08067D86:
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0xc]
	cmp r3, #2
	bgt _08067D94
	bl _080672DA
_08067D94:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendHorizontalTilemap
SendHorizontalTilemap: @ 0x08067DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _080680B8 @ =0x03004FD0
	movs r0, #0
_08067DB0:
	ldrb r7, [r1]
	adds r2, r0, #1
	mov sb, r2
	movs r2, #0x78
	adds r2, r2, r1
	mov r8, r2
	cmp r7, #0
	bne _08067DC2
	b _080680A2
_08067DC2:
	lsls r3, r0, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r6, r3, r0
	ldrh r2, [r1, #2]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08067DD8
	ldr r0, _080680BC @ =0x06000800
	adds r6, r3, r0
_08067DD8:
	movs r0, #0xf
	ands r2, r0
	lsls r0, r2, #2
	adds r6, r6, r0
	ldrh r4, [r1, #4]
	movs r5, #0
	cmp r5, r7
	blt _08067DEA
	b _080680A2
_08067DEA:
	movs r2, #0xf
	mov ip, r2
	adds r3, r1, #6
_08067DF0:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E22
	b _080680A2
_08067E22:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E54
	b _080680A2
_08067E54:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E86
	b _080680A2
_08067E86:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EB8
	b _080680A2
_08067EB8:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EEA
	b _080680A2
_08067EEA:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F1C
	b _080680A2
_08067F1C:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F4E
	b _080680A2
_08067F4E:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F80
	b _080680A2
_08067F80:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	b _08067DF0
_080680A2:
	mov r0, sb
	mov r1, r8
	cmp r0, #2
	bgt _080680AC
	b _08067DB0
_080680AC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080680B8: .4byte 0x03004FD0
_080680BC: .4byte 0x06000800

	thumb_func_start WaitForDma3
WaitForDma3: @ 0x080680C0
	push {lr}
	ldr r2, _080680DC @ =0x040000D4
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	cmp r0, #0
	bge _080680D6
_080680CE:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _080680CE
_080680D6:
	pop {r0}
	bx r0
	.align 2, 0
_080680DC: .4byte 0x040000D4
