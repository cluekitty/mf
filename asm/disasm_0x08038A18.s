    .include "asm/macros.inc"

    .syntax unified

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
