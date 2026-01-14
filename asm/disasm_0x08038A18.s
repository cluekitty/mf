    .include "asm/macros.inc"

    .syntax unified

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
