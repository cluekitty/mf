    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SpriteUtilUpdateSubSpriteData1Animation
SpriteUtilUpdateSubSpriteData1Animation: @ 0x08035ACC
	push {lr}
	ldr r2, _08035B04 @ =gSubSpriteData1
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	ldrh r1, [r2, #4]
	ldr r3, [r2]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _08035B00
	movs r0, #1
	strb r0, [r2, #6]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08035B00
	strh r0, [r2, #4]
_08035B00:
	pop {r0}
	bx r0
	.align 2, 0
_08035B04: .4byte gSubSpriteData1

	thumb_func_start SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position: @ 0x08035B08
	push {r4, lr}
	ldr r3, _08035B44 @ =gSubSpriteData1
	ldrh r0, [r3, #4]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r2, _08035B48 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035B44: .4byte gSubSpriteData1
_08035B48: .4byte gCurrentSprite

	thumb_func_start BoxSyncSubSprites
BoxSyncSubSprites: @ 0x08035B4C
	push {r4, lr}
	ldr r4, _08035BA8 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08035BAC @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08035BB0 @ =0x0879AFE0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _08035B7E
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_08035B7E:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035BA8: .4byte gSubSpriteData1
_08035BAC: .4byte gCurrentSprite
_08035BB0: .4byte 0x0879AFE0

	thumb_func_start BoxXMovement
BoxXMovement: @ 0x08035BB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov sl, r7
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov sb, r5
	movs r0, #0
	mov r8, r0
	ldr r6, _08035C00 @ =gCurrentSprite
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08035C12
	ldr r4, _08035C04 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08035C08 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035C0C
	adds r0, r6, #0
	adds r0, #0x24
	strb r5, [r0]
	movs r1, #1
	mov r8, r1
	b _08035C48
	.align 2, 0
_08035C00: .4byte gCurrentSprite
_08035C04: .4byte gSubSpriteData1
_08035C08: .4byte gPreviousCollisionCheck
_08035C0C:
	ldrh r0, [r4, #0xa]
	adds r0, r7, r0
	b _08035C46
_08035C12:
	ldr r4, _08035C38 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	subs r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08035C3C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035C40
	adds r0, r6, #0
	adds r0, #0x24
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	mov r8, r0
	b _08035C48
	.align 2, 0
_08035C38: .4byte gSubSpriteData1
_08035C3C: .4byte gPreviousCollisionCheck
_08035C40:
	ldrh r0, [r4, #0xa]
	mov r1, sl
	subs r0, r0, r1
_08035C46:
	strh r0, [r4, #0xa]
_08035C48:
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start BoxInit
BoxInit: @ 0x08035C58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl EventCheckOn_BoxRumble
	adds r1, r0, #0
	cmp r1, #0
	bne _08035C70
	ldr r0, _08035C6C @ =gCurrentSprite
	strh r1, [r0]
	b _08035E02
	.align 2, 0
_08035C6C: .4byte gCurrentSprite
_08035C70:
	ldr r7, _08035E0C @ =gCurrentSprite
	adds r0, r7, #0
	adds r0, #0x25
	movs r5, #0
	strb r5, [r0]
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r3, r1, #0
	movs r6, #0
	orrs r3, r0
	strh r3, [r7]
	adds r0, r7, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08035E10 @ =0x0000FFD8
	strh r0, [r7, #0xa]
	movs r0, #0x40
	strh r0, [r7, #0xc]
	ldr r0, _08035E14 @ =0x0000FFD0
	strh r0, [r7, #0xe]
	movs r0, #0x30
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #7
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x22
	movs r0, #0xc
	strb r0, [r2]
	adds r2, #0x13
	movs r0, #2
	strb r0, [r2]
	strb r1, [r7, #0x1e]
	ldr r2, _08035E18 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	adds r2, r7, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08035E1C @ =0x08347BD8
	str r0, [r7, #0x18]
	strb r6, [r7, #0x1c]
	strh r5, [r7, #0x16]
	ldr r4, _08035E20 @ =gSubSpriteData1
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	ldr r0, _08035E24 @ =0x08342DF0
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	strb r6, [r4, #0xe]
	adds r0, r7, #0
	adds r0, #0x2f
	strb r6, [r0]
	ldr r0, _08035E28 @ =0x0000FDFF
	ands r3, r0
	strh r3, [r7]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #8
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #9
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0xa
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0xb
	bl SpriteSpawnSecondary
_08035E02:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035E0C: .4byte gCurrentSprite
_08035E10: .4byte 0x0000FFD8
_08035E14: .4byte 0x0000FFD0
_08035E18: .4byte sPrimarySpriteStats
_08035E1C: .4byte 0x08347BD8
_08035E20: .4byte gSubSpriteData1
_08035E24: .4byte 0x08342DF0
_08035E28: .4byte 0x0000FDFF

	thumb_func_start BoxWaitingToEmergeInit
BoxWaitingToEmergeInit: @ 0x08035E2C
	push {r4, r5, lr}
	ldr r1, _08035E74 @ =gSubSpriteData1
	ldr r0, _08035E78 @ =0x08342F38
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r4, #0
	strh r0, [r1, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	ldr r5, _08035E7C @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2e
	strb r4, [r0]
	ldr r0, _08035E80 @ =0x0000026D
	bl SoundPlay_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	adds r0, r5, #0
	adds r0, #0x31
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035E74: .4byte gSubSpriteData1
_08035E78: .4byte 0x08342F38
_08035E7C: .4byte gCurrentSprite
_08035E80: .4byte 0x0000026D

	thumb_func_start BoxWaitingToEmerge
BoxWaitingToEmerge: @ 0x08035E84
	push {r4, r5, r6, lr}
	ldr r6, _08035EC8 @ =gCurrentSprite
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _08035EAC
	ldr r0, _08035ECC @ =0x0000026D
	bl SoundPlay_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0
	strb r0, [r4]
_08035EAC:
	ldrh r5, [r6, #2]
	ldrh r4, [r6, #4]
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x24
	bls _08035EBC
	b _08035FC2
_08035EBC:
	lsls r0, r0, #2
	ldr r1, _08035ED0 @ =_08035ED4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035EC8: .4byte gCurrentSprite
_08035ECC: .4byte 0x0000026D
_08035ED0: .4byte _08035ED4
_08035ED4: @ jump table
	.4byte _08035F68 @ case 0
	.4byte _08035FC2 @ case 1
	.4byte _08035FC2 @ case 2
	.4byte _08035FC2 @ case 3
	.4byte _08035F6E @ case 4
	.4byte _08035FC2 @ case 5
	.4byte _08035FC2 @ case 6
	.4byte _08035FC2 @ case 7
	.4byte _08035F74 @ case 8
	.4byte _08035FC2 @ case 9
	.4byte _08035FC2 @ case 10
	.4byte _08035FC2 @ case 11
	.4byte _08035FC2 @ case 12
	.4byte _08035FC2 @ case 13
	.4byte _08035FC2 @ case 14
	.4byte _08035FC2 @ case 15
	.4byte _08035F7E @ case 16
	.4byte _08035FC2 @ case 17
	.4byte _08035FC2 @ case 18
	.4byte _08035FC2 @ case 19
	.4byte _08035F88 @ case 20
	.4byte _08035FC2 @ case 21
	.4byte _08035FC2 @ case 22
	.4byte _08035FC2 @ case 23
	.4byte _08035F98 @ case 24
	.4byte _08035FC2 @ case 25
	.4byte _08035FC2 @ case 26
	.4byte _08035FC2 @ case 27
	.4byte _08035FA2 @ case 28
	.4byte _08035FC2 @ case 29
	.4byte _08035FC2 @ case 30
	.4byte _08035FC2 @ case 31
	.4byte _08035FAA @ case 32
	.4byte _08035FC2 @ case 33
	.4byte _08035FC2 @ case 34
	.4byte _08035FC2 @ case 35
	.4byte _08035FBA @ case 36
_08035F68:
	adds r0, r5, #0
	adds r1, r4, #0
	b _08035F90
_08035F6E:
	adds r0, r5, #0
	adds r1, r4, #0
	b _08035FB2
_08035F74:
	adds r0, r5, #0
	subs r0, #0x1c
	adds r1, r4, #0
	adds r1, #0x1c
	b _08035F90
_08035F7E:
	adds r0, r5, #0
	adds r0, #0x20
	adds r1, r4, #0
	subs r1, #0x20
	b _08035FB2
_08035F88:
	adds r0, r5, #0
	subs r0, #0x1c
	adds r1, r4, #0
	subs r1, #0x2e
_08035F90:
	movs r2, #0x2e
	bl ParticleSet
	b _08035FC2
_08035F98:
	adds r0, r5, #0
	adds r0, #0x40
	adds r1, r4, #0
	subs r1, #0x40
	b _08035FB2
_08035FA2:
	adds r0, r5, #0
	adds r0, #0x58
	adds r1, r4, #0
	b _08035FB2
_08035FAA:
	adds r0, r5, #0
	subs r0, #0x5a
	adds r1, r4, #0
	adds r1, #0x10
_08035FB2:
	movs r2, #0x2f
	bl ParticleSet
	b _08035FC2
_08035FBA:
	ldr r0, _08036000 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #0xff
	strb r1, [r0]
_08035FC2:
	ldr r6, _08036000 @ =gCurrentSprite
	adds r1, r6, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _08035FF8
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0x41
	strb r1, [r0]
	adds r1, r4, #0
	subs r1, #0xa0
	adds r0, r5, #0
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x1b
	movs r1, #7
	bl PlayMusic
_08035FF8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036000: .4byte gCurrentSprite

	thumb_func_start BoxFirstJumpInit
BoxFirstJumpInit: @ 0x08036004
	push {lr}
	ldr r1, _08036038 @ =gSubSpriteData1
	ldr r0, _0803603C @ =0x08342D98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08036040 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _08036044 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08036048 @ =0x00000265
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036038: .4byte gSubSpriteData1
_0803603C: .4byte 0x08342D98
_08036040: .4byte gCurrentSprite
_08036044: .4byte 0x0000FDFF
_08036048: .4byte 0x00000265

	thumb_func_start BoxFirstJump
BoxFirstJump: @ 0x0803604C
	push {r4, r5, lr}
	ldr r4, _08036090 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _08036094 @ =0x083420B4
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08036098 @ =0x00007FFF
	cmp r1, r0
	bne _080360A4
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	ldr r1, _0803609C @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r1, #0xb4
	movs r2, #0x35
	bl ParticleSet
	ldr r0, _080360A0 @ =0x00000266
	bl SoundPlay
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	b _080360B8
	.align 2, 0
_08036090: .4byte gCurrentSprite
_08036094: .4byte 0x083420B4
_08036098: .4byte 0x00007FFF
_0803609C: .4byte gSubSpriteData1
_080360A0: .4byte 0x00000266
_080360A4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _080360C0 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r3
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	subs r0, #0xa
	strh r0, [r1, #0xa]
_080360B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080360C0: .4byte gSubSpriteData1

	thumb_func_start BoxWaitingToRunInit
BoxWaitingToRunInit: @ 0x080360C4
	push {lr}
	ldr r1, _080360EC @ =gSubSpriteData1
	ldr r0, _080360F0 @ =0x08342F60
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _080360F4 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x18
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, _080360F8 @ =0x0000026A
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080360EC: .4byte gSubSpriteData1
_080360F0: .4byte 0x08342F60
_080360F4: .4byte gCurrentSprite
_080360F8: .4byte 0x0000026A

	thumb_func_start BoxWaitingToRun
BoxWaitingToRun: @ 0x080360FC
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036120
	ldr r1, _08036138 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08036120
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_08036120:
	ldr r1, _08036138 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036132
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08036132:
	pop {r0}
	bx r0
	.align 2, 0
_08036138: .4byte gCurrentSprite

	thumb_func_start BoxSlowRunningInit
BoxSlowRunningInit: @ 0x0803613C
	push {lr}
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r0, _08036158 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036164
	ldr r1, _0803615C @ =gSubSpriteData1
	ldr r0, _08036160 @ =0x08342ED8
	b _08036168
	.align 2, 0
_08036158: .4byte gCurrentSprite
_0803615C: .4byte gSubSpriteData1
_08036160: .4byte 0x08342ED8
_08036164:
	ldr r1, _08036184 @ =gSubSpriteData1
	ldr r0, _08036188 @ =0x08342E48
_08036168:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _0803618C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x1a
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08036184: .4byte gSubSpriteData1
_08036188: .4byte 0x08342E48
_0803618C: .4byte gCurrentSprite

	thumb_func_start BoxSlowRun
BoxSlowRun: @ 0x08036190
	push {r4, r5, lr}
	ldr r0, _080361F0 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _080361F4 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _080361F8 @ =0x00010003
	cmp r0, r1
	bne _080361A6
	ldr r0, _080361FC @ =0x00000262
	bl SoundPlay
_080361A6:
	ldr r5, _08036200 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	movs r1, #0x37
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080361EA
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _080361D8
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _080361D8
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
_080361D8:
	ldr r1, _08036200 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080361EA
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_080361EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080361F0: .4byte gSubSpriteData1
_080361F4: .4byte 0x00FFFFFF
_080361F8: .4byte 0x00010003
_080361FC: .4byte 0x00000262
_08036200: .4byte gCurrentSprite

	thumb_func_start BoxFastRunInit
BoxFastRunInit: @ 0x08036204
	push {lr}
	ldr r2, _0803621C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036228
	ldr r1, _08036220 @ =gSubSpriteData1
	ldr r0, _08036224 @ =0x08342F08
	b _0803622C
	.align 2, 0
_0803621C: .4byte gCurrentSprite
_08036220: .4byte gSubSpriteData1
_08036224: .4byte 0x08342F08
_08036228:
	ldr r1, _08036248 @ =gSubSpriteData1
	ldr r0, _0803624C @ =0x08342E78
_0803622C:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0xa
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08036248: .4byte gSubSpriteData1
_0803624C: .4byte 0x08342E78

	thumb_func_start BoxFastRun
BoxFastRun: @ 0x08036250
	push {r4, lr}
	ldr r4, _08036284 @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _08036288 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0803628C @ =0x00010003
	cmp r0, r1
	bne _08036266
	ldr r0, _08036290 @ =0x00000262
	bl SoundPlay
_08036266:
	movs r0, #8
	movs r1, #0x37
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080362CC
	ldr r2, _08036294 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036298
	subs r0, #1
	b _080362DC
	.align 2, 0
_08036284: .4byte gSubSpriteData1
_08036288: .4byte 0x00FFFFFF
_0803628C: .4byte 0x00010003
_08036290: .4byte 0x00000262
_08036294: .4byte gCurrentSprite
_08036298:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080362B8
	ldrh r0, [r4, #0xa]
	subs r0, #0xc8
	ldr r1, _080362B4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	ble _080362CC
	b _080362C4
	.align 2, 0
_080362B4: .4byte gSamusData
_080362B8:
	ldrh r0, [r4, #0xa]
	adds r0, #0xc8
	ldr r1, _080362E4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bge _080362CC
_080362C4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_080362CC:
	ldr r1, _080362E8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080362DE
	adds r1, #0x24
	movs r0, #0x3b
_080362DC:
	strb r0, [r1]
_080362DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080362E4: .4byte gSamusData
_080362E8: .4byte gCurrentSprite

	thumb_func_start BoxSkiddingInit
BoxSkiddingInit: @ 0x080362EC
	push {lr}
	ldr r2, _08036304 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036310
	ldr r1, _08036308 @ =gSubSpriteData1
	ldr r0, _0803630C @ =0x08342FC8
	b _08036314
	.align 2, 0
_08036304: .4byte gCurrentSprite
_08036308: .4byte gSubSpriteData1
_0803630C: .4byte 0x08342FC8
_08036310:
	ldr r1, _08036334 @ =gSubSpriteData1
	ldr r0, _08036338 @ =0x08342FA8
_08036314:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0803633C @ =0x00000263
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036334: .4byte gSubSpriteData1
_08036338: .4byte 0x08342FA8
_0803633C: .4byte 0x00000263

	thumb_func_start BoxSkidding
BoxSkidding: @ 0x08036340
	push {r4, r5, lr}
	ldr r4, _0803638C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsrs r0, r0, #2
	movs r1, #0x1f
	cmp r0, #5
	bls _08036354
	movs r1, #0x37
_08036354:
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036384
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036372
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
_08036372:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036384
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08036384:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803638C: .4byte gCurrentSprite

	thumb_func_start BoxStopSkiddingInit
BoxStopSkiddingInit: @ 0x08036390
	push {lr}
	ldr r2, _080363A8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080363B4
	ldr r1, _080363AC @ =gSubSpriteData1
	ldr r0, _080363B0 @ =0x08342FD8
	b _080363B8
	.align 2, 0
_080363A8: .4byte gCurrentSprite
_080363AC: .4byte gSubSpriteData1
_080363B0: .4byte 0x08342FD8
_080363B4:
	ldr r1, _080363CC @ =gSubSpriteData1
	ldr r0, _080363D0 @ =0x08342FB8
_080363B8:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080363CC: .4byte gSubSpriteData1
_080363D0: .4byte 0x08342FB8

	thumb_func_start BoxStopSkidding
BoxStopSkidding: @ 0x080363D4
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _080363F4
	ldr r1, _080363F0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3b
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #3
	b _08036404
	.align 2, 0
_080363F0: .4byte gCurrentSprite
_080363F4:
	ldr r1, _0803640C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036406
	adds r1, #0x24
	movs r0, #0x3b
_08036404:
	strb r0, [r1]
_08036406:
	pop {r0}
	bx r0
	.align 2, 0
_0803640C: .4byte gCurrentSprite

	thumb_func_start BoxBonkingInit
BoxBonkingInit: @ 0x08036410
	push {lr}
	ldr r1, _08036454 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, #0x10
	movs r3, #0
	movs r2, #0
	strh r0, [r1, #8]
	ldr r0, _08036458 @ =0x08342D98
	str r0, [r1]
	strb r3, [r1, #6]
	strh r2, [r1, #4]
	ldr r2, _0803645C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r3, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _08036460 @ =0x00000267
	bl SoundPlay
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	pop {r0}
	bx r0
	.align 2, 0
_08036454: .4byte gSubSpriteData1
_08036458: .4byte 0x08342D98
_0803645C: .4byte gCurrentSprite
_08036460: .4byte 0x00000267

	thumb_func_start BoxBonking
BoxBonking: @ 0x08036464
	push {r4, r5, r6, r7, lr}
	ldr r4, _08036488 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803648C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036494
	strh r1, [r4, #8]
	ldr r0, _08036490 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4b
	strb r1, [r0]
	b _080364F8
	.align 2, 0
_08036488: .4byte gSubSpriteData1
_0803648C: .4byte gPreviousVerticalCollisionCheck
_08036490: .4byte gCurrentSprite
_08036494:
	ldr r2, _080364C0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r6, _080364C4 @ =0x0834210C
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080364C8 @ =0x00007FFF
	cmp r1, r0
	bne _080364CC
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080364D6
	.align 2, 0
_080364C0: .4byte gCurrentSprite
_080364C4: .4byte 0x0834210C
_080364C8: .4byte 0x00007FFF
_080364CC:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, r0, r5
_080364D6:
	strh r0, [r4, #8]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080364F0
	ldr r1, _080364EC @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, #6
	b _080364F6
	.align 2, 0
_080364EC: .4byte gSubSpriteData1
_080364F0:
	ldr r1, _08036500 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, #6
_080364F6:
	strh r0, [r1, #0xa]
_080364F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036500: .4byte gSubSpriteData1

	thumb_func_start BoxLandingFromBonkInit
BoxLandingFromBonkInit: @ 0x08036504
	push {lr}
	ldr r1, _08036534 @ =gSubSpriteData1
	ldr r0, _08036538 @ =0x08342DA8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0803653C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r0, _08036540 @ =0x00000266
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036534: .4byte gSubSpriteData1
_08036538: .4byte 0x08342DA8
_0803653C: .4byte gCurrentSprite
_08036540: .4byte 0x00000266

	thumb_func_start BoxLandingFromBonk
BoxLandingFromBonk: @ 0x08036544
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036556
	ldr r0, _0803655C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
_08036556:
	pop {r0}
	bx r0
	.align 2, 0
_0803655C: .4byte gCurrentSprite

	thumb_func_start BoxLandingInit
BoxLandingInit: @ 0x08036560
	push {lr}
	ldr r1, _08036588 @ =gSubSpriteData1
	ldr r0, _0803658C @ =0x08342DA8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _08036590 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x3a
	strb r1, [r2]
	adds r0, #0x31
	strb r3, [r0]
	ldr r0, _08036594 @ =0x00000266
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036588: .4byte gSubSpriteData1
_0803658C: .4byte 0x08342DA8
_08036590: .4byte gCurrentSprite
_08036594: .4byte 0x00000266

	thumb_func_start BoxLanding
BoxLanding: @ 0x08036598
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _080365CC
	ldr r1, _080365B4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _080365B8
	adds r1, #0x24
	movs r0, #0x27
	b _080365CA
	.align 2, 0
_080365B4: .4byte gCurrentSprite
_080365B8:
	subs r0, #1
	strb r0, [r3]
	movs r2, #0x7f
	ands r2, r0
	cmp r2, #0
	bne _080365C6
	strb r2, [r3]
_080365C6:
	adds r1, #0x24
	movs r0, #0x3b
_080365CA:
	strb r0, [r1]
_080365CC:
	pop {r0}
	bx r0

	thumb_func_start BoxFinishedCrawlingInit
BoxFinishedCrawlingInit: @ 0x080365D0
	push {r4, lr}
	ldr r2, _08036600 @ =gSubSpriteData1
	ldr r0, _08036604 @ =0x08342F38
	str r0, [r2]
	ldr r1, _08036608 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #2
	mov r4, ip
	strb r0, [r4]
	strb r3, [r2, #6]
	strh r3, [r2, #4]
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	movs r0, #0x99
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036600: .4byte gSubSpriteData1
_08036604: .4byte 0x08342F38
_08036608: .4byte gCurrentSprite

	thumb_func_start BoxFinishedCrawling
BoxFinishedCrawling: @ 0x0803660C
	push {r4, r5, lr}
	ldr r4, _0803662C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #1
	bls _08036630
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _08036662
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	b _08036662
	.align 2, 0
_0803662C: .4byte gCurrentSprite
_08036630:
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036662
	bl SpriteUtilCheckSamusOnCeilingLadder
	cmp r0, #0
	beq _08036648
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08036660
_08036648:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803665A
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08036660
_0803665A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
_08036660:
	strb r0, [r1]
_08036662:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxJumpWarningInit
BoxJumpWarningInit: @ 0x08036668
	push {r4, lr}
	ldr r0, _0803668C @ =gSamusData
	ldrh r4, [r0, #0x16]
	ldr r0, _08036690 @ =gSubSpriteData1
	ldrh r2, [r0, #0xa]
	adds r1, r2, #0
	subs r1, #0x78
	adds r3, r0, #0
	cmp r1, r4
	bge _08036694
	adds r0, r2, #0
	adds r0, #0x78
	cmp r0, r4
	ble _08036694
	bl BoxStoppingToFireBombInit
	b _080366A6
	.align 2, 0
_0803668C: .4byte gSamusData
_08036690: .4byte gSubSpriteData1
_08036694:
	ldr r0, _080366AC @ =0x08342DC8
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r0, _080366B0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
_080366A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080366AC: .4byte 0x08342DC8
_080366B0: .4byte gCurrentSprite

	thumb_func_start BoxJumpWarning
BoxJumpWarning: @ 0x080366B4
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _080366C6
	ldr r0, _080366CC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3d
	strb r1, [r0]
_080366C6:
	pop {r0}
	bx r0
	.align 2, 0
_080366CC: .4byte gCurrentSprite

	thumb_func_start BoxJumpingInit
BoxJumpingInit: @ 0x080366D0
	push {r4, r5, lr}
	ldr r1, _0803670C @ =gSubSpriteData1
	ldr r0, _08036710 @ =0x08342D98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08036714 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #2
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803678C
	bl SpriteUtilCheckSamusOnCeilingLadder
	cmp r0, #0
	beq _08036718
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0803671C
	.align 2, 0
_0803670C: .4byte gSubSpriteData1
_08036710: .4byte 0x08342D98
_08036714: .4byte gCurrentSprite
_08036718:
	bl SpriteUtilMakeSpriteFaceAwayFromSamusDirection
_0803671C:
	ldr r4, _08036750 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08036764
	ldr r1, _08036754 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r2, _08036758 @ =0xFFFFFED4
	adds r0, r0, r2
	ldrh r1, [r1, #0xa]
	movs r2, #0x96
	lsls r2, r2, #1
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803675C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803678C
	ldrh r1, [r4]
	ldr r0, _08036760 @ =0x0000FDFF
	ands r0, r1
	b _08036782
	.align 2, 0
_08036750: .4byte gCurrentSprite
_08036754: .4byte gSubSpriteData1
_08036758: .4byte 0xFFFFFED4
_0803675C: .4byte gPreviousCollisionCheck
_08036760: .4byte 0x0000FDFF
_08036764:
	ldr r1, _08036798 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r2, _0803679C @ =0xFFFFFED4
	adds r0, r0, r2
	ldrh r1, [r1, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080367A0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803678C
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
_08036782:
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x83
	strb r0, [r1]
_0803678C:
	ldr r0, _080367A4 @ =0x00000265
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036798: .4byte gSubSpriteData1
_0803679C: .4byte 0xFFFFFED4
_080367A0: .4byte gPreviousCollisionCheck
_080367A4: .4byte 0x00000265

	thumb_func_start BoxJumping
BoxJumping: @ 0x080367A8
	push {r4, r5, lr}
	ldr r4, _080367D0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _080367D4 @ =0x083420E4
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _080367D8 @ =0x00007FFF
	cmp r1, r0
	bne _080367DC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _080367F2
	.align 2, 0
_080367D0: .4byte gCurrentSprite
_080367D4: .4byte 0x083420E4
_080367D8: .4byte 0x00007FFF
_080367DC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _080367F8 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r3
	strh r0, [r1, #8]
	movs r0, #0xc
	movs r1, #0x37
	bl BoxXMovement
_080367F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080367F8: .4byte gSubSpriteData1

	thumb_func_start BoxStoppingToFireBombInit
BoxStoppingToFireBombInit: @ 0x080367FC
	push {r4, lr}
	ldr r2, _0803682C @ =gSubSpriteData1
	ldr r0, _08036830 @ =0x08342F38
	str r0, [r2]
	ldr r1, _08036834 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #3
	mov r4, ip
	strb r0, [r4]
	strb r3, [r2, #6]
	strh r3, [r2, #4]
	adds r1, #0x24
	movs r0, #0x28
	strb r0, [r1]
	movs r0, #0x99
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803682C: .4byte gSubSpriteData1
_08036830: .4byte 0x08342F38
_08036834: .4byte gCurrentSprite

	thumb_func_start BoxStoppingToFireBomb
BoxStoppingToFireBomb: @ 0x08036838
	push {r4, r5, lr}
	ldr r5, _08036858 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #1
	bls _0803685C
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0803686C
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	b _0803686C
	.align 2, 0
_08036858: .4byte gCurrentSprite
_0803685C:
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0803686C
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
_0803686C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxLoweringToFireBombInit
BoxLoweringToFireBombInit: @ 0x08036874
	push {lr}
	ldr r1, _08036898 @ =gSubSpriteData1
	ldr r0, _0803689C @ =0x08342FE8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _080368A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	movs r0, #0x9a
	lsls r0, r0, #2
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036898: .4byte gSubSpriteData1
_0803689C: .4byte 0x08342FE8
_080368A0: .4byte gCurrentSprite

	thumb_func_start BoxLoweringToFireBomb
BoxLoweringToFireBomb: @ 0x080368A4
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _080368C2
	ldr r0, _080368C8 @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2c
	strb r1, [r0]
	ldr r0, _080368CC @ =gSubSpriteData1
	ldr r1, _080368D0 @ =0x08343028
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
_080368C2:
	pop {r0}
	bx r0
	.align 2, 0
_080368C8: .4byte gCurrentSprite
_080368CC: .4byte gSubSpriteData1
_080368D0: .4byte 0x08343028

	thumb_func_start BoxFiringBomb
BoxFiringBomb: @ 0x080368D4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl SpriteUtilHasSubSprite1AnimationEnded
	adds r6, r0, #0
	cmp r6, #0
	beq _08036910
	ldr r0, _08036900 @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2e
	strb r1, [r0]
	ldr r0, _08036904 @ =gSubSpriteData1
	ldr r1, _08036908 @ =0x08343048
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	ldr r0, _0803690C @ =0x00000269
	bl SoundPlay
	b _0803697A
	.align 2, 0
_08036900: .4byte gCurrentSprite
_08036904: .4byte gSubSpriteData1
_08036908: .4byte 0x08343048
_0803690C: .4byte 0x00000269
_08036910:
	ldr r3, _08036948 @ =gCurrentSprite
	ldrh r5, [r3, #2]
	ldrh r4, [r3, #4]
	ldr r0, _0803694C @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08036950 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08036954 @ =0x00020001
	cmp r0, r1
	bne _0803697A
	ldr r0, _08036958 @ =gSamusData
	ldrh r0, [r0, #0x16]
	cmp r4, r0
	bls _0803695C
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r5, #0
	subs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x71
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803697A
	.align 2, 0
_08036948: .4byte gCurrentSprite
_0803694C: .4byte gSubSpriteData1
_08036950: .4byte 0x00FFFFFF
_08036954: .4byte 0x00020001
_08036958: .4byte gSamusData
_0803695C:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r5, #0
	subs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #8]
	movs r0, #0x71
	movs r1, #0
	bl SpriteSpawnSecondary
_0803697A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxDoneFiringBomb
BoxDoneFiringBomb: @ 0x08036984
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036996
	ldr r0, _0803699C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
_08036996:
	pop {r0}
	bx r0
	.align 2, 0
_0803699C: .4byte gCurrentSprite

	thumb_func_start BoxDyingInit
BoxDyingInit: @ 0x080369A0
	ldr r1, _080369CC @ =gCurrentSprite
	ldr r0, _080369D0 @ =0x08347BD8
	str r0, [r1, #0x18]
	movs r3, #0
	strb r3, [r1, #0x1c]
	movs r2, #0
	strh r3, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #3
	strb r2, [r0]
	adds r1, #0x24
	movs r0, #0x44
	strb r0, [r1]
	ldr r0, _080369D4 @ =gSubSpriteData1
	ldr r1, _080369D8 @ =0x08342DF0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r3, [r0, #4]
	bx lr
	.align 2, 0
_080369CC: .4byte gCurrentSprite
_080369D0: .4byte 0x08347BD8
_080369D4: .4byte gSubSpriteData1
_080369D8: .4byte 0x08342DF0

	thumb_func_start BoxDying
BoxDying: @ 0x080369DC
	push {r4, r5, lr}
	ldr r1, _08036A08 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	bne _08036A1C
	ldr r4, _08036A0C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08036A10 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036A14
	strh r1, [r4, #8]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08036A2E
	.align 2, 0
_08036A08: .4byte gCurrentSprite
_08036A0C: .4byte gSubSpriteData1
_08036A10: .4byte gPreviousVerticalCollisionCheck
_08036A14:
	ldrh r0, [r4, #8]
	adds r0, #0x10
	strh r0, [r4, #8]
	b _08036A2E
_08036A1C:
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _08036A2E
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
_08036A2E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxMovingToFinalJumpInit
BoxMovingToFinalJumpInit: @ 0x08036A34
	push {r4, lr}
	ldr r4, _08036A80 @ =gCurrentSprite
	ldr r0, _08036A84 @ =0x08347BD8
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	movs r0, #0x77
	bl SpriteUtilFindPrimary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08036A88 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	strh r1, [r4, #8]
	adds r2, r4, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r2, _08036A8C @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, r1
	bls _08036A98
	ldr r0, _08036A90 @ =0x08342E18
	str r0, [r2]
	ldrh r1, [r4]
	ldr r0, _08036A94 @ =0x0000FDFF
	ands r0, r1
	b _08036AA6
	.align 2, 0
_08036A80: .4byte gCurrentSprite
_08036A84: .4byte 0x08347BD8
_08036A88: .4byte gSpriteData
_08036A8C: .4byte gSubSpriteData1
_08036A90: .4byte 0x08342E18
_08036A94: .4byte 0x0000FDFF
_08036A98:
	ldr r0, _08036AB8 @ =0x08342EA8
	str r0, [r2]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
_08036AA6:
	strh r0, [r4]
	ldr r1, _08036ABC @ =gSubSpriteData1
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036AB8: .4byte 0x08342EA8
_08036ABC: .4byte gSubSpriteData1

	thumb_func_start BoxMovingToFinalJump
BoxMovingToFinalJump: @ 0x08036AC0
	push {r4, r5, lr}
	ldr r0, _08036AFC @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08036B00 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08036B04 @ =0x00010003
	cmp r0, r1
	bne _08036AD6
	ldr r0, _08036B08 @ =0x00000262
	bl SoundPlay
_08036AD6:
	ldr r0, _08036B0C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r5, _08036B10 @ =gCurrentSprite
	cmp r0, #0
	bne _08036B1A
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036B14
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036B1A
	.align 2, 0
_08036AFC: .4byte gSubSpriteData1
_08036B00: .4byte 0x00FFFFFF
_08036B04: .4byte 0x00010003
_08036B08: .4byte 0x00000262
_08036B0C: .4byte gFrameCounter8Bit
_08036B10: .4byte gCurrentSprite
_08036B14:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
_08036B1A:
	ldr r4, _08036B38 @ =gSubSpriteData1
	ldrh r3, [r4, #0xa]
	ldr r0, _08036B3C @ =0x0000FFF8
	ldrh r2, [r5, #8]
	adds r1, r0, #0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _08036B40
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x47
	strb r0, [r1]
	b _08036B54
	.align 2, 0
_08036B38: .4byte gSubSpriteData1
_08036B3C: .4byte 0x0000FFF8
_08036B40:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036B50
	adds r0, r3, #2
	b _08036B52
_08036B50:
	subs r0, r3, #2
_08036B52:
	strh r0, [r4, #0xa]
_08036B54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxWaitingForFinalJumpInit
BoxWaitingForFinalJumpInit: @ 0x08036B5C
	push {lr}
	ldr r1, _08036B7C @ =gSubSpriteData1
	ldr r0, _08036B80 @ =0x08342DF0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08036B84 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x48
	strb r1, [r0]
	ldr r0, _08036B88 @ =0x00000276
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036B7C: .4byte gSubSpriteData1
_08036B80: .4byte 0x08342DF0
_08036B84: .4byte gCurrentSprite
_08036B88: .4byte 0x00000276

	thumb_func_start BoxWaitingForFinalJump
BoxWaitingForFinalJump: @ 0x08036B8C
	push {r4, lr}
	ldr r0, _08036BB4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r4, _08036BB8 @ =gCurrentSprite
	cmp r0, #0
	bne _08036BC2
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036BBC
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036BC2
	.align 2, 0
_08036BB4: .4byte gFrameCounter8Bit
_08036BB8: .4byte gCurrentSprite
_08036BBC:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08036BC2:
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _08036BF0 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08036BF4 @ =0xFFE70000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _08036BEA
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036BEA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_08036BEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036BF0: .4byte gBg1XPosition
_08036BF4: .4byte 0xFFE70000

	thumb_func_start BoxCrouchingForFinalJumpInit
BoxCrouchingForFinalJumpInit: @ 0x08036BF8
	ldr r1, _08036C10 @ =gSubSpriteData1
	ldr r0, _08036C14 @ =0x08342DC8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08036C18 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4a
	strb r1, [r0]
	bx lr
	.align 2, 0
_08036C10: .4byte gSubSpriteData1
_08036C14: .4byte 0x08342DC8
_08036C18: .4byte gCurrentSprite

	thumb_func_start BoxCrouchingForFinalJump
BoxCrouchingForFinalJump: @ 0x08036C1C
	push {lr}
	ldr r0, _08036C40 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08036C4E
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036C48
	ldr r0, _08036C44 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08036C4C
	.align 2, 0
_08036C40: .4byte gFrameCounter8Bit
_08036C44: .4byte gCurrentSprite
_08036C48:
	ldr r0, _08036C68 @ =gCurrentSprite
	adds r0, #0x20
_08036C4C:
	strb r1, [r0]
_08036C4E:
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _08036C62
	ldr r0, _08036C68 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4d
	strb r1, [r0]
	bl unk_36c4
_08036C62:
	pop {r0}
	bx r0
	.align 2, 0
_08036C68: .4byte gCurrentSprite

	thumb_func_start BoxFinalJumpInit
BoxFinalJumpInit: @ 0x08036C6C
	push {lr}
	ldr r1, _08036C94 @ =gSubSpriteData1
	ldr r0, _08036C98 @ =0x08342D98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08036C9C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4e
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08036CA0 @ =0x00000277
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036C94: .4byte gSubSpriteData1
_08036C98: .4byte 0x08342D98
_08036C9C: .4byte gCurrentSprite
_08036CA0: .4byte 0x00000277

	thumb_func_start BoxFinalJump
BoxFinalJump: @ 0x08036CA4
	push {r4, lr}
	ldr r0, _08036CCC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r4, _08036CD0 @ =gCurrentSprite
	cmp r0, #0
	bne _08036CDA
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036CD4
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036CDA
	.align 2, 0
_08036CCC: .4byte gFrameCounter8Bit
_08036CD0: .4byte gCurrentSprite
_08036CD4:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08036CDA:
	ldr r0, _08036D14 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	subs r1, #0x28
	strh r1, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08036D0C
	ldr r2, _08036D18 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	strh r3, [r4]
_08036D0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036D14: .4byte gSubSpriteData1
_08036D18: .4byte gSpriteData

	thumb_func_start BoxCrawlingInit
BoxCrawlingInit: @ 0x08036D1C
	push {lr}
	ldr r2, _08036D34 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036D40
	ldr r1, _08036D38 @ =gSubSpriteData1
	ldr r0, _08036D3C @ =0x08342EA8
	b _08036D44
	.align 2, 0
_08036D34: .4byte gCurrentSprite
_08036D38: .4byte gSubSpriteData1
_08036D3C: .4byte 0x08342EA8
_08036D40:
	ldr r1, _08036D58 @ =gSubSpriteData1
	ldr r0, _08036D5C @ =0x08342E18
_08036D44:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08036D58: .4byte gSubSpriteData1
_08036D5C: .4byte 0x08342E18

	thumb_func_start BoxCrawling
BoxCrawling: @ 0x08036D60
	push {lr}
	movs r0, #1
	movs r1, #7
	bl BoxXMovement
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxPartSetBoxWorkVar2
BoxPartSetBoxWorkVar2: @ 0x08036D70
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _08036D94 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, r3
	bhs _08036D8E
	strb r3, [r1]
_08036D8E:
	pop {r0}
	bx r0
	.align 2, 0
_08036D94: .4byte gSpriteData

	thumb_func_start BoxPartCenterSetImmunity
BoxPartCenterSetImmunity: @ 0x08036D98
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08036DC0 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x29
	adds r3, r1, #0
	cmp r0, #0x19
	bhi _08036E64
	lsls r0, r0, #2
	ldr r1, _08036DC4 @ =_08036DC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036DC0: .4byte gSpriteData
_08036DC4: .4byte _08036DC8
_08036DC8: @ jump table
	.4byte _08036E30 @ case 0
	.4byte _08036E30 @ case 1
	.4byte _08036E64 @ case 2
	.4byte _08036E30 @ case 3
	.4byte _08036E64 @ case 4
	.4byte _08036E64 @ case 5
	.4byte _08036E64 @ case 6
	.4byte _08036E64 @ case 7
	.4byte _08036E64 @ case 8
	.4byte _08036E64 @ case 9
	.4byte _08036E64 @ case 10
	.4byte _08036E64 @ case 11
	.4byte _08036E64 @ case 12
	.4byte _08036E64 @ case 13
	.4byte _08036E64 @ case 14
	.4byte _08036E64 @ case 15
	.4byte _08036E64 @ case 16
	.4byte _08036E64 @ case 17
	.4byte _08036E64 @ case 18
	.4byte _08036E64 @ case 19
	.4byte _08036E64 @ case 20
	.4byte _08036E64 @ case 21
	.4byte _08036E54 @ case 22
	.4byte _08036E54 @ case 23
	.4byte _08036E54 @ case 24
	.4byte _08036E54 @ case 25
_08036E30:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08036E64
	ldr r0, _08036E50 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08036E6E
	.align 2, 0
_08036E50: .4byte gCurrentSprite
_08036E54:
	ldr r0, _08036E60 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08036E6E
	.align 2, 0
_08036E60: .4byte gCurrentSprite
_08036E64:
	ldr r0, _08036E74 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_08036E6E:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08036E74: .4byte gCurrentSprite

	thumb_func_start BoxPartRemoveIgnoreProjectiles
BoxPartRemoveIgnoreProjectiles: @ 0x08036E78
	ldr r2, _08036E84 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08036E88 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08036E84: .4byte gCurrentSprite
_08036E88: .4byte 0x00007FFF

	thumb_func_start BoxPartInit
BoxPartInit: @ 0x08036E8C
	push {lr}
	ldr r2, _08036EC4 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08036EC8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	subs r1, #5
	movs r0, #2
	strb r0, [r1]
	ldrb r0, [r2, #0x1e]
	adds r3, r2, #0
	cmp r0, #6
	bhi _08036ECC
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	b _08036ED2
	.align 2, 0
_08036EC4: .4byte gCurrentSprite
_08036EC8: .4byte 0x0000FFFB
_08036ECC:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
_08036ED2:
	strb r0, [r1]
	ldrb r0, [r3, #0x1e]
	cmp r0, #0xb
	bls _08036EDC
	b _08036FE0
_08036EDC:
	lsls r0, r0, #2
	ldr r1, _08036EE8 @ =_08036EEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036EE8: .4byte _08036EEC
_08036EEC: @ jump table
	.4byte _08036F1C @ case 0
	.4byte _08036FA8 @ case 1
	.4byte _08036F1C @ case 2
	.4byte _08036FA8 @ case 3
	.4byte _08036FA8 @ case 4
	.4byte _08036FA8 @ case 5
	.4byte _08036F40 @ case 6
	.4byte _08036FE0 @ case 7
	.4byte _08036FA8 @ case 8
	.4byte _08036F68 @ case 9
	.4byte _08036FA8 @ case 10
	.4byte _08036FA8 @ case 11
_08036F1C:
	ldr r0, _08036F38 @ =0x0000FFB8
	strh r0, [r3, #0xa]
	movs r0, #0x48
	strh r0, [r3, #0xc]
	ldr r0, _08036F3C @ =0x0000FFE0
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	subs r1, #0x10
	b _08036F7E
	.align 2, 0
_08036F38: .4byte 0x0000FFB8
_08036F3C: .4byte 0x0000FFE0
_08036F40:
	ldr r0, _08036F60 @ =0x0000FFD0
	strh r0, [r3, #0xa]
	movs r0, #0x40
	strh r0, [r3, #0xc]
	ldr r0, _08036F64 @ =0x0000FFE0
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #2
	strb r0, [r1]
	b _08036FC8
	.align 2, 0
_08036F60: .4byte 0x0000FFD0
_08036F64: .4byte 0x0000FFE0
_08036F68:
	ldr r0, _08036F9C @ =0x0000FFE0
	strh r0, [r3, #0xa]
	movs r0, #0x20
	strh r0, [r3, #0xc]
	ldr r0, _08036FA0 @ =0x0000FFC0
	strh r0, [r3, #0xe]
	movs r0, #0x40
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
_08036F7E:
	strb r0, [r1]
	ldr r1, _08036FA4 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _08036FE4
	.align 2, 0
_08036F9C: .4byte 0x0000FFE0
_08036FA0: .4byte 0x0000FFC0
_08036FA4: .4byte sSecondarySpriteStats
_08036FA8:
	movs r2, #0
	ldr r1, _08036FD8 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
_08036FC8:
	ldr r1, _08036FDC @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	b _08036FE4
	.align 2, 0
_08036FD8: .4byte 0x0000FFFC
_08036FDC: .4byte sSecondarySpriteStats
_08036FE0:
	movs r0, #0
	strh r0, [r3]
_08036FE4:
	bl BoxSyncSubSprites
	pop {r0}
	bx r0

	thumb_func_start BoxPartFrontLeftLeg
BoxPartFrontLeftLeg: @ 0x08036FEC
	push {r4, r5, r6, r7, lr}
	ldr r5, _08037010 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldr r0, _08037014 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08037018
	strh r1, [r5]
	b _0803709A
	.align 2, 0
_08037010: .4byte gCurrentSprite
_08037014: .4byte gSpriteData
_08037018:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0803709A
	ldrh r3, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	bne _0803704E
	ldr r0, [r5, #0x18]
	ldr r7, _08037084 @ =0x083479F0
	cmp r0, r7
	beq _0803704E
	adds r0, r3, #0
	adds r0, #0x3c
	movs r2, #0x30
	bl ParticleSet
	str r7, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
_0803704E:
	ldr r1, _08037088 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803709A
	ldr r0, _0803708C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803709A
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08037094
	ldr r0, _08037090 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08037098
	.align 2, 0
_08037084: .4byte 0x083479F0
_08037088: .4byte gSpriteData
_0803708C: .4byte gFrameCounter8Bit
_08037090: .4byte gCurrentSprite
_08037094:
	ldr r0, _080370A0 @ =gCurrentSprite
	adds r0, #0x20
_08037098:
	strb r1, [r0]
_0803709A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370A0: .4byte gCurrentSprite

	thumb_func_start BoxPartFrontRightLeg
BoxPartFrontRightLeg: @ 0x080370A4
	push {r4, r5, r6, r7, lr}
	ldr r5, _080370C8 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldr r0, _080370CC @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080370D0
	strh r1, [r5]
	b _08037152
	.align 2, 0
_080370C8: .4byte gCurrentSprite
_080370CC: .4byte gSpriteData
_080370D0:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08037152
	ldrh r3, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	bne _08037106
	ldr r0, [r5, #0x18]
	ldr r7, _0803713C @ =0x08347AE8
	cmp r0, r7
	beq _08037106
	adds r0, r3, #0
	adds r0, #0x3c
	movs r2, #0x30
	bl ParticleSet
	str r7, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
_08037106:
	ldr r1, _08037140 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08037152
	ldr r0, _08037144 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08037152
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803714C
	ldr r0, _08037148 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08037150
	.align 2, 0
_0803713C: .4byte 0x08347AE8
_08037140: .4byte gSpriteData
_08037144: .4byte gFrameCounter8Bit
_08037148: .4byte gCurrentSprite
_0803714C:
	ldr r0, _08037158 @ =gCurrentSprite
	adds r0, #0x20
_08037150:
	strb r1, [r0]
_08037152:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037158: .4byte gCurrentSprite

	thumb_func_start BoxPartCenter
BoxPartCenter: @ 0x0803715C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0803718C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _08037190 @ =gSpriteData
	mov r2, sb
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r8, r1
	ldrh r0, [r1]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08037194
	strh r1, [r4]
	b _080372A0
	.align 2, 0
_0803718C: .4byte gCurrentSprite
_08037190: .4byte gSpriteData
_08037194:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080371A6
	b _080372A0
_080371A6:
	mov r7, r8
	adds r7, #0x2d
	ldrb r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080371E0
	ldr r0, _080371D4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080372A0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080371D8
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xc
	strb r0, [r1]
	b _080372A0
	.align 2, 0
_080371D4: .4byte gFrameCounter8Bit
_080371D8:
	adds r0, r4, #0
	adds r0, #0x20
	strb r6, [r0]
	b _080372A0
_080371E0:
	ldr r1, _08037220 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r5, [r0]
	ldrh r2, [r4, #2]
	ldrh r3, [r4, #4]
	mov r0, sb
	str r2, [sp]
	str r3, [sp, #4]
	bl BoxPartCenterSetImmunity
	ldrh r1, [r4, #0x14]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r1, #0
	bne _08037224
	ldrb r1, [r7]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r7]
	adds r0, r2, #0
	adds r0, #0x32
	adds r1, r3, #0
	movs r2, #0x2f
	bl ParticleSet
	mov r1, r8
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
	b _08037282
	.align 2, 0
_08037220: .4byte sSecondarySpriteStats
_08037224:
	lsrs r0, r5, #2
	cmp r1, r0
	bhs _08037234
	ldr r0, [r4, #0x18]
	ldr r1, _08037230 @ =0x08347BC8
	b _0803723E
	.align 2, 0
_08037230: .4byte 0x08347BC8
_08037234:
	lsrs r0, r5, #1
	cmp r1, r0
	bhs _0803725C
	ldr r0, [r4, #0x18]
	ldr r1, _08037258 @ =0x08347BB8
_0803723E:
	cmp r0, r1
	beq _08037282
	str r1, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r2, #0
	adds r0, #0x24
	adds r1, r3, #0
	movs r2, #0x30
	bl ParticleSet
	b _08037282
	.align 2, 0
_08037258: .4byte 0x08347BB8
_0803725C:
	ldrh r1, [r4, #0x14]
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r0, r0, #2
	cmp r1, r0
	bge _08037282
	ldr r0, [r4, #0x18]
	ldr r1, _080372B0 @ =0x08347BA8
	cmp r0, r1
	beq _08037282
	str r1, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r2, #0
	adds r0, #0x24
	adds r1, r3, #0
	movs r2, #0x30
	bl ParticleSet
_08037282:
	ldr r0, _080372B4 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _080372A0
	mov r0, sb
	movs r1, #2
	bl BoxPartSetBoxWorkVar2
	movs r0, #0x9e
	lsls r0, r0, #2
	bl SoundPlay
_080372A0:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080372B0: .4byte 0x08347BA8
_080372B4: .4byte gCurrentSprite

	thumb_func_start BoxPartCenterBottom
BoxPartCenterBottom: @ 0x080372B8
	push {lr}
	ldr r3, _080372DC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080372E0 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080372E4
	strh r1, [r3]
	b _0803748C
	.align 2, 0
_080372DC: .4byte gCurrentSprite
_080372E0: .4byte gSpriteData
_080372E4:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080372F2
	b _0803748C
_080372F2:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #8
	cmp r0, #0x46
	bls _08037300
	b _0803747C
_08037300:
	lsls r0, r0, #2
	ldr r1, _0803730C @ =_08037310
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803730C: .4byte _08037310
_08037310: @ jump table
	.4byte _0803742C @ case 0
	.4byte _0803747C @ case 1
	.4byte _0803747C @ case 2
	.4byte _0803747C @ case 3
	.4byte _0803747C @ case 4
	.4byte _0803747C @ case 5
	.4byte _0803747C @ case 6
	.4byte _0803747C @ case 7
	.4byte _0803747C @ case 8
	.4byte _0803747C @ case 9
	.4byte _0803747C @ case 10
	.4byte _0803747C @ case 11
	.4byte _0803747C @ case 12
	.4byte _0803747C @ case 13
	.4byte _0803747C @ case 14
	.4byte _0803747C @ case 15
	.4byte _0803742C @ case 16
	.4byte _0803747C @ case 17
	.4byte _0803747C @ case 18
	.4byte _0803747C @ case 19
	.4byte _0803747C @ case 20
	.4byte _0803747C @ case 21
	.4byte _0803747C @ case 22
	.4byte _0803747C @ case 23
	.4byte _0803747C @ case 24
	.4byte _0803747C @ case 25
	.4byte _0803747C @ case 26
	.4byte _0803747C @ case 27
	.4byte _0803747C @ case 28
	.4byte _0803747C @ case 29
	.4byte _0803747C @ case 30
	.4byte _0803747C @ case 31
	.4byte _0803747C @ case 32
	.4byte _0803747C @ case 33
	.4byte _0803747C @ case 34
	.4byte _0803747C @ case 35
	.4byte _0803747C @ case 36
	.4byte _0803747C @ case 37
	.4byte _0803747C @ case 38
	.4byte _0803747C @ case 39
	.4byte _0803747C @ case 40
	.4byte _0803747C @ case 41
	.4byte _0803747C @ case 42
	.4byte _0803747C @ case 43
	.4byte _0803747C @ case 44
	.4byte _0803747C @ case 45
	.4byte _0803747C @ case 46
	.4byte _0803747C @ case 47
	.4byte _0803747C @ case 48
	.4byte _0803747C @ case 49
	.4byte _0803747C @ case 50
	.4byte _0803747C @ case 51
	.4byte _0803742C @ case 52
	.4byte _0803747C @ case 53
	.4byte _0803747C @ case 54
	.4byte _0803747C @ case 55
	.4byte _0803747C @ case 56
	.4byte _0803747C @ case 57
	.4byte _0803747C @ case 58
	.4byte _0803747C @ case 59
	.4byte _08037438 @ case 60
	.4byte _08037438 @ case 61
	.4byte _08037438 @ case 62
	.4byte _08037438 @ case 63
	.4byte _08037438 @ case 64
	.4byte _08037438 @ case 65
	.4byte _08037438 @ case 66
	.4byte _0803747C @ case 67
	.4byte _0803747C @ case 68
	.4byte _08037438 @ case 69
	.4byte _08037438 @ case 70
_0803742C:
	ldr r0, [r3, #0x18]
	ldr r1, _08037434 @ =0x08347CA8
	b _08037480
	.align 2, 0
_08037434: .4byte 0x08347CA8
_08037438:
	ldr r0, [r3, #0x18]
	ldr r1, _0803746C @ =0x08347CA8
	cmp r0, r1
	beq _08037448
	str r1, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
_08037448:
	ldr r0, _08037470 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803748C
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08037474
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0xc
	strb r0, [r1]
	b _0803748C
	.align 2, 0
_0803746C: .4byte 0x08347CA8
_08037470: .4byte gFrameCounter8Bit
_08037474:
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	b _0803748C
_0803747C:
	ldr r0, [r3, #0x18]
	ldr r1, _08037490 @ =0x08347C98
_08037480:
	cmp r0, r1
	beq _0803748C
	str r1, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
_0803748C:
	pop {r0}
	bx r0
	.align 2, 0
_08037490: .4byte 0x08347C98

	thumb_func_start BoxPartDefault
BoxPartDefault: @ 0x08037494
	push {lr}
	ldr r3, _080374B8 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080374BC @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080374C0
	strh r1, [r3]
	b _0803750E
	.align 2, 0
_080374B8: .4byte gCurrentSprite
_080374BC: .4byte gSpriteData
_080374C0:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803750E
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	blt _0803750E
	cmp r0, #0x4a
	ble _080374E2
	cmp r0, #0x4e
	bgt _0803750E
	cmp r0, #0x4d
	blt _0803750E
_080374E2:
	ldr r0, _08037504 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803750E
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08037508
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0xd
	strb r0, [r1]
	b _0803750E
	.align 2, 0
_08037504: .4byte gFrameCounter8Bit
_08037508:
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
_0803750E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxMissileInit
BoxMissileInit: @ 0x08037514
	push {r4, lr}
	ldr r0, _0803759C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _080375A0 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _080375A4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _080375A8 @ =0x0000FFF8
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #8
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _080375AC @ =0x08347D68
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r1, _080375B0 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x2b
	movs r0, #0xc0
	strb r0, [r1]
	adds r0, #0x40
	strh r0, [r4, #0x12]
	adds r1, #3
	movs r0, #0x24
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #6]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080375B4 @ =0x0000026B
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803759C: .4byte gCurrentSprite
_080375A0: .4byte 0x0000FFFB
_080375A4: .4byte gIoRegisters
_080375A8: .4byte 0x0000FFF8
_080375AC: .4byte 0x08347D68
_080375B0: .4byte sSecondarySpriteStats
_080375B4: .4byte 0x0000026B

	thumb_func_start BoxMissileSpawning
BoxMissileSpawning: @ 0x080375B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r5, _08037638 @ =gCurrentSprite
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	bne _080375D0
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080375D0:
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r1, [r6]
	lsrs r1, r1, #1
	ldrh r0, [r5, #2]
	subs r0, r0, r1
	movs r2, #0
	mov r8, r2
	strh r0, [r5, #2]
	cmp r1, #2
	bhi _08037600
	adds r7, r5, #0
	adds r7, #0x2b
	ldrb r0, [r7]
	ldr r2, _0803763C @ =gSamusData
	ldrh r1, [r2, #0x18]
	subs r1, #0x40
	ldrh r2, [r2, #0x16]
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl SpriteUtilMakeSpriteRotateTowardsTarget
	strb r0, [r7]
_08037600:
	ldrb r0, [r6]
	subs r0, #2
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803762C
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	strb r2, [r6]
	adds r0, #1
	strb r1, [r0]
_0803762C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037638: .4byte gCurrentSprite
_0803763C: .4byte gSamusData

	thumb_func_start BoxMissileMoving
BoxMissileMoving: @ 0x08037640
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _080376C0 @ =gCurrentSprite
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080376B2
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _080376B2
	ldrb r1, [r1, #0x1e]
	movs r2, #8
	cmp r1, #3
	beq _0803766E
	movs r2, #0x28
	cmp r1, #2
	beq _0803766E
	movs r2, #0x68
	cmp r1, #1
	bne _0803766E
	movs r2, #0x48
_0803766E:
	ldr r4, _080376C4 @ =gSamusData
	ldrh r0, [r4, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0x18
	movs r3, #0x28
	bl SpriteUtilMoveTowardsTarget
	ldr r5, _080376C0 @ =gCurrentSprite
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	ldrh r1, [r4, #0x18]
	subs r1, #0x40
	ldrh r2, [r4, #0x16]
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl SpriteUtilMakeSpriteRotateTowardsTarget
	strb r0, [r6]
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080376C8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080376B8
	adds r1, r5, #0
_080376B2:
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080376B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080376C0: .4byte gCurrentSprite
_080376C4: .4byte gSamusData
_080376C8: .4byte gPreviousCollisionCheck

	thumb_func_start BoxMissileExploding
BoxMissileExploding: @ 0x080376CC
	push {lr}
	ldr r1, _080376EC @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0x9b
	lsls r0, r0, #2
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080376EC: .4byte gCurrentSprite

	thumb_func_start BoxBombInit
BoxBombInit: @ 0x080376F0
	push {r4, lr}
	ldr r0, _08037780 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08037784 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08037788 @ =0x0000FFE4
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #0x1c
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803778C @ =0x08347E58
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r1, _08037790 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x2b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #7
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #0xd
	movs r3, #2
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #0x9c
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037780: .4byte gCurrentSprite
_08037784: .4byte 0x0000FFFB
_08037788: .4byte 0x0000FFE4
_0803778C: .4byte 0x08347E58
_08037790: .4byte sSecondarySpriteStats

	thumb_func_start BoxBombMoving
BoxBombMoving: @ 0x08037794
	push {r4, r5, r6, lr}
	ldr r1, _080377A8 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r5, r1, #0
	cmp r0, #0
	bne _080377AC
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08037958
	.align 2, 0
_080377A8: .4byte gCurrentSprite
_080377AC:
	movs r0, #0x2f
	adds r0, r0, r5
	mov ip, r0
	ldrb r6, [r0]
	adds r0, r6, #0
	cmp r0, #0
	bne _080377FC
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _080377DC @ =0x0834214A
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r4, [r1]
	ldr r0, _080377E0 @ =0x00007FFF
	cmp r4, r0
	bne _080377E4
	movs r4, #0
	adds r0, r6, #1
	mov r1, ip
	strb r0, [r1]
	strb r4, [r3]
	b _080377E8
	.align 2, 0
_080377DC: .4byte 0x0834214A
_080377E0: .4byte 0x00007FFF
_080377E4:
	adds r0, r2, #1
	strb r0, [r3]
_080377E8:
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #3
	bne _080378D4
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #7
	strb r0, [r1]
	b _080378D4
_080377FC:
	cmp r0, #2
	bne _08037828
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _08037820 @ =0x0834213E
_08037808:
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r4, [r1]
	ldr r0, _08037824 @ =0x00007FFF
	cmp r4, r0
	bne _0803783C
	movs r4, #0
	adds r0, r6, #1
	mov r1, ip
	strb r0, [r1]
	strb r4, [r3]
	b _080378D4
	.align 2, 0
_08037820: .4byte 0x0834213E
_08037824: .4byte 0x00007FFF
_08037828:
	cmp r0, #4
	bne _08037842
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _08037838 @ =0x08342134
	b _08037808
	.align 2, 0
_08037838: .4byte 0x08342134
_0803783C:
	adds r0, r2, #1
	strb r0, [r3]
	b _080378D4
_08037842:
	cmp r0, #6
	bne _08037858
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	b _080378DA
_08037858:
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r1, _08037878 @ =0x08342160
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r0, _0803787C @ =0x00007FFF
	cmp r4, r0
	bne _08037880
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _08037884
	.align 2, 0
_08037878: .4byte 0x08342160
_0803787C: .4byte 0x00007FFF
_08037880:
	adds r0, r2, #1
	strb r0, [r3]
_08037884:
	ldr r5, _080378C8 @ =gCurrentSprite
	ldrh r0, [r5, #2]
	adds r0, #0x20
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _080378CC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080378D4
	adds r0, r1, #0
	subs r0, #0x20
	strh r0, [r5, #2]
	adds r4, r5, #0
	adds r4, #0x2f
	ldrb r0, [r4]
	cmp r0, #1
	bne _080378B0
	ldr r0, _080378D0 @ =0x00000271
	bl SoundPlay
_080378B0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	subs r0, #2
	strb r0, [r1]
	b _080378DA
	.align 2, 0
_080378C8: .4byte gCurrentSprite
_080378CC: .4byte gPreviousVerticalCollisionCheck
_080378D0: .4byte 0x00000271
_080378D4:
	ldrh r0, [r5, #2]
	adds r0, r4, r0
	strh r0, [r5, #2]
_080378DA:
	adds r4, r5, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08037924
	adds r2, r4, #0
	adds r2, #0x2b
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #6
	subs r0, r0, r1
	lsls r0, r0, #3
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037920 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037958
	adds r1, r4, #0
	adds r1, #0x30
	ldrh r0, [r4, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #4]
	b _08037958
	.align 2, 0
_08037920: .4byte gPreviousCollisionCheck
_08037924:
	adds r2, r5, #0
	adds r2, #0x2b
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	movs r1, #6
	subs r1, r1, r0
	lsls r1, r1, #3
	ldrb r0, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037960 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037958
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #4]
_08037958:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037960: .4byte gPreviousCollisionCheck

	thumb_func_start BoxBombLanded
BoxBombLanded: @ 0x08037964
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _0803797C @ =gCurrentSprite
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _08037980
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _080379DC
	.align 2, 0
_0803797C: .4byte gCurrentSprite
_08037980:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080379DC
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x72
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #8]
	movs r0, #0x72
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x22
	bl ParticleSet
	strh r5, [r4]
	ldr r0, _080379E4 @ =0x00000272
	bl SoundPlay
_080379DC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080379E4: .4byte 0x00000272

	thumb_func_start BoxBombExploding
BoxBombExploding: @ 0x080379E8
	push {r4, lr}
	ldr r4, _08037A08 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	movs r2, #0x32
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08037A0C @ =0x00000273
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037A08: .4byte gCurrentSprite
_08037A0C: .4byte 0x00000273

	thumb_func_start BoxFireInit
BoxFireInit: @ 0x08037A10
	push {r4, lr}
	ldr r0, _08037A6C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08037A70 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r2, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x27
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08037A74 @ =0x0000FFE0
	mov r4, ip
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	adds r0, #0x10
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	ldr r0, _08037A78 @ =0x08347E80
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r1, _08037A7C @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037A6C: .4byte gCurrentSprite
_08037A70: .4byte 0x0000FFFB
_08037A74: .4byte 0x0000FFE0
_08037A78: .4byte 0x08347E80
_08037A7C: .4byte sSecondarySpriteStats

	thumb_func_start BoxFireMovingHigh
BoxFireMovingHigh: @ 0x08037A80
	push {r4, r5, r6, lr}
	ldr r0, _08037A98 @ =gCurrentSprite
	ldrh r0, [r0, #0x16]
	cmp r0, #0x23
	bls _08037A8C
	b _08037BB4
_08037A8C:
	lsls r0, r0, #2
	ldr r1, _08037A9C @ =_08037AA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037A98: .4byte gCurrentSprite
_08037A9C: .4byte _08037AA0
_08037AA0: @ jump table
	.4byte _08037B30 @ case 0
	.4byte _08037B30 @ case 1
	.4byte _08037B30 @ case 2
	.4byte _08037B38 @ case 3
	.4byte _08037B40 @ case 4
	.4byte _08037BA4 @ case 5
	.4byte _08037B5C @ case 6
	.4byte _08037B94 @ case 7
	.4byte _08037B84 @ case 8
	.4byte _08037BB4 @ case 9
	.4byte _08037BB4 @ case 10
	.4byte _08037BB4 @ case 11
	.4byte _08037BB4 @ case 12
	.4byte _08037BB4 @ case 13
	.4byte _08037BB4 @ case 14
	.4byte _08037BB4 @ case 15
	.4byte _08037BB4 @ case 16
	.4byte _08037BB4 @ case 17
	.4byte _08037BB4 @ case 18
	.4byte _08037BB4 @ case 19
	.4byte _08037BB4 @ case 20
	.4byte _08037BB4 @ case 21
	.4byte _08037BB4 @ case 22
	.4byte _08037BB4 @ case 23
	.4byte _08037BB4 @ case 24
	.4byte _08037BB4 @ case 25
	.4byte _08037BB4 @ case 26
	.4byte _08037B64 @ case 27
	.4byte _08037B72 @ case 28
	.4byte _08037B84 @ case 29
	.4byte _08037B84 @ case 30
	.4byte _08037B8C @ case 31
	.4byte _08037B94 @ case 32
	.4byte _08037B9A @ case 33
	.4byte _08037BA4 @ case 34
	.4byte _08037BAC @ case 35
_08037B30:
	ldr r5, _08037B34 @ =0x0000FFE0
	b _08037BB6
	.align 2, 0
_08037B34: .4byte 0x0000FFE0
_08037B38:
	ldr r5, _08037B3C @ =0x0000FFC0
	b _08037BB6
	.align 2, 0
_08037B3C: .4byte 0x0000FFC0
_08037B40:
	ldr r5, _08037B54 @ =0x0000FFA0
	ldr r0, _08037B58 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _08037BB6
	movs r0, #0x9d
	lsls r0, r0, #2
	bl SoundPlay
	b _08037BB6
	.align 2, 0
_08037B54: .4byte 0x0000FFA0
_08037B58: .4byte gCurrentSprite
_08037B5C:
	ldr r5, _08037B60 @ =0x0000FF40
	b _08037BB6
	.align 2, 0
_08037B60: .4byte 0x0000FF40
_08037B64:
	ldr r0, _08037B78 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _08037B72
	ldr r0, _08037B7C @ =0x00000275
	bl SoundPlay
_08037B72:
	ldr r5, _08037B80 @ =0x0000FEA0
	b _08037BB6
	.align 2, 0
_08037B78: .4byte gCurrentSprite
_08037B7C: .4byte 0x00000275
_08037B80: .4byte 0x0000FEA0
_08037B84:
	ldr r5, _08037B88 @ =0x0000FEC0
	b _08037BB6
	.align 2, 0
_08037B88: .4byte 0x0000FEC0
_08037B8C:
	ldr r5, _08037B90 @ =0x0000FEE0
	b _08037BB6
	.align 2, 0
_08037B90: .4byte 0x0000FEE0
_08037B94:
	movs r5, #0xff
	lsls r5, r5, #8
	b _08037BB6
_08037B9A:
	ldr r5, _08037BA0 @ =0x0000FF20
	b _08037BB6
	.align 2, 0
_08037BA0: .4byte 0x0000FF20
_08037BA4:
	ldr r5, _08037BA8 @ =0x0000FF80
	b _08037BB6
	.align 2, 0
_08037BA8: .4byte 0x0000FF80
_08037BAC:
	ldr r5, _08037BB0 @ =0x0000FFA0
	b _08037BB6
	.align 2, 0
_08037BB0: .4byte 0x0000FFA0
_08037BB4:
	ldr r5, _08037C08 @ =0x0000FE80
_08037BB6:
	ldr r4, _08037C0C @ =gCurrentSprite
	movs r6, #0
	strh r5, [r4, #0xa]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08037BE0
	ldr r0, _08037C10 @ =0x083480A8
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08037C14 @ =0x0000FFD0
	strh r0, [r4, #0xa]
_08037BE0:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08037C1C
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037C18 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037C30
	ldrh r0, [r4, #4]
	adds r0, #3
	b _08037C3C
	.align 2, 0
_08037C08: .4byte 0x0000FE80
_08037C0C: .4byte gCurrentSprite
_08037C10: .4byte 0x083480A8
_08037C14: .4byte 0x0000FFD0
_08037C18: .4byte gPreviousCollisionCheck
_08037C1C:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037C34 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037C38
_08037C30:
	strh r6, [r4]
	b _08037C3E
	.align 2, 0
_08037C34: .4byte gPreviousCollisionCheck
_08037C38:
	ldrh r0, [r4, #4]
	subs r0, #3
_08037C3C:
	strh r0, [r4, #4]
_08037C3E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start BoxFireMovingLow
BoxFireMovingLow: @ 0x08037C44
	push {r4, r5, lr}
	ldr r4, _08037C94 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	movs r5, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037C6C
	ldr r0, _08037C98 @ =0x08347E80
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08037C9C @ =0x0000FFE0
	strh r0, [r4, #0xa]
_08037C6C:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08037CA4
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037CA0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037CB8
	ldrh r0, [r4, #4]
	adds r0, #3
	b _08037CC4
	.align 2, 0
_08037C94: .4byte gCurrentSprite
_08037C98: .4byte 0x08347E80
_08037C9C: .4byte 0x0000FFE0
_08037CA0: .4byte gPreviousCollisionCheck
_08037CA4:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037CBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037CC0
_08037CB8:
	strh r5, [r4]
	b _08037CC6
	.align 2, 0
_08037CBC: .4byte gPreviousCollisionCheck
_08037CC0:
	ldrh r0, [r4, #4]
	subs r0, #3
_08037CC4:
	strh r0, [r4, #4]
_08037CC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxSpawnFallingDebris
BoxSpawnFallingDebris: @ 0x08037CCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _08037DC4 @ =gCurrentSprite
	ldrh r6, [r4, #2]
	ldrh r7, [r4, #4]
	ldrb r2, [r4, #0x1f]
	movs r0, #0x23
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xe8
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xbe
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DC8 @ =0xFFFFFEAA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xa0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	ldr r1, _08037DCC @ =0xFFFFFEFA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xdc
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0x50
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DD0 @ =0xFFFFFEDC
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0x8c
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #8
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DC4: .4byte gCurrentSprite
_08037DC8: .4byte 0xFFFFFEAA
_08037DCC: .4byte 0xFFFFFEFA
_08037DD0: .4byte 0xFFFFFEDC

	thumb_func_start BoxSetDebrisClipdata
BoxSetDebrisClipdata: @ 0x08037DD4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08037E10 @ =gCurrentSprite
	ldrh r5, [r0, #2]
	ldrh r6, [r0, #4]
	ldr r0, _08037E14 @ =gCurrentClipdataAffectingAction
	mov r8, r0
	strb r4, [r0]
	subs r5, #0xe0
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	bl ClipdataProcess
	mov r0, r8
	strb r4, [r0]
	subs r6, #0x20
	adds r0, r5, #0
	adds r1, r6, #0
	bl ClipdataProcess
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037E10: .4byte gCurrentSprite
_08037E14: .4byte gCurrentClipdataAffectingAction

	thumb_func_start BoxDebrisInit
BoxDebrisInit: @ 0x08037E18
	push {r4, r5, lr}
	ldr r4, _08037EAC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	movs r5, #0x29
	movs r0, #0x18
	strb r0, [r5, r4]
	ldr r0, _08037EB0 @ =0x0000FF10
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	adds r0, #0xc0
	strh r0, [r4, #0xe]
	movs r0, #0x30
	strh r0, [r4, #0x10]
	ldr r0, _08037EB4 @ =0x08347FA8
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r3, #1
	movs r0, #1
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	bl EventCheckAfter_BoxDefeated
	adds r2, r0, #0
	cmp r2, #0
	beq _08037ECC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08037EB8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08037EBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037EC0
	strh r0, [r4]
	b _08037EDE
	.align 2, 0
_08037EAC: .4byte gCurrentSprite
_08037EB0: .4byte 0x0000FF10
_08037EB4: .4byte 0x08347FA8
_08037EB8: .4byte 0x0000DFFF
_08037EBC: .4byte gPreviousCollisionCheck
_08037EC0:
	movs r0, #2
	bl BoxSetDebrisClipdata
	bl BoxSpawnFallingDebris
	b _08037EDE
_08037ECC:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08037EE4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037EDE
	strh r2, [r4]
_08037EDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037EE4: .4byte gPreviousCollisionCheck

	thumb_func_start BoxDebrisIdle
BoxDebrisIdle: @ 0x08037EE8
	ldr r0, _08037EF4 @ =gCurrentSprite
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037EF4: .4byte gCurrentSprite

	thumb_func_start BoxDebrisFallingInit
BoxDebrisFallingInit: @ 0x08037EF8
	ldr r1, _08037F14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r2, [r1]
	ldr r0, _08037F18 @ =0x0000DFFF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_08037F14: .4byte gCurrentSprite
_08037F18: .4byte 0x0000DFFF

	thumb_func_start BoxDebrisWaitToFall
BoxDebrisWaitToFall: @ 0x08037F1C
	push {lr}
	ldr r2, _08037F74 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #4]
	lsrs r0, r0, #2
	ldr r1, _08037F78 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08037F7C @ =0xFFDF0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bhi _08037F6E
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	adds r0, #3
	strb r3, [r0]
	subs r0, #0xd
	movs r1, #0x1c
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	bl BoxSpawnFallingDebris
	movs r0, #0x8c
	lsls r0, r0, #2
	bl SoundPlay_3b1c
_08037F6E:
	pop {r0}
	bx r0
	.align 2, 0
_08037F74: .4byte gCurrentSprite
_08037F78: .4byte gBg1XPosition
_08037F7C: .4byte 0xFFDF0000

	thumb_func_start BoxDebrisFalling
BoxDebrisFalling: @ 0x08037F80
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08037FF0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r7, [r1]
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08037FF4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037FF8
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartVertical
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x31
	bl ParticleSet
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	movs r2, #0x31
	bl ParticleSet
	movs r0, #0x28
	bl EventCheckAdvance
	movs r0, #2
	bl BoxSetDebrisClipdata
	movs r0, #0x18
	movs r1, #6
	bl PlayMusic
	b _0803807E
	.align 2, 0
_08037FF0: .4byte gCurrentSprite
_08037FF4: .4byte gPreviousVerticalCollisionCheck
_08037FF8:
	movs r0, #0x31
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	ldr r1, _08038024 @ =sSpritesFallingSpeedFast
	mov ip, r1
	lsls r0, r2, #1
	add r0, ip
	ldrh r3, [r0]
	mov sb, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08038028 @ =0x00007FFF
	cmp r1, r0
	bne _0803802C
	subs r1, r2, #1
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038036
	.align 2, 0
_08038024: .4byte sSpritesFallingSpeedFast
_08038028: .4byte 0x00007FFF
_0803802C:
	adds r0, r2, #1
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	add r0, sb
_08038036:
	strh r0, [r4, #2]
	movs r1, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803804E
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x34
	bl ParticleSet
	b _0803807E
_0803804E:
	adds r0, r7, #4
	ands r0, r1
	cmp r0, #0
	bne _08038066
	adds r0, r5, #0
	subs r0, #0xa0
	adds r1, r6, #0
	adds r1, #0x28
	movs r2, #0x33
	bl ParticleSet
	b _0803807E
_08038066:
	adds r0, r7, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803807E
	adds r0, r5, #0
	subs r0, #0x82
	adds r1, r6, #0
	subs r1, #0x28
	movs r2, #0x33
	bl ParticleSet
_0803807E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxFallingDebrisInit
BoxFallingDebrisInit: @ 0x0803808C
	push {r4, lr}
	ldr r3, _080380D0 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _080380D4 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r4, #0
	strh r0, [r3]
	ldr r1, _080380D8 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	ldrb r0, [r3, #0x1e]
	cmp r0, #8
	bls _080380C6
	b _080382E8
_080380C6:
	lsls r0, r0, #2
	ldr r1, _080380DC @ =_080380E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080380D0: .4byte gCurrentSprite
_080380D4: .4byte 0x0000FFFB
_080380D8: .4byte 0x0000FFFC
_080380DC: .4byte _080380E0
_080380E0: @ jump table
	.4byte _08038104 @ case 0
	.4byte _08038160 @ case 1
	.4byte _0803818C @ case 2
	.4byte _080381BC @ case 3
	.4byte _080381EC @ case 4
	.4byte _0803821C @ case 5
	.4byte _0803824C @ case 6
	.4byte _08038280 @ case 7
	.4byte _080382A8 @ case 8
_08038104:
	ldr r3, _08038154 @ =gCurrentSprite
	ldr r0, _08038158 @ =0x08347FB8
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x29
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _0803815C @ =0x0000FF78
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	adds r0, #0x84
	strh r0, [r3, #0xe]
	movs r0, #0x44
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
	strh r0, [r3, #0x14]
	adds r2, #0xb
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038154: .4byte gCurrentSprite
_08038158: .4byte 0x08347FB8
_0803815C: .4byte 0x0000FF78
_08038160:
	ldr r4, _08038184 @ =gCurrentSprite
	ldr r0, _08038188 @ =0x08347FC8
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #5
	b _080382CA
	.align 2, 0
_08038184: .4byte gCurrentSprite
_08038188: .4byte 0x08347FC8
_0803818C:
	ldr r2, _080381B4 @ =gCurrentSprite
	ldr r0, _080381B8 @ =0x08347FD8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x28
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381B4: .4byte gCurrentSprite
_080381B8: .4byte 0x08347FD8
_080381BC:
	ldr r2, _080381E4 @ =gCurrentSprite
	ldr r0, _080381E8 @ =0x08347FE8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381E4: .4byte gCurrentSprite
_080381E8: .4byte 0x08347FE8
_080381EC:
	ldr r2, _08038214 @ =gCurrentSprite
	ldr r0, _08038218 @ =0x08347FF8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038214: .4byte gCurrentSprite
_08038218: .4byte 0x08347FF8
_0803821C:
	ldr r4, _08038244 @ =gCurrentSprite
	ldr r0, _08038248 @ =0x08348008
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	b _080382CC
	.align 2, 0
_08038244: .4byte gCurrentSprite
_08038248: .4byte 0x08348008
_0803824C:
	ldr r2, _08038278 @ =gCurrentSprite
	ldr r0, _0803827C @ =0x08348018
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038278: .4byte gCurrentSprite
_0803827C: .4byte 0x08348018
_08038280:
	ldr r2, _080382A0 @ =gCurrentSprite
	ldr r0, _080382A4 @ =0x08348028
	str r0, [r2, #0x18]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080382A0: .4byte gCurrentSprite
_080382A4: .4byte 0x08348028
_080382A8:
	ldr r4, _080382E0 @ =gCurrentSprite
	ldr r0, _080382E4 @ =0x08348038
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
_080382CA:
	movs r0, #0x3c
_080382CC:
	strb r0, [r1]
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	bne _080382EA
	ldrh r0, [r4, #2]
	adds r0, #0xc0
	strh r0, [r4, #2]
	b _080382EA
	.align 2, 0
_080382E0: .4byte gCurrentSprite
_080382E4: .4byte 0x08348038
_080382E8:
	strh r4, [r3]
_080382EA:
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	beq _08038300
	ldr r0, _080382FC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	b _08038306
	.align 2, 0
_080382FC: .4byte gCurrentSprite
_08038300:
	ldr r0, _08038310 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
_08038306:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038310: .4byte gCurrentSprite

	thumb_func_start BoxFallingDebrisFalling
BoxFallingDebrisFalling: @ 0x08038314
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08038334 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038338
	subs r0, #1
	strb r0, [r1]
	b _08038542
	.align 2, 0
_08038334: .4byte gCurrentSprite
_08038338:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r6, [r1]
	ldrh r7, [r4, #2]
	ldrh r0, [r4, #4]
	mov r8, r0
	ldrb r5, [r4, #0x1e]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _08038358
	adds r0, #1
	strb r0, [r1]
_08038358:
	ldrb r0, [r1]
	cmp r0, #0x32
	bls _080383DE
	adds r0, r7, #0
	mov r1, r8
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08038398 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080383DE
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	cmp r5, #0
	bne _0803839C
	movs r1, #0x81
	bl ScreenShakeStartVertical
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x31
	bl ParticleSet
	mov r1, r8
	adds r1, #0x20
	adds r0, r7, #0
	b _080383A8
	.align 2, 0
_08038398: .4byte gPreviousVerticalCollisionCheck
_0803839C:
	cmp r5, #1
	beq _080383A4
	cmp r5, #6
	bne _080383B0
_080383A4:
	adds r0, r7, #0
	mov r1, r8
_080383A8:
	movs r2, #0x31
	bl ParticleSet
	b _08038542
_080383B0:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080383BE
	cmp r5, #7
	bne _080383D2
_080383BE:
	mov r1, r8
	subs r1, #0x10
	adds r0, r7, #0
	movs r2, #0x27
	bl ParticleSet
	mov r1, r8
	adds r1, #0x10
	adds r0, r7, #0
	b _080383D6
_080383D2:
	adds r0, r7, #0
	mov r1, r8
_080383D6:
	movs r2, #0x27
	bl ParticleSet
	b _08038542
_080383DE:
	cmp r5, #0
	bne _0803845C
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080383F8
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x31
	bl ParticleSet
	b _08038426
_080383F8:
	adds r0, r6, #4
	ands r0, r1
	cmp r0, #0
	bne _08038410
	adds r0, r7, #0
	subs r0, #0xa0
	mov r1, r8
	adds r1, #0x32
	movs r2, #0x2e
	bl ParticleSet
	b _08038426
_08038410:
	adds r0, r6, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08038426
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x33
	bl ParticleSet
_08038426:
	ldr r3, _08038450 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038454 @ =sSpritesFallingSpeedFast
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038458 @ =0x00007FFF
	cmp r1, r0
	beq _08038442
	b _08038538
_08038442:
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_08038450: .4byte gCurrentSprite
_08038454: .4byte sSpritesFallingSpeedFast
_08038458: .4byte 0x00007FFF
_0803845C:
	cmp r5, #1
	beq _08038464
	cmp r5, #6
	bne _080384AC
_08038464:
	movs r0, #0x1f
	ands r6, r0
	cmp r6, #0
	bne _08038476
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x27
	bl ParticleSet
_08038476:
	ldr r3, _080384A0 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384A4 @ =sSpritesFallingSpeedQuickAcceleration
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080384A8 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384A0: .4byte gCurrentSprite
_080384A4: .4byte sSpritesFallingSpeedQuickAcceleration
_080384A8: .4byte 0x00007FFF
_080384AC:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080384BA
	cmp r5, #7
	bne _08038504
_080384BA:
	adds r0, r6, #7
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080384CE
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x33
	bl ParticleSet
_080384CE:
	ldr r3, _080384F8 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384FC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038500 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384F8: .4byte gCurrentSprite
_080384FC: .4byte sSpritesFallingSpeed
_08038500: .4byte 0x00007FFF
_08038504:
	ldr r3, _0803852C @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038530 @ =sSpritesFallingSpeedSlow
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038534 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_0803852C: .4byte gCurrentSprite
_08038530: .4byte sSpritesFallingSpeedSlow
_08038534: .4byte 0x00007FFF
_08038538:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08038540:
	strh r0, [r3, #2]
_08038542:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Box
Box: @ 0x0803854C
	push {lr}
	ldr r0, _08038564 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _0803855A
	b _0803878A
_0803855A:
	lsls r0, r0, #2
	ldr r1, _08038568 @ =_0803856C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038564: .4byte gCurrentSprite
_08038568: .4byte _0803856C
_0803856C: @ jump table
	.4byte _080386A8 @ case 0
	.4byte _080386AE @ case 1
	.4byte _080386B2 @ case 2
	.4byte _0803878A @ case 3
	.4byte _0803878A @ case 4
	.4byte _0803878A @ case 5
	.4byte _0803878A @ case 6
	.4byte _080386EA @ case 7
	.4byte _080386EE @ case 8
	.4byte _0803878A @ case 9
	.4byte _0803878A @ case 10
	.4byte _0803878A @ case 11
	.4byte _0803878A @ case 12
	.4byte _0803878A @ case 13
	.4byte _0803878A @ case 14
	.4byte _0803878A @ case 15
	.4byte _0803878A @ case 16
	.4byte _0803878A @ case 17
	.4byte _0803878A @ case 18
	.4byte _0803878A @ case 19
	.4byte _0803878A @ case 20
	.4byte _0803878A @ case 21
	.4byte _0803878A @ case 22
	.4byte _080386B8 @ case 23
	.4byte _080386BC @ case 24
	.4byte _080386C2 @ case 25
	.4byte _080386C6 @ case 26
	.4byte _080386CC @ case 27
	.4byte _080386D0 @ case 28
	.4byte _080386D6 @ case 29
	.4byte _080386DA @ case 30
	.4byte _080386E0 @ case 31
	.4byte _080386E4 @ case 32
	.4byte _0803878A @ case 33
	.4byte _0803878A @ case 34
	.4byte _0803878A @ case 35
	.4byte _0803878A @ case 36
	.4byte _0803878A @ case 37
	.4byte _0803878A @ case 38
	.4byte _08038726 @ case 39
	.4byte _0803872A @ case 40
	.4byte _08038730 @ case 41
	.4byte _08038734 @ case 42
	.4byte _0803878A @ case 43
	.4byte _0803873A @ case 44
	.4byte _0803878A @ case 45
	.4byte _08038740 @ case 46
	.4byte _0803878A @ case 47
	.4byte _0803878A @ case 48
	.4byte _0803878A @ case 49
	.4byte _0803878A @ case 50
	.4byte _0803878A @ case 51
	.4byte _0803878A @ case 52
	.4byte _0803878A @ case 53
	.4byte _0803878A @ case 54
	.4byte _080386F4 @ case 55
	.4byte _080386F8 @ case 56
	.4byte _08038708 @ case 57
	.4byte _0803870C @ case 58
	.4byte _08038712 @ case 59
	.4byte _08038716 @ case 60
	.4byte _0803871C @ case 61
	.4byte _08038720 @ case 62
	.4byte _08038746 @ case 63
	.4byte _0803874A @ case 64
	.4byte _08038750 @ case 65
	.4byte _08038754 @ case 66
	.4byte _0803875A @ case 67
	.4byte _0803875E @ case 68
	.4byte _08038764 @ case 69
	.4byte _08038768 @ case 70
	.4byte _0803876E @ case 71
	.4byte _08038772 @ case 72
	.4byte _08038778 @ case 73
	.4byte _0803877C @ case 74
	.4byte _080386FE @ case 75
	.4byte _08038702 @ case 76
	.4byte _08038782 @ case 77
	.4byte _08038786 @ case 78
_080386A8:
	bl BoxInit
	b _0803878A
_080386AE:
	bl BoxCrawlingInit
_080386B2:
	bl BoxCrawling
	b _0803878A
_080386B8:
	bl BoxWaitingToRunInit
_080386BC:
	bl BoxWaitingToRun
	b _0803878A
_080386C2:
	bl BoxSlowRunningInit
_080386C6:
	bl BoxSlowRun
	b _0803878A
_080386CC:
	bl BoxFastRunInit
_080386D0:
	bl BoxFastRun
	b _0803878A
_080386D6:
	bl BoxSkiddingInit
_080386DA:
	bl BoxSkidding
	b _0803878A
_080386E0:
	bl BoxStopSkiddingInit
_080386E4:
	bl BoxStopSkidding
	b _0803878A
_080386EA:
	bl BoxFinishedCrawlingInit
_080386EE:
	bl BoxFinishedCrawling
	b _0803878A
_080386F4:
	bl BoxBonkingInit
_080386F8:
	bl BoxBonking
	b _0803878A
_080386FE:
	bl BoxLandingFromBonkInit
_08038702:
	bl BoxLandingFromBonk
	b _0803878A
_08038708:
	bl BoxLandingInit
_0803870C:
	bl BoxLanding
	b _0803878A
_08038712:
	bl BoxJumpWarningInit
_08038716:
	bl BoxJumpWarning
	b _0803878A
_0803871C:
	bl BoxJumpingInit
_08038720:
	bl BoxJumping
	b _0803878A
_08038726:
	bl BoxStoppingToFireBombInit
_0803872A:
	bl BoxStoppingToFireBomb
	b _0803878A
_08038730:
	bl BoxLoweringToFireBombInit
_08038734:
	bl BoxLoweringToFireBomb
	b _0803878A
_0803873A:
	bl BoxFiringBomb
	b _0803878A
_08038740:
	bl BoxDoneFiringBomb
	b _0803878A
_08038746:
	bl BoxWaitingToEmergeInit
_0803874A:
	bl BoxWaitingToEmerge
	b _0803878A
_08038750:
	bl BoxFirstJumpInit
_08038754:
	bl BoxFirstJump
	b _0803878A
_0803875A:
	bl BoxDyingInit
_0803875E:
	bl BoxDying
	b _0803878A
_08038764:
	bl BoxMovingToFinalJumpInit
_08038768:
	bl BoxMovingToFinalJump
	b _0803878A
_0803876E:
	bl BoxWaitingForFinalJumpInit
_08038772:
	bl BoxWaitingForFinalJump
	b _0803878A
_08038778:
	bl BoxCrouchingForFinalJumpInit
_0803877C:
	bl BoxCrouchingForFinalJump
	b _0803878A
_08038782:
	bl BoxFinalJumpInit
_08038786:
	bl BoxFinalJump
_0803878A:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxPart
BoxPart: @ 0x08038798
	push {r4, lr}
	ldr r0, _080387B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080387B4
	bl BoxPartInit
	b _0803887C
	.align 2, 0
_080387B0: .4byte gCurrentSprite
_080387B4:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	beq _080387F4
	cmp r0, #2
	bgt _080387C4
	cmp r0, #0
	beq _080387CE
	b _0803885C
_080387C4:
	cmp r0, #6
	beq _0803881C
	cmp r0, #8
	beq _08038834
	b _0803885C
_080387CE:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _080387F0 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _080387E6
	strb r3, [r4]
_080387E6:
	bl BoxPartFrontLeftLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_080387F0: .4byte gSubSpriteData1
_080387F4:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038818 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803880C
	strb r3, [r4]
_0803880C:
	bl BoxPartFrontRightLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038818: .4byte gSubSpriteData1
_0803881C:
	ldr r0, _08038830 @ =gSubSpriteData1
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl BoxPartCenter
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038830: .4byte gSubSpriteData1
_08038834:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038858 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803884C
	strb r3, [r4]
_0803884C:
	bl BoxPartCenterBottom
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038858: .4byte gSubSpriteData1
_0803885C:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038884 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08038874
	strb r3, [r4]
_08038874:
	bl BoxPartDefault
	bl BoxSyncSubSprites
_0803887C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038884: .4byte gSubSpriteData1

	thumb_func_start BoxMissile
BoxMissile: @ 0x08038888
	push {lr}
	ldr r0, _080388A0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388B4
	cmp r0, #2
	bgt _080388A4
	cmp r0, #0
	beq _080388AE
	b _080388C4
	.align 2, 0
_080388A0: .4byte gCurrentSprite
_080388A4:
	cmp r0, #0x18
	beq _080388BA
	cmp r0, #0x37
	beq _080388C0
	b _080388C4
_080388AE:
	bl BoxMissileInit
	b _080388C4
_080388B4:
	bl BoxMissileSpawning
	b _080388C4
_080388BA:
	bl BoxMissileMoving
	b _080388C4
_080388C0:
	bl BoxMissileExploding
_080388C4:
	pop {r0}
	bx r0

	thumb_func_start BoxBomb
BoxBomb: @ 0x080388C8
	push {lr}
	ldr r0, _080388E0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388F4
	cmp r0, #2
	bgt _080388E4
	cmp r0, #0
	beq _080388EE
	b _08038904
	.align 2, 0
_080388E0: .4byte gCurrentSprite
_080388E4:
	cmp r0, #0x18
	beq _080388FA
	cmp r0, #0x37
	beq _08038900
	b _08038904
_080388EE:
	bl BoxBombInit
	b _08038904
_080388F4:
	bl BoxBombMoving
	b _08038904
_080388FA:
	bl BoxBombLanded
	b _08038904
_08038900:
	bl BoxBombExploding
_08038904:
	pop {r0}
	bx r0

	thumb_func_start BoxFire
BoxFire: @ 0x08038908
	push {lr}
	ldr r0, _08038920 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803892E
	cmp r0, #2
	bgt _08038924
	cmp r0, #0
	beq _0803892A
	b _08038938
	.align 2, 0
_08038920: .4byte gCurrentSprite
_08038924:
	cmp r0, #0x18
	beq _08038934
	b _08038938
_0803892A:
	bl BoxFireInit
_0803892E:
	bl BoxFireMovingHigh
	b _08038938
_08038934:
	bl BoxFireMovingLow
_08038938:
	pop {r0}
	bx r0

	thumb_func_start BoxDebris
BoxDebris: @ 0x0803893C
	push {lr}
	ldr r0, _08038954 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _080389EC
	lsls r0, r0, #2
	ldr r1, _08038958 @ =_0803895C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038954: .4byte gCurrentSprite
_08038958: .4byte _0803895C
_0803895C: @ jump table
	.4byte _080389D0 @ case 0
	.4byte _080389EC @ case 1
	.4byte _080389D6 @ case 2
	.4byte _080389EC @ case 3
	.4byte _080389EC @ case 4
	.4byte _080389EC @ case 5
	.4byte _080389EC @ case 6
	.4byte _080389EC @ case 7
	.4byte _080389EC @ case 8
	.4byte _080389EC @ case 9
	.4byte _080389EC @ case 10
	.4byte _080389EC @ case 11
	.4byte _080389EC @ case 12
	.4byte _080389EC @ case 13
	.4byte _080389EC @ case 14
	.4byte _080389EC @ case 15
	.4byte _080389EC @ case 16
	.4byte _080389EC @ case 17
	.4byte _080389EC @ case 18
	.4byte _080389EC @ case 19
	.4byte _080389EC @ case 20
	.4byte _080389EC @ case 21
	.4byte _080389EC @ case 22
	.4byte _080389EC @ case 23
	.4byte _080389DC @ case 24
	.4byte _080389EC @ case 25
	.4byte _080389E2 @ case 26
	.4byte _080389EC @ case 27
	.4byte _080389E8 @ case 28
_080389D0:
	bl BoxDebrisInit
	b _080389EC
_080389D6:
	bl BoxDebrisIdle
	b _080389EC
_080389DC:
	bl BoxDebrisFallingInit
	b _080389EC
_080389E2:
	bl BoxDebrisWaitToFall
	b _080389EC
_080389E8:
	bl BoxDebrisFalling
_080389EC:
	pop {r0}
	bx r0

	thumb_func_start BoxFallingDebris
BoxFallingDebris: @ 0x080389F0
	push {lr}
	ldr r0, _08038A04 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038A08
	cmp r0, #2
	beq _08038A0E
	b _08038A12
	.align 2, 0
_08038A04: .4byte gCurrentSprite
_08038A08:
	bl BoxFallingDebrisInit
	b _08038A12
_08038A0E:
	bl BoxFallingDebrisFalling
_08038A12:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerudaYMovement
GerudaYMovement: @ 0x08038A18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _08038A48 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08038A50
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038A4C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08038A62
	ldrh r0, [r4, #2]
	adds r0, r5, r0
	b _08038A70
	.align 2, 0
_08038A48: .4byte gCurrentSprite
_08038A4C: .4byte gPreviousCollisionCheck
_08038A50:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038A68 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08038A6C
_08038A62:
	movs r0, #1
	b _08038A74
	.align 2, 0
_08038A68: .4byte gPreviousCollisionCheck
_08038A6C:
	ldrh r0, [r4, #2]
	subs r0, r0, r6
_08038A70:
	strh r0, [r4, #2]
	movs r0, #0
_08038A74:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerudaXMovement
GerudaXMovement: @ 0x08038A7C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _08038ABC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038AC4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08038AC0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #4]
	adds r0, r6, r0
	b _08038AF8
	.align 2, 0
_08038ABC: .4byte gCurrentSprite
_08038AC0: .4byte gPreviousCollisionCheck
_08038AC4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08038AF0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08038AF4
_08038AEA:
	movs r0, #1
	b _08038AFC
	.align 2, 0
_08038AF0: .4byte gPreviousCollisionCheck
_08038AF4:
	ldrh r0, [r4, #4]
	subs r0, r0, r7
_08038AF8:
	strh r0, [r4, #4]
	movs r0, #0
_08038AFC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerudaSetIdleSideHitboxes
GerudaSetIdleSideHitboxes: @ 0x08038B04
	push {lr}
	ldr r2, _08038B20 @ =gCurrentSprite
	ldr r3, _08038B24 @ =0x0000FFE0
	strh r3, [r2, #0xa]
	movs r0, #0x40
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08038B28
	strh r3, [r2, #0xe]
	movs r0, #0x30
	b _08038B2E
	.align 2, 0
_08038B20: .4byte gCurrentSprite
_08038B24: .4byte 0x0000FFE0
_08038B28:
	ldr r0, _08038B34 @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_08038B2E:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08038B34: .4byte 0x0000FFD0

	thumb_func_start GerudaSetAttackingSideHitboxes
GerudaSetAttackingSideHitboxes: @ 0x08038B38
	push {lr}
	ldr r2, _08038B54 @ =gCurrentSprite
	ldr r3, _08038B58 @ =0x0000FFE0
	strh r3, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038B5C
	strh r3, [r2, #0xe]
	movs r0, #0x50
	b _08038B62
	.align 2, 0
_08038B54: .4byte gCurrentSprite
_08038B58: .4byte 0x0000FFE0
_08038B5C:
	ldr r0, _08038B68 @ =0x0000FFB0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_08038B62:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08038B68: .4byte 0x0000FFB0

	thumb_func_start GerudaUpdateLungingAnimation
GerudaUpdateLungingAnimation: @ 0x08038B6C
	push {lr}
	movs r0, #0xe0
	movs r1, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAE
	ldr r1, _08038B90 @ =gCurrentSprite
	ldr r0, [r1, #0x18]
	ldr r2, _08038B94 @ =0x08348C64
	cmp r0, r2
	beq _08038B98
	str r2, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	b _08038BE0
	.align 2, 0
_08038B90: .4byte gCurrentSprite
_08038B94: .4byte 0x08348C64
_08038B98:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _08038BE0
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _08038BE0
	movs r0, #0xc6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _08038BE0
_08038BAE:
	ldr r2, _08038BE4 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _08038BE8 @ =0x08348C64
	cmp r1, r0
	bne _08038BE0
	ldrh r0, [r2, #0x16]
	cmp r0, #0
	bne _08038BCC
	ldrb r0, [r2, #0x1c]
	cmp r0, #4
	bne _08038BCC
	movs r0, #0xc6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08038BCC:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08038BE0
	ldr r0, _08038BE4 @ =gCurrentSprite
	ldr r1, _08038BEC @ =0x08348C54
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
_08038BE0:
	pop {r0}
	bx r0
	.align 2, 0
_08038BE4: .4byte gCurrentSprite
_08038BE8: .4byte 0x08348C64
_08038BEC: .4byte 0x08348C54

	thumb_func_start GerudaInit
GerudaInit: @ 0x08038BF0
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08038C1C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08038C20
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08038C20
	strh r0, [r2]
	b _08038C84
	.align 2, 0
_08038C1C: .4byte gCurrentSprite
_08038C20:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r5, _08038C74 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x27
	movs r4, #0
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
	bl GerudaSetIdleSideHitboxes
	ldr r0, _08038C78 @ =0x08348C1C
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r2, _08038C7C @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08038C80
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _08038C84
	.align 2, 0
_08038C74: .4byte gCurrentSprite
_08038C78: .4byte 0x08348C1C
_08038C7C: .4byte sPrimarySpriteStats
_08038C80:
	movs r0, #1
	strb r0, [r1]
_08038C84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerudaIdleInit
GerudaIdleInit: @ 0x08038C8C
	ldr r3, _08038CB0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _08038CB4 @ =0x08348C1C
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08038CB0: .4byte gCurrentSprite
_08038CB4: .4byte 0x08348C1C

	thumb_func_start GerudaIdle
GerudaIdle: @ 0x08038CB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08038D28 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08038CCE
	b _08038E98
_08038CCE:
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r0, [r4]
	cmp r0, #0x23
	bhi _08038CEE
	ldrh r0, [r2, #2]
	adds r0, #0x40
	ldrh r1, [r2, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038D2C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038CEE
	movs r0, #0x24
	strb r0, [r4]
_08038CEE:
	ldr r4, _08038D28 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038D30 @ =0x083480C8
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038D34 @ =0x00007FFF
	cmp r1, r0
	bne _08038D0C
	ldrh r3, [r5]
	movs r2, #0
_08038D0C:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	movs r0, #1
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D38
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038D28: .4byte gCurrentSprite
_08038D2C: .4byte gPreviousCollisionCheck
_08038D30: .4byte 0x083480C8
_08038D34: .4byte 0x00007FFF
_08038D38:
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038D56
	cmp r2, #8
	beq _08038D5C
	b _08038E86
_08038D56:
	cmp r2, #4
	beq _08038D5C
	movs r2, #0
_08038D5C:
	cmp r2, #0
	bne _08038D62
	b _08038E86
_08038D62:
	ldr r2, _08038DA4 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08038DA8 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08038DAC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r5, [r2, #2]
	adds r0, r5, #0
	adds r0, #0x64
	adds r4, r2, #0
	mov r8, r1
	cmp r6, r0
	ble _08038DE8
	subs r0, #0x24
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08038DB0 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038DB4
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038DA4: .4byte gCurrentSprite
_08038DA8: .4byte 0x0000F7FF
_08038DAC: .4byte gSamusData
_08038DB0: .4byte gPreviousCollisionCheck
_08038DB4:
	ldrh r0, [r4, #2]
	adds r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038DD2
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
_08038DD2:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _08038E42
_08038DE8:
	adds r0, r5, #0
	subs r0, #0x64
	cmp r6, r0
	bge _08038E3A
	adds r0, #0x24
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08038E10 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038E14
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038E10: .4byte gPreviousCollisionCheck
_08038E14:
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038E32
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
_08038E32:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	b _08038E40
_08038E3A:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
_08038E40:
	strb r0, [r1]
_08038E42:
	strh r5, [r4, #6]
	strh r6, [r4, #8]
	mov r7, r8
	ldrh r6, [r7, #0x16]
	ldrh r5, [r4, #4]
	cmp r5, r6
	bls _08038E54
	subs r0, r5, r6
	b _08038E56
_08038E54:
	subs r0, r6, r5
_08038E56:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r5, r0
	bls _08038E6A
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #8
	b _08038E7C
_08038E6A:
	cmp r5, #0xa0
	bls _08038E76
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #6
	b _08038E7C
_08038E76:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
_08038E7C:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08038E96
_08038E86:
	ldr r1, _08038EA4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
_08038E92:
	adds r1, #0x24
	movs r0, #3
_08038E96:
	strb r0, [r1]
_08038E98:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038EA4: .4byte gCurrentSprite

	thumb_func_start GerudaTurningAroundInit
GerudaTurningAroundInit: @ 0x08038EA8
	ldr r1, _08038EC0 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _08038EC4 @ =0x08348C94
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08038EC0: .4byte gCurrentSprite
_08038EC4: .4byte 0x08348C94

	thumb_func_start GerudaTurningAround
GerudaTurningAround: @ 0x08038EC8
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _08038EE4
	ldr r2, _08038EE8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_08038EE4:
	pop {r0}
	bx r0
	.align 2, 0
_08038EE8: .4byte gCurrentSprite

	thumb_func_start GerudaAttackWarningInit
GerudaAttackWarningInit: @ 0x08038EEC
	push {lr}
	ldr r1, _08038F08 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _08038F0C @ =0x08348C44
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl GerudaSetAttackingSideHitboxes
	pop {r0}
	bx r0
	.align 2, 0
_08038F08: .4byte gCurrentSprite
_08038F0C: .4byte 0x08348C44

	thumb_func_start GerudaAttackWarning
GerudaAttackWarning: @ 0x08038F10
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08038F34
	ldr r0, _08038F38 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	ldr r1, _08038F3C @ =0x08348C54
	str r1, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x2c
	strb r1, [r2]
	adds r0, #0x2e
	movs r1, #0xb4
	strb r1, [r0]
_08038F34:
	pop {r0}
	bx r0
	.align 2, 0
_08038F38: .4byte gCurrentSprite
_08038F3C: .4byte 0x08348C54

	thumb_func_start GerudaAttacking
GerudaAttacking: @ 0x08038F40
	push {r4, r5, lr}
	bl GerudaUpdateLungingAnimation
	movs r5, #0
	ldr r4, _08038F84 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038F92
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl GerudaXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08038F8C
	ldrh r0, [r4, #2]
	ldrh r2, [r4, #8]
	cmp r0, r2
	blo _08038FB6
	ldr r0, _08038F88 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r4]
	b _08038FB6
	.align 2, 0
_08038F84: .4byte gCurrentSprite
_08038F88: .4byte 0x0000F7FF
_08038F8C:
	ldrh r0, [r4, #2]
	ldrh r4, [r4, #6]
	b _08038FAC
_08038F92:
	cmp r0, #1
	bne _08038FCA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FA8
	movs r5, #1
_08038FA8:
	ldrh r0, [r4, #2]
	ldrh r4, [r4, #8]
_08038FAC:
	cmp r0, r4
	bhi _08038FB6
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08038FB6:
	movs r0, #4
	bl GerudaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FD8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08038FD8
_08038FCA:
	movs r0, #8
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FD8
	movs r5, #1
_08038FD8:
	ldr r2, _08039010 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038FF0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08038FF0:
	cmp r5, #0
	beq _0803903C
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08039018
	ldr r1, _08039014 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08039030
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08039036
	.align 2, 0
_08039010: .4byte gCurrentSprite
_08039014: .4byte gSamusData
_08039018:
	ldr r1, _0803902C @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08039030
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08039036
	.align 2, 0
_0803902C: .4byte gSamusData
_08039030:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
_08039036:
	strb r0, [r1]
	bl GerudaSetIdleSideHitboxes
_0803903C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Geruda
Geruda: @ 0x08039044
	push {r4, lr}
	ldr r4, _0803906C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803905C
	ldr r0, _08039070 @ =0x0000018D
	bl SoundPlayNotAlreadyPlaying
_0803905C:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039074
	bl SpriteUtilUpdateFreezeTimer
	b _08039242
	.align 2, 0
_0803906C: .4byte gCurrentSprite
_08039070: .4byte 0x0000018D
_08039074:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08039080
	b _08039242
_08039080:
	lsls r0, r0, #2
	ldr r1, _0803908C @ =_08039090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803908C: .4byte _08039090
_08039090: @ jump table
	.4byte _08039200 @ case 0
	.4byte _08039206 @ case 1
	.4byte _0803920A @ case 2
	.4byte _08039210 @ case 3
	.4byte _08039214 @ case 4
	.4byte _08039242 @ case 5
	.4byte _08039242 @ case 6
	.4byte _08039242 @ case 7
	.4byte _08039242 @ case 8
	.4byte _08039242 @ case 9
	.4byte _08039242 @ case 10
	.4byte _08039242 @ case 11
	.4byte _08039242 @ case 12
	.4byte _08039242 @ case 13
	.4byte _08039242 @ case 14
	.4byte _08039242 @ case 15
	.4byte _08039242 @ case 16
	.4byte _08039242 @ case 17
	.4byte _08039242 @ case 18
	.4byte _08039242 @ case 19
	.4byte _08039242 @ case 20
	.4byte _08039242 @ case 21
	.4byte _08039242 @ case 22
	.4byte _08039242 @ case 23
	.4byte _08039242 @ case 24
	.4byte _08039242 @ case 25
	.4byte _08039242 @ case 26
	.4byte _08039242 @ case 27
	.4byte _08039242 @ case 28
	.4byte _08039242 @ case 29
	.4byte _08039242 @ case 30
	.4byte _08039242 @ case 31
	.4byte _08039242 @ case 32
	.4byte _08039242 @ case 33
	.4byte _08039242 @ case 34
	.4byte _08039242 @ case 35
	.4byte _08039242 @ case 36
	.4byte _08039242 @ case 37
	.4byte _08039242 @ case 38
	.4byte _08039242 @ case 39
	.4byte _08039242 @ case 40
	.4byte _0803921A @ case 41
	.4byte _0803921E @ case 42
	.4byte _08039242 @ case 43
	.4byte _08039224 @ case 44
	.4byte _08039242 @ case 45
	.4byte _08039242 @ case 46
	.4byte _08039242 @ case 47
	.4byte _08039242 @ case 48
	.4byte _08039242 @ case 49
	.4byte _08039242 @ case 50
	.4byte _08039242 @ case 51
	.4byte _08039242 @ case 52
	.4byte _08039242 @ case 53
	.4byte _08039242 @ case 54
	.4byte _08039242 @ case 55
	.4byte _08039242 @ case 56
	.4byte _08039242 @ case 57
	.4byte _08039242 @ case 58
	.4byte _08039242 @ case 59
	.4byte _08039242 @ case 60
	.4byte _08039242 @ case 61
	.4byte _08039242 @ case 62
	.4byte _08039242 @ case 63
	.4byte _08039242 @ case 64
	.4byte _08039242 @ case 65
	.4byte _08039242 @ case 66
	.4byte _08039242 @ case 67
	.4byte _08039242 @ case 68
	.4byte _08039242 @ case 69
	.4byte _08039242 @ case 70
	.4byte _08039242 @ case 71
	.4byte _08039242 @ case 72
	.4byte _08039242 @ case 73
	.4byte _08039242 @ case 74
	.4byte _08039242 @ case 75
	.4byte _08039242 @ case 76
	.4byte _08039242 @ case 77
	.4byte _08039242 @ case 78
	.4byte _08039242 @ case 79
	.4byte _08039242 @ case 80
	.4byte _08039242 @ case 81
	.4byte _08039242 @ case 82
	.4byte _08039242 @ case 83
	.4byte _08039242 @ case 84
	.4byte _08039242 @ case 85
	.4byte _08039242 @ case 86
	.4byte _0803922A @ case 87
	.4byte _0803922E @ case 88
	.4byte _08039234 @ case 89
	.4byte _08039238 @ case 90
	.4byte _0803923E @ case 91
_08039200:
	bl GerudaInit
	b _08039242
_08039206:
	bl GerudaIdleInit
_0803920A:
	bl GerudaIdle
	b _08039242
_08039210:
	bl GerudaTurningAroundInit
_08039214:
	bl GerudaTurningAround
	b _08039242
_0803921A:
	bl GerudaAttackWarningInit
_0803921E:
	bl GerudaAttackWarning
	b _08039242
_08039224:
	bl GerudaAttacking
	b _08039242
_0803922A:
	bl SpriteDyingInit
_0803922E:
	bl SpriteDying
	b _08039242
_08039234:
	bl GerudaInit
_08039238:
	bl SpriteSpawningFromX
	b _08039242
_0803923E:
	bl XParasiteInit
_08039242:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MiscPadInit
MiscPadInit: @ 0x08039248
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r5, #0
	ldr r3, _0803929C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _080392A0 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r3, #0x1d]
	adds r4, r3, #0
	cmp r0, #0x66
	beq _080392B4
	cmp r0, #0x66
	bgt _080392A4
	cmp r0, #0x65
	beq _080392AE
	b _080392FC
	.align 2, 0
_0803929C: .4byte gCurrentSprite
_080392A0: .4byte 0x0000FFFC
_080392A4:
	cmp r0, #0x67
	beq _080392DC
	cmp r0, #0x68
	beq _080392E6
	b _080392FC
_080392AE:
	bl EventCheckOn_EnteredPumpControlUnit
	b _080392E0
_080392B4:
	bl EventCheckOn_Meltdown
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08039302
	ldrb r1, [r4, #0x1e]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x53
	movs r2, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
	movs r5, #0
	b _08039302
_080392DC:
	bl EventCheckOn_SpaceJumpRecovered
_080392E0:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08039302
_080392E6:
	bl EventCheckOn_NavigationRoomLeavingPyr2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080392F8 @ =gAbilityRestingXPosition
	ldrh r0, [r4, #4]
	strh r0, [r1]
	b _08039302
	.align 2, 0
_080392F8: .4byte gAbilityRestingXPosition
_080392FC:
	movs r0, #0
	strh r0, [r4]
	b _0803937E
_08039302:
	ldr r4, _08039330 @ =gCurrentSprite
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x33
	movs r1, #0
	bl SpriteSpawnSecondary
	cmp r5, #0
	beq _08039334
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	b _0803933A
	.align 2, 0
_08039330: .4byte gCurrentSprite
_08039334:
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
_0803933A:
	ldr r6, _08039388 @ =gCurrentSprite
	ldrb r0, [r6, #0x1d]
	cmp r0, #0x68
	bne _0803937E
	adds r7, r6, #0
	adds r7, #0x23
	ldrb r3, [r7]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	ldr r5, _0803938C @ =0xFFFFFF00
	adds r0, r0, r5
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0x68
	movs r1, #0
	movs r2, #4
	bl SpriteSpawnSecondary
	ldrb r3, [r7]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x67
	movs r1, #0
	movs r2, #4
	bl SpriteSpawnSecondary
	ldr r1, _08039390 @ =gBossWork2
	strb r0, [r1]
_0803937E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039388: .4byte gCurrentSprite
_0803938C: .4byte 0xFFFFFF00
_08039390: .4byte gBossWork2

	thumb_func_start MiscPadIdleInit
MiscPadIdleInit: @ 0x08039394
	push {lr}
	ldr r1, _080393BC @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080393D4
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080393C4
	ldr r0, _080393C0 @ =0x0834AD8C
	b _080393C6
	.align 2, 0
_080393BC: .4byte gCurrentSprite
_080393C0: .4byte 0x0834AD8C
_080393C4:
	ldr r0, _080393D0 @ =0x0834A0F4
_080393C6:
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _080393EC
	.align 2, 0
_080393D0: .4byte 0x0834A0F4
_080393D4:
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080393E4
	ldr r0, _080393E0 @ =0x0834AD7C
	b _080393E6
	.align 2, 0
_080393E0: .4byte 0x0834AD7C
_080393E4:
	ldr r0, _080393F4 @ =0x0834A0E4
_080393E6:
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_080393EC:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080393F4: .4byte 0x0834A0E4

	thumb_func_start MiscPadIdle
MiscPadIdle: @ 0x080393F8
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _08039448
	ldr r1, _08039420 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0
	bne _08039450
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x68
	bne _08039428
	ldr r0, _08039424 @ =0x0834AD2C
	b _0803942A
	.align 2, 0
_08039420: .4byte gCurrentSprite
_08039424: .4byte 0x0834AD2C
_08039428:
	ldr r0, _08039444 @ =0x0834A094
_0803942A:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, #0xe9
	bl SoundPlay
	b _08039450
	.align 2, 0
_08039444: .4byte 0x0834A094
_08039448:
	ldr r0, _08039454 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_08039450:
	pop {r0}
	bx r0
	.align 2, 0
_08039454: .4byte gCurrentSprite

	thumb_func_start MiscPadPressingSwitch
MiscPadPressingSwitch: @ 0x08039458
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803948A
	ldr r0, _08039470 @ =gCurrentSprite
	ldrb r1, [r0, #0x1d]
	adds r3, r0, #0
	cmp r1, #0x68
	bne _08039478
	ldr r0, _08039474 @ =0x0834AD8C
	b _0803947A
	.align 2, 0
_08039470: .4byte gCurrentSprite
_08039474: .4byte 0x0834AD8C
_08039478:
	ldr r0, _08039490 @ =0x0834A0F4
_0803947A:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_0803948A:
	pop {r0}
	bx r0
	.align 2, 0
_08039490: .4byte 0x0834A0F4

	thumb_func_start MiscPadSwitchPressed
MiscPadSwitchPressed: @ 0x08039494
	push {r4, lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _080394E4
	bl SpriteUtilCheckSamusMorphed
	cmp r0, #0
	bne _08039514
	ldr r2, _080394D8 @ =gSamusData
	ldr r4, _080394DC @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _080394B8
	movs r0, #0
	strb r0, [r2, #5]
_080394B8:
	ldr r1, _080394E0 @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x36
	bl _call_via_r1
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	b _08039514
	.align 2, 0
_080394D8: .4byte gSamusData
_080394DC: .4byte gCurrentSprite
_080394E0: .4byte sSamusSetPoseFunctionPointer
_080394E4:
	ldr r0, _080394F4 @ =gCurrentSprite
	ldrb r1, [r0, #0x1d]
	adds r3, r0, #0
	cmp r1, #0x68
	bne _080394FC
	ldr r0, _080394F8 @ =0x0834AD54
	b _080394FE
	.align 2, 0
_080394F4: .4byte gCurrentSprite
_080394F8: .4byte 0x0834AD54
_080394FC:
	ldr r0, _0803951C @ =0x0834A0BC
_080394FE:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1c
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, #0xe6
	bl SoundPlay
_08039514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803951C: .4byte 0x0834A0BC

	thumb_func_start MiscPadReleasingSwitch
MiscPadReleasingSwitch: @ 0x08039520
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803952E
	bl MiscPadIdleInit
_0803952E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MiscPadSamusInteracting
MiscPadSamusInteracting: @ 0x08039534
	push {r4, lr}
	ldr r2, _08039564 @ =gCurrentSprite
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803957C
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039552
	ldr r0, _08039568 @ =0x00000103
	bl SoundPlay
_08039552:
	ldrb r0, [r4]
	cmp r0, #7
	bhi _0803956C
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #2
	bl SpriteLoadGfx
	b _0803959A
	.align 2, 0
_08039564: .4byte gCurrentSprite
_08039568: .4byte 0x00000103
_0803956C:
	cmp r0, #8
	bne _0803959A
	movs r0, #0x21
	movs r1, #2
	movs r2, #2
	bl SpriteLoadPal
	b _0803959A
_0803957C:
	ldr r1, _080395A0 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x36
	bne _0803959A
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _0803959A
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x3a
	strb r1, [r0]
	movs r0, #0x1e
	strb r0, [r4]
_0803959A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080395A0: .4byte gSamusData

	thumb_func_start MiscPadSpawnMessageBanner
MiscPadSpawnMessageBanner: @ 0x080395A4
	push {lr}
	sub sp, #0xc
	movs r3, #0
	ldr r2, _080395D4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039632
	subs r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	ldrb r1, [r2, #0x1d]
	cmp r1, #0x66
	beq _080395EC
	cmp r1, #0x66
	bgt _080395D8
	cmp r1, #0x65
	beq _080395E2
	b _08039608
	.align 2, 0
_080395D4: .4byte gCurrentSprite
_080395D8:
	cmp r1, #0x67
	beq _080395F6
	cmp r1, #0x68
	beq _08039600
	b _08039608
_080395E2:
	movs r0, #0x20
	bl EventCheckAdvance
	movs r3, #6
	b _0803960C
_080395EC:
	movs r0, #0x3d
	bl EventCheckAdvance
	movs r3, #7
	b _0803960C
_080395F6:
	movs r0, #0x4a
	bl EventCheckAdvance
	movs r3, #9
	b _0803960C
_08039600:
	movs r0, #0x3f
	bl EventCheckAdvance
	movs r3, #8
_08039608:
	cmp r3, #0
	beq _08039632
_0803960C:
	ldr r1, _08039638 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0803963C @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, _08039640 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	adds r1, r3, #0
	movs r2, #2
	movs r3, #0x10
	bl SpriteSpawnPrimary
_08039632:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08039638: .4byte gPreventMovementTimer
_0803963C: .4byte gXParasiteTargetYPosition
_08039640: .4byte gXParasiteTargetXPosition

	thumb_func_start MiscPadAfterInteraction
MiscPadAfterInteraction: @ 0x08039644
	push {lr}
	ldr r1, _08039660 @ =gCurrentSprite
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _08039672
	ldr r0, _08039664 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3b
	bne _08039668
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	b _08039672
	.align 2, 0
_08039660: .4byte gCurrentSprite
_08039664: .4byte gSamusData
_08039668:
	ldr r1, _08039678 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_08039672:
	pop {r0}
	bx r0
	.align 2, 0
_08039678: .4byte gPreventMovementTimer

	thumb_func_start MiscPadInactive
MiscPadInactive: @ 0x0803967C
	bx lr
	.align 2, 0

	thumb_func_start MiscPadWaitForWideBeamCoreX
MiscPadWaitForWideBeamCoreX: @ 0x08039680
	push {r4, lr}
	ldr r4, _080396C8 @ =gCurrentSprite
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x66
	bne _080396C2
	bl EventCheckOn_Meltdown
	cmp r0, #2
	bne _080396C2
	movs r0, #0x57
	bl SpriteUtilCountPrimarySprites
	cmp r0, #0
	bne _080396C2
	ldr r0, _080396CC @ =gPreventMovementTimer
	ldrh r2, [r0]
	cmp r2, #0
	bne _080396C2
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _080396D0 @ =0x0834A0BC
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_080396C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080396C8: .4byte gCurrentSprite
_080396CC: .4byte gPreventMovementTimer
_080396D0: .4byte 0x0834A0BC

	thumb_func_start MiscPadConsoleInit
MiscPadConsoleInit: @ 0x080396D4
	push {r4, r5, lr}
	ldr r0, _0803974C @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r4, [r0]
	mov r2, ip
	ldrh r1, [r2]
	ldr r0, _08039750 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r5, #0
	strh r0, [r2]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039754 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r0, #4
	mov r2, ip
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r5, [r2, #0x16]
	ldr r1, _08039758 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0x1d]
	mov r4, ip
	cmp r1, #0x66
	bne _08039760
	bl EventCheckOn_Meltdown
	cmp r0, #0
	beq _08039790
	ldr r0, _0803975C @ =0x0834A044
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	b _0803979A
	.align 2, 0
_0803974C: .4byte gCurrentSprite
_08039750: .4byte 0x0000FFFB
_08039754: .4byte 0x0000FFFC
_08039758: .4byte gSpriteData
_0803975C: .4byte 0x0834A044
_08039760:
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039784
	cmp r1, #0x68
	bne _08039774
	ldr r0, _08039770 @ =0x0834ACDC
	b _08039776
	.align 2, 0
_08039770: .4byte 0x0834ACDC
_08039774:
	ldr r0, _08039780 @ =0x0834A044
_08039776:
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	b _0803979A
	.align 2, 0
_08039780: .4byte 0x0834A044
_08039784:
	cmp r1, #0x68
	bne _08039790
	ldr r0, _0803978C @ =0x0834AD04
	b _08039792
	.align 2, 0
_0803978C: .4byte 0x0834AD04
_08039790:
	ldr r0, _080397A4 @ =0x0834A06C
_08039792:
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
_0803979A:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080397A4: .4byte 0x0834A06C

	thumb_func_start MiscPadConsoleIdle
MiscPadConsoleIdle: @ 0x080397A8
	push {lr}
	ldr r3, _080397D0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080397D4 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _080397EE
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080397DC
	ldr r0, _080397D8 @ =0x0834AD04
	b _080397DE
	.align 2, 0
_080397D0: .4byte gCurrentSprite
_080397D4: .4byte gSpriteData
_080397D8: .4byte 0x0834AD04
_080397DC:
	ldr r0, _080397F4 @ =0x0834A06C
_080397DE:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_080397EE:
	pop {r0}
	bx r0
	.align 2, 0
_080397F4: .4byte 0x0834A06C

	thumb_func_start MiscPad
MiscPad: @ 0x080397F8
	push {lr}
	ldr r0, _08039818 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _0803980E
	b _0803997A
_0803980E:
	lsls r0, r0, #2
	ldr r1, _0803981C @ =_08039820
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039818: .4byte gCurrentSprite
_0803981C: .4byte _08039820
_08039820: @ jump table
	.4byte _0803993C @ case 0
	.4byte _08039940 @ case 1
	.4byte _08039946 @ case 2
	.4byte _0803997A @ case 3
	.4byte _0803997A @ case 4
	.4byte _0803997A @ case 5
	.4byte _0803997A @ case 6
	.4byte _0803997A @ case 7
	.4byte _0803997A @ case 8
	.4byte _0803997A @ case 9
	.4byte _0803997A @ case 10
	.4byte _0803997A @ case 11
	.4byte _0803997A @ case 12
	.4byte _0803997A @ case 13
	.4byte _0803997A @ case 14
	.4byte _0803997A @ case 15
	.4byte _0803997A @ case 16
	.4byte _0803997A @ case 17
	.4byte _0803997A @ case 18
	.4byte _0803997A @ case 19
	.4byte _0803997A @ case 20
	.4byte _0803997A @ case 21
	.4byte _0803997A @ case 22
	.4byte _0803997A @ case 23
	.4byte _0803994C @ case 24
	.4byte _0803997A @ case 25
	.4byte _08039952 @ case 26
	.4byte _0803997A @ case 27
	.4byte _08039958 @ case 28
	.4byte _0803997A @ case 29
	.4byte _0803995E @ case 30
	.4byte _0803997A @ case 31
	.4byte _08039964 @ case 32
	.4byte _0803997A @ case 33
	.4byte _0803997A @ case 34
	.4byte _0803997A @ case 35
	.4byte _0803997A @ case 36
	.4byte _0803997A @ case 37
	.4byte _0803997A @ case 38
	.4byte _0803997A @ case 39
	.4byte _0803997A @ case 40
	.4byte _0803997A @ case 41
	.4byte _0803997A @ case 42
	.4byte _0803997A @ case 43
	.4byte _0803997A @ case 44
	.4byte _0803997A @ case 45
	.4byte _0803997A @ case 46
	.4byte _0803997A @ case 47
	.4byte _0803997A @ case 48
	.4byte _0803997A @ case 49
	.4byte _0803997A @ case 50
	.4byte _0803997A @ case 51
	.4byte _0803997A @ case 52
	.4byte _0803997A @ case 53
	.4byte _0803997A @ case 54
	.4byte _0803997A @ case 55
	.4byte _0803996A @ case 56
	.4byte _0803997A @ case 57
	.4byte _08039970 @ case 58
	.4byte _0803997A @ case 59
	.4byte _0803997A @ case 60
	.4byte _0803997A @ case 61
	.4byte _0803997A @ case 62
	.4byte _0803997A @ case 63
	.4byte _0803997A @ case 64
	.4byte _0803997A @ case 65
	.4byte _0803997A @ case 66
	.4byte _0803997A @ case 67
	.4byte _0803997A @ case 68
	.4byte _0803997A @ case 69
	.4byte _08039976 @ case 70
_0803993C:
	bl MiscPadInit
_08039940:
	bl MiscPadIdleInit
	b _0803997A
_08039946:
	bl MiscPadIdle
	b _0803997A
_0803994C:
	bl MiscPadPressingSwitch
	b _0803997A
_08039952:
	bl MiscPadSwitchPressed
	b _0803997A
_08039958:
	bl MiscPadReleasingSwitch
	b _0803997A
_0803995E:
	bl MiscPadAfterInteraction
	b _0803997A
_08039964:
	bl MiscPadInactive
	b _0803997A
_0803996A:
	bl MiscPadSamusInteracting
	b _0803997A
_08039970:
	bl MiscPadSpawnMessageBanner
	b _0803997A
_08039976:
	bl MiscPadWaitForWideBeamCoreX
_0803997A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MiscPadConsole
MiscPadConsole: @ 0x08039980
	push {lr}
	ldr r0, _0803999C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080399A0
	cmp r0, #2
	beq _080399A6
	b _080399AA
	.align 2, 0
_0803999C: .4byte gCurrentSprite
_080399A0:
	bl MiscPadConsoleInit
	b _080399AA
_080399A6:
	bl MiscPadConsoleIdle
_080399AA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OperationsRoomPadInit
OperationsRoomPadInit: @ 0x080399B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _08039A38 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r7, #0
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _08039A3C @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x21
	movs r1, #1
	mov r8, r1
	mov r1, r8
	strb r1, [r0]
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x34
	movs r1, #0
	bl SpriteSpawnSecondary
	bl EventCheckOn_SaXDefeated
	adds r5, r0, #0
	cmp r5, #0
	beq _08039A40
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	b _08039A5E
	.align 2, 0
_08039A38: .4byte gCurrentSprite
_08039A3C: .4byte 0x0000FFFC
_08039A40:
	bl EventCheckAfter_OrbitChange
	cmp r0, #0
	beq _08039A68
	adds r0, r4, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
_08039A5E:
	movs r0, #0x35
	movs r1, #0
	bl SpriteSpawnSecondary
	b _08039A70
_08039A68:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
_08039A70:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadIdleInit
OperationsRoomPadIdleInit: @ 0x08039A7C
	push {lr}
	ldr r1, _08039AA4 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039AAC
	ldr r0, _08039AA8 @ =0x0834C344
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _08039AB4
	.align 2, 0
_08039AA4: .4byte gCurrentSprite
_08039AA8: .4byte 0x0834C344
_08039AAC:
	ldr r0, _08039ABC @ =0x0834C2F4
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_08039AB4:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08039ABC: .4byte 0x0834C2F4

	thumb_func_start OperationsRoomPadIdle
OperationsRoomPadIdle: @ 0x08039AC0
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _08039B00
	ldr r3, _08039AF4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08039B08
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08039AF8 @ =0x0834C254
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _08039AFC @ =0x00000101
	bl SoundPlay
	b _08039B08
	.align 2, 0
_08039AF4: .4byte gCurrentSprite
_08039AF8: .4byte 0x0834C254
_08039AFC: .4byte 0x00000101
_08039B00:
	ldr r0, _08039B0C @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_08039B08:
	pop {r0}
	bx r0
	.align 2, 0
_08039B0C: .4byte gCurrentSprite

	thumb_func_start OperationsRoomPadPressingSwitch
OperationsRoomPadPressingSwitch: @ 0x08039B10
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08039B2E
	ldr r1, _08039B34 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _08039B38 @ =0x0834C344
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
_08039B2E:
	pop {r0}
	bx r0
	.align 2, 0
_08039B34: .4byte gCurrentSprite
_08039B38: .4byte 0x0834C344

	thumb_func_start OperationsRoomPadSwitchPressed
OperationsRoomPadSwitchPressed: @ 0x08039B3C
	push {r4, lr}
	bl NavPadDetectSamus
	adds r3, r0, #0
	cmp r3, #0
	beq _08039B90
	bl SpriteUtilCheckSamusMorphed
	cmp r0, #0
	bne _08039BAA
	ldr r2, _08039B84 @ =gSamusData
	ldr r4, _08039B88 @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _08039B62
	movs r0, #0
	strb r0, [r2, #5]
_08039B62:
	ldr r1, _08039B8C @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x36
	bl _call_via_r1
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	b _08039BAA
	.align 2, 0
_08039B84: .4byte gSamusData
_08039B88: .4byte gCurrentSprite
_08039B8C: .4byte sSamusSetPoseFunctionPointer
_08039B90:
	ldr r1, _08039BB0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _08039BB4 @ =0x0834C2CC
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_08039BAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039BB0: .4byte gCurrentSprite
_08039BB4: .4byte 0x0834C2CC

	thumb_func_start OperationsRoomPadReleasing
OperationsRoomPadReleasing: @ 0x08039BB8
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08039BC6
	bl OperationsRoomPadIdleInit
_08039BC6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OperationsRoomPadSamusInteracting
OperationsRoomPadSamusInteracting: @ 0x08039BCC
	push {lr}
	ldr r0, _08039C10 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039BEA
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039BEA
	ldr r0, _08039C14 @ =0x00000103
	bl SoundPlay
_08039BEA:
	ldr r1, _08039C18 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x36
	bne _08039C0C
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _08039C0C
	ldr r1, _08039C10 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3a
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
_08039C0C:
	pop {r0}
	bx r0
	.align 2, 0
_08039C10: .4byte gCurrentSprite
_08039C14: .4byte 0x00000103
_08039C18: .4byte gSamusData

	thumb_func_start OperationsRoomPadStartEscape
OperationsRoomPadStartEscape: @ 0x08039C1C
	push {lr}
	ldr r1, _08039C58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039C52
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _08039C5C @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x67
	bl EventCheckAdvance
	movs r0, #0xb
	bl TrySpawnMessageBanner
	movs r0, #0
	bl FadeMusic
_08039C52:
	pop {r0}
	bx r0
	.align 2, 0
_08039C58: .4byte gCurrentSprite
_08039C5C: .4byte gPreventMovementTimer

	thumb_func_start OperationsRoomPadConsoleInit
OperationsRoomPadConsoleInit: @ 0x08039C60
	push {r4, lr}
	ldr r0, _08039CB4 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08039CB8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039CBC @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08039CC0 @ =0x0834C244
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039CB4: .4byte gCurrentSprite
_08039CB8: .4byte 0x0000FFFB
_08039CBC: .4byte 0x0000FFFC
_08039CC0: .4byte 0x0834C244

	thumb_func_start OperationsRoomPadConsoleIdle
OperationsRoomPadConsoleIdle: @ 0x08039CC4
	bx lr
	.align 2, 0

	thumb_func_start OperationsRoomPadConsoleScreenInit
OperationsRoomPadConsoleScreenInit: @ 0x08039CC8
	push {r4, lr}
	ldr r0, _08039D3C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08039D40 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039D44 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r2, _08039D48 @ =gSpriteData
	mov r0, ip
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039D50
	ldr r0, _08039D4C @ =0x0834C27C
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x18
	b _08039D5C
	.align 2, 0
_08039D3C: .4byte gCurrentSprite
_08039D40: .4byte 0x0000FFFB
_08039D44: .4byte 0x0000FFFC
_08039D48: .4byte gSpriteData
_08039D4C: .4byte 0x0834C27C
_08039D50:
	ldr r0, _08039D64 @ =0x0834C2A4
	mov r2, ip
	str r0, [r2, #0x18]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
_08039D5C:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039D64: .4byte 0x0834C2A4

	thumb_func_start OperationsRoomPadConsoleScreenIdle
OperationsRoomPadConsoleScreenIdle: @ 0x08039D68
	push {lr}
	ldr r2, _08039D9C @ =gSpriteData
	ldr r3, _08039DA0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _08039D96
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08039DA4 @ =0x0834C27C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_08039D96:
	pop {r0}
	bx r0
	.align 2, 0
_08039D9C: .4byte gSpriteData
_08039DA0: .4byte gCurrentSprite
_08039DA4: .4byte 0x0834C27C

	thumb_func_start OperationsRoomPadScreenInit
OperationsRoomPadScreenInit: @ 0x08039DA8
	push {r4, lr}
	ldr r0, _08039E0C @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	mov r4, ip
	ldrh r1, [r4]
	ldr r0, _08039E10 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039E14 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08039E18 @ =0x0834C31C
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r0, #0x82
	lsls r0, r0, #1
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039E0C: .4byte gCurrentSprite
_08039E10: .4byte 0x0000FFFB
_08039E14: .4byte 0x0000FFFC
_08039E18: .4byte 0x0834C31C

	thumb_func_start OperationsRoomPadScreenTurningOn
OperationsRoomPadScreenTurningOn: @ 0x08039E1C
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08039E38
	ldr r1, _08039E3C @ =gCurrentSprite
	ldr r0, _08039E40 @ =0x0834C304
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_08039E38:
	pop {r0}
	bx r0
	.align 2, 0
_08039E3C: .4byte gCurrentSprite
_08039E40: .4byte 0x0834C304

	thumb_func_start OperationsRoomPadScreenIdle
OperationsRoomPadScreenIdle: @ 0x08039E44
	push {lr}
	ldr r3, _08039E7C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08039E80 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _08039E78
	ldr r0, _08039E84 @ =0x0834C354
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, #0xeb
	bl SoundPlay
_08039E78:
	pop {r0}
	bx r0
	.align 2, 0
_08039E7C: .4byte gCurrentSprite
_08039E80: .4byte gSpriteData
_08039E84: .4byte 0x0834C354

	thumb_func_start OperationsRoomPadScreenTurningOff
OperationsRoomPadScreenTurningOff: @ 0x08039E88
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08039E98
	ldr r1, _08039E9C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08039E98:
	pop {r0}
	bx r0
	.align 2, 0
_08039E9C: .4byte gCurrentSprite

	thumb_func_start OperationsRoomPad
OperationsRoomPad: @ 0x08039EA0
	push {lr}
	ldr r0, _08039EC0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bls _08039EB6
	b _08039FE0
_08039EB6:
	lsls r0, r0, #2
	ldr r1, _08039EC4 @ =_08039EC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039EC0: .4byte gCurrentSprite
_08039EC4: .4byte _08039EC8
_08039EC8: @ jump table
	.4byte _08039FB4 @ case 0
	.4byte _08039FB8 @ case 1
	.4byte _08039FBE @ case 2
	.4byte _08039FE0 @ case 3
	.4byte _08039FE0 @ case 4
	.4byte _08039FE0 @ case 5
	.4byte _08039FE0 @ case 6
	.4byte _08039FE0 @ case 7
	.4byte _08039FE0 @ case 8
	.4byte _08039FE0 @ case 9
	.4byte _08039FE0 @ case 10
	.4byte _08039FE0 @ case 11
	.4byte _08039FE0 @ case 12
	.4byte _08039FE0 @ case 13
	.4byte _08039FE0 @ case 14
	.4byte _08039FE0 @ case 15
	.4byte _08039FE0 @ case 16
	.4byte _08039FE0 @ case 17
	.4byte _08039FE0 @ case 18
	.4byte _08039FE0 @ case 19
	.4byte _08039FE0 @ case 20
	.4byte _08039FE0 @ case 21
	.4byte _08039FE0 @ case 22
	.4byte _08039FE0 @ case 23
	.4byte _08039FC4 @ case 24
	.4byte _08039FE0 @ case 25
	.4byte _08039FCA @ case 26
	.4byte _08039FE0 @ case 27
	.4byte _08039FD0 @ case 28
	.4byte _08039FE0 @ case 29
	.4byte _08039FE0 @ case 30
	.4byte _08039FE0 @ case 31
	.4byte _08039FE0 @ case 32
	.4byte _08039FE0 @ case 33
	.4byte _08039FE0 @ case 34
	.4byte _08039FE0 @ case 35
	.4byte _08039FE0 @ case 36
	.4byte _08039FE0 @ case 37
	.4byte _08039FE0 @ case 38
	.4byte _08039FE0 @ case 39
	.4byte _08039FE0 @ case 40
	.4byte _08039FE0 @ case 41
	.4byte _08039FE0 @ case 42
	.4byte _08039FE0 @ case 43
	.4byte _08039FE0 @ case 44
	.4byte _08039FE0 @ case 45
	.4byte _08039FE0 @ case 46
	.4byte _08039FE0 @ case 47
	.4byte _08039FE0 @ case 48
	.4byte _08039FE0 @ case 49
	.4byte _08039FE0 @ case 50
	.4byte _08039FE0 @ case 51
	.4byte _08039FE0 @ case 52
	.4byte _08039FE0 @ case 53
	.4byte _08039FE0 @ case 54
	.4byte _08039FE0 @ case 55
	.4byte _08039FD6 @ case 56
	.4byte _08039FE0 @ case 57
	.4byte _08039FDC @ case 58
_08039FB4:
	bl OperationsRoomPadInit
_08039FB8:
	bl OperationsRoomPadIdleInit
	b _08039FE0
_08039FBE:
	bl OperationsRoomPadIdle
	b _08039FE0
_08039FC4:
	bl OperationsRoomPadPressingSwitch
	b _08039FE0
_08039FCA:
	bl OperationsRoomPadSwitchPressed
	b _08039FE0
_08039FD0:
	bl OperationsRoomPadReleasing
	b _08039FE0
_08039FD6:
	bl OperationsRoomPadSamusInteracting
	b _08039FE0
_08039FDC:
	bl OperationsRoomPadStartEscape
_08039FE0:
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadConsole
OperationsRoomPadConsole: @ 0x08039FE4
	push {lr}
	ldr r0, _0803A000 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A004
	cmp r0, #2
	beq _0803A008
	b _0803A00C
	.align 2, 0
_0803A000: .4byte gCurrentSprite
_0803A004:
	bl OperationsRoomPadConsoleInit
_0803A008:
	bl OperationsRoomPadConsoleIdle
_0803A00C:
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadConsoleScreen
OperationsRoomPadConsoleScreen: @ 0x0803A010
	push {lr}
	ldr r0, _0803A02C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A030
	cmp r0, #2
	beq _0803A036
	b _0803A03A
	.align 2, 0
_0803A02C: .4byte gCurrentSprite
_0803A030:
	bl OperationsRoomPadConsoleScreenInit
	b _0803A03A
_0803A036:
	bl OperationsRoomPadConsoleScreenIdle
_0803A03A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OperationsRoomPadScreen
OperationsRoomPadScreen: @ 0x0803A040
	push {lr}
	ldr r0, _0803A060 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A072
	cmp r0, #2
	bgt _0803A064
	cmp r0, #0
	beq _0803A06E
	b _0803A082
	.align 2, 0
_0803A060: .4byte gCurrentSprite
_0803A064:
	cmp r0, #0x18
	beq _0803A078
	cmp r0, #0x1a
	beq _0803A07E
	b _0803A082
_0803A06E:
	bl OperationsRoomPadScreenInit
_0803A072:
	bl OperationsRoomPadScreenTurningOn
	b _0803A082
_0803A078:
	bl OperationsRoomPadScreenIdle
	b _0803A082
_0803A07E:
	bl OperationsRoomPadScreenTurningOff
_0803A082:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ScientistInit
ScientistInit: @ 0x0803A088
	push {r4, r5, lr}
	ldr r2, _0803A0AC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803A0B0 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r5, #2
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0803A0B4
	movs r0, #0
	strh r0, [r2]
	b _0803A0FC
	.align 2, 0
_0803A0AC: .4byte gCurrentSprite
_0803A0B0: .4byte gEquipment
_0803A0B4:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0803A104 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r3, r2, #0
	adds r3, #0x27
	movs r0, #0x28
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r3, #2
	movs r0, #0x10
	strb r0, [r3]
	ldr r0, _0803A108 @ =0x0000FF88
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x64
	strh r0, [r2, #0xe]
	movs r0, #0x14
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x24
	strb r5, [r0]
	ldr r0, _0803A10C @ =0x0834D9EC
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r4, [r2, #0x16]
_0803A0FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A104: .4byte 0x0000FFFB
_0803A108: .4byte 0x0000FF88
_0803A10C: .4byte 0x0834D9EC

	thumb_func_start ScientistIdle
ScientistIdle: @ 0x0803A110
	push {lr}
	ldr r3, _0803A144 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bls _0803A13E
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0803A148 @ =0x0834DAC4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
_0803A13E:
	pop {r0}
	bx r0
	.align 2, 0
_0803A144: .4byte gCurrentSprite
_0803A148: .4byte 0x0834DAC4

	thumb_func_start ScientistTurning
ScientistTurning: @ 0x0803A14C
	push {lr}
	ldr r1, _0803A16C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A166
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
_0803A166:
	pop {r0}
	bx r0
	.align 2, 0
_0803A16C: .4byte gCurrentSprite

	thumb_func_start ScientistTransformingInit
ScientistTransformingInit: @ 0x0803A170
	ldr r3, _0803A194 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r2, _0803A198 @ =0x00008020
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r3, #6]
	bx lr
	.align 2, 0
_0803A194: .4byte gCurrentSprite
_0803A198: .4byte 0x00008020

	thumb_func_start ScientistTransforming
ScientistTransforming: @ 0x0803A19C
	push {r4, lr}
	ldr r2, _0803A1E4 @ =gWrittenToMosaic_H
	ldr r1, _0803A1E8 @ =sXParasiteMosaicValues
	ldr r4, _0803A1EC @ =gCurrentSprite
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0803A1F0
	ldrh r2, [r4, #6]
	movs r0, #0x57
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0803A1FE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0x57
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	b _0803A1FE
	.align 2, 0
_0803A1E4: .4byte gWrittenToMosaic_H
_0803A1E8: .4byte sXParasiteMosaicValues
_0803A1EC: .4byte gCurrentSprite
_0803A1F0:
	cmp r0, #0x14
	bne _0803A1FE
	movs r0, #0x57
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0803A1FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Scientist
Scientist: @ 0x0803A204
	push {lr}
	ldr r0, _0803A224 @ =gCurrentSprite
	movs r1, #1
	strh r1, [r0, #0x14]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0803A23E
	cmp r0, #0x18
	bgt _0803A228
	cmp r0, #0
	beq _0803A232
	cmp r0, #2
	beq _0803A238
	b _0803A24C
	.align 2, 0
_0803A224: .4byte gCurrentSprite
_0803A228:
	cmp r0, #0x45
	beq _0803A244
	cmp r0, #0x46
	beq _0803A248
	b _0803A24C
_0803A232:
	bl ScientistInit
	b _0803A24C
_0803A238:
	bl ScientistIdle
	b _0803A24C
_0803A23E:
	bl ScientistTurning
	b _0803A24C
_0803A244:
	bl ScientistTransformingInit
_0803A248:
	bl ScientistTransforming
_0803A24C:
	pop {r0}
	bx r0

	thumb_func_start SkulteraSetSidesHitboxes
SkulteraSetSidesHitboxes: @ 0x0803A250
	push {lr}
	ldr r2, _0803A270 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A284
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A278
	ldr r0, _0803A274 @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x28
	b _0803A2A2
	.align 2, 0
_0803A270: .4byte gCurrentSprite
_0803A274: .4byte 0x0000FFE8
_0803A278:
	ldr r0, _0803A280 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x20
	b _0803A2A2
	.align 2, 0
_0803A280: .4byte 0x0000FFF0
_0803A284:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A29C
	ldr r0, _0803A298 @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x18
	b _0803A2A2
	.align 2, 0
_0803A298: .4byte 0x0000FFD8
_0803A29C:
	ldr r0, _0803A2A8 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x10
_0803A2A2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803A2A8: .4byte 0x0000FFE0

	thumb_func_start SkulteraXMovement
SkulteraXMovement: @ 0x0803A2AC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0803A2D0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0803A2F8
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A2D4
	ldrh r0, [r4, #4]
	adds r0, #0x38
	b _0803A2D8
	.align 2, 0
_0803A2D0: .4byte gCurrentSprite
_0803A2D4:
	ldrh r0, [r4, #4]
	adds r0, #0x28
_0803A2D8:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A2F4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0803A320
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _0803A32C
	.align 2, 0
_0803A2F4: .4byte gPreviousCollisionCheck
_0803A2F8:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A308
	ldrh r0, [r4, #4]
	subs r0, #0x38
	b _0803A30C
_0803A308:
	ldrh r0, [r4, #4]
	subs r0, #0x28
_0803A30C:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A324 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803A328
_0803A320:
	movs r0, #1
	b _0803A330
	.align 2, 0
_0803A324: .4byte gPreviousCollisionCheck
_0803A328:
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_0803A32C:
	strh r0, [r4, #4]
	movs r0, #0
_0803A330:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SkulteraTurningIntoX
SkulteraTurningIntoX: @ 0x0803A338
	push {lr}
	sub sp, #0x10
	ldr r2, _0803A370 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A374
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x30
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _0803A37A
	.align 2, 0
_0803A370: .4byte gCurrentSprite
_0803A374:
	ldrh r0, [r2, #2]
	subs r0, #0x20
	strh r0, [r2, #2]
_0803A37A:
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start SkulteraInit
SkulteraInit: @ 0x0803A380
	push {r4, r5, lr}
	ldr r2, _0803A3B4 @ =gCurrentSprite
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r3, [r4]
	cmp r3, #0
	bne _0803A3D8
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _0803A3C2
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803A3B8
	adds r0, r2, #0
	adds r0, #0x2d
	strb r3, [r0]
	b _0803A3C6
	.align 2, 0
_0803A3B4: .4byte gCurrentSprite
_0803A3B8:
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	b _0803A3C6
_0803A3C2:
	strh r3, [r2]
	b _0803A498
_0803A3C6:
	bl SpriteUtilChooseRandomXFlip
	ldr r0, _0803A3D4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803A3EA
	.align 2, 0
_0803A3D4: .4byte gCurrentSprite
_0803A3D8:
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x5a
	strb r0, [r4]
	movs r0, #0x2c
	strh r0, [r2, #6]
_0803A3EA:
	ldr r1, _0803A440 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x25
	movs r4, #0
	movs r0, #2
	strb r0, [r2]
	strb r4, [r1, #0x1c]
	movs r5, #0
	strh r4, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #2
	bne _0803A44C
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0803A444 @ =0x0834F074
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0803A448 @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r1, #0xc
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x6a
	strb r0, [r3, #0x1d]
	b _0803A484
	.align 2, 0
_0803A440: .4byte gCurrentSprite
_0803A444: .4byte 0x0834F074
_0803A448: .4byte 0x0000FF80
_0803A44C:
	ldr r0, _0803A4A0 @ =0x0834EFEC
	str r0, [r3, #0x18]
	ldrb r0, [r3, #0x1d]
	cmp r0, #0xb5
	beq _0803A462
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_0803A462:
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, _0803A4A4 @ =0x0000FFC0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r1, #0xe
	movs r0, #1
	strb r0, [r1]
_0803A484:
	ldr r2, _0803A4A8 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	bl SkulteraSetSidesHitboxes
_0803A498:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A4A0: .4byte 0x0834EFEC
_0803A4A4: .4byte 0x0000FFC0
_0803A4A8: .4byte sPrimarySpriteStats

	thumb_func_start SkulteraIdleInit
SkulteraIdleInit: @ 0x0803A4AC
	push {lr}
	ldr r0, _0803A4DC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #4]
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1, #8]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	strb r2, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A4E4
	ldr r0, _0803A4E0 @ =0x0834F074
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x2e
	movs r0, #3
	b _0803A4EE
	.align 2, 0
_0803A4DC: .4byte gCurrentSprite
_0803A4E0: .4byte 0x0834F074
_0803A4E4:
	ldr r0, _0803A4F4 @ =0x0834EFEC
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x2e
	movs r0, #4
_0803A4EE:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803A4F4: .4byte 0x0834EFEC

	thumb_func_start SkulteraIdle
SkulteraIdle: @ 0x0803A4F8
	push {r4, lr}
	ldr r4, _0803A520 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A572
	movs r0, #4
	bl SkulteraXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A524
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A570
	.align 2, 0
_0803A520: .4byte gCurrentSprite
_0803A524:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A53E
	ldrh r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	cmp r0, r1
	bge _0803A552
	b _0803A54A
_0803A53E:
	ldrh r0, [r4, #8]
	ldr r1, _0803A564 @ =0xFFFFFE00
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	cmp r0, r1
	ble _0803A552
_0803A54A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0803A552:
	ldr r1, _0803A568 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A56C
	adds r1, #0x2e
	movs r0, #3
	b _0803A570
	.align 2, 0
_0803A564: .4byte 0xFFFFFE00
_0803A568: .4byte gCurrentSprite
_0803A56C:
	adds r1, #0x2e
	movs r0, #4
_0803A570:
	strb r0, [r1]
_0803A572:
	ldr r0, _0803A5AC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A5D2
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0x40
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0803A5D2
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldr r3, _0803A5B0 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A5BA
	cmp r2, #8
	bne _0803A5B4
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0803A5D0
	.align 2, 0
_0803A5AC: .4byte 0x03001346
_0803A5B0: .4byte gCurrentSprite
_0803A5B4:
	cmp r2, #4
	bne _0803A5D2
	b _0803A5CA
_0803A5BA:
	cmp r2, #4
	bne _0803A5C6
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0803A5D0
_0803A5C6:
	cmp r2, #8
	bne _0803A5D2
_0803A5CA:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
_0803A5D0:
	strb r0, [r1]
_0803A5D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SkulteraChasingSamusInit
SkulteraChasingSamusInit: @ 0x0803A5D8
	push {lr}
	ldr r3, _0803A5F8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x2a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A600
	ldr r0, _0803A5FC @ =0x0834F0E4
	b _0803A602
	.align 2, 0
_0803A5F8: .4byte gCurrentSprite
_0803A5FC: .4byte 0x0834F0E4
_0803A600:
	ldr r0, _0803A608 @ =0x0834F054
_0803A602:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0803A608: .4byte 0x0834F054

	thumb_func_start SkulteraChasingSamus
SkulteraChasingSamus: @ 0x0803A60C
	push {r4, r5, lr}
	ldr r2, _0803A654 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0803A658 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0803A664
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A65C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A682
	ldr r0, _0803A660 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0803A682
	ldrh r0, [r4, #2]
	subs r0, #2
	b _0803A680
	.align 2, 0
_0803A654: .4byte gSamusData
_0803A658: .4byte gCurrentSprite
_0803A65C: .4byte gPreviousCollisionCheck
_0803A660: .4byte gCurrentAffectingClipdata
_0803A664:
	adds r0, r1, #0
	adds r0, #0x40
	cmp r0, r2
	bge _0803A682
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A6AC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A682
	ldrh r0, [r4, #2]
	adds r0, #2
_0803A680:
	strh r0, [r4, #2]
_0803A682:
	ldr r4, _0803A6B0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A6C2
	movs r0, #4
	bl SkulteraXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A6B4
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0803A6C2
	.align 2, 0
_0803A6AC: .4byte gPreviousCollisionCheck
_0803A6B0: .4byte gCurrentSprite
_0803A6B4:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A6C0
	movs r0, #3
_0803A6C0:
	strb r0, [r5]
_0803A6C2:
	ldr r0, _0803A6D4 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A6DC
	ldr r0, _0803A6D8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803A730
	.align 2, 0
_0803A6D4: .4byte 0x03001346
_0803A6D8: .4byte gCurrentSprite
_0803A6DC:
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0x40
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0803A730
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldr r3, _0803A714 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A718
	cmp r2, #8
	beq _0803A730
	cmp r2, #4
	bne _0803A728
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A72E
	.align 2, 0
_0803A714: .4byte gCurrentSprite
_0803A718:
	cmp r2, #4
	beq _0803A730
	cmp r2, #8
	bne _0803A728
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A72E
_0803A728:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #1
_0803A72E:
	strb r0, [r1]
_0803A730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SkulteraTurningAroundInit
SkulteraTurningAroundInit: @ 0x0803A738
	push {lr}
	ldr r3, _0803A77C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	cmp r1, #2
	bne _0803A78C
	ldr r0, _0803A780 @ =0x0834F09C
	str r0, [r3, #0x18]
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	bne _0803A7B2
	ldr r0, _0803A784 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A7B2
	ands r1, r2
	cmp r1, #0
	beq _0803A7B2
	ldr r0, _0803A788 @ =0x00000193
	bl SoundPlayNotAlreadyPlaying
	b _0803A7B2
	.align 2, 0
_0803A77C: .4byte gCurrentSprite
_0803A780: .4byte 0x0834F09C
_0803A784: .4byte 0x03001346
_0803A788: .4byte 0x00000193
_0803A78C:
	ldr r0, _0803A7B8 @ =0x0834F00C
	str r0, [r3, #0x18]
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	bne _0803A7B2
	ldr r0, _0803A7BC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A7B2
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803A7B2
	ldr r0, _0803A7C0 @ =0x00000191
	bl SoundPlayNotAlreadyPlaying
_0803A7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0803A7B8: .4byte 0x0834F00C
_0803A7BC: .4byte 0x03001346
_0803A7C0: .4byte 0x00000191

	thumb_func_start SkulteraTurningAround
SkulteraTurningAround: @ 0x0803A7C4
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803A7E0
	bl SkulteraIdleInit
	ldr r0, _0803A7E4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r2, #0x40
	eors r1, r2
	strh r1, [r0]
	bl SkulteraSetSidesHitboxes
_0803A7E0:
	pop {r0}
	bx r0
	.align 2, 0
_0803A7E4: .4byte gCurrentSprite

	thumb_func_start Skultera
Skultera: @ 0x0803A7E8
	push {lr}
	ldr r1, _0803A810 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A814
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803A82A
	movs r0, #0xca
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803A82A
	.align 2, 0
_0803A810: .4byte gCurrentSprite
_0803A814:
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803A82A
	movs r0, #0xc9
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803A82A:
	ldr r1, _0803A83C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A840
	bl SpriteUtilUpdateFreezeTimer
	b _0803AA0E
	.align 2, 0
_0803A83C: .4byte gCurrentSprite
_0803A840:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803A84C
	b _0803AA0E
_0803A84C:
	lsls r0, r0, #2
	ldr r1, _0803A858 @ =_0803A85C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A858: .4byte _0803A85C
_0803A85C: @ jump table
	.4byte _0803A9CC @ case 0
	.4byte _0803A9D2 @ case 1
	.4byte _0803A9D8 @ case 2
	.4byte _0803A9DE @ case 3
	.4byte _0803A9E2 @ case 4
	.4byte _0803AA0E @ case 5
	.4byte _0803AA0E @ case 6
	.4byte _0803AA0E @ case 7
	.4byte _0803AA0E @ case 8
	.4byte _0803AA0E @ case 9
	.4byte _0803AA0E @ case 10
	.4byte _0803AA0E @ case 11
	.4byte _0803AA0E @ case 12
	.4byte _0803AA0E @ case 13
	.4byte _0803AA0E @ case 14
	.4byte _0803AA0E @ case 15
	.4byte _0803AA0E @ case 16
	.4byte _0803AA0E @ case 17
	.4byte _0803AA0E @ case 18
	.4byte _0803AA0E @ case 19
	.4byte _0803AA0E @ case 20
	.4byte _0803AA0E @ case 21
	.4byte _0803AA0E @ case 22
	.4byte _0803AA0E @ case 23
	.4byte _0803AA0E @ case 24
	.4byte _0803AA0E @ case 25
	.4byte _0803AA0E @ case 26
	.4byte _0803AA0E @ case 27
	.4byte _0803AA0E @ case 28
	.4byte _0803AA0E @ case 29
	.4byte _0803AA0E @ case 30
	.4byte _0803AA0E @ case 31
	.4byte _0803AA0E @ case 32
	.4byte _0803AA0E @ case 33
	.4byte _0803AA0E @ case 34
	.4byte _0803AA0E @ case 35
	.4byte _0803AA0E @ case 36
	.4byte _0803AA0E @ case 37
	.4byte _0803AA0E @ case 38
	.4byte _0803AA0E @ case 39
	.4byte _0803AA0E @ case 40
	.4byte _0803A9E8 @ case 41
	.4byte _0803A9EC @ case 42
	.4byte _0803AA0E @ case 43
	.4byte _0803AA0E @ case 44
	.4byte _0803AA0E @ case 45
	.4byte _0803AA0E @ case 46
	.4byte _0803AA0E @ case 47
	.4byte _0803AA0E @ case 48
	.4byte _0803AA0E @ case 49
	.4byte _0803AA0E @ case 50
	.4byte _0803AA0E @ case 51
	.4byte _0803AA0E @ case 52
	.4byte _0803AA0E @ case 53
	.4byte _0803AA0E @ case 54
	.4byte _0803AA0E @ case 55
	.4byte _0803AA0E @ case 56
	.4byte _0803AA0E @ case 57
	.4byte _0803AA0E @ case 58
	.4byte _0803AA0E @ case 59
	.4byte _0803AA0E @ case 60
	.4byte _0803AA0E @ case 61
	.4byte _0803AA0E @ case 62
	.4byte _0803AA0E @ case 63
	.4byte _0803AA0E @ case 64
	.4byte _0803AA0E @ case 65
	.4byte _0803AA0E @ case 66
	.4byte _0803AA0E @ case 67
	.4byte _0803AA0E @ case 68
	.4byte _0803AA0E @ case 69
	.4byte _0803AA0E @ case 70
	.4byte _0803AA0E @ case 71
	.4byte _0803AA0E @ case 72
	.4byte _0803AA0E @ case 73
	.4byte _0803AA0E @ case 74
	.4byte _0803AA0E @ case 75
	.4byte _0803AA0E @ case 76
	.4byte _0803AA0E @ case 77
	.4byte _0803AA0E @ case 78
	.4byte _0803AA0E @ case 79
	.4byte _0803AA0E @ case 80
	.4byte _0803AA0E @ case 81
	.4byte _0803AA0E @ case 82
	.4byte _0803AA0E @ case 83
	.4byte _0803AA0E @ case 84
	.4byte _0803AA0E @ case 85
	.4byte _0803AA0E @ case 86
	.4byte _0803A9F2 @ case 87
	.4byte _0803A9F6 @ case 88
	.4byte _0803A9FC @ case 89
	.4byte _0803AA00 @ case 90
	.4byte _0803AA06 @ case 91
_0803A9CC:
	bl SkulteraInit
	b _0803AA0E
_0803A9D2:
	bl SkulteraIdleInit
	b _0803AA0E
_0803A9D8:
	bl SkulteraIdle
	b _0803AA0E
_0803A9DE:
	bl SkulteraTurningAroundInit
_0803A9E2:
	bl SkulteraTurningAround
	b _0803AA0E
_0803A9E8:
	bl SkulteraChasingSamusInit
_0803A9EC:
	bl SkulteraChasingSamus
	b _0803AA0E
_0803A9F2:
	bl SpriteDyingInit
_0803A9F6:
	bl SpriteDying
	b _0803AA0E
_0803A9FC:
	bl SkulteraInit
_0803AA00:
	bl SpriteSpawningFromX
	b _0803AA0E
_0803AA06:
	bl SkulteraTurningIntoX
	bl XParasiteInit
_0803AA0E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZeelaCheckCollidingWithAir
ZeelaCheckCollidingWithAir: @ 0x0803AA14
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803AA48 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AA74
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AA50
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA4C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803AAB8
	.align 2, 0
_0803AA48: .4byte gCurrentSprite
_0803AA4C: .4byte gPreviousCollisionCheck
_0803AA50:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA70 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803AAB8
	.align 2, 0
_0803AA70: .4byte gPreviousCollisionCheck
_0803AA74:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AAA0
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA9C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803AAB4
	.align 2, 0
_0803AA9C: .4byte gPreviousCollisionCheck
_0803AAA0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AACC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
_0803AAB4:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803AAB8:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	movs r6, #1
_0803AAC4:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803AACC: .4byte gPreviousCollisionCheck

	thumb_func_start ZeelaUpdateHitbox
ZeelaUpdateHitbox: @ 0x0803AAD0
	push {lr}
	ldr r2, _0803AAFC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AB20
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AB08
	ldr r0, _0803AB00 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0803AB04 @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803AB42
	.align 2, 0
_0803AAFC: .4byte gCurrentSprite
_0803AB00: .4byte 0x0000FFD8
_0803AB04: .4byte 0x0000FFC0
_0803AB08:
	ldr r0, _0803AB18 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0803AB1C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803AB44
	.align 2, 0
_0803AB18: .4byte 0x0000FFD8
_0803AB1C: .4byte 0x0000FFF0
_0803AB20:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AB34
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803AB3A
_0803AB34:
	ldr r0, _0803AB48 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803AB3A:
	strh r0, [r2, #0xc]
	ldr r0, _0803AB4C @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x28
_0803AB42:
	strh r0, [r2, #0x10]
_0803AB44:
	pop {r0}
	bx r0
	.align 2, 0
_0803AB48: .4byte 0x0000FFC0
_0803AB4C: .4byte 0x0000FFD8

	thumb_func_start ZeelaSetCrawlingOam
ZeelaSetCrawlingOam: @ 0x0803AB50
	push {lr}
	ldr r0, _0803AB64 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803AB6C
	ldr r0, _0803AB68 @ =0x083505DC
	b _0803AB6E
	.align 2, 0
_0803AB64: .4byte gCurrentSprite
_0803AB68: .4byte 0x083505DC
_0803AB6C:
	ldr r0, _0803AB7C @ =0x08350584
_0803AB6E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803AB7C: .4byte 0x08350584

	thumb_func_start ZeelaSetFallingOam
ZeelaSetFallingOam: @ 0x0803AB80
	push {lr}
	ldr r0, _0803AB94 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803AB9C
	ldr r0, _0803AB98 @ =0x0835060C
	b _0803AB9E
	.align 2, 0
_0803AB94: .4byte gCurrentSprite
_0803AB98: .4byte 0x0835060C
_0803AB9C:
	ldr r0, _0803ABAC @ =0x083505B4
_0803AB9E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803ABAC: .4byte 0x083505B4

	thumb_func_start ZeelaShootProjectiles
ZeelaShootProjectiles: @ 0x0803ABB0
	push {r4, r5, lr}
	sub sp, #0xc
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803ABDC
	ldr r0, _0803ABD8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0803ABD2
	b _0803AD6C
_0803ABD2:
	movs r0, #0
	strb r0, [r1]
	b _0803AD6C
	.align 2, 0
_0803ABD8: .4byte gCurrentSprite
_0803ABDC:
	ldr r1, _0803AC44 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ABEA
	b _0803AD6C
_0803ABEA:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0803AC06
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0803AC06
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803AC06
	ldr r0, _0803AC48 @ =0x000001CB
	bl SoundPlayNotAlreadyPlaying
_0803AC06:
	ldr r1, _0803AC44 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	adds r4, r1, #0
	cmp r0, #1
	bne _0803ACAC
	ldrb r0, [r4, #0x1c]
	cmp r0, #8
	bne _0803ACAC
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AC64
	ldrh r1, [r4]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AC4C
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x3c
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0803ACEE
	.align 2, 0
_0803AC44: .4byte gCurrentSprite
_0803AC48: .4byte 0x000001CB
_0803AC4C:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x3c
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0803AD10
_0803AC64:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AC8A
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	b _0803AD44
_0803AC8A:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x38
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803ACAC:
	mov ip, r4
	ldrh r0, [r4, #0x16]
	cmp r0, #2
	bne _0803AD6C
	ldrb r0, [r4, #0x1c]
	cmp r0, #8
	bne _0803AD6C
	mov r0, ip
	adds r0, #0x2d
	ldrb r5, [r0]
	cmp r5, #0
	beq _0803AD1A
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803ACF8
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x34
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
_0803ACEE:
	movs r0, #0x38
	movs r1, #3
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803ACF8:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x3c
	str r0, [sp, #4]
	str r1, [sp, #8]
_0803AD10:
	movs r0, #0x38
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803AD1A:
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803AD4E
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x3c
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x34
	str r0, [sp, #4]
	str r5, [sp, #8]
_0803AD44:
	movs r0, #0x38
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803AD4E:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x34
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x38
	movs r1, #0
	bl SpriteSpawnSecondary
_0803AD6C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ZeelaTurningIntoX
ZeelaTurningIntoX: @ 0x0803AD74
	push {lr}
	ldr r2, _0803AD94 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ADA0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AD98
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803ADB8
	.align 2, 0
_0803AD94: .4byte gCurrentSprite
_0803AD98:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803ADB8
_0803ADA0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803ADB2
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803ADB6
_0803ADB2:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803ADB6:
	strh r0, [r2, #2]
_0803ADB8:
	pop {r0}
	bx r0

	thumb_func_start ZeelaInit
ZeelaInit: @ 0x0803ADBC
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803ADE8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803ADEC
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803ADEC
	strh r0, [r2]
	b _0803AEFC
	.align 2, 0
_0803ADE8: .4byte gCurrentSprite
_0803ADEC:
	ldr r0, _0803AE04 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	ldrb r1, [r2]
	adds r7, r0, #0
	cmp r1, #0x59
	bne _0803AE08
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r7, #6]
	b _0803AEC2
	.align 2, 0
_0803AE04: .4byte gCurrentSprite
_0803AE08:
	movs r0, #2
	strb r0, [r2]
	ldrh r0, [r7, #2]
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AE2C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	movs r6, #0xf0
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _0803AE30
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	b _0803AEC2
	.align 2, 0
_0803AE2C: .4byte gPreviousCollisionCheck
_0803AE30:
	ldrh r0, [r7, #2]
	subs r0, #0x44
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AE5E
	adds r0, r7, #0
	adds r0, #0x2d
	strb r4, [r0]
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x40
	strh r0, [r7, #2]
	b _0803AEC2
_0803AE5E:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AE8A
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	subs r0, #0x20
	strh r0, [r7, #4]
	b _0803AEC2
_0803AE8A:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	adds r2, r6, #0
	ands r2, r0
	cmp r2, #0
	beq _0803AEBE
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	adds r0, #0x20
	strh r0, [r7, #4]
	b _0803AEC2
_0803AEBE:
	strh r2, [r7]
	b _0803AEFC
_0803AEC2:
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl ZeelaSetCrawlingOam
	bl ZeelaUpdateHitbox
	ldr r2, _0803AF04 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #8
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803AEFC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF04: .4byte sPrimarySpriteStats

	thumb_func_start ZeelaIdleInit
ZeelaIdleInit: @ 0x0803AF08
	push {lr}
	bl ZeelaSetCrawlingOam
	ldr r0, _0803AF1C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803AF1C: .4byte gCurrentSprite

	thumb_func_start ZeelaIdle
ZeelaIdle: @ 0x0803AF20
	push {r4, r5, r6, lr}
	ldr r4, _0803AF4C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803AF32
	b _0803B14C
_0803AF32:
	bl ZeelaShootProjectiles
	bl ZeelaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF50
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803B14C
	.align 2, 0
_0803AF4C: .4byte gCurrentSprite
_0803AF50:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B040
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AFBC
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803AF94
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AF90 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AF86
	b _0803B138
_0803AF86:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803AFE6
	.align 2, 0
_0803AF90: .4byte gPreviousCollisionCheck
_0803AF94:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AFB8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AFAC
	b _0803B138
_0803AFAC:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803B024
	.align 2, 0
_0803AFB8: .4byte gPreviousCollisionCheck
_0803AFBC:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B004
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B000 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AFE0
	b _0803B138
_0803AFE0:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
_0803AFE6:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803AFF6
	b _0803B138
_0803AFF6:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _0803B132
	.align 2, 0
_0803B000: .4byte gPreviousCollisionCheck
_0803B004:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B03C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803B01E
	b _0803B138
_0803B01E:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
_0803B024:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803B034
	b _0803B138
_0803B034:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	b _0803B132
	.align 2, 0
_0803B03C: .4byte gPreviousCollisionCheck
_0803B040:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B0C0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B090
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B08C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0803B130
	.align 2, 0
_0803B08C: .4byte gPreviousCollisionCheck
_0803B090:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B0BC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	b _0803B126
	.align 2, 0
_0803B0BC: .4byte gPreviousCollisionCheck
_0803B0C0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B100
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B0FC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0803B130
	.align 2, 0
_0803B0FC: .4byte gPreviousCollisionCheck
_0803B100:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B154 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
_0803B126:
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	subs r0, #1
_0803B130:
	strh r0, [r4, #4]
_0803B132:
	movs r0, #0
	cmp r0, #0
	beq _0803B14C
_0803B138:
	ldr r2, _0803B158 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_0803B14C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B154: .4byte gPreviousCollisionCheck
_0803B158: .4byte gCurrentSprite

	thumb_func_start ZeelaTurningAroundInit
ZeelaTurningAroundInit: @ 0x0803B15C
	push {lr}
	ldr r0, _0803B170 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl ZeelaSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803B170: .4byte gCurrentSprite

	thumb_func_start ZeelaTurningAround
ZeelaTurningAround: @ 0x0803B174
	push {lr}
	bl ZeelaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B18C
	ldr r0, _0803B188 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0803B19A
	.align 2, 0
_0803B188: .4byte gCurrentSprite
_0803B18C:
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803B19C
	ldr r0, _0803B1A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_0803B19A:
	strb r1, [r0]
_0803B19C:
	pop {r0}
	bx r0
	.align 2, 0
_0803B1A0: .4byte gCurrentSprite

	thumb_func_start ZeelaFallingInit
ZeelaFallingInit: @ 0x0803B1A4
	push {lr}
	ldr r1, _0803B1C0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl ZeelaSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803B1C0: .4byte gCurrentSprite

	thumb_func_start ZeelaFalling
ZeelaFalling: @ 0x0803B1C4
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803B1EC @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B1F0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B1FC
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803B1FC
	.align 2, 0
_0803B1EC: .4byte gCurrentSprite
_0803B1F0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B204
_0803B1FC:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803B204:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803B250 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B278
	ldr r4, _0803B254 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803B22A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803B22A:
	ldrh r0, [r4]
	ldr r1, _0803B258 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl ZeelaUpdateHitbox
	cmp r5, #0
	beq _0803B264
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B25C
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803B260
	.align 2, 0
_0803B250: .4byte gPreviousVerticalCollisionCheck
_0803B254: .4byte gCurrentSprite
_0803B258: .4byte 0x0000FEFF
_0803B25C:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803B260:
	subs r0, r0, r1
	strh r0, [r4, #4]
_0803B264:
	ldr r0, _0803B274 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl ZeelaSetFallingOam
	b _0803B2BC
	.align 2, 0
_0803B274: .4byte gCurrentSprite
_0803B278:
	ldr r3, _0803B2A4 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803B2A8 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803B2AC @ =0x00007FFF
	cmp r1, r0
	bne _0803B2B0
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803B2BA
	.align 2, 0
_0803B2A4: .4byte gCurrentSprite
_0803B2A8: .4byte sSpritesFallingSpeed
_0803B2AC: .4byte 0x00007FFF
_0803B2B0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803B2BA:
	strh r0, [r3, #2]
_0803B2BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZeelaProjectileInit
ZeelaProjectileInit: @ 0x0803B2C4
	push {r4, lr}
	ldr r0, _0803B328 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803B32C @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803B330 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _0803B334 @ =0x08350634
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B328: .4byte gCurrentSprite
_0803B32C: .4byte 0x0000FFFB
_0803B330: .4byte 0x0000FFF8
_0803B334: .4byte 0x08350634

	thumb_func_start ZeelaProjectileMoving
ZeelaProjectileMoving: @ 0x0803B338
	push {r4, r5, r6, lr}
	ldr r1, _0803B360 @ =gCurrentClipdataAffectingAction
	movs r0, #5
	strb r0, [r1]
	ldr r4, _0803B364 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803B368 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B36C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0803B3FA
	.align 2, 0
_0803B360: .4byte gCurrentClipdataAffectingAction
_0803B364: .4byte gCurrentSprite
_0803B368: .4byte gPreviousCollisionCheck
_0803B36C:
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _0803B390 @ =0x0834F10C
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803B394 @ =0x00007FFF
	cmp r1, r0
	bne _0803B398
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	b _0803B39C
	.align 2, 0
_0803B390: .4byte 0x0834F10C
_0803B394: .4byte 0x00007FFF
_0803B398:
	adds r0, r2, #1
	strb r0, [r5]
_0803B39C:
	ldr r0, _0803B3B0 @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	adds r3, r0, #0
	cmp r2, #1
	bls _0803B3D4
	cmp r2, #3
	bne _0803B3B4
	ldrh r0, [r3, #4]
	adds r0, r0, r4
	b _0803B3B8
	.align 2, 0
_0803B3B0: .4byte gCurrentSprite
_0803B3B4:
	ldrh r0, [r3, #4]
	subs r0, r0, r4
_0803B3B8:
	strh r0, [r3, #4]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B3CC
	ldrh r0, [r3, #2]
	adds r0, #6
	strh r0, [r3, #2]
	b _0803B3FA
_0803B3CC:
	ldrh r0, [r3, #2]
	subs r0, #6
	strh r0, [r3, #2]
	b _0803B3FA
_0803B3D4:
	cmp r2, #0
	beq _0803B3DE
	ldrh r0, [r3, #2]
	subs r0, r0, r4
	b _0803B3E2
_0803B3DE:
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803B3E2:
	strh r0, [r3, #2]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B3F4
	ldrh r0, [r3, #4]
	adds r0, #6
	b _0803B3F8
_0803B3F4:
	ldrh r0, [r3, #4]
	subs r0, #6
_0803B3F8:
	strh r0, [r3, #4]
_0803B3FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZeelaProjectileExplodingInit
ZeelaProjectileExplodingInit: @ 0x0803B400
	push {lr}
	ldr r3, _0803B430 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0803B434 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B43C
	ldr r0, _0803B438 @ =0x0835066C
	b _0803B43E
	.align 2, 0
_0803B430: .4byte gCurrentSprite
_0803B434: .4byte gSpriteRandomNumber
_0803B438: .4byte 0x0835066C
_0803B43C:
	ldr r0, _0803B444 @ =0x08350694
_0803B43E:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0803B444: .4byte 0x08350694

	thumb_func_start ZeelaProjectileExploding
ZeelaProjectileExploding: @ 0x0803B448
	push {r4, lr}
	ldr r4, _0803B468 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803B460
	movs r0, #0
	strh r0, [r4]
_0803B460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B468: .4byte gCurrentSprite

	thumb_func_start Zeela
Zeela: @ 0x0803B46C
	push {r4, lr}
	ldr r4, _0803B498 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803B486
	movs r0, #0xe6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803B486:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B49C
	bl SpriteUtilUpdateFreezeTimer
	b _0803B668
	.align 2, 0
_0803B498: .4byte gCurrentSprite
_0803B49C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803B4A8
	b _0803B668
_0803B4A8:
	lsls r0, r0, #2
	ldr r1, _0803B4B4 @ =_0803B4B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803B4B4: .4byte _0803B4B8
_0803B4B8: @ jump table
	.4byte _0803B628 @ case 0
	.4byte _0803B62E @ case 1
	.4byte _0803B632 @ case 2
	.4byte _0803B668 @ case 3
	.4byte _0803B668 @ case 4
	.4byte _0803B668 @ case 5
	.4byte _0803B668 @ case 6
	.4byte _0803B638 @ case 7
	.4byte _0803B63C @ case 8
	.4byte _0803B668 @ case 9
	.4byte _0803B668 @ case 10
	.4byte _0803B668 @ case 11
	.4byte _0803B668 @ case 12
	.4byte _0803B668 @ case 13
	.4byte _0803B668 @ case 14
	.4byte _0803B668 @ case 15
	.4byte _0803B668 @ case 16
	.4byte _0803B668 @ case 17
	.4byte _0803B668 @ case 18
	.4byte _0803B668 @ case 19
	.4byte _0803B668 @ case 20
	.4byte _0803B642 @ case 21
	.4byte _0803B646 @ case 22
	.4byte _0803B668 @ case 23
	.4byte _0803B668 @ case 24
	.4byte _0803B668 @ case 25
	.4byte _0803B668 @ case 26
	.4byte _0803B668 @ case 27
	.4byte _0803B668 @ case 28
	.4byte _0803B668 @ case 29
	.4byte _0803B668 @ case 30
	.4byte _0803B668 @ case 31
	.4byte _0803B668 @ case 32
	.4byte _0803B668 @ case 33
	.4byte _0803B668 @ case 34
	.4byte _0803B668 @ case 35
	.4byte _0803B668 @ case 36
	.4byte _0803B668 @ case 37
	.4byte _0803B668 @ case 38
	.4byte _0803B668 @ case 39
	.4byte _0803B668 @ case 40
	.4byte _0803B668 @ case 41
	.4byte _0803B668 @ case 42
	.4byte _0803B668 @ case 43
	.4byte _0803B668 @ case 44
	.4byte _0803B668 @ case 45
	.4byte _0803B668 @ case 46
	.4byte _0803B668 @ case 47
	.4byte _0803B668 @ case 48
	.4byte _0803B668 @ case 49
	.4byte _0803B668 @ case 50
	.4byte _0803B668 @ case 51
	.4byte _0803B668 @ case 52
	.4byte _0803B668 @ case 53
	.4byte _0803B668 @ case 54
	.4byte _0803B668 @ case 55
	.4byte _0803B668 @ case 56
	.4byte _0803B668 @ case 57
	.4byte _0803B668 @ case 58
	.4byte _0803B668 @ case 59
	.4byte _0803B668 @ case 60
	.4byte _0803B668 @ case 61
	.4byte _0803B668 @ case 62
	.4byte _0803B668 @ case 63
	.4byte _0803B668 @ case 64
	.4byte _0803B668 @ case 65
	.4byte _0803B668 @ case 66
	.4byte _0803B668 @ case 67
	.4byte _0803B668 @ case 68
	.4byte _0803B668 @ case 69
	.4byte _0803B668 @ case 70
	.4byte _0803B668 @ case 71
	.4byte _0803B668 @ case 72
	.4byte _0803B668 @ case 73
	.4byte _0803B668 @ case 74
	.4byte _0803B668 @ case 75
	.4byte _0803B668 @ case 76
	.4byte _0803B668 @ case 77
	.4byte _0803B668 @ case 78
	.4byte _0803B668 @ case 79
	.4byte _0803B668 @ case 80
	.4byte _0803B668 @ case 81
	.4byte _0803B668 @ case 82
	.4byte _0803B668 @ case 83
	.4byte _0803B668 @ case 84
	.4byte _0803B668 @ case 85
	.4byte _0803B668 @ case 86
	.4byte _0803B64C @ case 87
	.4byte _0803B650 @ case 88
	.4byte _0803B656 @ case 89
	.4byte _0803B65A @ case 90
	.4byte _0803B660 @ case 91
_0803B628:
	bl ZeelaInit
	b _0803B668
_0803B62E:
	bl ZeelaIdleInit
_0803B632:
	bl ZeelaIdle
	b _0803B668
_0803B638:
	bl ZeelaTurningAroundInit
_0803B63C:
	bl ZeelaTurningAround
	b _0803B668
_0803B642:
	bl ZeelaFallingInit
_0803B646:
	bl ZeelaFalling
	b _0803B668
_0803B64C:
	bl SpriteDyingInit
_0803B650:
	bl SpriteDying
	b _0803B668
_0803B656:
	bl ZeelaInit
_0803B65A:
	bl SpriteSpawningFromX
	b _0803B668
_0803B660:
	bl ZeelaTurningIntoX
	bl XParasiteInit
_0803B668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZeelaProjectile
ZeelaProjectile: @ 0x0803B670
	push {lr}
	ldr r0, _0803B688 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803B696
	cmp r0, #2
	bgt _0803B68C
	cmp r0, #0
	beq _0803B692
	b _0803B6A2
	.align 2, 0
_0803B688: .4byte gCurrentSprite
_0803B68C:
	cmp r0, #0x38
	beq _0803B69C
	b _0803B6A2
_0803B692:
	bl ZeelaProjectileInit
_0803B696:
	bl ZeelaProjectileMoving
	b _0803B6A6
_0803B69C:
	bl ZeelaProjectileExploding
	b _0803B6A6
_0803B6A2:
	bl ZeelaProjectileExplodingInit
_0803B6A6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaCheckCollidingWithAir
SovaCheckCollidingWithAir: @ 0x0803B6AC
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803B6E0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B70C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B6E8
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B6E4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803B74C
	.align 2, 0
_0803B6E0: .4byte gCurrentSprite
_0803B6E4: .4byte gPreviousCollisionCheck
_0803B6E8:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B708 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803B74C
	.align 2, 0
_0803B708: .4byte gPreviousCollisionCheck
_0803B70C:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B734
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B730 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803B748
	.align 2, 0
_0803B730: .4byte gPreviousCollisionCheck
_0803B734:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B760 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
_0803B748:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803B74C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	movs r6, #1
_0803B758:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803B760: .4byte gPreviousCollisionCheck

	thumb_func_start SovaUpdateHitbox
SovaUpdateHitbox: @ 0x0803B764
	push {lr}
	ldr r2, _0803B790 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B7B4
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B79C
	ldr r0, _0803B794 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803B798 @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803B7D4
	.align 2, 0
_0803B790: .4byte gCurrentSprite
_0803B794: .4byte 0x0000FFE4
_0803B798: .4byte 0x0000FFC0
_0803B79C:
	ldr r0, _0803B7AC @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803B7B0 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803B7D6
	.align 2, 0
_0803B7AC: .4byte 0x0000FFE4
_0803B7B0: .4byte 0x0000FFF0
_0803B7B4:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B7C6
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803B7CC
_0803B7C6:
	ldr r0, _0803B7DC @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803B7CC:
	strh r0, [r2, #0xc]
	ldr r0, _0803B7E0 @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
_0803B7D4:
	strh r0, [r2, #0x10]
_0803B7D6:
	pop {r0}
	bx r0
	.align 2, 0
_0803B7DC: .4byte 0x0000FFC0
_0803B7E0: .4byte 0x0000FFE4

	thumb_func_start SovaSetCrawlingOam
SovaSetCrawlingOam: @ 0x0803B7E4
	push {lr}
	ldr r0, _0803B7F8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803B800
	ldr r0, _0803B7FC @ =0x0835335C
	b _0803B816
	.align 2, 0
_0803B7F8: .4byte gCurrentSprite
_0803B7FC: .4byte 0x0835335C
_0803B800:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B814
	ldr r0, _0803B810 @ =0x08353384
	b _0803B816
	.align 2, 0
_0803B810: .4byte 0x08353384
_0803B814:
	ldr r0, _0803B824 @ =0x08353334
_0803B816:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803B824: .4byte 0x08353334

	thumb_func_start SovaTurningIntoX
SovaTurningIntoX: @ 0x0803B828
	push {lr}
	ldr r2, _0803B848 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B854
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B84C
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803B86A
	.align 2, 0
_0803B848: .4byte gCurrentSprite
_0803B84C:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803B86A
_0803B854:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B864
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803B868
_0803B864:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803B868:
	strh r0, [r2, #2]
_0803B86A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaInit
SovaInit: @ 0x0803B870
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803B8A0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B8A4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803B8A4
	strh r0, [r2]
	b _0803B9E4
	.align 2, 0
_0803B8A0: .4byte gCurrentSprite
_0803B8A4:
	ldr r1, _0803B8BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _0803B8C0
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803B9B4
	.align 2, 0
_0803B8BC: .4byte gCurrentSprite
_0803B8C0:
	movs r0, #0
	mov r8, r0
	movs r0, #2
	strb r0, [r2]
	movs r1, #0x2f
	adds r1, r1, r4
	mov sb, r1
	mov r0, r8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803B8FC @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _0803B904
	adds r0, r4, #0
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	ldr r0, _0803B900 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x46
	b _0803B9A2
	.align 2, 0
_0803B8FC: .4byte gPreviousCollisionCheck
_0803B900: .4byte gSpriteRandomNumber
_0803B904:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B92C
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0803B99A
_0803B92C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B968
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	ldr r0, _0803B964 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x1e
	adds r1, #3
	strb r0, [r1]
	b _0803B9B4
	.align 2, 0
_0803B964: .4byte gSpriteRandomNumber
_0803B968:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	beq _0803B9B0
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	strh r0, [r4, #4]
_0803B99A:
	ldr r0, _0803B9AC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x1e
_0803B9A2:
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	b _0803B9B4
	.align 2, 0
_0803B9AC: .4byte gSpriteRandomNumber
_0803B9B0:
	strh r2, [r4]
	b _0803B9E4
_0803B9B4:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SovaSetCrawlingOam
	bl SovaUpdateHitbox
	ldr r2, _0803B9F0 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803B9E4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B9F0: .4byte sPrimarySpriteStats

	thumb_func_start SovaIdleInit
SovaIdleInit: @ 0x0803B9F4
	push {lr}
	bl SovaSetCrawlingOam
	ldr r0, _0803BA08 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803BA08: .4byte gCurrentSprite

	thumb_func_start SovaIdle
SovaIdle: @ 0x0803BA0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _0803BAC0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803BA24
	b _0803BE98
_0803BA24:
	movs r0, #1
	mov r8, r0
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	subs r1, r0, #1
	strb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BA40
	b _0803BBCC
_0803BA40:
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BA4C
	b _0803BD70
_0803BA4C:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BB08
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BA90
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x14
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BA90
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BA90:
	ldr r4, _0803BAC0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BAC8
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BAC4 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BAB6
	b _0803BC9E
_0803BAB6:
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803BB70
	.align 2, 0
_0803BAC0: .4byte gCurrentSprite
_0803BAC4: .4byte gPreviousCollisionCheck
_0803BAC8:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BB04 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BAE0
	b _0803BC9E
_0803BAE0:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803BAF8
	b _0803BC9E
_0803BAF8:
	ldrh r0, [r4, #2]
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BB04: .4byte gPreviousCollisionCheck
_0803BB08:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BB42
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x14
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BB42
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BB42:
	ldr r4, _0803BB88 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BB90
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BB8C @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BB6A
	b _0803BC9E
_0803BB6A:
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
_0803BB70:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803BB80
	b _0803BC9E
_0803BB80:
	ldrh r0, [r4, #2]
	add r0, r8
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BB88: .4byte gCurrentSprite
_0803BB8C: .4byte gPreviousCollisionCheck
_0803BB90:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BBC8 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803BC9E
	ldrh r0, [r4, #2]
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BBC8: .4byte gPreviousCollisionCheck
_0803BBCC:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BCB6
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _0803BC0E
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC0E
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BC0E:
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC28
	ldr r0, _0803BC24 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803BE98
	.align 2, 0
_0803BC24: .4byte gCurrentSprite
_0803BC28:
	ldr r4, _0803BC68 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC70
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BC6C @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803BC9E
	b _0803BD4E
	.align 2, 0
_0803BC68: .4byte gCurrentSprite
_0803BC6C: .4byte gPreviousCollisionCheck
_0803BC70:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BCA8 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BCAC
_0803BC9E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803BE80
	.align 2, 0
_0803BCA8: .4byte gPreviousCollisionCheck
_0803BCAC:
	ldrh r0, [r4, #4]
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0803BE80
_0803BCB6:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0803BCC2
	cmp r0, #0x20
	bne _0803BCF0
_0803BCC2:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BD24
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803BD24
_0803BCF0:
	cmp r0, #0
	bne _0803BD24
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xd2
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BD24
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BD24:
	bl SpriteUtilAlignYPositionOnSlopeAtOrigin
	ldr r6, _0803BD58 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r6]
	adds r1, r2, #0
	cmp r1, #0
	bne _0803BD84
	ldr r4, _0803BD5C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BD60
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BD70
_0803BD4E:
	ldrh r0, [r4, #4]
	add r0, r8
	strh r0, [r4, #4]
	b _0803BE80
	.align 2, 0
_0803BD58: .4byte gPreviousVerticalCollisionCheck
_0803BD5C: .4byte gCurrentSprite
_0803BD60:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BD7A
_0803BD70:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803BE98
_0803BD7A:
	ldrh r0, [r4, #4]
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r4, #4]
	b _0803BE80
_0803BD84:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0803BE18
	ldr r2, _0803BDD4 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BDD8 @ =0x083533AC
	cmp r1, r0
	bne _0803BDAA
	ldr r0, _0803BDDC @ =0x08353334
	str r0, [r2, #0x18]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BDAA
	ldr r0, _0803BDE0 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2]
_0803BDAA:
	ldr r4, _0803BDD4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BDE8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BDE4 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BE0C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x28
	b _0803BE02
	.align 2, 0
_0803BDD4: .4byte gCurrentSprite
_0803BDD8: .4byte 0x083533AC
_0803BDDC: .4byte 0x08353334
_0803BDE0: .4byte 0x0000FFBF
_0803BDE4: .4byte gPreviousCollisionCheck
_0803BDE8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BE14 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BE0C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x28
_0803BE02:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _0803BE50
_0803BE0C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803BE50
	.align 2, 0
_0803BE14: .4byte gPreviousCollisionCheck
_0803BE18:
	cmp r1, #2
	beq _0803BE20
	cmp r1, #4
	bne _0803BE2E
_0803BE20:
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BE6C @ =0x08353334
	cmp r1, r0
	bne _0803BE2E
	ldr r0, _0803BE70 @ =0x083533AC
	str r0, [r2, #0x18]
_0803BE2E:
	ldr r0, _0803BE74 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #3
	beq _0803BE3A
	cmp r0, #5
	bne _0803BE50
_0803BE3A:
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BE6C @ =0x08353334
	cmp r1, r0
	bne _0803BE50
	ldr r0, _0803BE70 @ =0x083533AC
	str r0, [r2, #0x18]
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2]
_0803BE50:
	cmp r5, #0
	bne _0803BE84
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BE78
	ldrh r0, [r2, #4]
	add r0, r8
	b _0803BE7E
	.align 2, 0
_0803BE68: .4byte gCurrentSprite
_0803BE6C: .4byte 0x08353334
_0803BE70: .4byte 0x083533AC
_0803BE74: .4byte gPreviousVerticalCollisionCheck
_0803BE78:
	ldrh r0, [r2, #4]
	mov r1, r8
	subs r0, r0, r1
_0803BE7E:
	strh r0, [r2, #4]
_0803BE80:
	cmp r5, #0
	beq _0803BE98
_0803BE84:
	ldr r2, _0803BEA4 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_0803BE98:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BEA4: .4byte gCurrentSprite

	thumb_func_start SovaTurningAroundInit
SovaTurningAroundInit: @ 0x0803BEA8
	ldr r1, _0803BEBC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803BEBC: .4byte gCurrentSprite

	thumb_func_start SovaTurningAround
SovaTurningAround: @ 0x0803BEC0
	push {lr}
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BEDC
	ldr r0, _0803BED8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803BEF4
	.align 2, 0
_0803BED8: .4byte gCurrentSprite
_0803BEDC:
	ldr r1, _0803BEF8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803BEF4
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0803BEF4:
	pop {r0}
	bx r0
	.align 2, 0
_0803BEF8: .4byte gCurrentSprite

	thumb_func_start SovaFallingInit
SovaFallingInit: @ 0x0803BEFC
	ldr r1, _0803BF10 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bx lr
	.align 2, 0
_0803BF10: .4byte gCurrentSprite

	thumb_func_start SovaFalling
SovaFalling: @ 0x0803BF14
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803BF3C @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BF40
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BF4C
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803BF4C
	.align 2, 0
_0803BF3C: .4byte gCurrentSprite
_0803BF40:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803BF54
_0803BF4C:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803BF54:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803BFB0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BFC6
	ldr r4, _0803BFB4 @ =gCurrentSprite
	movs r3, #0
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803BF7C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803BF7C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	strb r3, [r2]
	ldrh r1, [r4]
	ldr r0, _0803BFB8 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r3, [r0]
	bl SovaSetCrawlingOam
	bl SovaUpdateHitbox
	cmp r5, #0
	beq _0803C008
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BFBC
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803BFC0
	.align 2, 0
_0803BFB0: .4byte gPreviousVerticalCollisionCheck
_0803BFB4: .4byte gCurrentSprite
_0803BFB8: .4byte 0x0000FEFF
_0803BFBC:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803BFC0:
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0803C008
_0803BFC6:
	ldr r3, _0803BFF0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803BFF4 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803BFF8 @ =0x00007FFF
	cmp r1, r0
	bne _0803BFFC
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803C006
	.align 2, 0
_0803BFF0: .4byte gCurrentSprite
_0803BFF4: .4byte sSpritesFallingSpeed
_0803BFF8: .4byte 0x00007FFF
_0803BFFC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803C006:
	strh r0, [r3, #2]
_0803C008:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaFireInit
SovaFireInit: @ 0x0803C010
	push {r4, lr}
	ldr r0, _0803C084 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803C088 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	movs r1, #8
	strb r1, [r0]
	subs r2, #0xb
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0803C08C @ =0x0000FFD8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r3, [r2, #0xc]
	adds r0, #0x20
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r0, ip
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _0803C094
	ldr r0, _0803C090 @ =0x0835346C
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x16
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r4, [r0]
	b _0803C0A6
	.align 2, 0
_0803C084: .4byte gCurrentSprite
_0803C088: .4byte 0x0000FFFB
_0803C08C: .4byte 0x0000FFD8
_0803C090: .4byte 0x0835346C
_0803C094:
	ldr r0, _0803C0AC @ =0x083533D4
	mov r1, ip
	str r0, [r1, #0x18]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0x32
	strb r0, [r1]
_0803C0A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0AC: .4byte 0x083533D4

	thumb_func_start SovaFireBig
SovaFireBig: @ 0x0803C0B0
	push {lr}
	ldr r2, _0803C0EC @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0803C0E6
	movs r1, #0
	ldr r0, _0803C0F0 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	ldr r0, _0803C0F4 @ =0x083533FC
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0x32
	mov r1, ip
	strb r0, [r1]
_0803C0E6:
	pop {r0}
	bx r0
	.align 2, 0
_0803C0EC: .4byte gCurrentSprite
_0803C0F0: .4byte 0x0000FFE4
_0803C0F4: .4byte 0x083533FC

	thumb_func_start SovaFireSmall
SovaFireSmall: @ 0x0803C0F8
	push {lr}
	ldr r2, _0803C134 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0803C12E
	movs r1, #0
	ldr r0, _0803C138 @ =0x0000FFF0
	strh r0, [r2, #0xa]
	ldr r0, _0803C13C @ =0x08353424
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	movs r0, #0x1e
	mov r1, ip
	strb r0, [r1]
_0803C12E:
	pop {r0}
	bx r0
	.align 2, 0
_0803C134: .4byte gCurrentSprite
_0803C138: .4byte 0x0000FFF0
_0803C13C: .4byte 0x08353424

	thumb_func_start SovaFireDisappearing
SovaFireDisappearing: @ 0x0803C140
	push {lr}
	ldr r2, _0803C174 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	ands r0, r1
	cmp r0, #0
	bne _0803C160
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0803C160:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0803C170
	strh r0, [r2]
_0803C170:
	pop {r0}
	bx r0
	.align 2, 0
_0803C174: .4byte gCurrentSprite

	thumb_func_start SovaFireExplodingInit
SovaFireExplodingInit: @ 0x0803C178
	push {lr}
	ldr r1, _0803C1A4 @ =gCurrentSprite
	ldr r0, _0803C1A8 @ =0x08353494
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C19E
	ldr r0, _0803C1AC @ =0x0000018F
	bl SoundPlayNotAlreadyPlaying
_0803C19E:
	pop {r0}
	bx r0
	.align 2, 0
_0803C1A4: .4byte gCurrentSprite
_0803C1A8: .4byte 0x08353494
_0803C1AC: .4byte 0x0000018F

	thumb_func_start SovaFireExploding
SovaFireExploding: @ 0x0803C1B0
	push {r4, lr}
	ldr r4, _0803C1D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803C1C8
	movs r0, #0
	strh r0, [r4]
_0803C1C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C1D0: .4byte gCurrentSprite

	thumb_func_start Sova
Sova: @ 0x0803C1D4
	push {r4, lr}
	ldr r4, _0803C200 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803C1EE
	movs r0, #0xc8
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803C1EE:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C204
	bl SpriteUtilUpdateFreezeTimer
	b _0803C3D0
	.align 2, 0
_0803C200: .4byte gCurrentSprite
_0803C204:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803C210
	b _0803C3D0
_0803C210:
	lsls r0, r0, #2
	ldr r1, _0803C21C @ =_0803C220
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C21C: .4byte _0803C220
_0803C220: @ jump table
	.4byte _0803C390 @ case 0
	.4byte _0803C396 @ case 1
	.4byte _0803C39A @ case 2
	.4byte _0803C3D0 @ case 3
	.4byte _0803C3D0 @ case 4
	.4byte _0803C3D0 @ case 5
	.4byte _0803C3D0 @ case 6
	.4byte _0803C3A0 @ case 7
	.4byte _0803C3A4 @ case 8
	.4byte _0803C3D0 @ case 9
	.4byte _0803C3D0 @ case 10
	.4byte _0803C3D0 @ case 11
	.4byte _0803C3D0 @ case 12
	.4byte _0803C3D0 @ case 13
	.4byte _0803C3D0 @ case 14
	.4byte _0803C3D0 @ case 15
	.4byte _0803C3D0 @ case 16
	.4byte _0803C3D0 @ case 17
	.4byte _0803C3D0 @ case 18
	.4byte _0803C3D0 @ case 19
	.4byte _0803C3D0 @ case 20
	.4byte _0803C3AA @ case 21
	.4byte _0803C3AE @ case 22
	.4byte _0803C3D0 @ case 23
	.4byte _0803C3D0 @ case 24
	.4byte _0803C3D0 @ case 25
	.4byte _0803C3D0 @ case 26
	.4byte _0803C3D0 @ case 27
	.4byte _0803C3D0 @ case 28
	.4byte _0803C3D0 @ case 29
	.4byte _0803C3D0 @ case 30
	.4byte _0803C3D0 @ case 31
	.4byte _0803C3D0 @ case 32
	.4byte _0803C3D0 @ case 33
	.4byte _0803C3D0 @ case 34
	.4byte _0803C3D0 @ case 35
	.4byte _0803C3D0 @ case 36
	.4byte _0803C3D0 @ case 37
	.4byte _0803C3D0 @ case 38
	.4byte _0803C3D0 @ case 39
	.4byte _0803C3D0 @ case 40
	.4byte _0803C3D0 @ case 41
	.4byte _0803C3D0 @ case 42
	.4byte _0803C3D0 @ case 43
	.4byte _0803C3D0 @ case 44
	.4byte _0803C3D0 @ case 45
	.4byte _0803C3D0 @ case 46
	.4byte _0803C3D0 @ case 47
	.4byte _0803C3D0 @ case 48
	.4byte _0803C3D0 @ case 49
	.4byte _0803C3D0 @ case 50
	.4byte _0803C3D0 @ case 51
	.4byte _0803C3D0 @ case 52
	.4byte _0803C3D0 @ case 53
	.4byte _0803C3D0 @ case 54
	.4byte _0803C3D0 @ case 55
	.4byte _0803C3D0 @ case 56
	.4byte _0803C3D0 @ case 57
	.4byte _0803C3D0 @ case 58
	.4byte _0803C3D0 @ case 59
	.4byte _0803C3D0 @ case 60
	.4byte _0803C3D0 @ case 61
	.4byte _0803C3D0 @ case 62
	.4byte _0803C3D0 @ case 63
	.4byte _0803C3D0 @ case 64
	.4byte _0803C3D0 @ case 65
	.4byte _0803C3D0 @ case 66
	.4byte _0803C3D0 @ case 67
	.4byte _0803C3D0 @ case 68
	.4byte _0803C3D0 @ case 69
	.4byte _0803C3D0 @ case 70
	.4byte _0803C3D0 @ case 71
	.4byte _0803C3D0 @ case 72
	.4byte _0803C3D0 @ case 73
	.4byte _0803C3D0 @ case 74
	.4byte _0803C3D0 @ case 75
	.4byte _0803C3D0 @ case 76
	.4byte _0803C3D0 @ case 77
	.4byte _0803C3D0 @ case 78
	.4byte _0803C3D0 @ case 79
	.4byte _0803C3D0 @ case 80
	.4byte _0803C3D0 @ case 81
	.4byte _0803C3D0 @ case 82
	.4byte _0803C3D0 @ case 83
	.4byte _0803C3D0 @ case 84
	.4byte _0803C3D0 @ case 85
	.4byte _0803C3D0 @ case 86
	.4byte _0803C3B4 @ case 87
	.4byte _0803C3B8 @ case 88
	.4byte _0803C3BE @ case 89
	.4byte _0803C3C2 @ case 90
	.4byte _0803C3C8 @ case 91
_0803C390:
	bl SovaInit
	b _0803C3D0
_0803C396:
	bl SovaIdleInit
_0803C39A:
	bl SovaIdle
	b _0803C3D0
_0803C3A0:
	bl SovaTurningAroundInit
_0803C3A4:
	bl SovaTurningAround
	b _0803C3D0
_0803C3AA:
	bl SovaFallingInit
_0803C3AE:
	bl SovaFalling
	b _0803C3D0
_0803C3B4:
	bl SpriteDyingInit
_0803C3B8:
	bl SpriteDying
	b _0803C3D0
_0803C3BE:
	bl SovaInit
_0803C3C2:
	bl SpriteSpawningFromX
	b _0803C3D0
_0803C3C8:
	bl SovaTurningIntoX
	bl XParasiteInit
_0803C3D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaFire
SovaFire: @ 0x0803C3D8
	push {lr}
	ldr r0, _0803C3F0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bhi _0803C48A
	lsls r0, r0, #2
	ldr r1, _0803C3F4 @ =_0803C3F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C3F0: .4byte gCurrentSprite
_0803C3F4: .4byte _0803C3F8
_0803C3F8: @ jump table
	.4byte _0803C464 @ case 0
	.4byte _0803C48A @ case 1
	.4byte _0803C46A @ case 2
	.4byte _0803C48A @ case 3
	.4byte _0803C48A @ case 4
	.4byte _0803C48A @ case 5
	.4byte _0803C48A @ case 6
	.4byte _0803C482 @ case 7
	.4byte _0803C486 @ case 8
	.4byte _0803C48A @ case 9
	.4byte _0803C48A @ case 10
	.4byte _0803C48A @ case 11
	.4byte _0803C48A @ case 12
	.4byte _0803C48A @ case 13
	.4byte _0803C48A @ case 14
	.4byte _0803C48A @ case 15
	.4byte _0803C48A @ case 16
	.4byte _0803C48A @ case 17
	.4byte _0803C48A @ case 18
	.4byte _0803C48A @ case 19
	.4byte _0803C48A @ case 20
	.4byte _0803C48A @ case 21
	.4byte _0803C47C @ case 22
	.4byte _0803C48A @ case 23
	.4byte _0803C470 @ case 24
	.4byte _0803C48A @ case 25
	.4byte _0803C476 @ case 26
_0803C464:
	bl SovaFireInit
	b _0803C48A
_0803C46A:
	bl SovaFireBig
	b _0803C48A
_0803C470:
	bl SovaFireSmall
	b _0803C48A
_0803C476:
	bl SovaFireDisappearing
	b _0803C48A
_0803C47C:
	bl SpriteUtilCurrentSpriteFall
	b _0803C48A
_0803C482:
	bl SovaFireExplodingInit
_0803C486:
	bl SovaFireExploding
_0803C48A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardCheckShouldStartle
YardCheckShouldStartle: @ 0x0803C490
	push {lr}
	ldr r0, _0803C4B4 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C4D8
	ldr r1, _0803C4B8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x18
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C4C0
	ldr r0, _0803C4BC @ =0x08355490
	b _0803C4C2
	.align 2, 0
_0803C4B4: .4byte gCurrentPowerBomb
_0803C4B8: .4byte gCurrentSprite
_0803C4BC: .4byte 0x08355490
_0803C4C0:
	ldr r0, _0803C4D4 @ =0x08355370
_0803C4C2:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x30
	movs r0, #0xb4
	strb r0, [r1]
	movs r0, #1
	b _0803C4DA
	.align 2, 0
_0803C4D4: .4byte 0x08355370
_0803C4D8:
	movs r0, #0
_0803C4DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YardCheckCollidingWithAir
YardCheckCollidingWithAir: @ 0x0803C4E0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803C514 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C540
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803C51C
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C518 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803C584
	.align 2, 0
_0803C514: .4byte gCurrentSprite
_0803C518: .4byte gPreviousCollisionCheck
_0803C51C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C53C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803C584
	.align 2, 0
_0803C53C: .4byte gPreviousCollisionCheck
_0803C540:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C56C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C568 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803C580
	.align 2, 0
_0803C568: .4byte gPreviousCollisionCheck
_0803C56C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C598 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
_0803C580:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803C584:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	movs r6, #1
_0803C590:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C598: .4byte gPreviousCollisionCheck

	thumb_func_start YardUpdateHitbox
YardUpdateHitbox: @ 0x0803C59C
	push {lr}
	ldr r2, _0803C5D4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C630
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C5F8
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803C5E0
	ldr r0, _0803C5D8 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803C5DC @ =0x0000FFC8
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803C69A
	.align 2, 0
_0803C5D4: .4byte gCurrentSprite
_0803C5D8: .4byte 0x0000FFE4
_0803C5DC: .4byte 0x0000FFC8
_0803C5E0:
	ldr r0, _0803C5F0 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803C5F4 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x38
	b _0803C69A
	.align 2, 0
_0803C5F0: .4byte 0x0000FFE4
_0803C5F4: .4byte 0x0000FFF0
_0803C5F8:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C618
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x38
	strh r0, [r2, #0xc]
	ldr r0, _0803C614 @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
	b _0803C69A
	.align 2, 0
_0803C614: .4byte 0x0000FFE4
_0803C618:
	ldr r0, _0803C628 @ =0x0000FFC8
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0803C62C @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
	b _0803C69A
	.align 2, 0
_0803C628: .4byte 0x0000FFC8
_0803C62C: .4byte 0x0000FFE4
_0803C630:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C678
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803C660
	ldr r0, _0803C658 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	movs r0, #0x20
	strh r0, [r2, #0xc]
	ldr r0, _0803C65C @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803C69A
	.align 2, 0
_0803C658: .4byte 0x0000FFE0
_0803C65C: .4byte 0x0000FFC0
_0803C660:
	ldr r0, _0803C670 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	movs r0, #0x20
	strh r0, [r2, #0xc]
	ldr r0, _0803C674 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803C69C
	.align 2, 0
_0803C670: .4byte 0x0000FFE0
_0803C674: .4byte 0x0000FFF0
_0803C678:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C68C
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803C692
_0803C68C:
	ldr r0, _0803C6A0 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803C692:
	strh r0, [r2, #0xc]
	ldr r0, _0803C6A4 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803C69A:
	strh r0, [r2, #0x10]
_0803C69C:
	pop {r0}
	bx r0
	.align 2, 0
_0803C6A0: .4byte 0x0000FFC0
_0803C6A4: .4byte 0x0000FFE0

	thumb_func_start YardSetCrawlingOam
YardSetCrawlingOam: @ 0x0803C6A8
	push {lr}
	ldr r2, _0803C6CC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _0803C6DC
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C6D4
	ldr r0, _0803C6D0 @ =0x08355540
	b _0803C6F2
	.align 2, 0
_0803C6CC: .4byte gCurrentSprite
_0803C6D0: .4byte 0x08355540
_0803C6D4:
	ldr r0, _0803C6D8 @ =0x08355530
	b _0803C6F2
	.align 2, 0
_0803C6D8: .4byte 0x08355530
_0803C6DC:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C6F0
	ldr r0, _0803C6EC @ =0x083553E8
	b _0803C6F2
	.align 2, 0
_0803C6EC: .4byte 0x083553E8
_0803C6F0:
	ldr r0, _0803C700 @ =0x083552C8
_0803C6F2:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C700: .4byte 0x083552C8

	thumb_func_start YardSetTurningAroundOam
YardSetTurningAroundOam: @ 0x0803C704
	push {lr}
	ldr r0, _0803C718 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C720
	ldr r0, _0803C71C @ =0x083554C8
	b _0803C722
	.align 2, 0
_0803C718: .4byte gCurrentSprite
_0803C71C: .4byte 0x083554C8
_0803C720:
	ldr r0, _0803C730 @ =0x083553A8
_0803C722:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C730: .4byte 0x083553A8

	thumb_func_start YardSetTurningAroundSecondPartOam
YardSetTurningAroundSecondPartOam: @ 0x0803C734
	push {lr}
	ldr r0, _0803C748 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C750
	ldr r0, _0803C74C @ =0x083554E8
	b _0803C752
	.align 2, 0
_0803C748: .4byte gCurrentSprite
_0803C74C: .4byte 0x083554E8
_0803C750:
	ldr r0, _0803C760 @ =0x083553C8
_0803C752:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C760: .4byte 0x083553C8

	thumb_func_start YardSetChargingOam
YardSetChargingOam: @ 0x0803C764
	push {lr}
	ldr r0, _0803C778 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C780
	ldr r0, _0803C77C @ =0x08355408
	b _0803C782
	.align 2, 0
_0803C778: .4byte gCurrentSprite
_0803C77C: .4byte 0x08355408
_0803C780:
	ldr r0, _0803C790 @ =0x083552E8
_0803C782:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C790: .4byte 0x083552E8

	thumb_func_start YardSetShootingOam
YardSetShootingOam: @ 0x0803C794
	push {lr}
	ldr r0, _0803C7A8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C7B0
	ldr r0, _0803C7AC @ =0x08355438
	b _0803C7B2
	.align 2, 0
_0803C7A8: .4byte gCurrentSprite
_0803C7AC: .4byte 0x08355438
_0803C7B0:
	ldr r0, _0803C7C0 @ =0x08355318
_0803C7B2:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C7C0: .4byte 0x08355318

	thumb_func_start YardSetRecoilOam
YardSetRecoilOam: @ 0x0803C7C4
	push {lr}
	ldr r0, _0803C7D8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C7E0
	ldr r0, _0803C7DC @ =0x08355470
	b _0803C7E2
	.align 2, 0
_0803C7D8: .4byte gCurrentSprite
_0803C7DC: .4byte 0x08355470
_0803C7E0:
	ldr r0, _0803C7F0 @ =0x08355350
_0803C7E2:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C7F0: .4byte 0x08355350

	thumb_func_start YardCheckShoot
YardCheckShoot: @ 0x0803C7F4
	push {r4, lr}
	ldr r1, _0803C808 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803C80C
	subs r0, #1
	strb r0, [r2]
	b _0803C866
	.align 2, 0
_0803C808: .4byte gCurrentSprite
_0803C80C:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C824
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehindY
	b _0803C830
_0803C824:
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
_0803C830:
	adds r1, r0, #0
	cmp r1, #3
	bne _0803C844
	ldr r0, _0803C840 @ =gCurrentSprite
	adds r0, #0x24
	strb r1, [r0]
	b _0803C866
	.align 2, 0
_0803C840: .4byte gCurrentSprite
_0803C844:
	cmp r1, #0xc
	bne _0803C866
	ldr r4, _0803C86C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl YardSetChargingOam
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C866
	ldr r0, _0803C870 @ =0x00000195
	bl SoundPlayNotAlreadyPlaying
_0803C866:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C86C: .4byte gCurrentSprite
_0803C870: .4byte 0x00000195

	thumb_func_start YardCharging
YardCharging: @ 0x0803C874
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803C892
	ldr r0, _0803C898 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x2e
	movs r1, #0x1e
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #0x2c
	strb r1, [r0]
	bl YardSetShootingOam
_0803C892:
	pop {r0}
	bx r0
	.align 2, 0
_0803C898: .4byte gCurrentSprite

	thumb_func_start YardShooting
YardShooting: @ 0x0803C89C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl YardCheckShouldStartle
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0803C8AE
	b _0803CA2C
_0803C8AE:
	ldr r1, _0803C8CC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r2, r0, #1
	strb r2, [r3]
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _0803C8D0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	bl YardSetRecoilOam
	b _0803CA2C
	.align 2, 0
_0803C8CC: .4byte gCurrentSprite
_0803C8D0:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	beq _0803C8DA
	b _0803CA2C
_0803C8DA:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	cmp r6, #0
	beq _0803C972
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803C930
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C918
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x54
	str r0, [sp, #4]
	str r7, [sp, #8]
	b _0803C9F0
_0803C918:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x54
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _0803C9A4
_0803C930:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C95E
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x54
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3a
	movs r1, #3
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C95E:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x54
	b _0803C9C0
_0803C972:
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803C9CE
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C9AE
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r6, [sp, #8]
_0803C9A4:
	movs r0, #0x3a
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9AE:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x40
_0803C9C0:
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x3a
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9CE:
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C9FA
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r5, [sp, #8]
_0803C9F0:
	movs r0, #0x3a
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9FA:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x3a
	movs r1, #3
	bl SpriteSpawnSecondary
_0803CA18:
	ldr r0, _0803CA34 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CA2C
	movs r0, #0xcb
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803CA2C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA34: .4byte gCurrentSprite

	thumb_func_start YardRecoil
YardRecoil: @ 0x0803CA38
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803CA52
	ldr r1, _0803CA58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_0803CA52:
	pop {r0}
	bx r0
	.align 2, 0
_0803CA58: .4byte gCurrentSprite

	thumb_func_start YardTurningIntoX
YardTurningIntoX: @ 0x0803CA5C
	push {lr}
	ldr r2, _0803CA7C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803CA88
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803CA80
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803CAA0
	.align 2, 0
_0803CA7C: .4byte gCurrentSprite
_0803CA80:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803CAA0
_0803CA88:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803CA9A
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803CA9E
_0803CA9A:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803CA9E:
	strh r0, [r2, #2]
_0803CAA0:
	pop {r0}
	bx r0

	thumb_func_start YardInit
YardInit: @ 0x0803CAA4
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0803CAF0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0x59
	bne _0803CB04
	ldrh r0, [r4]
	ldr r2, _0803CAF4 @ =0x0000FF7F
	ands r2, r0
	strh r2, [r4]
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803CAD2
	b _0803CC0A
_0803CAD2:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0803CADE
	b _0803CC0A
_0803CADE:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803CAF8
	movs r1, #0x40
	adds r0, r2, #0
	b _0803CBB8
	.align 2, 0
_0803CAF0: .4byte gCurrentSprite
_0803CAF4: .4byte 0x0000FF7F
_0803CAF8:
	ldr r0, _0803CB00 @ =0x0000FFBF
	ands r0, r2
	strh r0, [r4]
	b _0803CC0A
	.align 2, 0
_0803CB00: .4byte 0x0000FFBF
_0803CB04:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r5]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803CB3C @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _0803CB40
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r0, #0x40
	b _0803CBB8
	.align 2, 0
_0803CB3C: .4byte gPreviousCollisionCheck
_0803CB40:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CB7C
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r0, #0x40
	b _0803CC06
_0803CB7C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CBBE
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0803CBB8:
	orrs r0, r1
	strh r0, [r4]
	b _0803CC0A
_0803CBBE:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	bne _0803CBD8
	strh r2, [r4]
	b _0803CC74
_0803CBD8:
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	movs r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	strh r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0803CC06:
	orrs r1, r0
	strh r1, [r4]
_0803CC0A:
	ldr r1, _0803CC28 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803CC2C
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	movs r0, #8
	orrs r0, r2
	b _0803CC36
	.align 2, 0
_0803CC28: .4byte gCurrentSprite
_0803CC2C:
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	movs r0, #0xf7
	ands r0, r2
_0803CC36:
	strb r0, [r3]
	bl YardSetCrawlingOam
	bl YardUpdateHitbox
	ldr r3, _0803CC7C @ =gCurrentSprite
	ldr r2, _0803CC80 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x25
	movs r0, #2
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #8
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803CC74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC7C: .4byte gCurrentSprite
_0803CC80: .4byte sPrimarySpriteStats

	thumb_func_start YardCheckRoll
YardCheckRoll: @ 0x0803CC84
	push {r4, r5, lr}
	ldr r4, _0803CCC0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0803CCF0
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CCF0
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CCB6
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CCC4
_0803CCB6:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803CCF0
	.align 2, 0
_0803CCC0: .4byte gCurrentSprite
_0803CCC4:
	bl SpriteUtilMakeSpriteFaceAwayFromSamusDirection
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0803CCF0
	movs r1, #0
	movs r0, #0x80
	orrs r0, r2
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	strh r5, [r4, #0x12]
_0803CCF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardRolling
YardRolling: @ 0x0803CCF8
	push {r4, r5, r6, r7, lr}
	bl YardCheckRoll
	movs r7, #0
	bl SpriteUtilAlignYPositionOnSlopeAtOrigin
	ldr r5, _0803CD38 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	bne _0803CD72
	ldr r4, _0803CD3C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CD40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0803CD50
	cmp r0, #4
	beq _0803CD64
	cmp r0, #2
	beq _0803CD36
	b _0803CE5E
_0803CD36:
	b _0803CD64
	.align 2, 0
_0803CD38: .4byte gPreviousVerticalCollisionCheck
_0803CD3C: .4byte gCurrentSprite
_0803CD40:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803CD5A
_0803CD50:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803CED0
_0803CD5A:
	cmp r0, #5
	beq _0803CD64
	cmp r0, #3
	beq _0803CD64
	b _0803CE5E
_0803CD64:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0803CE5E
_0803CD72:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0803CDF8
	ldr r4, _0803CDB8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CDC4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803CDBC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0803CDAE
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803CE5E
_0803CDAE:
	ldrh r1, [r4]
	ldr r0, _0803CDC0 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0803CED0
	.align 2, 0
_0803CDB8: .4byte gCurrentSprite
_0803CDBC: .4byte gPreviousCollisionCheck
_0803CDC0: .4byte 0x0000FDFF
_0803CDC4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803CDF4 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803CDE8
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _0803CE5E
_0803CDE8:
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r4]
	b _0803CED0
	.align 2, 0
_0803CDF4: .4byte gPreviousCollisionCheck
_0803CDF8:
	cmp r1, #4
	beq _0803CE00
	cmp r1, #2
	bne _0803CE28
_0803CE00:
	ldr r1, _0803CE24 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _0803CE80
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803CE5E
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r5]
	b _0803CE80
	.align 2, 0
_0803CE24: .4byte gCurrentSprite
_0803CE28:
	cmp r1, #5
	beq _0803CE30
	cmp r1, #3
	bne _0803CE5E
_0803CE30:
	ldr r1, _0803CE54 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _0803CE5C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803CE5E
	ldr r0, _0803CE58 @ =0x0000FDFF
	ands r0, r2
	strh r0, [r5]
	b _0803CE80
	.align 2, 0
_0803CE54: .4byte gCurrentSprite
_0803CE58: .4byte 0x0000FDFF
_0803CE5C:
	movs r7, #1
_0803CE5E:
	ldr r5, _0803CE7C @ =gCurrentSprite
	cmp r7, #0
	bne _0803CE80
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CE8E
	subs r1, #0xa
	movs r0, #1
	strb r0, [r1]
	b _0803CED0
	.align 2, 0
_0803CE7C: .4byte gCurrentSprite
_0803CE80:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _0803CE8E
	movs r0, #0x10
	strb r0, [r1]
_0803CE8E:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsrs r4, r0, #3
	adds r0, r4, #0
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CEB2
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, r0, r4
	b _0803CEBA
_0803CEB2:
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, r0, r4
_0803CEBA:
	strb r0, [r1]
	ldr r0, _0803CED8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0803CED0
	movs r0, #0xcc
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803CED0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CED8: .4byte gFrameCounter8Bit

	thumb_func_start YardStartled
YardStartled: @ 0x0803CEDC
	push {lr}
	bl YardCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CEF8
	ldr r0, _0803CEF4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803CF10
	.align 2, 0
_0803CEF4: .4byte gCurrentSprite
_0803CEF8:
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803CF10
	ldr r1, _0803CF14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_0803CF10:
	pop {r0}
	bx r0
	.align 2, 0
_0803CF14: .4byte gCurrentSprite

	thumb_func_start YardIdleInit
YardIdleInit: @ 0x0803CF18
	push {lr}
	bl YardSetCrawlingOam
	ldr r0, _0803CF2C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803CF2C: .4byte gCurrentSprite

	thumb_func_start YardIdle
YardIdle: @ 0x0803CF30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #1
	mov sb, r0
	movs r6, #0
	bl YardCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CF5C
	ldr r0, _0803CF58 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803D2C0
	.align 2, 0
_0803CF58: .4byte gCurrentSprite
_0803CF5C:
	ldr r4, _0803CF74 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CF78
	bl YardCheckRoll
	b _0803D2C0
	.align 2, 0
_0803CF74: .4byte gCurrentSprite
_0803CF78:
	bl YardCheckShouldStartle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CF84
	b _0803D2C0
_0803CF84:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803D050
	ldrh r1, [r4, #2]
	ldrh r2, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r4, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	ldrh r0, [r4, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r5, #0
	str r4, [sp, #0x18]
_0803CFBE:
	ldr r0, [sp, #0x18]
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r5, r0
	beq _0803D03E
	ldr r1, _0803D04C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D03E
	mov r1, ip
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x6d
	bne _0803D03E
	mov r0, ip
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _0803D03E
	mov r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _0803D03E
	mov r7, ip
	ldrh r3, [r7, #2]
	ldrh r4, [r7, #4]
	ldrh r2, [r7, #0xa]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r7, #0xc]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r1, [r7, #0xe]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r7, #0x10]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, r8
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _0803D03E
	b _0803D296
_0803D03E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0803CFBE
	b _0803D054
	.align 2, 0
_0803D04C: .4byte gSpriteData
_0803D050:
	subs r0, #1
	strb r0, [r1]
_0803D054:
	ldr r4, _0803D098 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803D062
	b _0803D168
_0803D062:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D0E0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D0A0
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D09C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D08E
	b _0803D270
_0803D08E:
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803D10A
	.align 2, 0
_0803D098: .4byte gCurrentSprite
_0803D09C: .4byte gPreviousCollisionCheck
_0803D0A0:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D0DC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D0B8
	b _0803D270
_0803D0B8:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D0D0
	b _0803D270
_0803D0D0:
	ldrh r0, [r4, #2]
	mov r1, sb
	subs r0, r0, r1
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D0DC: .4byte gPreviousCollisionCheck
_0803D0E0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D128
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D124 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D104
	b _0803D270
_0803D104:
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
_0803D10A:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D11A
	b _0803D270
_0803D11A:
	ldrh r0, [r4, #2]
	add r0, sb
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D124: .4byte gPreviousCollisionCheck
_0803D128:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D164 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D142
	b _0803D270
_0803D142:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D158
	b _0803D270
_0803D158:
	ldrh r0, [r4, #2]
	mov r7, sb
	subs r0, r0, r7
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D164: .4byte gPreviousCollisionCheck
_0803D168:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D1EC
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D1B8
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D1B4 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
	.align 2, 0
_0803D1B4: .4byte gPreviousCollisionCheck
_0803D1B8:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D1E8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	b _0803D2A8
	.align 2, 0
_0803D1E8: .4byte gPreviousCollisionCheck
_0803D1EC:
	bl SpriteUtilAlignYPositionOnSlopeAtOrigin
	ldr r0, _0803D23C @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r5, #0xf0
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D284
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D244
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _0803D240 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
	.align 2, 0
_0803D23C: .4byte gPreviousVerticalCollisionCheck
_0803D240: .4byte gPreviousCollisionCheck
_0803D244:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _0803D278 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D27C
_0803D270:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0803D2B0
	.align 2, 0
_0803D278: .4byte gPreviousCollisionCheck
_0803D27C:
	ldrh r0, [r4, #4]
	mov r7, sb
	subs r0, r0, r7
	b _0803D2AE
_0803D284:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D2A8
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
_0803D296:
	ldr r1, [sp, #0x18]
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	ldr r1, [sp, #0x18]
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0803D2C0
_0803D2A8:
	ldrh r0, [r4, #4]
	mov r1, sb
	subs r0, r0, r1
_0803D2AE:
	strh r0, [r4, #4]
_0803D2B0:
	cmp r6, #0
	beq _0803D2BC
	ldr r0, _0803D2D0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	strb r1, [r0]
_0803D2BC:
	bl YardCheckShoot
_0803D2C0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2D0: .4byte gCurrentSprite

	thumb_func_start YardTurningAroundInit
YardTurningAroundInit: @ 0x0803D2D4
	push {lr}
	ldr r0, _0803D2E8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bl YardSetTurningAroundOam
	pop {r0}
	bx r0
	.align 2, 0
_0803D2E8: .4byte gCurrentSprite

	thumb_func_start YardTurningAround
YardTurningAround: @ 0x0803D2EC
	push {r4, lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803D332
	ldr r4, _0803D318 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #5
	strb r1, [r0]
	bl YardSetTurningAroundSecondPartOam
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D31C
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	b _0803D320
	.align 2, 0
_0803D318: .4byte gCurrentSprite
_0803D31C:
	ldrh r0, [r4]
	movs r1, #0x40
_0803D320:
	eors r0, r1
	strh r0, [r4]
	ldr r0, _0803D338 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0803D332:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D338: .4byte gCurrentSprite

	thumb_func_start YardTurningAroundSecondPart
YardTurningAroundSecondPart: @ 0x0803D33C
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803D34E
	ldr r0, _0803D354 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803D34E:
	pop {r0}
	bx r0
	.align 2, 0
_0803D354: .4byte gCurrentSprite

	thumb_func_start YardFallingInit
YardFallingInit: @ 0x0803D358
	push {lr}
	ldr r1, _0803D374 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl YardSetCrawlingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803D374: .4byte gCurrentSprite

	thumb_func_start YardFalling
YardFalling: @ 0x0803D378
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803D3A0 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D3A4
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D3B0
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803D3B0
	.align 2, 0
_0803D3A0: .4byte gCurrentSprite
_0803D3A4:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D3B8
_0803D3B0:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803D3B8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803D410 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D444
	ldr r4, _0803D414 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803D3DE
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803D3DE:
	ldrh r1, [r4]
	ldr r0, _0803D418 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r4]
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bl YardUpdateHitbox
	bl YardSetCrawlingOam
	cmp r5, #0
	beq _0803D424
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D41C
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803D420
	.align 2, 0
_0803D410: .4byte gPreviousVerticalCollisionCheck
_0803D414: .4byte gCurrentSprite
_0803D418: .4byte 0x0000FEFF
_0803D41C:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803D420:
	subs r0, r0, r1
	strh r0, [r4, #4]
_0803D424:
	ldr r2, _0803D440 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D488
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	movs r2, #0x28
	bl ParticleSet
	b _0803D488
	.align 2, 0
_0803D440: .4byte gCurrentSprite
_0803D444:
	ldr r3, _0803D470 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803D474 @ =sSpritesFallingSpeedSlow
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803D478 @ =0x00007FFF
	cmp r1, r0
	bne _0803D47C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803D486
	.align 2, 0
_0803D470: .4byte gCurrentSprite
_0803D474: .4byte sSpritesFallingSpeedSlow
_0803D478: .4byte 0x00007FFF
_0803D47C:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803D486:
	strh r0, [r3, #2]
_0803D488:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectileInit
YardProjectileInit: @ 0x0803D490
	push {r4, lr}
	ldr r0, _0803D4FC @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803D500 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r2, #0xb
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0803D504 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _0803D508 @ =0x08355508
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803D50C @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D4FC: .4byte gCurrentSprite
_0803D500: .4byte 0x0000FFFB
_0803D504: .4byte 0x0000FFF8
_0803D508: .4byte 0x08355508
_0803D50C: .4byte gIoRegisters

	thumb_func_start YardProjectileMoving
YardProjectileMoving: @ 0x0803D510
	push {lr}
	ldr r1, _0803D528 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0803D52C
	ldrh r0, [r1, #2]
	subs r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	subs r0, #3
	b _0803D554
	.align 2, 0
_0803D528: .4byte gCurrentSprite
_0803D52C:
	cmp r0, #1
	bne _0803D53C
	ldrh r0, [r1, #2]
	adds r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	subs r0, #3
	b _0803D554
_0803D53C:
	cmp r0, #2
	bne _0803D546
	ldrh r0, [r1, #2]
	adds r0, #3
	b _0803D54E
_0803D546:
	cmp r0, #3
	bne _0803D556
	ldrh r0, [r1, #2]
	subs r0, #3
_0803D54E:
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	adds r0, #3
_0803D554:
	strh r0, [r1, #4]
_0803D556:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectileExplodingInit
YardProjectileExplodingInit: @ 0x0803D55C
	ldr r3, _0803D578 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _0803D57C @ =0x08355550
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0803D578: .4byte gCurrentSprite
_0803D57C: .4byte 0x08355550

	thumb_func_start YardProjectileExploding
YardProjectileExploding: @ 0x0803D580
	push {r4, lr}
	ldr r4, _0803D5A0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803D598
	movs r0, #0
	strh r0, [r4]
_0803D598:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D5A0: .4byte gCurrentSprite

	thumb_func_start Yard
Yard: @ 0x0803D5A4
	push {r4, lr}
	ldr r4, _0803D5CC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803D5BC
	ldr r0, _0803D5D0 @ =0x00000197
	bl SoundPlayNotAlreadyPlaying
_0803D5BC:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D5D4
	bl SpriteUtilUpdateFreezeTimer
	b _0803D7C4
	.align 2, 0
_0803D5CC: .4byte gCurrentSprite
_0803D5D0: .4byte 0x00000197
_0803D5D4:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803D5E0
	b _0803D7C4
_0803D5E0:
	lsls r0, r0, #2
	ldr r1, _0803D5EC @ =_0803D5F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D5EC: .4byte _0803D5F0
_0803D5F0: @ jump table
	.4byte _0803D760 @ case 0
	.4byte _0803D766 @ case 1
	.4byte _0803D76A @ case 2
	.4byte _0803D776 @ case 3
	.4byte _0803D77A @ case 4
	.4byte _0803D780 @ case 5
	.4byte _0803D7C4 @ case 6
	.4byte _0803D7C4 @ case 7
	.4byte _0803D7C4 @ case 8
	.4byte _0803D7C4 @ case 9
	.4byte _0803D7C4 @ case 10
	.4byte _0803D7C4 @ case 11
	.4byte _0803D7C4 @ case 12
	.4byte _0803D7C4 @ case 13
	.4byte _0803D7C4 @ case 14
	.4byte _0803D7C4 @ case 15
	.4byte _0803D7C4 @ case 16
	.4byte _0803D7C4 @ case 17
	.4byte _0803D7C4 @ case 18
	.4byte _0803D7C4 @ case 19
	.4byte _0803D7C4 @ case 20
	.4byte _0803D786 @ case 21
	.4byte _0803D78A @ case 22
	.4byte _0803D7C4 @ case 23
	.4byte _0803D770 @ case 24
	.4byte _0803D7C4 @ case 25
	.4byte _0803D7C4 @ case 26
	.4byte _0803D7C4 @ case 27
	.4byte _0803D7C4 @ case 28
	.4byte _0803D7C4 @ case 29
	.4byte _0803D7C4 @ case 30
	.4byte _0803D7C4 @ case 31
	.4byte _0803D7C4 @ case 32
	.4byte _0803D7C4 @ case 33
	.4byte _0803D7C4 @ case 34
	.4byte _0803D7C4 @ case 35
	.4byte _0803D7C4 @ case 36
	.4byte _0803D7C4 @ case 37
	.4byte _0803D7C4 @ case 38
	.4byte _0803D7C4 @ case 39
	.4byte _0803D7C4 @ case 40
	.4byte _0803D7C4 @ case 41
	.4byte _0803D790 @ case 42
	.4byte _0803D7C4 @ case 43
	.4byte _0803D796 @ case 44
	.4byte _0803D7C4 @ case 45
	.4byte _0803D79C @ case 46
	.4byte _0803D7C4 @ case 47
	.4byte _0803D7C4 @ case 48
	.4byte _0803D7C4 @ case 49
	.4byte _0803D7C4 @ case 50
	.4byte _0803D7C4 @ case 51
	.4byte _0803D7C4 @ case 52
	.4byte _0803D7C4 @ case 53
	.4byte _0803D7C4 @ case 54
	.4byte _0803D7C4 @ case 55
	.4byte _0803D7A2 @ case 56
	.4byte _0803D7C4 @ case 57
	.4byte _0803D7C4 @ case 58
	.4byte _0803D7C4 @ case 59
	.4byte _0803D7C4 @ case 60
	.4byte _0803D7C4 @ case 61
	.4byte _0803D7C4 @ case 62
	.4byte _0803D7C4 @ case 63
	.4byte _0803D7C4 @ case 64
	.4byte _0803D7C4 @ case 65
	.4byte _0803D7C4 @ case 66
	.4byte _0803D7C4 @ case 67
	.4byte _0803D7C4 @ case 68
	.4byte _0803D7C4 @ case 69
	.4byte _0803D7C4 @ case 70
	.4byte _0803D7C4 @ case 71
	.4byte _0803D7C4 @ case 72
	.4byte _0803D7C4 @ case 73
	.4byte _0803D7C4 @ case 74
	.4byte _0803D7C4 @ case 75
	.4byte _0803D7C4 @ case 76
	.4byte _0803D7C4 @ case 77
	.4byte _0803D7C4 @ case 78
	.4byte _0803D7C4 @ case 79
	.4byte _0803D7C4 @ case 80
	.4byte _0803D7C4 @ case 81
	.4byte _0803D7C4 @ case 82
	.4byte _0803D7C4 @ case 83
	.4byte _0803D7C4 @ case 84
	.4byte _0803D7C4 @ case 85
	.4byte _0803D7C4 @ case 86
	.4byte _0803D7A8 @ case 87
	.4byte _0803D7AC @ case 88
	.4byte _0803D7B2 @ case 89
	.4byte _0803D7B6 @ case 90
	.4byte _0803D7BC @ case 91
_0803D760:
	bl YardInit
	b _0803D7C4
_0803D766:
	bl YardIdleInit
_0803D76A:
	bl YardIdle
	b _0803D7C4
_0803D770:
	bl YardStartled
	b _0803D7C4
_0803D776:
	bl YardTurningAroundInit
_0803D77A:
	bl YardTurningAround
	b _0803D7C4
_0803D780:
	bl YardTurningAroundSecondPart
	b _0803D7C4
_0803D786:
	bl YardFallingInit
_0803D78A:
	bl YardFalling
	b _0803D7C4
_0803D790:
	bl YardCharging
	b _0803D7C4
_0803D796:
	bl YardShooting
	b _0803D7C4
_0803D79C:
	bl YardRecoil
	b _0803D7C4
_0803D7A2:
	bl YardRolling
	b _0803D7C4
_0803D7A8:
	bl SpriteDyingInit
_0803D7AC:
	bl SpriteDying
	b _0803D7C4
_0803D7B2:
	bl YardInit
_0803D7B6:
	bl SpriteSpawningFromX
	b _0803D7C4
_0803D7BC:
	bl YardTurningIntoX
	bl XParasiteInit
_0803D7C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectile
YardProjectile: @ 0x0803D7CC
	push {lr}
	ldr r0, _0803D7E4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803D7F2
	cmp r0, #2
	bgt _0803D7E8
	cmp r0, #0
	beq _0803D7EE
	b _0803D7FE
	.align 2, 0
_0803D7E4: .4byte gCurrentSprite
_0803D7E8:
	cmp r0, #0x38
	beq _0803D7F8
	b _0803D7FE
_0803D7EE:
	bl YardProjectileInit
_0803D7F2:
	bl YardProjectileMoving
	b _0803D802
_0803D7F8:
	bl YardProjectileExploding
	b _0803D802
_0803D7FE:
	bl YardProjectileExplodingInit
_0803D802:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvirCheckInShootingRange
EvirCheckInShootingRange: @ 0x0803D808
	push {r4, lr}
	movs r4, #0
	ldr r3, _0803D820 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803D824
	movs r0, #0
	b _0803D854
	.align 2, 0
_0803D820: .4byte gCurrentSprite
_0803D824:
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803D836
	subs r0, #1
	strb r0, [r2]
	movs r0, #0
	b _0803D854
_0803D836:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D852
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _0803D852
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803D852:
	adds r0, r4, #0
_0803D854:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvirSpawningFromX
EvirSpawningFromX: @ 0x0803D85C
	push {lr}
	ldr r3, _0803D884 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D890
	ldr r2, _0803D888 @ =gWrittenToMosaic_H
	ldr r1, _0803D88C @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0803D8A4
	.align 2, 0
_0803D884: .4byte gCurrentSprite
_0803D888: .4byte gWrittenToMosaic_H
_0803D88C: .4byte sXParasiteMosaicValues
_0803D890:
	ldrh r0, [r3]
	ldr r1, _0803D8A8 @ =0x00007FFF
	ands r1, r0
	adds r2, r3, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0803D8AC @ =0x0000FFDF
	ands r1, r0
	strh r1, [r3]
_0803D8A4:
	pop {r0}
	bx r0
	.align 2, 0
_0803D8A8: .4byte 0x00007FFF
_0803D8AC: .4byte 0x0000FFDF

	thumb_func_start EvirTurningIntoX
EvirTurningIntoX: @ 0x0803D8B0
	push {r4, lr}
	sub sp, #0x10
	ldr r2, _0803D8F0 @ =gCurrentSprite
	ldrh r0, [r2, #2]
	subs r0, #0x5c
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D8F4
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x28
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _0803D918
	.align 2, 0
_0803D8F0: .4byte gCurrentSprite
_0803D8F4:
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x28
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
_0803D918:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvirInit
EvirInit: @ 0x0803D920
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r3, _0803D98C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x27
	movs r5, #0
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r2, _0803D990 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r4, #0
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0803D994 @ =0x08356ABC
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r5, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r4, [r0]
	adds r0, #6
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D9B0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803D998
	strh r5, [r3]
	b _0803DA6A
	.align 2, 0
_0803D98C: .4byte gCurrentSprite
_0803D990: .4byte sPrimarySpriteStats
_0803D994: .4byte 0x08356ABC
_0803D998:
	adds r0, r3, #0
	adds r0, #0x36
	strb r2, [r0]
	ldr r0, _0803D9AC @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r5, [r3, #0xc]
	adds r0, #0x40
	strh r0, [r3, #0xe]
	movs r0, #0x40
	b _0803D9BE
	.align 2, 0
_0803D9AC: .4byte 0x0000FF80
_0803D9B0:
	ldr r0, _0803D9D8 @ =0x0000FFC0
	strh r0, [r3, #0xa]
	adds r0, #0x28
	strh r0, [r3, #0xc]
	subs r0, #8
	strh r0, [r3, #0xe]
	movs r0, #0x20
_0803D9BE:
	strh r0, [r3, #0x10]
	ldr r4, _0803D9DC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803D9E0
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803DA6A
	.align 2, 0
_0803D9D8: .4byte 0x0000FFC0
_0803D9DC: .4byte gCurrentSprite
_0803D9E0:
	movs r7, #0
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	bl SpriteUtilChooseRandomXDirection
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x3b
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0803DA42
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803DA46
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x3b
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0803DA6A
_0803DA42:
	strh r7, [r4]
	b _0803DA6A
_0803DA46:
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3b
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0803DA6A
	strh r5, [r4]
_0803DA6A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvirShootingInit
EvirShootingInit: @ 0x0803DA74
	ldr r0, _0803DA90 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x2a
	strb r1, [r2]
	ldr r1, _0803DA94 @ =0x08356B04
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x5a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803DA90: .4byte gCurrentSprite
_0803DA94: .4byte 0x08356B04

	thumb_func_start EvirShooting
EvirShooting: @ 0x0803DA98
	push {r4, lr}
	sub sp, #0xc
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803DAB4
	ldr r0, _0803DAB0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803DB36
	.align 2, 0
_0803DAB0: .4byte gCurrentSprite
_0803DAB4:
	ldr r1, _0803DAF0 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	mov ip, r1
	cmp r0, #4
	bne _0803DB16
	ldrb r0, [r1, #0x1c]
	cmp r0, #8
	bne _0803DB16
	ldrh r1, [r1]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803DAF4
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x48
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x1c
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _0803DB0C
	.align 2, 0
_0803DAF0: .4byte gCurrentSprite
_0803DAF4:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x48
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
_0803DB0C:
	movs r0, #0x3c
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803DB36
_0803DB16:
	mov r1, ip
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0803DB36
	ldrb r0, [r1, #0x1c]
	cmp r0, #8
	bne _0803DB36
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803DB36
	movs r0, #0xd5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803DB36:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvirIdleInit
EvirIdleInit: @ 0x0803DB40
	ldr r1, _0803DB58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0803DB5C @ =0x08356ABC
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0803DB58: .4byte gCurrentSprite
_0803DB5C: .4byte 0x08356ABC

	thumb_func_start EvirIdle
EvirIdle: @ 0x0803DB60
	push {r4, r5, r6, lr}
	bl EvirCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DB72
	bl EvirShootingInit
	b _0803DC90
_0803DB72:
	movs r6, #0
	ldr r4, _0803DBB8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DBC4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803DBBC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldr r0, _0803DBC0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803DC06
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0803DC04
	.align 2, 0
_0803DBB8: .4byte gCurrentSprite
_0803DBBC: .4byte gPreviousCollisionCheck
_0803DBC0: .4byte gFrameCounter8Bit
_0803DBC4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803DBF0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803DBF4
_0803DBEA:
	movs r6, #1
	b _0803DC06
	.align 2, 0
_0803DBF0: .4byte gPreviousCollisionCheck
_0803DBF4:
	ldr r0, _0803DC30 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803DC06
	ldrh r0, [r4, #4]
	subs r0, #4
_0803DC04:
	strh r0, [r4, #4]
_0803DC06:
	ldr r4, _0803DC34 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DC3C
	ldrh r0, [r4, #2]
	adds r0, #8
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803DC38 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0803DC4E
	ldrh r0, [r4, #2]
	adds r0, #2
	b _0803DC60
	.align 2, 0
_0803DC30: .4byte gFrameCounter8Bit
_0803DC34: .4byte gCurrentSprite
_0803DC38: .4byte gPreviousCollisionCheck
_0803DC3C:
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803DC58 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803DC5C
_0803DC4E:
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
	b _0803DC62
	.align 2, 0
_0803DC58: .4byte gPreviousCollisionCheck
_0803DC5C:
	ldrh r0, [r4, #2]
	subs r0, #2
_0803DC60:
	strh r0, [r4, #2]
_0803DC62:
	cmp r6, #0
	beq _0803DC74
	ldr r0, _0803DC70 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	strb r1, [r0]
	b _0803DC90
	.align 2, 0
_0803DC70: .4byte gCurrentSprite
_0803DC74:
	ldr r2, _0803DC98 @ =gCurrentSprite
	ldrh r1, [r2, #0x16]
	cmp r1, #2
	bne _0803DC90
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _0803DC90
	ldrh r0, [r2]
	ands r1, r0
	cmp r1, #0
	beq _0803DC90
	ldr r0, _0803DC9C @ =0x000001A9
	bl SoundPlayNotAlreadyPlaying
_0803DC90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DC98: .4byte gCurrentSprite
_0803DC9C: .4byte 0x000001A9

	thumb_func_start EvirTurningAroundInit
EvirTurningAroundInit: @ 0x0803DCA0
	ldr r1, _0803DCB8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _0803DCBC @ =0x08356B44
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0803DCB8: .4byte gCurrentSprite
_0803DCBC: .4byte 0x08356B44

	thumb_func_start EvirTurningAround
EvirTurningAround: @ 0x0803DCC0
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803DCE6
	ldr r2, _0803DCEC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0803DCF0 @ =0x08356B64
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0803DCE6:
	pop {r0}
	bx r0
	.align 2, 0
_0803DCEC: .4byte gCurrentSprite
_0803DCF0: .4byte 0x08356B64

	thumb_func_start EvirTurningAroundSecondPart
EvirTurningAroundSecondPart: @ 0x0803DCF4
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803DD06
	ldr r0, _0803DD0C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803DD06:
	pop {r0}
	bx r0
	.align 2, 0
_0803DD0C: .4byte gCurrentSprite

	thumb_func_start EvirCollisionInit
EvirCollisionInit: @ 0x0803DD10
	push {r4, r5, lr}
	ldr r0, _0803DD98 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0803DD9C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DD3C
	mov r5, ip
	ldrh r1, [r5]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_0803DD3C:
	mov r0, ip
	adds r0, #0x25
	movs r3, #0
	movs r2, #2
	strb r2, [r0]
	adds r0, #2
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	movs r4, #0
	ldr r0, _0803DDA0 @ =0x0000FFE0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	ldr r1, _0803DDA4 @ =sSecondarySpriteStats
	mov r5, ip
	ldrb r0, [r5, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0803DDA8 @ =0x08356B84
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r3, [r5, #0x16]
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0803DDB0
	ldr r0, _0803DDAC @ =0x0000FFE8
	strh r0, [r5, #0xe]
	movs r0, #0x18
	strh r0, [r5, #0x10]
	b _0803DDBA
	.align 2, 0
_0803DD98: .4byte gCurrentSprite
_0803DD9C: .4byte gSpriteData
_0803DDA0: .4byte 0x0000FFE0
_0803DDA4: .4byte sSecondarySpriteStats
_0803DDA8: .4byte 0x08356B84
_0803DDAC: .4byte 0x0000FFE8
_0803DDB0:
	ldr r0, _0803DDC0 @ =0x0000FFC8
	mov r1, ip
	strh r0, [r1, #0xe]
	movs r0, #0x38
	strh r0, [r1, #0x10]
_0803DDBA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDC0: .4byte 0x0000FFC8

	thumb_func_start EvirCollisionIdle
EvirCollisionIdle: @ 0x0803DDC4
	push {r4, r5, r6, r7, lr}
	ldr r3, _0803DDF4 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _0803DDF8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r6, #0x80
	lsls r6, r6, #6
	adds r0, r6, #0
	ands r0, r1
	adds r4, r3, #0
	adds r7, r2, #0
	cmp r0, #0
	beq _0803DDFC
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
	b _0803DE02
	.align 2, 0
_0803DDF4: .4byte gCurrentSprite
_0803DDF8: .4byte gSpriteData
_0803DDFC:
	ldrh r1, [r4]
	ldr r0, _0803DE48 @ =0x0000DFFF
	ands r0, r1
_0803DE02:
	strh r0, [r4]
	ldrh r6, [r4, #0x14]
	lsls r3, r5, #3
	cmp r6, #0
	bne _0803DE4C
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x56
	bhi _0803DE4C
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r3, #0
	mov r0, ip
	strh r6, [r0, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	strh r6, [r4]
	b _0803DEC6
	.align 2, 0
_0803DE48: .4byte 0x0000DFFF
_0803DE4C:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0803DE74
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r0, [r2, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DE6E
	ldrh r0, [r2, #4]
	subs r0, #0x18
	b _0803DE82
_0803DE6E:
	ldrh r0, [r2, #4]
	adds r0, #0x18
	b _0803DE82
_0803DE74:
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #2]
	subs r1, #0x60
	strh r1, [r4, #2]
	ldrh r0, [r0, #4]
_0803DE82:
	strh r0, [r4, #4]
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x58
	bgt _0803DE9A
	cmp r0, #0x57
	blt _0803DE9A
	movs r0, #0
	b _0803DEC4
_0803DE9A:
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803DEBE
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	b _0803DEC4
_0803DEBE:
	ldrh r1, [r4]
	ldr r0, _0803DECC @ =0x00007FFF
	ands r0, r1
_0803DEC4:
	strh r0, [r4]
_0803DEC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DECC: .4byte 0x00007FFF

	thumb_func_start EvirProjectileInit
EvirProjectileInit: @ 0x0803DED0
	push {r4, r5, lr}
	ldr r0, _0803DF44 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x26
	movs r4, #0
	movs r3, #1
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r1, _0803DF48 @ =0x0000FFF4
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r0, #0xc
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0803DF4C @ =0x08356B84
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r4, [r5, #0x16]
	movs r1, #0x40
	movs r0, #0x40
	strh r0, [r5, #0x12]
	mov r0, ip
	adds r0, #0x2f
	strb r1, [r0]
	subs r0, #0xb
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x21
	strb r3, [r0]
	ldrh r0, [r5, #2]
	strh r0, [r5, #6]
	ldrh r0, [r5, #4]
	strh r0, [r5, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DF44: .4byte gCurrentSprite
_0803DF48: .4byte 0x0000FFF4
_0803DF4C: .4byte 0x08356B84

	thumb_func_start EvirProjectileMovingInit
EvirProjectileMovingInit: @ 0x0803DF50
	ldr r1, _0803DF70 @ =gCurrentSprite
	ldr r2, _0803DF74 @ =sSecondarySpriteStats
	ldrb r0, [r1, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #0x14]
	ldrh r2, [r1]
	ldr r0, _0803DF78 @ =0x0000FFFB
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803DF70: .4byte gCurrentSprite
_0803DF74: .4byte sSecondarySpriteStats
_0803DF78: .4byte 0x0000FFFB

	thumb_func_start EvirProjectileMoving
EvirProjectileMoving: @ 0x0803DF7C
	push {r4, r5, r6, lr}
	ldr r1, _0803DF90 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r3, r1, #0
	cmp r0, #0
	bne _0803DF94
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0803E062
	.align 2, 0
_0803DF90: .4byte gCurrentSprite
_0803DF94:
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803DFA6
	strh r0, [r3]
	b _0803E062
_0803DFA6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DFB8
	adds r1, r3, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #4
	b _0803DFC0
_0803DFB8:
	adds r1, r3, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #4
_0803DFC0:
	strb r0, [r1]
	ldr r0, _0803E008 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803DFD4
	ldrh r0, [r3, #0x12]
	adds r0, #1
	strh r0, [r3, #0x12]
_0803DFD4:
	ldrh r4, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r5, [r0]
	ldr r1, _0803E00C @ =0x080A4FA4
	lsls r0, r5, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r6, r1, #0
	cmp r2, #0
	bge _0803E010
	rsbs r2, r2, #0
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r4, r1, #0
	cmp r0, #0
	bge _0803DFFC
	adds r0, #0xff
_0803DFFC:
	lsls r0, r0, #8
	lsrs r2, r0, #0x10
	ldrh r0, [r3, #6]
	subs r0, r0, r2
	b _0803E026
	.align 2, 0
_0803E008: .4byte gFrameCounter8Bit
_0803E00C: .4byte 0x080A4FA4
_0803E010:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r4, r1, #0
	cmp r0, #0
	bge _0803E01E
	adds r0, #0xff
_0803E01E:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r1, [r3, #6]
	adds r0, r0, r1
_0803E026:
	strh r0, [r3, #2]
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0803E04E
	rsbs r1, r1, #0
	asrs r0, r4, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0803E044
	adds r0, #0xff
_0803E044:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #8]
	subs r0, r0, r1
	b _0803E060
_0803E04E:
	asrs r0, r4, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0803E058
	adds r0, #0xff
_0803E058:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r6, [r3, #8]
	adds r0, r0, r6
_0803E060:
	strh r0, [r3, #4]
_0803E062:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EvirProjectileExplodingInit
EvirProjectileExplodingInit: @ 0x0803E068
	ldr r3, _0803E09C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0803E0A0 @ =0x08356BAC
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803E09C: .4byte gCurrentSprite
_0803E0A0: .4byte 0x08356BAC

	thumb_func_start EvirProjectileExploding
EvirProjectileExploding: @ 0x0803E0A4
	push {r4, lr}
	ldr r4, _0803E0C4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803E0BC
	movs r0, #0
	strh r0, [r4]
_0803E0BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E0C4: .4byte gCurrentSprite

	thumb_func_start Evir
Evir: @ 0x0803E0C8
	push {r4, lr}
	ldr r4, _0803E100 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803E0E2
	movs r0, #0xd6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803E0E2:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E104
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x3b
	bl SpriteUtilUpdateSecondarySpriteFreezeTimerOfCurrent
	b _0803E2E6
	.align 2, 0
_0803E100: .4byte gCurrentSprite
_0803E104:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803E110
	b _0803E2E6
_0803E110:
	lsls r0, r0, #2
	ldr r1, _0803E11C @ =_0803E120
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E11C: .4byte _0803E120
_0803E120: @ jump table
	.4byte _0803E290 @ case 0
	.4byte _0803E296 @ case 1
	.4byte _0803E29A @ case 2
	.4byte _0803E2AA @ case 3
	.4byte _0803E2AE @ case 4
	.4byte _0803E2B4 @ case 5
	.4byte _0803E2E6 @ case 6
	.4byte _0803E2E6 @ case 7
	.4byte _0803E2E6 @ case 8
	.4byte _0803E2E6 @ case 9
	.4byte _0803E2E6 @ case 10
	.4byte _0803E2E6 @ case 11
	.4byte _0803E2E6 @ case 12
	.4byte _0803E2E6 @ case 13
	.4byte _0803E2E6 @ case 14
	.4byte _0803E2E6 @ case 15
	.4byte _0803E2E6 @ case 16
	.4byte _0803E2E6 @ case 17
	.4byte _0803E2E6 @ case 18
	.4byte _0803E2E6 @ case 19
	.4byte _0803E2E6 @ case 20
	.4byte _0803E2E6 @ case 21
	.4byte _0803E2E6 @ case 22
	.4byte _0803E2E6 @ case 23
	.4byte _0803E2E6 @ case 24
	.4byte _0803E2E6 @ case 25
	.4byte _0803E2E6 @ case 26
	.4byte _0803E2E6 @ case 27
	.4byte _0803E2E6 @ case 28
	.4byte _0803E2E6 @ case 29
	.4byte _0803E2E6 @ case 30
	.4byte _0803E2E6 @ case 31
	.4byte _0803E2E6 @ case 32
	.4byte _0803E2E6 @ case 33
	.4byte _0803E2E6 @ case 34
	.4byte _0803E2E6 @ case 35
	.4byte _0803E2E6 @ case 36
	.4byte _0803E2E6 @ case 37
	.4byte _0803E2E6 @ case 38
	.4byte _0803E2E6 @ case 39
	.4byte _0803E2E6 @ case 40
	.4byte _0803E2A0 @ case 41
	.4byte _0803E2A4 @ case 42
	.4byte _0803E2E6 @ case 43
	.4byte _0803E2E6 @ case 44
	.4byte _0803E2E6 @ case 45
	.4byte _0803E2E6 @ case 46
	.4byte _0803E2E6 @ case 47
	.4byte _0803E2E6 @ case 48
	.4byte _0803E2E6 @ case 49
	.4byte _0803E2E6 @ case 50
	.4byte _0803E2E6 @ case 51
	.4byte _0803E2E6 @ case 52
	.4byte _0803E2E6 @ case 53
	.4byte _0803E2E6 @ case 54
	.4byte _0803E2E6 @ case 55
	.4byte _0803E2E6 @ case 56
	.4byte _0803E2E6 @ case 57
	.4byte _0803E2E6 @ case 58
	.4byte _0803E2E6 @ case 59
	.4byte _0803E2E6 @ case 60
	.4byte _0803E2E6 @ case 61
	.4byte _0803E2E6 @ case 62
	.4byte _0803E2E6 @ case 63
	.4byte _0803E2E6 @ case 64
	.4byte _0803E2E6 @ case 65
	.4byte _0803E2E6 @ case 66
	.4byte _0803E2E6 @ case 67
	.4byte _0803E2E6 @ case 68
	.4byte _0803E2E6 @ case 69
	.4byte _0803E2E6 @ case 70
	.4byte _0803E2E6 @ case 71
	.4byte _0803E2E6 @ case 72
	.4byte _0803E2E6 @ case 73
	.4byte _0803E2E6 @ case 74
	.4byte _0803E2E6 @ case 75
	.4byte _0803E2E6 @ case 76
	.4byte _0803E2E6 @ case 77
	.4byte _0803E2E6 @ case 78
	.4byte _0803E2E6 @ case 79
	.4byte _0803E2E6 @ case 80
	.4byte _0803E2E6 @ case 81
	.4byte _0803E2E6 @ case 82
	.4byte _0803E2E6 @ case 83
	.4byte _0803E2E6 @ case 84
	.4byte _0803E2E6 @ case 85
	.4byte _0803E2E6 @ case 86
	.4byte _0803E2BA @ case 87
	.4byte _0803E2CA @ case 88
	.4byte _0803E2D4 @ case 89
	.4byte _0803E2D8 @ case 90
	.4byte _0803E2DE @ case 91
_0803E290:
	bl EvirInit
	b _0803E2E6
_0803E296:
	bl EvirIdleInit
_0803E29A:
	bl EvirIdle
	b _0803E2E6
_0803E2A0:
	bl EvirShootingInit
_0803E2A4:
	bl EvirShooting
	b _0803E2E6
_0803E2AA:
	bl EvirTurningAroundInit
_0803E2AE:
	bl EvirTurningAround
	b _0803E2E6
_0803E2B4:
	bl EvirTurningAroundSecondPart
	b _0803E2E6
_0803E2BA:
	ldr r0, _0803E2D0 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x3b
	bl SpriteUtilUnfreezeSecondarySprites
	bl SpriteDyingInit
_0803E2CA:
	bl SpriteDying
	b _0803E2E6
	.align 2, 0
_0803E2D0: .4byte gCurrentSprite
_0803E2D4:
	bl EvirInit
_0803E2D8:
	bl EvirSpawningFromX
	b _0803E2E6
_0803E2DE:
	bl EvirTurningIntoX
	bl XParasiteInit
_0803E2E6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvirCollision
EvirCollision: @ 0x0803E2EC
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803E350 @ =gSpriteData
	ldr r3, _0803E354 @ =gCurrentSprite
	movs r0, #0x23
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	movs r0, #0x7f
	adds r6, r3, #0
	adds r6, #0x2c
	ldrb r2, [r6]
	adds r1, r0, #0
	ands r1, r4
	ands r0, r2
	cmp r1, r0
	bhs _0803E33C
	movs r0, #0x80
	ands r0, r4
	strb r0, [r5]
	mov r1, ip
	ldrb r0, [r1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r7
	adds r1, #0x2c
	ldrb r0, [r6]
	adds r0, #1
	movs r2, #0x7f
	ands r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0803E33C:
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E358
	bl SpriteUtilUpdateFreezeTimer
	bl SpriteUtilUpdatePrimarySpriteFreezeTimerOfCurrent
	b _0803E36A
	.align 2, 0
_0803E350: .4byte gSpriteData
_0803E354: .4byte gCurrentSprite
_0803E358:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E366
	bl EvirCollisionInit
_0803E366:
	bl EvirCollisionIdle
_0803E36A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EvirProjectile
EvirProjectile: @ 0x0803E370
	push {lr}
	ldr r0, _0803E388 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E39C
	cmp r0, #1
	bgt _0803E38C
	cmp r0, #0
	beq _0803E396
	b _0803E3AC
	.align 2, 0
_0803E388: .4byte gCurrentSprite
_0803E38C:
	cmp r0, #2
	beq _0803E3A0
	cmp r0, #0x38
	beq _0803E3A6
	b _0803E3AC
_0803E396:
	bl EvirProjectileInit
	b _0803E3B0
_0803E39C:
	bl EvirProjectileMovingInit
_0803E3A0:
	bl EvirProjectileMoving
	b _0803E3B0
_0803E3A6:
	bl EvirProjectileExploding
	b _0803E3B0
_0803E3AC:
	bl EvirProjectileExplodingInit
_0803E3B0:
	pop {r0}
	bx r0

	thumb_func_start BullInit
BullInit: @ 0x0803E3B4
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803E3E0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E3E4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803E3E4
	strh r0, [r2]
	b _0803E474
	.align 2, 0
_0803E3E0: .4byte gCurrentSprite
_0803E3E4:
	ldr r4, _0803E45C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #0
	ldr r1, _0803E460 @ =0x0000FFE0
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803E464 @ =0x08357540
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
	ldr r2, _0803E468 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilChooseRandomXFlip
	bl SpriteUtilChooseRandomXDirection
	ldr r0, _0803E46C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	bls _0803E448
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0803E448:
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803E470
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803E474
	.align 2, 0
_0803E45C: .4byte gCurrentSprite
_0803E460: .4byte 0x0000FFE0
_0803E464: .4byte 0x08357540
_0803E468: .4byte sPrimarySpriteStats
_0803E46C: .4byte gSpriteRandomNumber
_0803E470:
	movs r0, #1
	strb r0, [r1]
_0803E474:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BullIdleInit
BullIdleInit: @ 0x0803E47C
	ldr r0, _0803E498 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _0803E49C @ =0x08357540
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803E498: .4byte gCurrentSprite
_0803E49C: .4byte 0x08357540

	thumb_func_start BullIdle
BullIdle: @ 0x0803E4A0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r4, _0803E4EC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E4B8
	b _0803E5BC
_0803E4B8:
	movs r0, #3
	strb r0, [r1]
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E4FE
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E4F0 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E4F8
	ldrh r1, [r4]
	ldr r0, _0803E4F4 @ =0x0000FDFF
	ands r0, r1
	b _0803E51E
	.align 2, 0
_0803E4EC: .4byte gCurrentSprite
_0803E4F0: .4byte gPreviousCollisionCheck
_0803E4F4: .4byte 0x0000FDFF
_0803E4F8:
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0803E52C
_0803E4FE:
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E524 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E528
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
_0803E51E:
	strh r0, [r4]
	movs r5, #1
	b _0803E52E
	.align 2, 0
_0803E524: .4byte gPreviousCollisionCheck
_0803E528:
	ldrh r0, [r4, #4]
	subs r0, #4
_0803E52C:
	strh r0, [r4, #4]
_0803E52E:
	ldr r4, _0803E560 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E572
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E564 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E56C
	ldrh r0, [r4]
	ldr r1, _0803E568 @ =0x0000FBFF
	ands r1, r0
	b _0803E592
	.align 2, 0
_0803E560: .4byte gCurrentSprite
_0803E564: .4byte gPreviousCollisionCheck
_0803E568: .4byte 0x0000FBFF
_0803E56C:
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803E5A4
_0803E572:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E59C @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E5A0
	ldrh r0, [r4]
	adds r1, r6, #0
	orrs r1, r0
_0803E592:
	strh r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803E5A6
	.align 2, 0
_0803E59C: .4byte gPreviousCollisionCheck
_0803E5A0:
	ldrh r0, [r4, #2]
	adds r0, #4
_0803E5A4:
	strh r0, [r4, #2]
_0803E5A6:
	cmp r5, #0
	beq _0803E5BC
	ldr r0, _0803E5C4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E5BC
	ldr r0, _0803E5C8 @ =0x00000199
	bl SoundPlayNotAlreadyPlaying
_0803E5BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E5C4: .4byte gCurrentSprite
_0803E5C8: .4byte 0x00000199

	thumb_func_start Bull
Bull: @ 0x0803E5CC
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0803E5E4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E5E8
	bl SpriteUtilUpdateFreezeTimer
	b _0803E68E
	.align 2, 0
_0803E5E4: .4byte gCurrentSprite
_0803E5E8:
	mov r0, ip
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803E62C
	mov r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E62C
	mov r0, ip
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	bne _0803E62C
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	subs r0, #0xc
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3d
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xcd
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803E62C:
	ldr r0, _0803E648 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x57
	beq _0803E676
	cmp r0, #0x57
	bgt _0803E652
	cmp r0, #1
	beq _0803E66A
	cmp r0, #1
	bgt _0803E64C
	cmp r0, #0
	beq _0803E664
	b _0803E68E
	.align 2, 0
_0803E648: .4byte gCurrentSprite
_0803E64C:
	cmp r0, #2
	beq _0803E670
	b _0803E68E
_0803E652:
	cmp r0, #0x59
	beq _0803E680
	cmp r0, #0x59
	blt _0803E67A
	cmp r0, #0x5a
	beq _0803E684
	cmp r0, #0x5b
	beq _0803E68A
	b _0803E68E
_0803E664:
	bl BullInit
	b _0803E68E
_0803E66A:
	bl BullIdleInit
	b _0803E68E
_0803E670:
	bl BullIdle
	b _0803E68E
_0803E676:
	bl SpriteDyingInit
_0803E67A:
	bl SpriteDying
	b _0803E68E
_0803E680:
	bl BullInit
_0803E684:
	bl SpriteSpawningFromX
	b _0803E68E
_0803E68A:
	bl XParasiteInit
_0803E68E:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BullSmoke
BullSmoke: @ 0x0803E698
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803E70C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r5, [r0]
	adds r7, r5, #0
	movs r0, #0x24
	adds r0, r0, r4
	mov ip, r0
	ldrb r6, [r0]
	cmp r6, #0
	bne _0803E720
	ldrh r1, [r4]
	ldr r0, _0803E710 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x21
	movs r3, #1
	strb r3, [r0]
	adds r2, r4, #0
	adds r2, #0x22
	movs r0, #3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0803E714 @ =0x08357568
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0803E718 @ =0x0000FF80
	strh r1, [r4, #0xa]
	movs r0, #0x80
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r0, ip
	strb r2, [r0]
	ldr r1, _0803E71C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2f
	strb r3, [r0]
	b _0803E750
	.align 2, 0
_0803E70C: .4byte gCurrentSprite
_0803E710: .4byte 0x0000FFFB
_0803E714: .4byte 0x08357568
_0803E718: .4byte 0x0000FF80
_0803E71C: .4byte gSpriteData
_0803E720:
	ldrh r0, [r4, #0x16]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0803E734
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
_0803E734:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803E750
	movs r2, #0
	movs r0, #0
	strh r0, [r4]
	ldr r1, _0803E758 @ =gSpriteData
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2f
	strb r2, [r0]
_0803E750:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E758: .4byte gSpriteData

	thumb_func_start MemuInit
MemuInit: @ 0x0803E75C
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803E788 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E78C
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803E78C
	strh r0, [r2]
	b _0803E814
	.align 2, 0
_0803E788: .4byte gCurrentSprite
_0803E78C:
	ldr r4, _0803E7FC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #0
	ldr r1, _0803E800 @ =0x0000FFE0
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803E804 @ =0x08357F14
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r2, _0803E808 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilChooseRandomXDirection
	ldr r0, _0803E80C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	bls _0803E7E6
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0803E7E6:
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803E810
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803E814
	.align 2, 0
_0803E7FC: .4byte gCurrentSprite
_0803E800: .4byte 0x0000FFE0
_0803E804: .4byte 0x08357F14
_0803E808: .4byte sPrimarySpriteStats
_0803E80C: .4byte gSpriteRandomNumber
_0803E810:
	movs r0, #1
	strb r0, [r1]
_0803E814:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MemuIdleInit
MemuIdleInit: @ 0x0803E81C
	ldr r2, _0803E838 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0803E83C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r1, #0xc
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803E838: .4byte gCurrentSprite
_0803E83C: .4byte gSpriteRandomNumber

	thumb_func_start MemuIdle
MemuIdle: @ 0x0803E840
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803E8B8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803E8B0
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _0803E8BC @ =0x083575B0
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _0803E8C0 @ =0x00007FFF
	cmp r0, r6
	bne _0803E86C
	ldrh r2, [r3]
	movs r1, #0
_0803E86C:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _0803E8C4 @ =0x08357632
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0803E890
	ldrh r2, [r3]
	movs r1, #0
_0803E890:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _0803E8B0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0803E8B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8B8: .4byte gCurrentSprite
_0803E8BC: .4byte 0x083575B0
_0803E8C0: .4byte 0x00007FFF
_0803E8C4: .4byte 0x08357632

	thumb_func_start MemuChasingSamusInit
MemuChasingSamusInit: @ 0x0803E8C8
	push {r4, r5, lr}
	ldr r4, _0803E920 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0803E924 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xc
	strh r0, [r4, #0x12]
	ldr r0, _0803E928 @ =0x08357F3C
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldrh r2, [r4, #2]
	ldr r1, _0803E92C @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	cmp r2, r0
	ble _0803E934
	ldrh r1, [r4]
	ldr r0, _0803E930 @ =0x0000FBFF
	ands r0, r1
	b _0803E93E
	.align 2, 0
_0803E920: .4byte gCurrentSprite
_0803E924: .4byte gSpriteRandomNumber
_0803E928: .4byte 0x08357F3C
_0803E92C: .4byte gSamusData
_0803E930: .4byte 0x0000FBFF
_0803E934:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
_0803E93E:
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MemuChasingSamus
MemuChasingSamus: @ 0x0803E948
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803E9D4 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	mov ip, r1
	ldrh r3, [r0, #4]
	mov r8, r3
	movs r5, #0x18
	adds r0, #0x23
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bhi _0803EA22
	ldr r0, _0803E9D8 @ =gSpriteData
	mov sb, r0
_0803E96E:
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	mov r1, sb
	adds r3, r0, r1
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803EA18
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803EA18
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x70
	bne _0803EA18
	ldrh r7, [r3, #2]
	ldrh r6, [r3, #4]
	mov r0, ip
	adds r1, r0, r5
	subs r0, r7, r5
	cmp r1, r0
	ble _0803EA18
	mov r0, ip
	subs r1, r0, r5
	adds r0, r7, r5
	cmp r1, r0
	bge _0803EA18
	mov r0, r8
	adds r1, r0, r5
	subs r0, r6, r5
	cmp r1, r0
	ble _0803EA18
	mov r0, r8
	subs r1, r0, r5
	adds r0, r6, r5
	cmp r1, r0
	bge _0803EA18
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EA22
	cmp ip, r7
	bls _0803E9DC
	subs r0, r7, #4
	b _0803E9DE
	.align 2, 0
_0803E9D4: .4byte gCurrentSprite
_0803E9D8: .4byte gSpriteData
_0803E9DC:
	adds r0, r7, #4
_0803E9DE:
	strh r0, [r3, #2]
	cmp r8, r6
	bls _0803E9F0
	subs r1, r2, r4
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #4]
	subs r0, #4
	b _0803E9FA
_0803E9F0:
	subs r1, r2, r4
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #4]
	adds r0, #4
_0803E9FA:
	strh r0, [r1, #4]
	subs r2, r2, r4
	lsls r2, r2, #3
	add r2, sb
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	eors r1, r0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	eors r1, r0
	strh r1, [r2]
	b _0803EA22
_0803EA18:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _0803E96E
_0803EA22:
	ldr r4, _0803EA3C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EA40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	b _0803EA46
	.align 2, 0
_0803EA3C: .4byte gCurrentSprite
_0803EA40:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
_0803EA46:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803EA70 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803EA5A
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
_0803EA5A:
	ldr r4, _0803EA74 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EA78
	ldrh r0, [r4, #2]
	adds r0, #0x20
	b _0803EA7C
	.align 2, 0
_0803EA70: .4byte gPreviousCollisionCheck
_0803EA74: .4byte gCurrentSprite
_0803EA78:
	ldrh r0, [r4, #2]
	subs r0, #0x20
_0803EA7C:
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803EAE0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803EA92
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
_0803EA92:
	ldr r0, _0803EAE4 @ =gSamusData
	ldrh r1, [r0, #0x18]
	subs r1, #0x48
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldrh r6, [r0, #0x16]
	movs r0, #4
	mov r8, r0
	ldr r1, _0803EAE8 @ =gCurrentSprite
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r4
	adds r2, r1, #0
	cmp r0, #0
	beq _0803EB0C
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EAEC
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	bgt _0803EB1E
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0803EAD4
	adds r0, #1
	strb r0, [r1]
_0803EAD4:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	b _0803EB60
	.align 2, 0
_0803EAE0: .4byte gPreviousCollisionCheck
_0803EAE4: .4byte gSamusData
_0803EAE8: .4byte gCurrentSprite
_0803EAEC:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EB00
	lsrs r0, r0, #0x1a
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _0803EB60
_0803EB00:
	ldr r0, _0803EB08 @ =0x0000FDFF
	ands r0, r4
	b _0803EB56
	.align 2, 0
_0803EB08: .4byte 0x0000FDFF
_0803EB0C:
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EB3C
	ldrh r1, [r2, #4]
	adds r0, r6, #4
	cmp r1, r0
	bge _0803EB28
_0803EB1E:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r3]
	b _0803EB60
_0803EB28:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0803EB36
	adds r0, #1
	strb r0, [r1]
_0803EB36:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803EB4A
_0803EB3C:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EB52
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803EB4A:
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _0803EB60
_0803EB52:
	adds r0, r5, #0
	orrs r0, r4
_0803EB56:
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_0803EB60:
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EBBC
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EB9A
	ldrh r1, [r2, #2]
	subs r0, r7, #4
	cmp r1, r0
	bgt _0803EBCE
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0803EB8E
	adds r0, #1
	strb r0, [r1]
_0803EB8E:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _0803EC12
_0803EB9A:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EBAE
	lsrs r0, r0, #0x1a
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	b _0803EC12
_0803EBAE:
	ldrh r0, [r2]
	ldr r1, _0803EBB8 @ =0x0000FBFF
	ands r1, r0
	b _0803EC08
	.align 2, 0
_0803EBB8: .4byte 0x0000FBFF
_0803EBBC:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EBEC
	ldrh r1, [r2, #2]
	adds r0, r7, #4
	cmp r1, r0
	bge _0803EBD8
_0803EBCE:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0803EC12
_0803EBD8:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0803EBE6
	adds r0, #1
	strb r0, [r1]
_0803EBE6:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803EBFA
_0803EBEC:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EC02
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803EBFA:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _0803EC12
_0803EC02:
	ldrh r0, [r2]
	adds r1, r4, #0
	orrs r1, r0
_0803EC08:
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0803EC12:
	ldrh r0, [r2, #0x12]
	subs r0, #1
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803EC32
	movs r0, #0xc
	strh r0, [r2, #0x12]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EC32
	ldr r0, _0803EC40 @ =0x0000019B
	bl SoundPlayNotAlreadyPlaying
_0803EC32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC40: .4byte 0x0000019B

	thumb_func_start Memu
Memu: @ 0x0803EC44
	push {r4, lr}
	ldr r4, _0803EC70 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803EC5E
	movs r0, #0xce
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803EC5E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC74
	bl SpriteUtilUpdateFreezeTimer
	b _0803EE34
	.align 2, 0
_0803EC70: .4byte gCurrentSprite
_0803EC74:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803EC80
	b _0803EE34
_0803EC80:
	lsls r0, r0, #2
	ldr r1, _0803EC8C @ =_0803EC90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EC8C: .4byte _0803EC90
_0803EC90: @ jump table
	.4byte _0803EE00 @ case 0
	.4byte _0803EE06 @ case 1
	.4byte _0803EE0C @ case 2
	.4byte _0803EE34 @ case 3
	.4byte _0803EE34 @ case 4
	.4byte _0803EE34 @ case 5
	.4byte _0803EE34 @ case 6
	.4byte _0803EE34 @ case 7
	.4byte _0803EE34 @ case 8
	.4byte _0803EE34 @ case 9
	.4byte _0803EE34 @ case 10
	.4byte _0803EE34 @ case 11
	.4byte _0803EE34 @ case 12
	.4byte _0803EE34 @ case 13
	.4byte _0803EE34 @ case 14
	.4byte _0803EE34 @ case 15
	.4byte _0803EE34 @ case 16
	.4byte _0803EE34 @ case 17
	.4byte _0803EE34 @ case 18
	.4byte _0803EE34 @ case 19
	.4byte _0803EE34 @ case 20
	.4byte _0803EE34 @ case 21
	.4byte _0803EE34 @ case 22
	.4byte _0803EE12 @ case 23
	.4byte _0803EE16 @ case 24
	.4byte _0803EE34 @ case 25
	.4byte _0803EE34 @ case 26
	.4byte _0803EE34 @ case 27
	.4byte _0803EE34 @ case 28
	.4byte _0803EE34 @ case 29
	.4byte _0803EE34 @ case 30
	.4byte _0803EE34 @ case 31
	.4byte _0803EE34 @ case 32
	.4byte _0803EE34 @ case 33
	.4byte _0803EE34 @ case 34
	.4byte _0803EE34 @ case 35
	.4byte _0803EE34 @ case 36
	.4byte _0803EE34 @ case 37
	.4byte _0803EE34 @ case 38
	.4byte _0803EE34 @ case 39
	.4byte _0803EE34 @ case 40
	.4byte _0803EE34 @ case 41
	.4byte _0803EE34 @ case 42
	.4byte _0803EE34 @ case 43
	.4byte _0803EE34 @ case 44
	.4byte _0803EE34 @ case 45
	.4byte _0803EE34 @ case 46
	.4byte _0803EE34 @ case 47
	.4byte _0803EE34 @ case 48
	.4byte _0803EE34 @ case 49
	.4byte _0803EE34 @ case 50
	.4byte _0803EE34 @ case 51
	.4byte _0803EE34 @ case 52
	.4byte _0803EE34 @ case 53
	.4byte _0803EE34 @ case 54
	.4byte _0803EE34 @ case 55
	.4byte _0803EE34 @ case 56
	.4byte _0803EE34 @ case 57
	.4byte _0803EE34 @ case 58
	.4byte _0803EE34 @ case 59
	.4byte _0803EE34 @ case 60
	.4byte _0803EE34 @ case 61
	.4byte _0803EE34 @ case 62
	.4byte _0803EE34 @ case 63
	.4byte _0803EE34 @ case 64
	.4byte _0803EE34 @ case 65
	.4byte _0803EE34 @ case 66
	.4byte _0803EE34 @ case 67
	.4byte _0803EE34 @ case 68
	.4byte _0803EE34 @ case 69
	.4byte _0803EE34 @ case 70
	.4byte _0803EE34 @ case 71
	.4byte _0803EE34 @ case 72
	.4byte _0803EE34 @ case 73
	.4byte _0803EE34 @ case 74
	.4byte _0803EE34 @ case 75
	.4byte _0803EE34 @ case 76
	.4byte _0803EE34 @ case 77
	.4byte _0803EE34 @ case 78
	.4byte _0803EE34 @ case 79
	.4byte _0803EE34 @ case 80
	.4byte _0803EE34 @ case 81
	.4byte _0803EE34 @ case 82
	.4byte _0803EE34 @ case 83
	.4byte _0803EE34 @ case 84
	.4byte _0803EE34 @ case 85
	.4byte _0803EE34 @ case 86
	.4byte _0803EE1C @ case 87
	.4byte _0803EE20 @ case 88
	.4byte _0803EE26 @ case 89
	.4byte _0803EE2A @ case 90
	.4byte _0803EE30 @ case 91
_0803EE00:
	bl MemuInit
	b _0803EE34
_0803EE06:
	bl MemuIdleInit
	b _0803EE34
_0803EE0C:
	bl MemuIdle
	b _0803EE34
_0803EE12:
	bl MemuChasingSamusInit
_0803EE16:
	bl MemuChasingSamus
	b _0803EE34
_0803EE1C:
	bl SpriteDyingInit
_0803EE20:
	bl SpriteDying
	b _0803EE34
_0803EE26:
	bl MemuInit
_0803EE2A:
	bl SpriteSpawningFromX
	b _0803EE34
_0803EE30:
	bl XParasiteInit
_0803EE34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerubossYMovement
GerubossYMovement: @ 0x0803EE3C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _0803EE80 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803EE88
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EE84 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	adds r0, r6, r0
	b _0803EEBC
	.align 2, 0
_0803EE80: .4byte gCurrentSprite
_0803EE84: .4byte gPreviousCollisionCheck
_0803EE88:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EEB4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803EEB8
_0803EEAE:
	movs r0, #1
	b _0803EEC0
	.align 2, 0
_0803EEB4: .4byte gPreviousCollisionCheck
_0803EEB8:
	ldrh r0, [r4, #2]
	subs r0, r0, r7
_0803EEBC:
	strh r0, [r4, #2]
	movs r0, #0
_0803EEC0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerubossXMovement
GerubossXMovement: @ 0x0803EEC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _0803EF0C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EF14
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EF10 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #4]
	adds r0, r6, r0
	b _0803EF48
	.align 2, 0
_0803EF0C: .4byte gCurrentSprite
_0803EF10: .4byte gPreviousCollisionCheck
_0803EF14:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EF40 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803EF44
_0803EF3A:
	movs r0, #1
	b _0803EF4C
	.align 2, 0
_0803EF40: .4byte gPreviousCollisionCheck
_0803EF44:
	ldrh r0, [r4, #4]
	subs r0, r0, r7
_0803EF48:
	strh r0, [r4, #4]
	movs r0, #0
_0803EF4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerubossTurningIntoX
GerubossTurningIntoX: @ 0x0803EF54
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0803EF94 @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #8
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x24
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	adds r0, #8
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x24
	strh r0, [r4, #4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803EF94: .4byte gCurrentSprite

	thumb_func_start GerubossInit
GerubossInit: @ 0x0803EF98
	push {lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803EFC4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EFC8
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803EFC8
	strh r0, [r2]
	b _0803F05A
	.align 2, 0
_0803EFC4: .4byte gCurrentSprite
_0803EFC8:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _0803F038 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x27
	movs r2, #0
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0803F03C @ =0x0000FFE0
	strh r0, [r3, #0xa]
	movs r0, #0x30
	strh r0, [r3, #0xc]
	ldr r0, _0803F040 @ =0x0000FFC8
	strh r0, [r3, #0xe]
	movs r0, #0x38
	strh r0, [r3, #0x10]
	ldr r0, _0803F044 @ =0x08358E14
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0803F048 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r2, _0803F04C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803F050
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r3, #6]
	b _0803F05A
	.align 2, 0
_0803F038: .4byte gCurrentSprite
_0803F03C: .4byte 0x0000FFE0
_0803F040: .4byte 0x0000FFC8
_0803F044: .4byte 0x08358E14
_0803F048: .4byte gIoRegisters
_0803F04C: .4byte sPrimarySpriteStats
_0803F050:
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	movs r0, #1
	strb r0, [r1]
_0803F05A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerubossIdleInit
GerubossIdleInit: @ 0x0803F060
	ldr r0, _0803F07C @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x24
	movs r2, #0
	movs r1, #2
	strb r1, [r3]
	strb r2, [r0, #0x1c]
	strh r2, [r0, #0x16]
	ldr r1, _0803F080 @ =0x08358E14
	str r1, [r0, #0x18]
	adds r0, #0x2e
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803F07C: .4byte gCurrentSprite
_0803F080: .4byte 0x08358E14

	thumb_func_start GerubossIdle
GerubossIdle: @ 0x0803F084
	push {r4, r5, lr}
	ldr r4, _0803F0C0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803F154
	ldrh r0, [r4, #2]
	subs r0, #0x24
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F0C4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F0C8
	ldrh r0, [r4, #2]
	subs r0, #0x24
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F0C8
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0803F14C
	.align 2, 0
_0803F0C0: .4byte gCurrentSprite
_0803F0C4: .4byte gPreviousCollisionCheck
_0803F0C8:
	ldr r4, _0803F0FC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0803F104
	adds r2, r4, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #8
	strb r0, [r2]
	strb r1, [r4, #0x1c]
	strh r1, [r4, #0x16]
	ldr r0, _0803F100 @ =0x08358DF4
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0xd0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803F154
	.align 2, 0
_0803F0FC: .4byte gCurrentSprite
_0803F100: .4byte 0x08358DF4
_0803F104:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F112
	subs r0, #1
	b _0803F152
_0803F112:
	ldr r0, _0803F13C @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x48
	ldrh r1, [r4, #2]
	cmp r0, r1
	blt _0803F154
	movs r5, #0x80
	lsls r5, r5, #2
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0803F140
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
	b _0803F14A
	.align 2, 0
_0803F13C: .4byte gSamusData
_0803F140:
	cmp r0, #4
	bne _0803F154
	ldrh r1, [r4]
	ldr r0, _0803F15C @ =0x0000FDFF
	ands r0, r1
_0803F14A:
	strh r0, [r4]
_0803F14C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
_0803F152:
	strb r0, [r1]
_0803F154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F15C: .4byte 0x0000FDFF

	thumb_func_start GerubossStalling
GerubossStalling: @ 0x0803F160
	push {lr}
	ldr r1, _0803F180 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F17A
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0803F17A:
	pop {r0}
	bx r0
	.align 2, 0
_0803F180: .4byte gCurrentSprite

	thumb_func_start GerubossLaunchingInit
GerubossLaunchingInit: @ 0x0803F184
	push {lr}
	ldr r1, _0803F1A4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F1A8 @ =0x08358E3C
	str r0, [r1, #0x18]
	ldr r0, _0803F1AC @ =0x0000019D
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_0803F1A4: .4byte gCurrentSprite
_0803F1A8: .4byte 0x08358E3C
_0803F1AC: .4byte 0x0000019D

	thumb_func_start GerubossCharging
GerubossCharging: @ 0x0803F1B0
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803F1E8
	ldr r1, _0803F1EC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F1F0 @ =0x08358E6C
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x2e
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xcf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F1E8:
	pop {r0}
	bx r0
	.align 2, 0
_0803F1EC: .4byte gCurrentSprite
_0803F1F0: .4byte 0x08358E6C

	thumb_func_start GerubossGoingDown
GerubossGoingDown: @ 0x0803F1F4
	push {r4, lr}
	ldr r2, _0803F220 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F228
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0803F242
	strb r1, [r2, #0x1c]
	movs r0, #0
	strh r1, [r2, #0x16]
	ldr r1, _0803F224 @ =0x08358E8C
	str r1, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	b _0803F242
	.align 2, 0
_0803F220: .4byte gCurrentSprite
_0803F224: .4byte 0x08358E8C
_0803F228:
	adds r4, r2, #0
	adds r4, #0x2f
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803F23C
	ldr r0, _0803F270 @ =0x0000019F
	bl SoundPlay
_0803F23C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0803F242:
	movs r0, #2
	bl GerubossXMovement
	movs r0, #0xc
	bl GerubossYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F268
	ldr r1, _0803F274 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2e
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F278 @ =0x08358EEC
	str r0, [r1, #0x18]
_0803F268:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F270: .4byte 0x0000019F
_0803F274: .4byte gCurrentSprite
_0803F278: .4byte 0x08358EEC

	thumb_func_start GerubossChagningDirection
GerubossChagningDirection: @ 0x0803F27C
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803F2B0
	ldr r1, _0803F2B4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x30
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F2B8 @ =0x08358EAC
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	ldr r0, _0803F2BC @ =0x0000F7FF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x2e
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xcf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F2B0:
	pop {r0}
	bx r0
	.align 2, 0
_0803F2B4: .4byte gCurrentSprite
_0803F2B8: .4byte 0x08358EAC
_0803F2BC: .4byte 0x0000F7FF

	thumb_func_start GerubossGoingUp
GerubossGoingUp: @ 0x0803F2C0
	push {r4, lr}
	ldr r2, _0803F2EC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F2F4
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0803F30E
	strb r1, [r2, #0x1c]
	movs r0, #0
	strh r1, [r2, #0x16]
	ldr r1, _0803F2F0 @ =0x08358ECC
	str r1, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	b _0803F30E
	.align 2, 0
_0803F2EC: .4byte gCurrentSprite
_0803F2F0: .4byte 0x08358ECC
_0803F2F4:
	adds r4, r2, #0
	adds r4, #0x2f
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803F308
	ldr r0, _0803F33C @ =0x0000019F
	bl SoundPlay
_0803F308:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0803F30E:
	movs r0, #2
	bl GerubossXMovement
	movs r0, #0xc
	bl GerubossYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F334
	ldr r1, _0803F340 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x32
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F344 @ =0x08358F3C
	str r0, [r1, #0x18]
_0803F334:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F33C: .4byte 0x0000019F
_0803F340: .4byte gCurrentSprite
_0803F344: .4byte 0x08358F3C

	thumb_func_start GerubossGrabbingCeiling
GerubossGrabbingCeiling: @ 0x0803F348
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803F35A
	ldr r0, _0803F360 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803F35A:
	pop {r0}
	bx r0
	.align 2, 0
_0803F360: .4byte gCurrentSprite

	thumb_func_start Geruboss
Geruboss: @ 0x0803F364
	push {r4, lr}
	ldr r4, _0803F38C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803F37C
	ldr r0, _0803F390 @ =0x000001A1
	bl SoundPlayNotAlreadyPlaying
_0803F37C:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F394
	bl SpriteUtilUpdateFreezeTimer
	b _0803F574
	.align 2, 0
_0803F38C: .4byte gCurrentSprite
_0803F390: .4byte 0x000001A1
_0803F394:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803F3A0
	b _0803F574
_0803F3A0:
	lsls r0, r0, #2
	ldr r1, _0803F3AC @ =_0803F3B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F3AC: .4byte _0803F3B0
_0803F3B0: @ jump table
	.4byte _0803F520 @ case 0
	.4byte _0803F526 @ case 1
	.4byte _0803F52A @ case 2
	.4byte _0803F574 @ case 3
	.4byte _0803F574 @ case 4
	.4byte _0803F574 @ case 5
	.4byte _0803F574 @ case 6
	.4byte _0803F574 @ case 7
	.4byte _0803F530 @ case 8
	.4byte _0803F574 @ case 9
	.4byte _0803F574 @ case 10
	.4byte _0803F574 @ case 11
	.4byte _0803F574 @ case 12
	.4byte _0803F574 @ case 13
	.4byte _0803F574 @ case 14
	.4byte _0803F574 @ case 15
	.4byte _0803F574 @ case 16
	.4byte _0803F574 @ case 17
	.4byte _0803F574 @ case 18
	.4byte _0803F574 @ case 19
	.4byte _0803F574 @ case 20
	.4byte _0803F574 @ case 21
	.4byte _0803F574 @ case 22
	.4byte _0803F574 @ case 23
	.4byte _0803F574 @ case 24
	.4byte _0803F574 @ case 25
	.4byte _0803F574 @ case 26
	.4byte _0803F574 @ case 27
	.4byte _0803F574 @ case 28
	.4byte _0803F574 @ case 29
	.4byte _0803F574 @ case 30
	.4byte _0803F574 @ case 31
	.4byte _0803F574 @ case 32
	.4byte _0803F574 @ case 33
	.4byte _0803F574 @ case 34
	.4byte _0803F574 @ case 35
	.4byte _0803F574 @ case 36
	.4byte _0803F574 @ case 37
	.4byte _0803F574 @ case 38
	.4byte _0803F574 @ case 39
	.4byte _0803F574 @ case 40
	.4byte _0803F536 @ case 41
	.4byte _0803F53A @ case 42
	.4byte _0803F574 @ case 43
	.4byte _0803F540 @ case 44
	.4byte _0803F574 @ case 45
	.4byte _0803F546 @ case 46
	.4byte _0803F574 @ case 47
	.4byte _0803F54C @ case 48
	.4byte _0803F574 @ case 49
	.4byte _0803F552 @ case 50
	.4byte _0803F574 @ case 51
	.4byte _0803F574 @ case 52
	.4byte _0803F574 @ case 53
	.4byte _0803F574 @ case 54
	.4byte _0803F574 @ case 55
	.4byte _0803F574 @ case 56
	.4byte _0803F574 @ case 57
	.4byte _0803F574 @ case 58
	.4byte _0803F574 @ case 59
	.4byte _0803F574 @ case 60
	.4byte _0803F574 @ case 61
	.4byte _0803F574 @ case 62
	.4byte _0803F574 @ case 63
	.4byte _0803F574 @ case 64
	.4byte _0803F574 @ case 65
	.4byte _0803F574 @ case 66
	.4byte _0803F574 @ case 67
	.4byte _0803F574 @ case 68
	.4byte _0803F574 @ case 69
	.4byte _0803F574 @ case 70
	.4byte _0803F574 @ case 71
	.4byte _0803F574 @ case 72
	.4byte _0803F574 @ case 73
	.4byte _0803F574 @ case 74
	.4byte _0803F574 @ case 75
	.4byte _0803F574 @ case 76
	.4byte _0803F574 @ case 77
	.4byte _0803F574 @ case 78
	.4byte _0803F574 @ case 79
	.4byte _0803F574 @ case 80
	.4byte _0803F574 @ case 81
	.4byte _0803F574 @ case 82
	.4byte _0803F574 @ case 83
	.4byte _0803F574 @ case 84
	.4byte _0803F574 @ case 85
	.4byte _0803F574 @ case 86
	.4byte _0803F558 @ case 87
	.4byte _0803F55C @ case 88
	.4byte _0803F562 @ case 89
	.4byte _0803F566 @ case 90
	.4byte _0803F56C @ case 91
_0803F520:
	bl GerubossInit
	b _0803F574
_0803F526:
	bl GerubossIdleInit
_0803F52A:
	bl GerubossIdle
	b _0803F574
_0803F530:
	bl GerubossStalling
	b _0803F574
_0803F536:
	bl GerubossLaunchingInit
_0803F53A:
	bl GerubossCharging
	b _0803F574
_0803F540:
	bl GerubossGoingDown
	b _0803F574
_0803F546:
	bl GerubossChagningDirection
	b _0803F574
_0803F54C:
	bl GerubossGoingUp
	b _0803F574
_0803F552:
	bl GerubossGrabbingCeiling
	b _0803F574
_0803F558:
	bl SpriteDyingInit
_0803F55C:
	bl SpriteDying
	b _0803F574
_0803F562:
	bl GerubossInit
_0803F566:
	bl SpriteSpawningFromX
	b _0803F574
_0803F56C:
	bl GerubossTurningIntoX
	bl XParasiteInit
_0803F574:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChootSetOpenHitbox
ChootSetOpenHitbox: @ 0x0803F57C
	ldr r1, _0803F590 @ =gCurrentSprite
	ldr r0, _0803F594 @ =0x0000FFE0
	strh r0, [r1, #0xa]
	movs r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0803F598 @ =0x0000FFC4
	strh r0, [r1, #0xe]
	movs r0, #0x3c
	strh r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0803F590: .4byte gCurrentSprite
_0803F594: .4byte 0x0000FFE0
_0803F598: .4byte 0x0000FFC4

	thumb_func_start ChootSetClosedHitbox
ChootSetClosedHitbox: @ 0x0803F59C
	ldr r1, _0803F5B0 @ =gCurrentSprite
	ldr r0, _0803F5B4 @ =0x0000FFD0
	strh r0, [r1, #0xa]
	movs r0, #0xc
	strh r0, [r1, #0xc]
	ldr r0, _0803F5B8 @ =0x0000FFE0
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0803F5B0: .4byte gCurrentSprite
_0803F5B4: .4byte 0x0000FFD0
_0803F5B8: .4byte 0x0000FFE0

	thumb_func_start ChootInit
ChootInit: @ 0x0803F5BC
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803F5E8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F5EC
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803F5EC
	strh r0, [r2]
	b _0803F650
	.align 2, 0
_0803F5E8: .4byte gCurrentSprite
_0803F5EC:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r5, _0803F640 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x27
	movs r4, #0
	movs r2, #0x10
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r2, [r0]
	bl ChootSetOpenHitbox
	ldr r0, _0803F644 @ =0x083598FC
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r2, _0803F648 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803F64C
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _0803F650
	.align 2, 0
_0803F640: .4byte gCurrentSprite
_0803F644: .4byte 0x083598FC
_0803F648: .4byte sPrimarySpriteStats
_0803F64C:
	movs r0, #1
	strb r0, [r1]
_0803F650:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChootIdleInit
ChootIdleInit: @ 0x0803F658
	ldr r1, _0803F670 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F674 @ =0x083598FC
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0803F670: .4byte gCurrentSprite
_0803F674: .4byte 0x083598FC

	thumb_func_start ChootIdle
ChootIdle: @ 0x0803F678
	push {r4, r5, lr}
	ldr r4, _0803F6D8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803F6D2
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F6DC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F6AA
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F6CA
_0803F6AA:
	ldr r0, _0803F6E0 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x48
	ldr r4, _0803F6D8 @ =gCurrentSprite
	ldrh r1, [r4, #2]
	cmp r0, r1
	bgt _0803F6D2
	movs r0, #0xa0
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F6D2
_0803F6CA:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
_0803F6D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F6D8: .4byte gCurrentSprite
_0803F6DC: .4byte gPreviousCollisionCheck
_0803F6E0: .4byte gSamusData

	thumb_func_start ChootLaunchingInit
ChootLaunchingInit: @ 0x0803F6E4
	ldr r1, _0803F6F8 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0803F6FC @ =0x0835990C
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803F6F8: .4byte gCurrentSprite
_0803F6FC: .4byte 0x0835990C

	thumb_func_start ChootLaunching
ChootLaunching: @ 0x0803F700
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803F712
	ldr r0, _0803F718 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
_0803F712:
	pop {r0}
	bx r0
	.align 2, 0
_0803F718: .4byte gCurrentSprite

	thumb_func_start ChootGoingUpInit
ChootGoingUpInit: @ 0x0803F71C
	push {r4, lr}
	ldr r4, _0803F758 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r4, #0x1c]
	movs r2, #0
	strh r0, [r4, #0x16]
	ldr r0, _0803F75C @ =0x08359924
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	strb r2, [r0]
	bl ChootSetClosedHitbox
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F750
	movs r0, #0xd1
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F750:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F758: .4byte gCurrentSprite
_0803F75C: .4byte 0x08359924

	thumb_func_start ShootGoingUp
ShootGoingUp: @ 0x0803F760
	push {r4, r5, r6, lr}
	ldr r4, _0803F7AC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F7B0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F7A2
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F7A2
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r1, _0803F7B4 @ =0x08358F64
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803F7B8 @ =0x00007FFF
	cmp r1, r0
	bne _0803F7BC
_0803F7A2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
	b _0803F7C6
	.align 2, 0
_0803F7AC: .4byte gCurrentSprite
_0803F7B0: .4byte gPreviousCollisionCheck
_0803F7B4: .4byte 0x08358F64
_0803F7B8: .4byte 0x00007FFF
_0803F7BC:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
_0803F7C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ChootOpeningInit
ChootOpeningInit: @ 0x0803F7CC
	push {lr}
	ldr r1, _0803F7E8 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0803F7EC @ =0x08359934
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	bl ChootSetOpenHitbox
	pop {r0}
	bx r0
	.align 2, 0
_0803F7E8: .4byte gCurrentSprite
_0803F7EC: .4byte 0x08359934

	thumb_func_start ChootOpening
ChootOpening: @ 0x0803F7F0
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0803F802
	ldr r0, _0803F808 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
_0803F802:
	pop {r0}
	bx r0
	.align 2, 0
_0803F808: .4byte gCurrentSprite

	thumb_func_start ChootGoingDownInit
ChootGoingDownInit: @ 0x0803F80C
	ldr r0, _0803F828 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	movs r3, #0
	strh r1, [r0, #0x16]
	ldr r1, _0803F82C @ =0x0835995C
	str r1, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x30
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	bx lr
	.align 2, 0
_0803F828: .4byte gCurrentSprite
_0803F82C: .4byte 0x0835995C

	thumb_func_start ChootGoingDown
ChootGoingDown: @ 0x0803F830
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0803F850 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F854 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F858
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	b _0803F8B8
	.align 2, 0
_0803F850: .4byte gCurrentSprite
_0803F854: .4byte gPreviousCollisionCheck
_0803F858:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F870
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	b _0803F8B8
_0803F870:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r1, #0x3f
	ands r1, r0
	cmp r1, #0
	bne _0803F8B0
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3e
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F8B0
	ldr r0, _0803F8C4 @ =0x000001A3
	bl SoundPlayNotAlreadyPlaying
_0803F8B0:
	ldr r1, _0803F8C8 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
_0803F8B8:
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F8C4: .4byte 0x000001A3
_0803F8C8: .4byte gCurrentSprite

	thumb_func_start ChootSpitInit
ChootSpitInit: @ 0x0803F8CC
	push {r4, lr}
	ldr r0, _0803F934 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803F938 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803F93C @ =0x0000FFE0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x10
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0803F940 @ =0x08359984
	str r0, [r2, #0x18]
	adds r1, #0xc
	movs r0, #8
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F934: .4byte gCurrentSprite
_0803F938: .4byte 0x0000FFFB
_0803F93C: .4byte 0x0000FFE0
_0803F940: .4byte 0x08359984

	thumb_func_start ChootSpitSpawning
ChootSpitSpawning: @ 0x0803F944
	push {lr}
	ldr r2, _0803F97C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F976
	strb r3, [r2, #0x1c]
	strh r0, [r2, #0x16]
	ldr r0, _0803F980 @ =0x08359994
	str r0, [r2, #0x18]
	subs r1, #0xa
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r3, [r0]
_0803F976:
	pop {r0}
	bx r0
	.align 2, 0
_0803F97C: .4byte gCurrentSprite
_0803F980: .4byte 0x08359994

	thumb_func_start ChootSpitExplodingInit
ChootSpitExplodingInit: @ 0x0803F984
	push {r4, lr}
	ldr r4, _0803F9A4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803F9A8 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803F9B0
	ldr r0, _0803F9AC @ =0x083599CC
	b _0803F9B2
	.align 2, 0
_0803F9A4: .4byte gCurrentSprite
_0803F9A8: .4byte gPreviousCollisionCheck
_0803F9AC: .4byte 0x083599CC
_0803F9B0:
	ldr r0, _0803F9C8 @ =0x083599A4
_0803F9B2:
	str r0, [r4, #0x18]
	ldr r0, _0803F9CC @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9C8: .4byte 0x083599A4
_0803F9CC: .4byte gCurrentSprite

	thumb_func_start ChootSpitExploding
ChootSpitExploding: @ 0x0803F9D0
	push {r4, lr}
	ldr r4, _0803F9F0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0803F9E8
	movs r0, #0
	strh r0, [r4]
_0803F9E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9F0: .4byte gCurrentSprite

	thumb_func_start Choot
Choot: @ 0x0803F9F4
	push {r4, lr}
	ldr r4, _0803FA20 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803FA0E
	movs r0, #0xd2
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803FA0E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FA24
	bl SpriteUtilUpdateFreezeTimer
	b _0803FC00
	.align 2, 0
_0803FA20: .4byte gCurrentSprite
_0803FA24:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803FA30
	b _0803FC00
_0803FA30:
	lsls r0, r0, #2
	ldr r1, _0803FA3C @ =_0803FA40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FA3C: .4byte _0803FA40
_0803FA40: @ jump table
	.4byte _0803FBB0 @ case 0
	.4byte _0803FBB6 @ case 1
	.4byte _0803FBBA @ case 2
	.4byte _0803FC00 @ case 3
	.4byte _0803FC00 @ case 4
	.4byte _0803FC00 @ case 5
	.4byte _0803FC00 @ case 6
	.4byte _0803FC00 @ case 7
	.4byte _0803FC00 @ case 8
	.4byte _0803FC00 @ case 9
	.4byte _0803FC00 @ case 10
	.4byte _0803FC00 @ case 11
	.4byte _0803FC00 @ case 12
	.4byte _0803FC00 @ case 13
	.4byte _0803FC00 @ case 14
	.4byte _0803FC00 @ case 15
	.4byte _0803FC00 @ case 16
	.4byte _0803FC00 @ case 17
	.4byte _0803FC00 @ case 18
	.4byte _0803FC00 @ case 19
	.4byte _0803FC00 @ case 20
	.4byte _0803FC00 @ case 21
	.4byte _0803FC00 @ case 22
	.4byte _0803FC00 @ case 23
	.4byte _0803FC00 @ case 24
	.4byte _0803FC00 @ case 25
	.4byte _0803FC00 @ case 26
	.4byte _0803FC00 @ case 27
	.4byte _0803FC00 @ case 28
	.4byte _0803FC00 @ case 29
	.4byte _0803FC00 @ case 30
	.4byte _0803FC00 @ case 31
	.4byte _0803FC00 @ case 32
	.4byte _0803FC00 @ case 33
	.4byte _0803FC00 @ case 34
	.4byte _0803FC00 @ case 35
	.4byte _0803FC00 @ case 36
	.4byte _0803FC00 @ case 37
	.4byte _0803FC00 @ case 38
	.4byte _0803FC00 @ case 39
	.4byte _0803FC00 @ case 40
	.4byte _0803FBC0 @ case 41
	.4byte _0803FBC4 @ case 42
	.4byte _0803FBCA @ case 43
	.4byte _0803FBCE @ case 44
	.4byte _0803FBD4 @ case 45
	.4byte _0803FBD8 @ case 46
	.4byte _0803FBDE @ case 47
	.4byte _0803FBE2 @ case 48
	.4byte _0803FC00 @ case 49
	.4byte _0803FC00 @ case 50
	.4byte _0803FC00 @ case 51
	.4byte _0803FC00 @ case 52
	.4byte _0803FC00 @ case 53
	.4byte _0803FC00 @ case 54
	.4byte _0803FC00 @ case 55
	.4byte _0803FC00 @ case 56
	.4byte _0803FC00 @ case 57
	.4byte _0803FC00 @ case 58
	.4byte _0803FC00 @ case 59
	.4byte _0803FC00 @ case 60
	.4byte _0803FC00 @ case 61
	.4byte _0803FC00 @ case 62
	.4byte _0803FC00 @ case 63
	.4byte _0803FC00 @ case 64
	.4byte _0803FC00 @ case 65
	.4byte _0803FC00 @ case 66
	.4byte _0803FC00 @ case 67
	.4byte _0803FC00 @ case 68
	.4byte _0803FC00 @ case 69
	.4byte _0803FC00 @ case 70
	.4byte _0803FC00 @ case 71
	.4byte _0803FC00 @ case 72
	.4byte _0803FC00 @ case 73
	.4byte _0803FC00 @ case 74
	.4byte _0803FC00 @ case 75
	.4byte _0803FC00 @ case 76
	.4byte _0803FC00 @ case 77
	.4byte _0803FC00 @ case 78
	.4byte _0803FC00 @ case 79
	.4byte _0803FC00 @ case 80
	.4byte _0803FC00 @ case 81
	.4byte _0803FC00 @ case 82
	.4byte _0803FC00 @ case 83
	.4byte _0803FC00 @ case 84
	.4byte _0803FC00 @ case 85
	.4byte _0803FC00 @ case 86
	.4byte _0803FBE8 @ case 87
	.4byte _0803FBEC @ case 88
	.4byte _0803FBF2 @ case 89
	.4byte _0803FBF6 @ case 90
	.4byte _0803FBFC @ case 91
_0803FBB0:
	bl ChootInit
	b _0803FC00
_0803FBB6:
	bl ChootIdleInit
_0803FBBA:
	bl ChootIdle
	b _0803FC00
_0803FBC0:
	bl ChootLaunchingInit
_0803FBC4:
	bl ChootLaunching
	b _0803FC00
_0803FBCA:
	bl ChootGoingUpInit
_0803FBCE:
	bl ShootGoingUp
	b _0803FC00
_0803FBD4:
	bl ChootOpeningInit
_0803FBD8:
	bl ChootOpening
	b _0803FC00
_0803FBDE:
	bl ChootGoingDownInit
_0803FBE2:
	bl ChootGoingDown
	b _0803FC00
_0803FBE8:
	bl SpriteDyingInit
_0803FBEC:
	bl SpriteDying
	b _0803FC00
_0803FBF2:
	bl ChootInit
_0803FBF6:
	bl SpriteSpawningFromX
	b _0803FC00
_0803FBFC:
	bl XParasiteInit
_0803FC00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChootSpit
ChootSpit: @ 0x0803FC08
	push {lr}
	ldr r0, _0803FC20 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0803FC16
	b _0803FD22
_0803FC16:
	lsls r0, r0, #2
	ldr r1, _0803FC24 @ =_0803FC28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FC20: .4byte gCurrentSprite
_0803FC24: .4byte _0803FC28
_0803FC28: @ jump table
	.4byte _0803FD08 @ case 0
	.4byte _0803FD22 @ case 1
	.4byte _0803FD0E @ case 2
	.4byte _0803FD22 @ case 3
	.4byte _0803FD22 @ case 4
	.4byte _0803FD22 @ case 5
	.4byte _0803FD22 @ case 6
	.4byte _0803FD14 @ case 7
	.4byte _0803FD18 @ case 8
	.4byte _0803FD22 @ case 9
	.4byte _0803FD22 @ case 10
	.4byte _0803FD22 @ case 11
	.4byte _0803FD22 @ case 12
	.4byte _0803FD22 @ case 13
	.4byte _0803FD22 @ case 14
	.4byte _0803FD22 @ case 15
	.4byte _0803FD22 @ case 16
	.4byte _0803FD22 @ case 17
	.4byte _0803FD22 @ case 18
	.4byte _0803FD22 @ case 19
	.4byte _0803FD22 @ case 20
	.4byte _0803FD22 @ case 21
	.4byte _0803FD1E @ case 22
	.4byte _0803FD22 @ case 23
	.4byte _0803FD22 @ case 24
	.4byte _0803FD22 @ case 25
	.4byte _0803FD22 @ case 26
	.4byte _0803FD22 @ case 27
	.4byte _0803FD22 @ case 28
	.4byte _0803FD22 @ case 29
	.4byte _0803FD22 @ case 30
	.4byte _0803FD22 @ case 31
	.4byte _0803FD22 @ case 32
	.4byte _0803FD22 @ case 33
	.4byte _0803FD22 @ case 34
	.4byte _0803FD22 @ case 35
	.4byte _0803FD22 @ case 36
	.4byte _0803FD22 @ case 37
	.4byte _0803FD22 @ case 38
	.4byte _0803FD22 @ case 39
	.4byte _0803FD22 @ case 40
	.4byte _0803FD22 @ case 41
	.4byte _0803FD22 @ case 42
	.4byte _0803FD22 @ case 43
	.4byte _0803FD22 @ case 44
	.4byte _0803FD22 @ case 45
	.4byte _0803FD22 @ case 46
	.4byte _0803FD22 @ case 47
	.4byte _0803FD22 @ case 48
	.4byte _0803FD22 @ case 49
	.4byte _0803FD22 @ case 50
	.4byte _0803FD22 @ case 51
	.4byte _0803FD22 @ case 52
	.4byte _0803FD22 @ case 53
	.4byte _0803FD22 @ case 54
	.4byte _0803FD14 @ case 55
_0803FD08:
	bl ChootSpitInit
	b _0803FD22
_0803FD0E:
	bl ChootSpitSpawning
	b _0803FD22
_0803FD14:
	bl ChootSpitExplodingInit
_0803FD18:
	bl ChootSpitExploding
	b _0803FD22
_0803FD1E:
	bl SpriteUtilCurrentSpriteFall
_0803FD22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianGroundCheckInShootingRange
ZebesianGroundCheckInShootingRange: @ 0x0803FD28
	push {r4, lr}
	ldr r0, _0803FD70 @ =gSamusData
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	ldrh r0, [r0, #0x18]
	adds r1, r1, r0
	ldr r4, _0803FD74 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	cmp r1, r0
	bgt _0803FD8C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xd0
	lsls r2, r2, #2
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	adds r3, r0, #0
	cmp r3, #3
	bne _0803FD78
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x17
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	movs r0, #3
	b _0803FDCC
	.align 2, 0
_0803FD70: .4byte gSamusData
_0803FD74: .4byte gCurrentSprite
_0803FD78:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FD90
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FD90
_0803FD8C:
	movs r0, #0
	b _0803FDCC
_0803FD90:
	movs r0, #0xc0
	lsls r0, r0, #1
	movs r2, #0xd0
	lsls r2, r2, #2
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	adds r3, r0, #0
	cmp r3, #3
	bne _0803FDB4
	ldr r0, _0803FDB0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x29
	strb r1, [r0]
	b _0803FDC8
	.align 2, 0
_0803FDB0: .4byte gCurrentSprite
_0803FDB4:
	cmp r3, #0xc
	bne _0803FDC8
	ldr r1, _0803FDD4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
_0803FDC8:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
_0803FDCC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803FDD4: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundCheckCollidingWithAir
ZebesianGroundCheckCollidingWithAir: @ 0x0803FDD8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803FE0C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803FE10 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803FE02
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803FE02
	movs r6, #1
_0803FE02:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803FE0C: .4byte gCurrentSprite
_0803FE10: .4byte gPreviousCollisionCheck

	thumb_func_start ZebesianGroundSetIdleHitbox
ZebesianGroundSetIdleHitbox: @ 0x0803FE14
	push {lr}
	ldr r2, _0803FE34 @ =gCurrentSprite
	movs r3, #0
	movs r1, #0
	ldr r0, _0803FE38 @ =0x0000FF40
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803FE40
	ldr r0, _0803FE3C @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x38
	b _0803FE46
	.align 2, 0
_0803FE34: .4byte gCurrentSprite
_0803FE38: .4byte 0x0000FF40
_0803FE3C: .4byte 0x0000FFE0
_0803FE40:
	ldr r0, _0803FE4C @ =0x0000FFC8
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803FE46:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803FE4C: .4byte 0x0000FFC8

	thumb_func_start ZebesianGroundSetShootingHitbox
ZebesianGroundSetShootingHitbox: @ 0x0803FE50
	push {lr}
	ldr r0, _0803FE64 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803FE6C
	ldr r0, _0803FE68 @ =0x0000FF80
	b _0803FE6E
	.align 2, 0
_0803FE64: .4byte gCurrentSprite
_0803FE68: .4byte 0x0000FF80
_0803FE6C:
	ldr r0, _0803FE88 @ =0x0000FF40
_0803FE6E:
	strh r0, [r2, #0xa]
	movs r3, #0
	movs r0, #0
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803FE90
	ldr r0, _0803FE8C @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x70
	b _0803FE96
	.align 2, 0
_0803FE88: .4byte 0x0000FF40
_0803FE8C: .4byte 0x0000FFE0
_0803FE90:
	ldr r0, _0803FE9C @ =0x0000FF90
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803FE96:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803FE9C: .4byte 0x0000FF90

	thumb_func_start ZebesianGroundInit
ZebesianGroundInit: @ 0x0803FEA0
	push {r4, lr}
	ldr r4, _0803FEB8 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803FEBC
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	b _0803FF22
	.align 2, 0
_0803FEB8: .4byte gCurrentSprite
_0803FEBC:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0xb4
	bne _0803FEE2
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803FED4
	movs r0, #0
	strh r0, [r4]
	b _0803FF6E
_0803FED4:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	b _0803FF10
_0803FEE2:
	bl SpriteUtilTrySetAbsorbXFlag
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803FF10
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803FF0A
	strh r0, [r4]
	b _0803FF6E
_0803FF0A:
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
_0803FF10:
	bl SpriteUtilChooseRandomXFlip
	ldr r1, _0803FF74 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
_0803FF22:
	strb r0, [r1]
	ldr r0, _0803FF74 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x25
	movs r3, #0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _0803FF78 @ =sPrimarySpriteStats
	mov r0, ip
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	mov r2, ip
	strh r0, [r2, #0x14]
	adds r2, #0x27
	movs r0, #0x38
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	adds r2, #2
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, _0803FF7C @ =0x0835C190
	mov r2, ip
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r0, ip
	adds r0, #0x2f
	strb r1, [r0]
	bl ZebesianGroundSetIdleHitbox
_0803FF6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF74: .4byte gCurrentSprite
_0803FF78: .4byte sPrimarySpriteStats
_0803FF7C: .4byte 0x0835C190

	thumb_func_start ZebesianGroundSpawningFromX
ZebesianGroundSpawningFromX: @ 0x0803FF80
	push {lr}
	ldr r3, _0803FFB4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803FFC0
	ldr r2, _0803FFB8 @ =gWrittenToMosaic_H
	ldr r1, _0803FFBC @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0803FFFC
	.align 2, 0
_0803FFB4: .4byte gCurrentSprite
_0803FFB8: .4byte gWrittenToMosaic_H
_0803FFBC: .4byte sXParasiteMosaicValues
_0803FFC0:
	ldrb r0, [r3, #0x1d]
	cmp r0, #0xb4
	bne _0803FFE8
	strb r1, [r3, #0x1f]
	movs r0, #0xb3
	strb r0, [r3, #0x1d]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldrh r0, [r3, #2]
	subs r0, #0x40
	strh r0, [r3, #2]
	b _0803FFFC
_0803FFE8:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08040000 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _08040004 @ =0x00007FFF
	ands r0, r1
	strh r0, [r3]
_0803FFFC:
	pop {r0}
	bx r0
	.align 2, 0
_08040000: .4byte 0x0000FFDF
_08040004: .4byte 0x00007FFF

	thumb_func_start ZebesianPreAquaTurningintoX
ZebesianPreAquaTurningintoX: @ 0x08040008
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, _08040068 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0804006C
	ldrb r1, [r4, #0x1d]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r4, #0x1d]
	ldrb r3, [r6]
	ldrb r0, [r5]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x98
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _080400B0
	.align 2, 0
_08040068: .4byte gCurrentSprite
_0804006C:
	ldrb r1, [r4, #0x1d]
	adds r7, r4, #0
	adds r7, #0x23
	ldrb r3, [r7]
	adds r6, r4, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r4, #0x1d]
	ldrb r3, [r7]
	ldrb r0, [r6]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x98
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x10
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
_080400B0:
	ldr r1, _080400C0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080400C0: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundTurningIntoX
ZebesianGroundTurningIntoX: @ 0x080400C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r6, _08040168 @ =gCurrentSprite
	ldrb r0, [r6, #0x1d]
	cmp r0, #0xa2
	bne _0804016C
	adds r1, r0, #0
	movs r0, #0x23
	adds r0, r0, r6
	mov r8, r0
	ldrb r3, [r0]
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x1c
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x18
	str r0, [sp, #8]
	movs r5, #0x40
	str r5, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x38
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x18
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x54
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0xc
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x70
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #2]
	subs r0, #0x8c
	strh r0, [r6, #2]
	b _080401D4
	.align 2, 0
_08040168: .4byte gCurrentSprite
_0804016C:
	ldrh r1, [r6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080401A2
	ldrb r1, [r6, #0x1d]
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #4]
	subs r0, #0x10
	b _080401CA
_080401A2:
	ldrb r1, [r6, #0x1d]
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #4]
	adds r0, #0x10
_080401CA:
	strh r0, [r6, #4]
	ldr r1, _080401E0 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x98
	strh r0, [r1, #2]
_080401D4:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080401E0: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundFallingInit
ZebesianGroundFallingInit: @ 0x080401E4
	push {lr}
	ldr r3, _08040208 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0804020C @ =0x0835C200
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_08040208: .4byte gCurrentSprite
_0804020C: .4byte 0x0835C200

	thumb_func_start ZebesianGroundIdleInit
ZebesianGroundIdleInit: @ 0x08040210
	push {r4, lr}
	ldr r4, _08040234 @ =gCurrentSprite
	ldr r0, _08040238 @ =0x0835C190
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040234: .4byte gCurrentSprite
_08040238: .4byte 0x0835C190

	thumb_func_start ZebesianGroundIdle
ZebesianGroundIdle: @ 0x0804023C
	push {r4, r5, r6, r7, lr}
	ldr r4, _08040264 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0804024E
	b _08040410
_0804024E:
	movs r7, #0
	bl ZebesianGroundCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040268
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	b _0804040E
	.align 2, 0
_08040264: .4byte gCurrentSprite
_08040268:
	bl SpriteUtilAlignYPositionOnSlopeAtOrigin
	ldr r0, _080402A4 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08040344
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080402E0
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080402A8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080402AC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x60
	b _080402FC
	.align 2, 0
_080402A4: .4byte gPreviousVerticalCollisionCheck
_080402A8: .4byte gPreviousCollisionCheck
_080402AC:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #4]
	adds r0, #4
	b _08040358
_080402E0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040310 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040314
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x60
_080402FC:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #2
	cmp r0, #0
	bne _0804035A
_0804030C:
	movs r7, #1
	b _0804035A
	.align 2, 0
_08040310: .4byte gPreviousCollisionCheck
_08040314:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	b _08040354
_08040344:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040354
	ldrh r0, [r4, #4]
	adds r0, #4
	b _08040358
_08040354:
	ldrh r0, [r4, #4]
	subs r0, #4
_08040358:
	strh r0, [r4, #4]
_0804035A:
	ldr r2, _0804037C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08040396
	ldrh r0, [r2, #0x16]
	cmp r0, #2
	bne _08040384
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _08040384
	ldr r0, _08040380 @ =0x000001AF
	bl SoundPlay
	b _08040396
	.align 2, 0
_0804037C: .4byte gCurrentSprite
_08040380: .4byte 0x000001AF
_08040384:
	ldrh r0, [r2, #0x16]
	cmp r0, #6
	bne _08040396
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _08040396
	ldr r0, _080403B0 @ =0x000001AF
	bl SoundPlay
_08040396:
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040410
	cmp r7, #1
	bne _080403B8
	ldr r0, _080403B4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #9
	strb r1, [r0]
	b _08040410
	.align 2, 0
_080403B0: .4byte 0x000001AF
_080403B4: .4byte gCurrentSprite
_080403B8:
	cmp r7, #2
	bne _080403D0
	ldr r1, _080403CC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	b _0804040E
	.align 2, 0
_080403CC: .4byte gCurrentSprite
_080403D0:
	ldr r2, _080403F8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040410
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080403FC
	ldrh r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	bge _08040410
	b _08040408
	.align 2, 0
_080403F8: .4byte gCurrentSprite
_080403FC:
	ldrh r0, [r2, #8]
	ldr r1, _08040418 @ =0xFFFFFF00
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	ble _08040410
_08040408:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #9
_0804040E:
	strb r0, [r1]
_08040410:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040418: .4byte 0xFFFFFF00

	thumb_func_start ZebesianGroundTurningAroundInit
ZebesianGroundTurningAroundInit: @ 0x0804041C
	ldr r1, _08040434 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _08040438 @ =0x0835C328
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_08040434: .4byte gCurrentSprite
_08040438: .4byte 0x0835C328

	thumb_func_start ZebesianGroundTurningAround
ZebesianGroundTurningAround: @ 0x0804043C
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08040462
	ldr r2, _08040468 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804046C @ =0x0835C348
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_08040462:
	pop {r0}
	bx r0
	.align 2, 0
_08040468: .4byte gCurrentSprite
_0804046C: .4byte 0x0835C348

	thumb_func_start ZebesianGroundTurningAroundSecondPart
ZebesianGroundTurningAroundSecondPart: @ 0x08040470
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0804049A
	ldr r1, _08040490 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	beq _08040494
	movs r0, #0
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #0x29
	b _08040498
	.align 2, 0
_08040490: .4byte gCurrentSprite
_08040494:
	adds r1, #0x24
	movs r0, #1
_08040498:
	strb r0, [r1]
_0804049A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianGroundJumpWarningInit
ZebesianGroundJumpWarningInit: @ 0x080404A0
	ldr r1, _080404B4 @ =gCurrentSprite
	ldr r0, _080404B8 @ =0x0835C2D8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	bx lr
	.align 2, 0
_080404B4: .4byte gCurrentSprite
_080404B8: .4byte 0x0835C2D8

	thumb_func_start ZebesianGroundJumpWarning
ZebesianGroundJumpWarning: @ 0x080404BC
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _080404F6
	ldr r3, _080404FC @ =gCurrentSprite
	ldr r0, _08040500 @ =0x0835C300
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r2, #0
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _08040504 @ =0x0000FF60
	strh r0, [r3, #0xa]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080404F6
	ldr r0, _08040508 @ =0x000001AD
	bl SoundPlayNotAlreadyPlaying
_080404F6:
	pop {r0}
	bx r0
	.align 2, 0
_080404FC: .4byte gCurrentSprite
_08040500: .4byte 0x0835C300
_08040504: .4byte 0x0000FF60
_08040508: .4byte 0x000001AD

	thumb_func_start ZebesianGroundJumping
ZebesianGroundJumping: @ 0x0804050C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _08040548 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040550
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804054C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #4]
	adds r0, #0xa
	b _08040584
	.align 2, 0
_08040548: .4byte gCurrentSprite
_0804054C: .4byte gPreviousCollisionCheck
_08040550:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804057C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08040580
_08040576:
	movs r6, #1
	b _08040586
	.align 2, 0
_0804057C: .4byte gPreviousCollisionCheck
_08040580:
	ldrh r0, [r4, #4]
	subs r0, #0xa
_08040584:
	strh r0, [r4, #4]
_08040586:
	ldr r1, _080405B4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _080405BC
	ldr r0, _080405B8 @ =0x08359A10
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrb r0, [r2]
	cmp r0, #0x12
	bhi _080405DC
	b _080405D8
	.align 2, 0
_080405B4: .4byte gCurrentSprite
_080405B8: .4byte 0x08359A10
_080405BC:
	ldr r0, _080405FC @ =0x083599FC
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _080405DC
_080405D8:
	adds r0, #1
	strb r0, [r2]
_080405DC:
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _08040640
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08040600 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08040604
	strh r1, [r4, #2]
	bl ZebesianGroundLandingInit
	b _0804067A
	.align 2, 0
_080405FC: .4byte 0x083599FC
_08040600: .4byte gPreviousVerticalCollisionCheck
_08040604:
	cmp r6, #0
	bne _0804067A
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040632
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804062E
	movs r6, #1
_0804062E:
	cmp r6, #0
	beq _0804067A
_08040632:
	ldr r0, _0804063C @ =gCurrentSprite
	strh r1, [r0, #2]
	bl ZebesianGroundLandingInit
	b _0804067A
	.align 2, 0
_0804063C: .4byte gCurrentSprite
_08040640:
	movs r6, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040680 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040676
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08040672
	movs r6, #1
_08040672:
	cmp r6, #0
	beq _0804067A
_08040676:
	bl ZebesianGroundFallingInit
_0804067A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040680: .4byte gPreviousCollisionCheck

	thumb_func_start ZebesianGroundLandingInit
ZebesianGroundLandingInit: @ 0x08040684
	push {lr}
	ldr r1, _080406B0 @ =gCurrentSprite
	ldr r0, _080406B4 @ =0x0835C310
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080406AC
	movs r0, #0xd7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080406AC:
	pop {r0}
	bx r0
	.align 2, 0
_080406B0: .4byte gCurrentSprite
_080406B4: .4byte 0x0835C310

	thumb_func_start ZebesianGroundLanding
ZebesianGroundLanding: @ 0x080406B8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _0804077C
	ldr r4, _080406DC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080406E0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0804077C
	.align 2, 0
_080406DC: .4byte gCurrentSprite
_080406E0:
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804077C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804072C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040728 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040762
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804075E
	b _08040762
	.align 2, 0
_08040728: .4byte gPreviousCollisionCheck
_0804072C:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804076C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040762
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804075E
	movs r7, #1
_0804075E:
	cmp r7, #0
	beq _08040774
_08040762:
	ldr r0, _08040770 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	b _0804077A
	.align 2, 0
_0804076C: .4byte gPreviousCollisionCheck
_08040770: .4byte gCurrentSprite
_08040774:
	ldr r0, _08040784 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_0804077A:
	strb r1, [r0]
_0804077C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040784: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundWaitingInit
ZebesianGroundWaitingInit: @ 0x08040788
	push {lr}
	ldr r1, _080407A4 @ =gCurrentSprite
	ldr r0, _080407A8 @ =0x0835C1D8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_080407A4: .4byte gCurrentSprite
_080407A8: .4byte 0x0835C1D8

	thumb_func_start ZebesianGroundWaiting
ZebesianGroundWaiting: @ 0x080407AC
	push {lr}
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _080407BE
	ldr r0, _080407C4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_080407BE:
	pop {r0}
	bx r0
	.align 2, 0
_080407C4: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundStandingInit
ZebesianGroundStandingInit: @ 0x080407C8
	ldr r1, _080407EC @ =gCurrentSprite
	ldr r0, _080407F0 @ =0x0835C1D8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0xa
	strb r0, [r2]
	ldr r0, _080407F4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #2
	adds r1, #0x2f
	strb r0, [r1]
	bx lr
	.align 2, 0
_080407EC: .4byte gCurrentSprite
_080407F0: .4byte 0x0835C1D8
_080407F4: .4byte gSpriteRandomNumber

	thumb_func_start ZebesianGroundStanding
ZebesianGroundStanding: @ 0x080407F8
	push {lr}
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040824
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _08040824
	ldr r1, _08040828 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040824
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_08040824:
	pop {r0}
	bx r0
	.align 2, 0
_08040828: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundShootingInit
ZebesianGroundShootingInit: @ 0x0804082C
	push {r4, lr}
	ldr r4, _08040858 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x46
	strb r0, [r1]
	bl SpriteUtilCheckSamusCrouchingOrMorphed
	cmp r0, #0
	beq _08040860
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0804085C @ =0x0835C278
	b _0804086A
	.align 2, 0
_08040858: .4byte gCurrentSprite
_0804085C: .4byte 0x0835C278
_08040860:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08040878 @ =0x0835C210
_0804086A:
	str r0, [r4, #0x18]
	bl ZebesianGroundSetShootingHitbox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040878: .4byte 0x0835C210

	thumb_func_start ZebesianGroundShooting
ZebesianGroundShooting: @ 0x0804087C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _080408DC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040912
	ldrh r0, [r4, #0x16]
	cmp r0, #6
	beq _08040894
	b _080409A0
_08040894:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _0804089C
	b _080409A0
_0804089C:
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080408E0
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x58
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	b _0804095A
	.align 2, 0
_080408DC: .4byte gCurrentSprite
_080408E0:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x58
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0804095E
_08040912:
	ldrh r0, [r4, #0x16]
	cmp r0, #7
	bne _080409A0
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _080409A0
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08040968
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x60
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x68
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x10
_0804095A:
	str r0, [sp, #4]
	str r6, [sp, #8]
_0804095E:
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	b _080409A0
_08040968:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x60
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x68
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
_080409A0:
	bl SpriteUtilHasCurrentAnimationNearlyEnded
	cmp r0, #0
	beq _080409B0
	ldr r0, _080409B8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
_080409B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080409B8: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundShootingEndInit
ZebesianGroundShootingEndInit: @ 0x080409BC
	push {lr}
	ldr r1, _080409D8 @ =gCurrentSprite
	ldr r0, _080409DC @ =0x0835C1D8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_080409D8: .4byte gCurrentSprite
_080409DC: .4byte 0x0835C1D8

	thumb_func_start ZebesianGroundShootingEnd
ZebesianGroundShootingEnd: @ 0x080409E0
	push {r4, r5, r6, lr}
	ldr r0, _08040A24 @ =gSamusData
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	ldrh r0, [r0, #0x18]
	adds r1, r1, r0
	ldr r4, _08040A28 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	cmp r1, r0
	bgt _08040A6E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r6, #0xd0
	lsls r6, r6, #2
	movs r0, #0xc0
	adds r2, r6, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08040A2C
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x17
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	b _08040A76
	.align 2, 0
_08040A24: .4byte gSamusData
_08040A28: .4byte gCurrentSprite
_08040A2C:
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _08040A3A
	subs r0, #1
	strb r0, [r5]
_08040A3A:
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r2, r6, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08040A58
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040A76
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08040A74
_08040A58:
	cmp r0, #0xc
	bne _08040A6E
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040A76
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	adds r1, #0xb
	b _08040A72
_08040A6E:
	adds r1, r4, #0
	adds r1, #0x24
_08040A72:
	movs r0, #1
_08040A74:
	strb r0, [r1]
_08040A76:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZebesianGroundBeamInit
ZebesianGroundBeamInit: @ 0x08040A7C
	push {r4, r5, r6, lr}
	ldr r0, _08040AEC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _08040AF0 @ =0x0000FFFB
	ands r3, r0
	movs r5, #0
	movs r4, #0
	mov r1, ip
	strh r3, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	movs r2, #0x30
	strb r2, [r0]
	ldr r0, _08040AF4 @ =0x0000FFF8
	mov r6, ip
	strh r0, [r6, #0xa]
	strh r1, [r6, #0xc]
	ldr r0, _08040AF8 @ =0x0835C398
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r4, [r6, #0x16]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x40
	ands r0, r3
	mov r1, ip
	cmp r0, #0
	beq _08040AFC
	movs r0, #0x10
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
	b _08040B04
	.align 2, 0
_08040AEC: .4byte gCurrentSprite
_08040AF0: .4byte 0x0000FFFB
_08040AF4: .4byte 0x0000FFF8
_08040AF8: .4byte 0x0835C398
_08040AFC:
	ldr r0, _08040B1C @ =0x0000FFD0
	strh r0, [r1, #0xe]
	adds r0, #0x20
	strh r0, [r1, #0x10]
_08040B04:
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08040B14
	ldr r0, _08040B20 @ =0x0000015D
	bl SoundPlayNotAlreadyPlaying
_08040B14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040B1C: .4byte 0x0000FFD0
_08040B20: .4byte 0x0000015D

	thumb_func_start ZebesianGroundBeamSpawning
ZebesianGroundBeamSpawning: @ 0x08040B24
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08040B64
	ldr r2, _08040B54 @ =gCurrentSprite
	ldr r0, _08040B58 @ =0x0835C3C0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040B5C
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0x60
	b _08040B62
	.align 2, 0
_08040B54: .4byte gCurrentSprite
_08040B58: .4byte 0x0835C3C0
_08040B5C:
	ldr r0, _08040B68 @ =0x0000FFA0
	strh r0, [r2, #0xe]
	adds r0, #0x40
_08040B62:
	strh r0, [r2, #0x10]
_08040B64:
	pop {r0}
	bx r0
	.align 2, 0
_08040B68: .4byte 0x0000FFA0

	thumb_func_start ZebesianGroundBeamFired
ZebesianGroundBeamFired: @ 0x08040B6C
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _08040BAC
	ldr r2, _08040B9C @ =gCurrentSprite
	ldr r0, _08040BA0 @ =0x0835C368
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040BA4
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0xa0
	b _08040BAA
	.align 2, 0
_08040B9C: .4byte gCurrentSprite
_08040BA0: .4byte 0x0835C368
_08040BA4:
	ldr r0, _08040BB0 @ =0x0000FF60
	strh r0, [r2, #0xe]
	adds r0, #0x80
_08040BAA:
	strh r0, [r2, #0x10]
_08040BAC:
	pop {r0}
	bx r0
	.align 2, 0
_08040BB0: .4byte 0x0000FF60

	thumb_func_start ZebesianGroundCheckSkipMovement
ZebesianGroundCheckSkipMovement: @ 0x08040BB4
	push {lr}
	ldr r2, _08040BD4 @ =gCurrentSprite
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xb4
	bne _08040BDC
	ldr r0, _08040BD8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08040BDC
	ldrb r0, [r2, #0x1c]
	subs r0, #1
	strb r0, [r2, #0x1c]
	movs r0, #1
	b _08040BDE
	.align 2, 0
_08040BD4: .4byte gCurrentSprite
_08040BD8: .4byte gFrameCounter8Bit
_08040BDC:
	movs r0, #0
_08040BDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ZebesianGround
ZebesianGround: @ 0x08040BE4
	push {r4, lr}
	ldr r4, _08040C1C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08040BFE
	movs r0, #0xaf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08040BFE:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040C20
	bl SpriteUtilUpdateFreezeTimer
	b _08040EF6
	.align 2, 0
_08040C1C: .4byte gCurrentSprite
_08040C20:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08040C2C
	b _08040EB8
_08040C2C:
	lsls r0, r0, #2
	ldr r1, _08040C38 @ =_08040C3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040C38: .4byte _08040C3C
_08040C3C: @ jump table
	.4byte _08040DAC @ case 0
	.4byte _08040DB2 @ case 1
	.4byte _08040DB6 @ case 2
	.4byte _08040DF4 @ case 3
	.4byte _08040DF8 @ case 4
	.4byte _08040E08 @ case 5
	.4byte _08040EB8 @ case 6
	.4byte _08040DC8 @ case 7
	.4byte _08040DCC @ case 8
	.4byte _08040DDE @ case 9
	.4byte _08040DE2 @ case 10
	.4byte _08040EB8 @ case 11
	.4byte _08040EB8 @ case 12
	.4byte _08040EB8 @ case 13
	.4byte _08040EB8 @ case 14
	.4byte _08040EB8 @ case 15
	.4byte _08040EB8 @ case 16
	.4byte _08040EB8 @ case 17
	.4byte _08040EB8 @ case 18
	.4byte _08040EB8 @ case 19
	.4byte _08040EB8 @ case 20
	.4byte _08040E18 @ case 21
	.4byte _08040E1C @ case 22
	.4byte _08040E2C @ case 23
	.4byte _08040E30 @ case 24
	.4byte _08040EB8 @ case 25
	.4byte _08040E40 @ case 26
	.4byte _08040EB8 @ case 27
	.4byte _08040E50 @ case 28
	.4byte _08040EB8 @ case 29
	.4byte _08040EB8 @ case 30
	.4byte _08040EB8 @ case 31
	.4byte _08040EB8 @ case 32
	.4byte _08040EB8 @ case 33
	.4byte _08040EB8 @ case 34
	.4byte _08040EB8 @ case 35
	.4byte _08040EB8 @ case 36
	.4byte _08040EB8 @ case 37
	.4byte _08040EB8 @ case 38
	.4byte _08040EB8 @ case 39
	.4byte _08040EB8 @ case 40
	.4byte _08040E60 @ case 41
	.4byte _08040E64 @ case 42
	.4byte _08040E74 @ case 43
	.4byte _08040E78 @ case 44
	.4byte _08040EB8 @ case 45
	.4byte _08040EB8 @ case 46
	.4byte _08040EB8 @ case 47
	.4byte _08040EB8 @ case 48
	.4byte _08040EB8 @ case 49
	.4byte _08040EB8 @ case 50
	.4byte _08040EB8 @ case 51
	.4byte _08040EB8 @ case 52
	.4byte _08040EB8 @ case 53
	.4byte _08040EB8 @ case 54
	.4byte _08040EB8 @ case 55
	.4byte _08040EB8 @ case 56
	.4byte _08040EB8 @ case 57
	.4byte _08040EB8 @ case 58
	.4byte _08040EB8 @ case 59
	.4byte _08040EB8 @ case 60
	.4byte _08040EB8 @ case 61
	.4byte _08040EB8 @ case 62
	.4byte _08040EB8 @ case 63
	.4byte _08040EB8 @ case 64
	.4byte _08040EB8 @ case 65
	.4byte _08040EB8 @ case 66
	.4byte _08040EB8 @ case 67
	.4byte _08040EB8 @ case 68
	.4byte _08040EB8 @ case 69
	.4byte _08040EB8 @ case 70
	.4byte _08040EB8 @ case 71
	.4byte _08040EB8 @ case 72
	.4byte _08040EB8 @ case 73
	.4byte _08040EB8 @ case 74
	.4byte _08040EB8 @ case 75
	.4byte _08040EB8 @ case 76
	.4byte _08040EB8 @ case 77
	.4byte _08040EB8 @ case 78
	.4byte _08040EB8 @ case 79
	.4byte _08040EB8 @ case 80
	.4byte _08040EB8 @ case 81
	.4byte _08040EB8 @ case 82
	.4byte _08040EB8 @ case 83
	.4byte _08040EB8 @ case 84
	.4byte _08040EB8 @ case 85
	.4byte _08040EB8 @ case 86
	.4byte _08040E88 @ case 87
	.4byte _08040E8C @ case 88
	.4byte _08040E92 @ case 89
	.4byte _08040E96 @ case 90
	.4byte _08040E9C @ case 91
_08040DAC:
	bl ZebesianGroundInit
	b _08040EB8
_08040DB2:
	bl ZebesianGroundIdleInit
_08040DB6:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DC2
	b _08040EF6
_08040DC2:
	bl ZebesianGroundIdle
	b _08040EB8
_08040DC8:
	bl ZebesianGroundWaitingInit
_08040DCC:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DD8
	b _08040EF6
_08040DD8:
	bl ZebesianGroundWaiting
	b _08040EB8
_08040DDE:
	bl ZebesianGroundStandingInit
_08040DE2:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DEE
	b _08040EF6
_08040DEE:
	bl ZebesianGroundStanding
	b _08040EB8
_08040DF4:
	bl ZebesianGroundTurningAroundInit
_08040DF8:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundTurningAround
	b _08040EB8
_08040E08:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundTurningAroundSecondPart
	b _08040EB8
_08040E18:
	bl ZebesianGroundFallingInit
_08040E1C:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl SpriteUtilCurrentSpriteFall
	b _08040EB8
_08040E2C:
	bl ZebesianGroundJumpWarningInit
_08040E30:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundJumpWarning
	b _08040EB8
_08040E40:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundJumping
	b _08040EB8
_08040E50:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundLanding
	b _08040EB8
_08040E60:
	bl ZebesianGroundShootingInit
_08040E64:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundShooting
	b _08040EB8
_08040E74:
	bl ZebesianGroundShootingEndInit
_08040E78:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundShootingEnd
	b _08040EB8
_08040E88:
	bl SpriteDyingInit
_08040E8C:
	bl SpriteDying
	b _08040EB8
_08040E92:
	bl ZebesianGroundInit
_08040E96:
	bl ZebesianGroundSpawningFromX
	b _08040EB8
_08040E9C:
	ldr r0, _08040EAC @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0xb4
	bne _08040EB0
	bl ZebesianPreAquaTurningintoX
	b _08040EB8
	.align 2, 0
_08040EAC: .4byte gCurrentSprite
_08040EB0:
	bl ZebesianGroundTurningIntoX
	bl XParasiteInit
_08040EB8:
	ldr r2, _08040ED8 @ =gCurrentSprite
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xa2
	bne _08040EF6
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040EE0
	ldr r0, _08040EDC @ =gSamusData
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08040EF6
	b _08040EEC
	.align 2, 0
_08040ED8: .4byte gCurrentSprite
_08040EDC: .4byte gSamusData
_08040EE0:
	ldr r0, _08040EFC @ =gSamusData
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08040EF6
_08040EEC:
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
_08040EF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EFC: .4byte gSamusData

	thumb_func_start ZebesianGroundBeam
ZebesianGroundBeam: @ 0x08040F00
	push {lr}
	ldr r0, _08040F18 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08040F28
	cmp r0, #2
	bgt _08040F1C
	cmp r0, #0
	beq _08040F22
	b _08040F32
	.align 2, 0
_08040F18: .4byte gCurrentSprite
_08040F1C:
	cmp r0, #0x18
	beq _08040F2E
	b _08040F32
_08040F22:
	bl ZebesianGroundBeamInit
	b _08040F32
_08040F28:
	bl ZebesianGroundBeamSpawning
	b _08040F32
_08040F2E:
	bl ZebesianGroundBeamFired
_08040F32:
	ldr r2, _08040F44 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040F48
	ldrh r0, [r2, #4]
	adds r0, #0xa
	b _08040F4C
	.align 2, 0
_08040F44: .4byte gCurrentSprite
_08040F48:
	ldrh r0, [r2, #4]
	subs r0, #0xa
_08040F4C:
	strh r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
