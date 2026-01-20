    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start IceBeamAbilitySpawningFromX
IceBeamAbilitySpawningFromX: @ 0x08058934
	push {r4, lr}
	ldr r0, _08058964 @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x2e
	ldrb r1, [r4]
	subs r1, #1
	strb r1, [r4]
	ldr r3, _08058968 @ =gWrittenToMosaic_H
	ldr r2, _0805896C @ =sXParasiteMosaicValues
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bhi _08058970
	ldrb r2, [r4]
	movs r0, #0x4d
	movs r1, #0
	bl SpriteLoadGfx
	b _0805897E
	.align 2, 0
_08058964: .4byte gCurrentSprite
_08058968: .4byte gWrittenToMosaic_H
_0805896C: .4byte sXParasiteMosaicValues
_08058970:
	cmp r1, #8
	bne _0805897E
	movs r0, #0x4d
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_0805897E:
	ldr r2, _080589A0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805899A
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _080589A4 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_0805899A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080589A0: .4byte gCurrentSprite
_080589A4: .4byte 0x0000FFDF

	thumb_func_start IceBeamAbilityInit
IceBeamAbilityInit: @ 0x080589A8
	push {r4, r5, r6, lr}
	ldr r3, _08058A04 @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r5, _08058A08 @ =0x0000FFFB
	ands r5, r0
	movs r6, #0
	movs r2, #0
	strh r5, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r6, [r0]
	adds r0, #2
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r1, _08058A0C @ =0x0000FFDC
	strh r1, [r3, #0xa]
	movs r0, #0x24
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _08058A10 @ =0x083A86A4
	str r0, [r3, #0x18]
	strb r6, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08058A14
	ldrh r0, [r3, #2]
	subs r0, #0x48
	strh r0, [r3, #2]
	movs r0, #0x5a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r4, [r0]
	movs r1, #0x20
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r3]
	b _08058A26
	.align 2, 0
_08058A04: .4byte gCurrentSprite
_08058A08: .4byte 0x0000FFFB
_08058A0C: .4byte 0x0000FFDC
_08058A10: .4byte 0x083A86A4
_08058A14:
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r6, [r0]
_08058A26:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start IceBeamAbilitySpawning
IceBeamAbilitySpawning: @ 0x08058A2C
	push {lr}
	ldr r1, _08058A58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r2, #8
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058A54
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	ldr r0, _08058A5C @ =0x000002AE
	bl SoundPlay
_08058A54:
	pop {r0}
	bx r0
	.align 2, 0
_08058A58: .4byte gCurrentSprite
_08058A5C: .4byte 0x000002AE

	thumb_func_start IceBeamAbilityEntering
IceBeamAbilityEntering: @ 0x08058A60
	push {r4, r5, r6, lr}
	ldr r2, _08058ACC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08058AD0 @ =0x08328480
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08058AD4 @ =0x00007FFF
	cmp r1, r0
	bne _08058A8A
	ldrh r4, [r5]
	movs r3, #0
_08058A8A:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	movs r4, #0
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	lsrs r1, r3, #2
	ldr r0, _08058AD8 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r6, _08058ADC @ =0xFFC60000
	adds r1, r1, r6
	lsrs r1, r1, #0x10
	cmp r1, #4
	bhi _08058AE0
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	mov r0, ip
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	b _08058AE4
	.align 2, 0
_08058ACC: .4byte gCurrentSprite
_08058AD0: .4byte 0x08328480
_08058AD4: .4byte 0x00007FFF
_08058AD8: .4byte gBg1XPosition
_08058ADC: .4byte 0xFFC60000
_08058AE0:
	adds r0, r3, #6
	strh r0, [r2, #4]
_08058AE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IceBeamAbilityFloatingBeforeSaX
IceBeamAbilityFloatingBeforeSaX: @ 0x08058AEC
	push {r4, r5, r6, r7, lr}
	ldr r2, _08058B54 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058B64
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _08058B58 @ =0x083A74A8
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08058B5C @ =0x00007FFF
	cmp r0, r6
	bne _08058B22
	ldrh r3, [r4]
	movs r1, #0
_08058B22:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08058B60 @ =0x083A752A
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _08058B46
	ldrh r3, [r4]
	movs r1, #0
_08058B46:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _08058B78
	.align 2, 0
_08058B54: .4byte gCurrentSprite
_08058B58: .4byte 0x083A74A8
_08058B5C: .4byte 0x00007FFF
_08058B60: .4byte 0x083A752A
_08058B64:
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_08058B78:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IceBeamAbilityTurningIntoSaX
IceBeamAbilityTurningIntoSaX: @ 0x08058B80
	push {lr}
	ldr r1, _08058BB8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldr r3, _08058BBC @ =gWrittenToMosaic_H
	ldr r2, _08058BC0 @ =sXParasiteMosaicValues
	adds r1, #0x2e
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08058BC4
	ldrb r2, [r1]
	movs r0, #0xc9
	movs r1, #0
	bl SpriteLoadGfx
	b _08058BD2
	.align 2, 0
_08058BB8: .4byte gCurrentSprite
_08058BBC: .4byte gWrittenToMosaic_H
_08058BC0: .4byte sXParasiteMosaicValues
_08058BC4:
	cmp r0, #8
	bne _08058BD2
	movs r0, #0xc9
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_08058BD2:
	ldr r2, _08058BF0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058BEA
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0xc9
	strb r0, [r2, #0x1d]
_08058BEA:
	pop {r0}
	bx r0
	.align 2, 0
_08058BF0: .4byte gCurrentSprite

	thumb_func_start IceBeamAbilitySpawningFromSaXInit
IceBeamAbilitySpawningFromSaXInit: @ 0x08058BF4
	ldr r3, _08058C34 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	subs r1, #3
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08058C38 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #0xf
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_08058C34: .4byte gCurrentSprite
_08058C38: .4byte gIoRegisters

	thumb_func_start IceBeamAbilityGoingToTarget
IceBeamAbilityGoingToTarget: @ 0x08058C3C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _08058CD0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r5, _08058CD4 @ =gCurrentSprite
	cmp r0, #0
	bne _08058C56
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
_08058C56:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08058CD8 @ =gAbilityRestingYPosition
	ldrh r0, [r4]
	ldr r6, _08058CDC @ =gAbilityRestingXPosition
	ldrh r1, [r6]
	movs r2, #2
	str r2, [sp]
	ldr r2, _08058CE0 @ =0x00000141
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0x18
	bl XParasiteMoveWithSound
	ldrh r2, [r5, #2]
	ldrh r1, [r4]
	adds r0, r1, #6
	cmp r2, r0
	bge _08058CC8
	subs r0, r1, #6
	cmp r2, r0
	ble _08058CC8
	ldrh r2, [r5, #4]
	ldrh r1, [r6]
	adds r0, r1, #6
	cmp r2, r0
	bge _08058CC8
	subs r0, r1, #6
	cmp r2, r0
	ble _08058CC8
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x5e
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _08058CE4 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r1, _08058CE8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08058CEC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #7
	bl _call_via_r1
	ldr r0, _08058CF0 @ =gPoseLock
	strb r4, [r0]
_08058CC8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058CD0: .4byte gFrameCounter8Bit
_08058CD4: .4byte gCurrentSprite
_08058CD8: .4byte gAbilityRestingYPosition
_08058CDC: .4byte gAbilityRestingXPosition
_08058CE0: .4byte 0x00000141
_08058CE4: .4byte 0x0000FFFB
_08058CE8: .4byte sSamusSetPoseFunctionPointer
_08058CEC: .4byte gSamusData
_08058CF0: .4byte gPoseLock

	thumb_func_start IceBeamAbilityWaiting
IceBeamAbilityWaiting: @ 0x08058CF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08058DEC @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	ldr r4, _08058DF0 @ =0x083031E0
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r7, _08058DF4 @ =0x00007FFF
	mov r8, r7
	cmp r0, r8
	bne _08058D1C
	ldrh r2, [r4]
	movs r1, #0
_08058D1C:
	adds r0, r1, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r3, #2]
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08058DF8 @ =0x08303262
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r8
	bne _08058D44
	ldrh r2, [r4]
	movs r1, #0
_08058D44:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r3, #4]
	adds r0, r0, r2
	strh r0, [r3, #4]
	ldrh r4, [r3]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _08058E10
	ldr r1, _08058DFC @ =gPreventMovementTimer
	movs r0, #0x64
	strh r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5f
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	adds r1, #9
	strb r6, [r1]
	strb r0, [r5]
	subs r1, #1
	strb r6, [r1]
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x80
	orrs r0, r4
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	movs r0, #0x14
	strh r0, [r3, #6]
	strb r6, [r3, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x16]
	ldr r0, _08058E00 @ =0x083A86EC
	str r0, [r3, #0x18]
	ldr r4, _08058E04 @ =gSamusData
	movs r5, #0x26
	ldrsh r0, [r4, r5]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r7, [r4, #0x18]
	adds r0, r0, r7
	ldrh r1, [r4, #0x16]
	movs r2, #0x1d
	bl ParticleSet
	movs r0, #0x6b
	bl EventCheckAdvance
	ldr r1, _08058E08 @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #4
	bl _call_via_r1
	ldr r1, _08058E0C @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl SoundPlay
	movs r0, #0
	bl FadeMusic
	b _08058E22
	.align 2, 0
_08058DEC: .4byte gCurrentSprite
_08058DF0: .4byte 0x083031E0
_08058DF4: .4byte 0x00007FFF
_08058DF8: .4byte 0x08303262
_08058DFC: .4byte gPreventMovementTimer
_08058E00: .4byte 0x083A86EC
_08058E04: .4byte gSamusData
_08058E08: .4byte sSamusSetPoseFunctionPointer
_08058E0C: .4byte 0x030012F0
_08058E10:
	ldr r0, _08058E2C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08058E22
	movs r0, #0xc3
	bl SoundPlay
_08058E22:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058E2C: .4byte gFrameCounter8Bit

	thumb_func_start IceBeamAbilityGettingAbsorbed
IceBeamAbilityGettingAbsorbed: @ 0x08058E30
	push {r4, r5, lr}
	ldr r4, _08058E54 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilHealSamusOfOneTank
	bl XParasiteStickToSamus
	ldrh r0, [r4, #6]
	adds r5, r0, #0
	cmp r5, #0
	beq _08058E58
	subs r0, #1
	strh r0, [r4, #6]
	b _08058E6A
	.align 2, 0
_08058E54: .4byte gCurrentSprite
_08058E58:
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _08058E64
	subs r0, #8
	strh r0, [r4, #0x12]
	b _08058E6A
_08058E64:
	bl ProjectileLoadBeamGraphics
	strh r5, [r4]
_08058E6A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IceBeamAbility
IceBeamAbility: @ 0x08058E70
	push {lr}
	ldr r0, _08058E88 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5f
	bls _08058E7E
	b _0805904E
_08058E7E:
	lsls r0, r0, #2
	ldr r1, _08058E8C @ =_08058E90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058E88: .4byte gCurrentSprite
_08058E8C: .4byte _08058E90
_08058E90: @ jump table
	.4byte _08059010 @ case 0
	.4byte _08059016 @ case 1
	.4byte _0805901C @ case 2
	.4byte _0805904E @ case 3
	.4byte _0805904E @ case 4
	.4byte _0805904E @ case 5
	.4byte _0805904E @ case 6
	.4byte _0805904E @ case 7
	.4byte _0805904E @ case 8
	.4byte _0805904E @ case 9
	.4byte _0805904E @ case 10
	.4byte _0805904E @ case 11
	.4byte _0805904E @ case 12
	.4byte _0805904E @ case 13
	.4byte _0805904E @ case 14
	.4byte _0805904E @ case 15
	.4byte _0805904E @ case 16
	.4byte _0805904E @ case 17
	.4byte _0805904E @ case 18
	.4byte _0805904E @ case 19
	.4byte _0805904E @ case 20
	.4byte _0805904E @ case 21
	.4byte _0805904E @ case 22
	.4byte _08059022 @ case 23
	.4byte _08059028 @ case 24
	.4byte _0805904E @ case 25
	.4byte _0805904E @ case 26
	.4byte _0805904E @ case 27
	.4byte _0805904E @ case 28
	.4byte _0805904E @ case 29
	.4byte _0805904E @ case 30
	.4byte _0805904E @ case 31
	.4byte _0805904E @ case 32
	.4byte _0805904E @ case 33
	.4byte _0805904E @ case 34
	.4byte _0805904E @ case 35
	.4byte _0805904E @ case 36
	.4byte _0805904E @ case 37
	.4byte _0805904E @ case 38
	.4byte _0805904E @ case 39
	.4byte _0805904E @ case 40
	.4byte _0805904E @ case 41
	.4byte _0805904E @ case 42
	.4byte _0805904E @ case 43
	.4byte _0805904E @ case 44
	.4byte _0805904E @ case 45
	.4byte _0805904E @ case 46
	.4byte _0805904E @ case 47
	.4byte _0805904E @ case 48
	.4byte _0805904E @ case 49
	.4byte _0805904E @ case 50
	.4byte _0805904E @ case 51
	.4byte _0805904E @ case 52
	.4byte _0805904E @ case 53
	.4byte _0805904E @ case 54
	.4byte _0805904E @ case 55
	.4byte _0805904E @ case 56
	.4byte _0805904E @ case 57
	.4byte _0805904E @ case 58
	.4byte _0805904E @ case 59
	.4byte _0805904E @ case 60
	.4byte _0805904E @ case 61
	.4byte _0805904E @ case 62
	.4byte _0805904E @ case 63
	.4byte _0805904E @ case 64
	.4byte _0805904E @ case 65
	.4byte _0805904E @ case 66
	.4byte _0805904E @ case 67
	.4byte _0805904E @ case 68
	.4byte _0805904E @ case 69
	.4byte _0805904E @ case 70
	.4byte _0805904E @ case 71
	.4byte _0805904E @ case 72
	.4byte _0805904E @ case 73
	.4byte _0805904E @ case 74
	.4byte _0805904E @ case 75
	.4byte _0805904E @ case 76
	.4byte _0805904E @ case 77
	.4byte _0805904E @ case 78
	.4byte _0805904E @ case 79
	.4byte _0805904E @ case 80
	.4byte _0805904E @ case 81
	.4byte _0805904E @ case 82
	.4byte _0805904E @ case 83
	.4byte _0805904E @ case 84
	.4byte _0805904E @ case 85
	.4byte _0805904E @ case 86
	.4byte _0805904E @ case 87
	.4byte _0805904E @ case 88
	.4byte _0805902E @ case 89
	.4byte _08059032 @ case 90
	.4byte _0805904E @ case 91
	.4byte _08059038 @ case 92
	.4byte _0805903E @ case 93
	.4byte _08059044 @ case 94
	.4byte _0805904A @ case 95
_08059010:
	bl IceBeamAbilityInit
	b _0805904E
_08059016:
	bl IceBeamAbilitySpawning
	b _0805904E
_0805901C:
	bl IceBeamAbilityEntering
	b _0805904E
_08059022:
	bl IceBeamAbilityFloatingBeforeSaX
	b _0805904E
_08059028:
	bl IceBeamAbilityTurningIntoSaX
	b _0805904E
_0805902E:
	bl IceBeamAbilityInit
_08059032:
	bl IceBeamAbilitySpawningFromX
	b _0805904E
_08059038:
	bl IceBeamAbilitySpawningFromSaXInit
	b _0805904E
_0805903E:
	bl IceBeamAbilityGoingToTarget
	b _0805904E
_08059044:
	bl IceBeamAbilityWaiting
	b _0805904E
_0805904A:
	bl IceBeamAbilityGettingAbsorbed
_0805904E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MetroidHusk
MetroidHusk: @ 0x08059054
	push {r4, r5, lr}
	ldr r3, _080590A8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _080590A0
	adds r0, r3, #0
	adds r0, #0x22
	movs r2, #4
	strb r2, [r0]
	adds r0, #3
	strb r4, [r0]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080590AC @ =0x0000FFFC
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	strh r0, [r3, #0xe]
	strh r2, [r3, #0x10]
	movs r0, #2
	strb r0, [r5]
	ldr r0, _080590B0 @ =0x083A8F44
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r4, [r3, #0x16]
_080590A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080590A8: .4byte gCurrentSprite
_080590AC: .4byte 0x0000FFFC
_080590B0: .4byte 0x083A8F44

	thumb_func_start RidleyMove
RidleyMove: @ 0x080590B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r1, _0805911C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xc8
	cmp r0, #0x1b
	bne _080590F4
	adds r2, #0x58
_080590F4:
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059128
	ldr r1, _08059120 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059124 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r1, #1
	mov r8, r1
	b _08059140
	.align 2, 0
_0805911C: .4byte gCurrentSprite
_08059120: .4byte gSubSpriteData1
_08059124: .4byte gPreviousCollisionCheck
_08059128:
	ldr r1, _08059170 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r2, #1
	mov r8, r2
_08059140:
	ldr r0, _08059178 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805917C
	ldr r4, _08059170 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0xe0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059192
	ldrh r0, [r4, #8]
	adds r0, #0xa0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	b _0805918E
	.align 2, 0
_08059170: .4byte gSubSpriteData1
_08059174: .4byte gPreviousCollisionCheck
_08059178: .4byte gCurrentSprite
_0805917C:
	ldr r1, _080591E4 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r5, _080591E8 @ =0xFFFFFE80
	adds r0, r0, r5
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080591EC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
_0805918E:
	cmp r0, #0
	beq _08059198
_08059192:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08059198:
	movs r4, #0
	ldr r2, _080591F0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08059214
	mov r0, r8
	cmp r0, #0
	bne _0805927E
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080591F4
	ldr r2, _080591E4 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	cmp r1, r0
	bgt _08059232
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _080591D8
	adds r0, #1
	strb r0, [r1]
_080591D8:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r5, [r2, #0xa]
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_080591E4: .4byte gSubSpriteData1
_080591E8: .4byte 0xFFFFFE80
_080591EC: .4byte gPreviousCollisionCheck
_080591F0: .4byte gCurrentSprite
_080591F4:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r1, _08059210 @ =gSubSpriteData1
	mov r2, ip
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #0xa]
	adds r0, r0, r5
	strh r0, [r1, #0xa]
	b _0805927A
	.align 2, 0
_08059210: .4byte gSubSpriteData1
_08059214:
	mov r0, r8
	cmp r0, #0
	bne _08059278
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805925A
	ldr r2, _08059240 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	ldr r0, _08059244 @ =0xFFFFFF00
	add r0, sb
	cmp r1, r0
	bge _08059248
_08059232:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r2, ip
	strb r0, [r2]
	b _0805927A
	.align 2, 0
_08059240: .4byte gSubSpriteData1
_08059244: .4byte 0xFFFFFF00
_08059248:
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _08059256
	adds r0, #1
	strb r0, [r1]
_08059256:
	ldrb r1, [r1]
	b _0805926A
_0805925A:
	subs r0, #1
	mov r5, ip
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r2, _08059274 @ =gSubSpriteData1
	ldrb r1, [r5]
_0805926A:
	asrs r1, r6
	ldrh r0, [r2, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_08059274: .4byte gSubSpriteData1
_08059278:
	movs r4, #1
_0805927A:
	cmp r4, #0
	beq _080592A2
_0805927E:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080592A2
	subs r1, #0xc
	movs r0, #3
	strb r0, [r1]
_080592A2:
	movs r4, #0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08059318
	cmp r7, #0
	bne _0805937A
	movs r5, #0x2e
	adds r5, r5, r3
	mov ip, r5
	ldrb r0, [r5]
	cmp r0, #0
	bne _080592F8
	ldr r2, _080592D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080592DC
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r5]
	b _08059376
	.align 2, 0
_080592D8: .4byte gSubSpriteData1
_080592DC:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _080592EC
	adds r0, #1
	strb r0, [r1]
_080592EC:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
_080592F8:
	subs r0, #1
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r1, _08059314 @ =gSubSpriteData1
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #8]
	adds r0, r0, r5
	strh r0, [r1, #8]
	b _08059376
	.align 2, 0
_08059314: .4byte gSubSpriteData1
_08059318:
	cmp r7, #0
	bne _08059374
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059356
	ldr r2, _08059340 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	adds r0, #4
	cmp r1, r0
	bge _08059344
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _08059376
	.align 2, 0
_08059340: .4byte gSubSpriteData1
_08059344:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _08059364
	adds r0, #1
	strb r0, [r1]
	b _08059364
_08059356:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r2, _08059370 @ =gSubSpriteData1
_08059364:
	ldrb r1, [r1]
	asrs r1, r6
	ldrh r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
	.align 2, 0
_08059370: .4byte gSubSpriteData1
_08059374:
	movs r4, #1
_08059376:
	cmp r4, #0
	beq _0805938E
_0805937A:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0805938E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateSubSpriteData2Animation
UpdateSubSpriteData2Animation: @ 0x080593A0
	push {lr}
	ldr r2, _080593D8 @ =gSubSpriteData2
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
	bhs _080593D4
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
	bne _080593D4
	strh r0, [r2, #4]
_080593D4:
	pop {r0}
	bx r0
	.align 2, 0
_080593D8: .4byte gSubSpriteData2

	thumb_func_start RidleySyncSubSpritesPosition
RidleySyncSubSpritesPosition: @ 0x080593DC
	push {r4, lr}
	ldr r4, _0805941C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059420 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059424
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059436
	.align 2, 0
_0805941C: .4byte gSubSpriteData2
_08059420: .4byte gCurrentSprite
_08059424:
	ldrb r0, [r2, #0x1e]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059436:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySyncSubSprites
RidleySyncSubSprites: @ 0x0805943C
	push {r4, lr}
	ldr r4, _080594A0 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _080594A4 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _080594A8 @ =0x0879B708
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805946E
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805946E:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _080594AC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _080594BC
	.align 2, 0
_080594A0: .4byte gSubSpriteData1
_080594A4: .4byte gCurrentSprite
_080594A8: .4byte 0x0879B708
_080594AC:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_080594BC:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _080594CC
	ldr r0, _080594D4 @ =gSubSpriteData2
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
_080594CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594D4: .4byte gSubSpriteData2

	thumb_func_start RidleyTailSyncSubSprites
RidleyTailSyncSubSprites: @ 0x080594D8
	push {r4, lr}
	ldr r4, _0805953C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059540 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08059544 @ =0x0879B708
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805950A
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805950A:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _08059548
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059558
	.align 2, 0
_0805953C: .4byte gSubSpriteData2
_08059540: .4byte gCurrentSprite
_08059544: .4byte 0x0879B708
_08059548:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdatePalette
RidleyUpdatePalette: @ 0x08059560
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08059584 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _08059588 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805958C @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08059590
	cmp r1, #1
	beq _080595A8
	b _080595BE
	.align 2, 0
_08059584: .4byte gCurrentSprite
_08059588: .4byte sPrimarySpriteStats
_0805958C: .4byte gBossWork1
_08059590:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _080595BE
	ldr r7, _080595A4 @ =0x083AE06C
	movs r0, #1
	strb r0, [r4]
	b _080595C2
	.align 2, 0
_080595A4: .4byte 0x083AE06C
_080595A8:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _080595BE
	ldr r7, _080595D8 @ =0x083AE0AC
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_080595BE:
	cmp r6, #0
	beq _080595D0
_080595C2:
	ldr r1, _080595DC @ =0x040000D4
	str r7, [r1]
	ldr r0, _080595E0 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _080595E4 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080595D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080595D8: .4byte 0x083AE0AC
_080595DC: .4byte 0x040000D4
_080595E0: .4byte 0x05000300
_080595E4: .4byte 0x80000020

	thumb_func_start RidleySetBackgroundPriority
RidleySetBackgroundPriority: @ 0x080595E8
	push {lr}
	ldr r2, _0805960C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	lsrs r0, r0, #2
	ldr r1, _08059610 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08059614 @ =0xFF410000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _08059618
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #2
	b _08059624
	.align 2, 0
_0805960C: .4byte gCurrentSprite
_08059610: .4byte gBg1YPosition
_08059614: .4byte 0xFF410000
_08059618:
	ldr r0, _0805962C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
_08059624:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805962C: .4byte gIoRegisters

	thumb_func_start RidleyUpdateClawOam
RidleyUpdateClawOam: @ 0x08059630
	push {lr}
	ldr r0, _08059654 @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x25
	ldrb r0, [r3]
	cmp r0, #0x1b
	bne _08059660
	ldr r1, _08059658 @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _0805965C @ =0x083A9F74
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08059676
	.align 2, 0
_08059654: .4byte gCurrentSprite
_08059658: .4byte gSubSpriteData1
_0805965C: .4byte 0x083A9F74
_08059660:
	ldr r1, _0805967C @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _08059680 @ =0x083A9944
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	movs r0, #0x1a
	strb r0, [r3]
_08059676:
	pop {r0}
	bx r0
	.align 2, 0
_0805967C: .4byte gSubSpriteData1
_08059680: .4byte 0x083A9944

	thumb_func_start RidleyTailStrikingCheckPlayEffects
RidleyTailStrikingCheckPlayEffects: @ 0x08059684
	push {lr}
	ldr r2, _080596B4 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	adds r0, #0x14
	ldr r1, _080596B8 @ =0x0000053E
	cmp r0, r1
	bgt _080596AA
	ldrh r0, [r2, #2]
	adds r0, #0x14
	cmp r0, r1
	ble _080596AA
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0xf4
	lsls r0, r0, #1
	bl SoundPlay
_080596AA:
	ldr r1, _080596B4 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
_080596B4: .4byte gCurrentSprite
_080596B8: .4byte 0x0000053E

	thumb_func_start RidleyTailStrikeYMovement
RidleyTailStrikeYMovement: @ 0x080596BC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080596EC @ =gSamusData
	ldr r4, _080596F0 @ =gSubSpriteData1
	ldrh r2, [r4, #8]
	ldrh r0, [r0, #0x18]
	adds r1, r2, #0
	cmp r0, r1
	blo _080596E6
	ldr r0, _080596F4 @ =0x0000043F
	cmp r1, r0
	bhi _080596E6
	ldr r0, _080596F8 @ =gCurrentSprite
	ldrh r0, [r0, #2]
	adds r0, #0x14
	ldr r1, _080596FC @ =0x0000053E
	cmp r0, r1
	bgt _080596E6
	adds r0, r3, r2
	strh r0, [r4, #8]
_080596E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596EC: .4byte gSamusData
_080596F0: .4byte gSubSpriteData1
_080596F4: .4byte 0x0000043F
_080596F8: .4byte gCurrentSprite
_080596FC: .4byte 0x0000053E

	thumb_func_start RidleyFloatingMovement
RidleyFloatingMovement: @ 0x08059700
	push {r4, lr}
	sub sp, #4
	ldr r0, _08059718 @ =gCurrentSprite
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08059724
	ldr r0, _0805971C @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	ldr r0, _08059720 @ =gXParasiteTargetXPosition
	ldrh r1, [r0]
	b _0805975C
	.align 2, 0
_08059718: .4byte gCurrentSprite
_0805971C: .4byte gXParasiteTargetYPosition
_08059720: .4byte gXParasiteTargetXPosition
_08059724:
	ldr r0, _08059748 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	ldr r0, _0805974C @ =gSamusData
	ldrh r4, [r0, #0x18]
	ldr r1, _08059750 @ =0x000002BF
	adds r3, r0, #0
	cmp r4, r1
	bls _08059758
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	bne _08059758
	ldr r1, _08059754 @ =0xFFFFFE00
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _0805975A
	.align 2, 0
_08059748: .4byte gFrameCounter8Bit
_0805974C: .4byte gSamusData
_08059750: .4byte 0x000002BF
_08059754: .4byte 0xFFFFFE00
_08059758:
	ldrh r2, [r3, #0x18]
_0805975A:
	ldrh r1, [r3, #0x16]
_0805975C:
	movs r0, #2
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0x18
	movs r3, #0x18
	bl RidleyMove
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdateHealthThreshold
RidleyUpdateHealthThreshold: @ 0x08059774
	push {r4, lr}
	ldr r4, _080597B4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08059820
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _08059798
	ldr r0, _080597B8 @ =0x000001E1
	bl SoundPlayNotAlreadyPlaying
_08059798:
	ldrh r2, [r4, #0x14]
	cmp r2, #0
	bne _080597C4
	ldr r0, _080597BC @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _080597C4
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	ldr r0, _080597C0 @ =gBossWork5
	strh r2, [r0]
	b _08059818
	.align 2, 0
_080597B4: .4byte gCurrentSprite
_080597B8: .4byte 0x000001E1
_080597BC: .4byte gSubSpriteData1
_080597C0: .4byte gBossWork5
_080597C4:
	ldr r2, _080597F8 @ =gBossWork5
	ldr r0, _080597FC @ =gSubSpriteData1
	ldr r3, _08059800 @ =gCurrentSprite
	ldrh r0, [r0, #0xc]
	ldrh r1, [r3, #0x14]
	subs r0, r0, r1
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xfa
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08059804
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x18
	beq _080597F2
	cmp r0, #0x1a
	beq _080597F2
	movs r0, #0x1f
	strb r0, [r1]
_080597F2:
	movs r0, #0
	strh r0, [r2]
	b _08059818
	.align 2, 0
_080597F8: .4byte gBossWork5
_080597FC: .4byte gSubSpriteData1
_08059800: .4byte gCurrentSprite
_08059804:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08059818
	ldr r0, _08059828 @ =0x000001DF
	bl SoundPlayNotAlreadyPlaying
_08059818:
	ldr r0, _0805982C @ =gSubSpriteData1
	ldr r1, _08059830 @ =gCurrentSprite
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xc]
_08059820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059828: .4byte 0x000001DF
_0805982C: .4byte gSubSpriteData1
_08059830: .4byte gCurrentSprite

	thumb_func_start RidleyWaveBeamCollsiion
RidleyWaveBeamCollsiion: @ 0x08059834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r3, _08059908 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080598F8
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080598F8
	ldrh r1, [r3, #2]
	ldrh r2, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r0, [r3, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0
_08059882:
	ldr r1, _0805990C @ =gProjectileData
	lsls r0, r7, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _080598EE
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x18]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x1a]
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r4, #0x1c]
	adds r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	ldr r3, [sp, #0x10]
	str r3, [sp]
	mov r3, sl
	str r3, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	mov r3, r8
	str r3, [sp, #0xc]
	mov r3, ip
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080598EE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
_080598EE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _08059882
_080598F8:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059908: .4byte gCurrentSprite
_0805990C: .4byte gProjectileData

	thumb_func_start RidleyCheckGrabSamusLeft
RidleyCheckGrabSamusLeft: @ 0x08059910
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _08059938 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _0805993C @ =0x083A9A2C
	cmp r2, r0
	beq _08059930
	ldr r0, _08059940 @ =0x083A9A44
	cmp r2, r0
	bne _08059944
_08059930:
	adds r0, r1, #0
	subs r0, #0x82
	b _08059948
	.align 2, 0
_08059938: .4byte gSubSpriteData1
_0805993C: .4byte 0x083A9A2C
_08059940: .4byte 0x083A9A44
_08059944:
	adds r0, r1, #0
	subs r0, #0xe6
_08059948:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _08059978 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805997C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r0, #1
	b _08059982
	.align 2, 0
_08059978: .4byte gSamusData
_0805997C: .4byte gPreviousCollisionCheck
_08059980:
	movs r0, #0
_08059982:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleyCheckGrabSamusRight
RidleyCheckGrabSamusRight: @ 0x08059988
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _080599B0 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _080599B4 @ =0x083A9A2C
	cmp r2, r0
	beq _080599A8
	ldr r0, _080599B8 @ =0x083A9A44
	cmp r2, r0
	bne _080599BC
_080599A8:
	adds r0, r1, #0
	adds r0, #0x82
	b _080599C0
	.align 2, 0
_080599B0: .4byte gSubSpriteData1
_080599B4: .4byte 0x083A9A2C
_080599B8: .4byte 0x083A9A44
_080599BC:
	adds r0, r1, #0
	adds r0, #0xe6
_080599C0:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _080599F0 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080599F4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r0, #1
	b _080599FA
	.align 2, 0
_080599F0: .4byte gSamusData
_080599F4: .4byte gPreviousCollisionCheck
_080599F8:
	movs r0, #0
_080599FA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleySamusGrabbed
RidleySamusGrabbed: @ 0x08059A00
	push {r4, lr}
	ldr r2, _08059A40 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08059A78
	ldr r3, _08059A44 @ =0x0000F7FF
	ands r3, r1
	strh r3, [r2]
	ldr r4, _08059A48 @ =gSamusData
	ldrh r0, [r2, #2]
	adds r0, #0xb4
	strh r0, [r4, #0x18]
	ldr r0, _08059A4C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _08059A50 @ =0x083A9A2C
	cmp r1, r0
	beq _08059A2E
	ldr r0, _08059A54 @ =0x083A9A44
	cmp r1, r0
	bne _08059A60
_08059A2E:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A58
	ldrh r0, [r2, #4]
	adds r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
	.align 2, 0
_08059A40: .4byte gCurrentSprite
_08059A44: .4byte 0x0000F7FF
_08059A48: .4byte gSamusData
_08059A4C: .4byte gSubSpriteData1
_08059A50: .4byte 0x083A9A2C
_08059A54: .4byte 0x083A9A44
_08059A58:
	ldrh r0, [r2, #4]
	subs r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
_08059A60:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A70
	ldrh r0, [r2, #4]
	adds r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A70:
	ldrh r0, [r2, #4]
	subs r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A78:
	adds r1, r2, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _08059A86
	movs r0, #0x1a
	strb r0, [r1]
_08059A86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySetSideHitboxes
RidleySetSideHitboxes: @ 0x08059A8C
	push {lr}
	ldr r2, _08059AA4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059AAC
	ldr r0, _08059AA8 @ =0x0000FF80
	strh r0, [r2, #0xe]
	movs r0, #0xe0
	b _08059AB2
	.align 2, 0
_08059AA4: .4byte gCurrentSprite
_08059AA8: .4byte 0x0000FF80
_08059AAC:
	ldr r0, _08059AB8 @ =0x0000FF20
	strh r0, [r2, #0xe]
	movs r0, #0x80
_08059AB2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08059AB8: .4byte 0x0000FF20

	thumb_func_start RidleyXMovement_Unused
RidleyXMovement_Unused: @ 0x08059ABC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	movs r6, #0
	ldr r1, _08059AFC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xa0
	cmp r0, #0x1b
	bne _08059AD6
	adds r2, #0x80
_08059AD6:
	ldrh r1, [r1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059B08
	ldr r4, _08059B00 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B04 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059B1E
	ldrh r0, [r4, #0xa]
	adds r0, r5, r0
	b _08059B30
	.align 2, 0
_08059AFC: .4byte gCurrentSprite
_08059B00: .4byte gSubSpriteData1
_08059B04: .4byte gPreviousCollisionCheck
_08059B08:
	ldr r4, _08059B24 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B28 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059B2C
_08059B1E:
	movs r6, #1
	b _08059B32
	.align 2, 0
_08059B24: .4byte gSubSpriteData1
_08059B28: .4byte gPreviousCollisionCheck
_08059B2C:
	ldrh r0, [r4, #0xa]
	subs r0, r0, r7
_08059B30:
	strh r0, [r4, #0xa]
_08059B32:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RidleyTailXMovement
RidleyTailXMovement: @ 0x08059B3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r8, r6
	ldr r0, _08059B84 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r5, [r0]
	movs r7, #0
	ldr r1, _08059B88 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059B94
	ldr r4, _08059B8C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059BAA
	ldrh r0, [r4, #0xa]
	adds r0, r6, r0
	b _08059BBE
	.align 2, 0
_08059B84: .4byte gCurrentSprite
_08059B88: .4byte gSpriteData
_08059B8C: .4byte gSubSpriteData1
_08059B90: .4byte gPreviousCollisionCheck
_08059B94:
	ldr r4, _08059BB0 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059BB4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059BB8
_08059BAA:
	movs r7, #1
	b _08059BC4
	.align 2, 0
_08059BB0: .4byte gSubSpriteData1
_08059BB4: .4byte gPreviousCollisionCheck
_08059BB8:
	ldrh r0, [r4, #0xa]
	mov r1, r8
	subs r0, r0, r1
_08059BBE:
	strh r0, [r4, #0xa]
	cmp r7, #0
	beq _08059BDA
_08059BC4:
	ldr r1, _08059BE8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_08059BDA:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08059BE8: .4byte gSpriteData

	thumb_func_start RidleyScreamingInit
RidleyScreamingInit: @ 0x08059BEC
	push {r4, r5, lr}
	ldr r1, _08059C3C @ =gSubSpriteData1
	ldr r0, _08059C40 @ =0x083A9A14
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r4, _08059C44 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	bne _08059C20
	ldr r1, _08059C48 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08059C4C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
_08059C20:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C50
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0x3c
	strb r0, [r1]
	movs r0, #0xef
	lsls r0, r0, #1
	bl SoundPlay
	b _08059C64
	.align 2, 0
_08059C3C: .4byte gSubSpriteData1
_08059C40: .4byte 0x083A9A14
_08059C44: .4byte gCurrentSprite
_08059C48: .4byte sSamusSetPoseFunctionPointer
_08059C4C: .4byte gSamusData
_08059C50:
	movs r0, #0
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xb4
	strb r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #1
	bl SoundPlay_3b1c
_08059C64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyScreaming
RidleyScreaming: @ 0x08059C6C
	push {r4, r5, lr}
	ldr r4, _08059C94 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08059CCC
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C98
	bl RidleyUpdateClawOam
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08059E32
	.align 2, 0
_08059C94: .4byte gCurrentSprite
_08059C98:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r2
	adds r1, r4, #0
	adds r1, #0x2c
	strb r2, [r1]
	subs r1, #0xc
	strb r2, [r1]
	movs r1, #0x2c
	strh r1, [r4, #6]
	ldr r1, _08059CC8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	b _08059E32
	.align 2, 0
_08059CC8: .4byte 0x0000FFFB
_08059CCC:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059CE2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _08059CDC
	b _08059E32
_08059CDC:
	bl RidleyFloatingMovement
	b _08059E32
_08059CE2:
	ldr r0, _08059D04 @ =gSubSpriteData1
	ldrh r4, [r0, #8]
	ldrh r5, [r0, #0xa]
	ldrb r0, [r2]
	cmp r0, #0x40
	beq _08059DB0
	cmp r0, #0x40
	bgt _08059D12
	cmp r0, #0x10
	bne _08059CF8
	b _08059DFC
_08059CF8:
	cmp r0, #0x10
	bgt _08059D08
	cmp r0, #0
	bne _08059D02
	b _08059E18
_08059D02:
	b _08059E32
	.align 2, 0
_08059D04: .4byte gSubSpriteData1
_08059D08:
	cmp r0, #0x20
	beq _08059DE4
	cmp r0, #0x30
	beq _08059DC8
	b _08059E32
_08059D12:
	cmp r0, #0x70
	beq _08059D5E
	cmp r0, #0x70
	bgt _08059D24
	cmp r0, #0x50
	beq _08059D94
	cmp r0, #0x60
	beq _08059D7C
	b _08059E32
_08059D24:
	cmp r0, #0x80
	beq _08059D46
	cmp r0, #0x90
	beq _08059D2E
	b _08059E32
_08059D2E:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1a
	b _08059D74
_08059D46:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x34
	b _08059DDC
_08059D5E:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x4c
_08059D74:
	movs r2, #0x25
	bl ParticleSet
	b _08059E32
_08059D7C:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x58
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x20
	b _08059E10
_08059D94:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	subs r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
	b _08059E32
_08059DB0:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _08059DDC
_08059DC8:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1c
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x46
	adds r1, r5, #0
_08059DDC:
	movs r2, #0x22
	bl ParticleSet
	b _08059E32
_08059DE4:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x58
	b _08059E10
_08059DFC:
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0x4c
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
_08059E10:
	movs r2, #0x2f
	bl ParticleSet
	b _08059E32
_08059E18:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
_08059E32:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start RidleyTurningIntoCoreX
RidleyTurningIntoCoreX: @ 0x08059E38
	push {lr}
	ldr r2, _08059E74 @ =gWrittenToMosaic_H
	ldr r1, _08059E78 @ =sXParasiteMosaicValues
	ldr r3, _08059E7C @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08059E62
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x49
	strb r0, [r3, #0x1d]
_08059E62:
	ldrh r0, [r3, #6]
	cmp r0, #0x13
	bhi _08059E80
	adds r2, r0, #0
	movs r0, #0x49
	movs r1, #0
	bl SpriteLoadGfx
	b _08059E8E
	.align 2, 0
_08059E74: .4byte gWrittenToMosaic_H
_08059E78: .4byte sXParasiteMosaicValues
_08059E7C: .4byte gCurrentSprite
_08059E80:
	cmp r0, #0x14
	bne _08059E8E
	movs r0, #0x49
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_08059E8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyForming
RidleyForming: @ 0x08059E94
	push {r4, r5, lr}
	ldr r3, _08059ED0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08059ED4 @ =gSubSpriteData1
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08059EE0
	ldr r2, _08059ED8 @ =gWrittenToMosaic_H
	ldr r1, _08059EDC @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08059EFA
	.align 2, 0
_08059ED0: .4byte gCurrentSprite
_08059ED4: .4byte gSubSpriteData1
_08059ED8: .4byte gWrittenToMosaic_H
_08059EDC: .4byte sXParasiteMosaicValues
_08059EE0:
	ldrh r1, [r3]
	ldr r0, _08059F00 @ =0x00007FDF
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08059F04 @ =0x083A9A5C
	str r0, [r4]
	strb r2, [r4, #6]
	strh r5, [r4, #4]
_08059EFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059F00: .4byte 0x00007FDF
_08059F04: .4byte 0x083A9A5C

	thumb_func_start RidleyScreamingAfterSpawn
RidleyScreamingAfterSpawn: @ 0x08059F08
	push {lr}
	ldr r1, _08059F70 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #4
	bne _08059F1E
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _08059F1E
	ldr r0, _08059F74 @ =0x000001DD
	bl SoundPlay
_08059F1E:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _08059F6A
	ldr r2, _08059F78 @ =gSubSpriteData1
	ldr r0, _08059F7C @ =0x083A996C
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	movs r3, #0
	strh r0, [r2, #4]
	ldr r0, _08059F70 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	ldrh r0, [r2, #8]
	subs r0, #0xe0
	strh r0, [r2, #8]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0xe0
	strh r0, [r1, #2]
	adds r1, #0x27
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08059F80 @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0xa0
	strh r0, [r1, #0xc]
_08059F6A:
	pop {r0}
	bx r0
	.align 2, 0
_08059F70: .4byte gCurrentSprite
_08059F74: .4byte 0x000001DD
_08059F78: .4byte gSubSpriteData1
_08059F7C: .4byte 0x083A996C
_08059F80: .4byte 0x0000FFA0

	thumb_func_start RidleyRisingAfterSpawn
RidleyRisingAfterSpawn: @ 0x08059F84
	push {r4, r5, r6, r7, lr}
	ldr r5, _08059FB8 @ =gSubSpriteData1
	ldrh r3, [r5, #8]
	ldr r0, _08059FBC @ =0x0000027F
	cmp r3, r0
	bls _08059FD8
	ldr r0, _08059FC0 @ =gCurrentSprite
	adds r0, #0x31
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08059FC4 @ =0x083A9F9C
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08059FC8 @ =0x00007FFF
	cmp r1, r0
	bne _08059FCC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r5, #8]
	b _0805A014
	.align 2, 0
_08059FB8: .4byte gSubSpriteData1
_08059FBC: .4byte 0x0000027F
_08059FC0: .4byte gCurrentSprite
_08059FC4: .4byte 0x083A9F9C
_08059FC8: .4byte 0x00007FFF
_08059FCC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	adds r0, r3, r4
	strh r0, [r5, #8]
	b _0805A014
_08059FD8:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805A014
	bl RidleyUpdateClawOam
	ldr r3, _0805A01C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0805A020 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
_0805A014:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A01C: .4byte gCurrentSprite
_0805A020: .4byte gSpriteRandomNumber

	thumb_func_start RidleyInit
RidleyInit: @ 0x0805A024
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0805A1B0 @ =gBossWork1
	movs r0, #0
	strb r0, [r1]
	ldr r7, _0805A1B4 @ =gCurrentSprite
	ldrh r1, [r7]
	ldr r2, _0805A1B8 @ =0x00008240
	adds r0, r2, #0
	movs r6, #0
	movs r5, #0
	orrs r0, r1
	strh r0, [r7]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	movs r4, #2
	strb r4, [r0]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x29
	movs r0, #0x50
	strb r0, [r2]
	ldr r0, _0805A1BC @ =0x0000FEC0
	strh r0, [r7, #0xa]
	strh r1, [r7, #0xc]
	bl RidleySetSideHitboxes
	strb r4, [r7, #0x1e]
	ldr r2, _0805A1C0 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	ldr r4, _0805A1C4 @ =gSubSpriteData1
	strh r0, [r4, #0xc]
	ldr r0, _0805A1C8 @ =gBossWork5
	strh r5, [r0]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r1, [r7]
	ldr r0, _0805A1CC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	ldr r0, _0805A1D0 @ =0x083A9A5C
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	strb r6, [r4, #0xe]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #3
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1B0: .4byte gBossWork1
_0805A1B4: .4byte gCurrentSprite
_0805A1B8: .4byte 0x00008240
_0805A1BC: .4byte 0x0000FEC0
_0805A1C0: .4byte sPrimarySpriteStats
_0805A1C4: .4byte gSubSpriteData1
_0805A1C8: .4byte gBossWork5
_0805A1CC: .4byte 0x0000FFFB
_0805A1D0: .4byte 0x083A9A5C

	thumb_func_start RidleyIdleInit
RidleyIdleInit: @ 0x0805A1D4
	push {lr}
	bl RidleyUpdateClawOam
	ldr r3, _0805A21C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0805A220 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0805A216
	movs r0, #0x1a
	strb r0, [r1]
_0805A216:
	pop {r0}
	bx r0
	.align 2, 0
_0805A21C: .4byte gCurrentSprite
_0805A220: .4byte gSpriteRandomNumber

	thumb_func_start RidleyIdle
RidleyIdle: @ 0x0805A224
	push {r4, r5, lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r4, _0805A258 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805A25C
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A26E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A260
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A258: .4byte gCurrentSprite
_0805A25C:
	subs r0, #1
	strb r0, [r1]
_0805A260:
	ldr r0, _0805A278 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0x1b
	bne _0805A280
_0805A26E:
	ldr r0, _0805A27C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r5, _0805A278 @ =gCurrentSprite
	b _0805A284
	.align 2, 0
_0805A278: .4byte gCurrentSprite
_0805A27C: .4byte gXParasiteTargetXPosition
_0805A280:
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r2, [r0, #0x16]
_0805A284:
	adds r4, r5, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A304
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A2F0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A2E4 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A2E8 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bhi _0805A36E
	ldr r0, _0805A2EC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A2E0: .4byte gSamusData
_0805A2E4: .4byte gSubSpriteData1
_0805A2E8: .4byte gBg1XPosition
_0805A2EC: .4byte gSpriteRandomNumber
_0805A2F0:
	ldr r0, _0805A300 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bhs _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A300: .4byte gSubSpriteData1
_0805A304:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A324
	ldr r0, _0805A320 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bls _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A320: .4byte gSubSpriteData1
_0805A324:
	adds r4, r5, #0
	adds r4, #0x25
	ldrb r0, [r4]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A374 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A378 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r5, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A37C @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x8c
	bls _0805A36E
	ldr r0, _0805A380 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r4]
	adds r1, r5, #0
_0805A368:
	adds r1, #0x24
	movs r0, #0x2f
_0805A36C:
	strb r0, [r1]
_0805A36E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte gSamusData
_0805A378: .4byte gSubSpriteData1
_0805A37C: .4byte gBg1XPosition
_0805A380: .4byte gSpriteRandomNumber

	thumb_func_start RidleyTurningAroundInit
RidleyTurningAroundInit: @ 0x0805A384
	ldr r1, _0805A39C @ =gSubSpriteData1
	ldr r0, _0805A3A0 @ =0x083A9A2C
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A3A4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A39C: .4byte gSubSpriteData1
_0805A3A0: .4byte 0x083A9A2C
_0805A3A4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAround
RidleyTurningAround: @ 0x0805A3A8
	push {lr}
	bl RidleyFloatingMovement
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805A3D8
	ldr r1, _0805A3DC @ =gSubSpriteData1
	ldr r0, _0805A3E0 @ =0x083A9A44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r2, _0805A3E4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	bl RidleySetSideHitboxes
_0805A3D8:
	pop {r0}
	bx r0
	.align 2, 0
_0805A3DC: .4byte gSubSpriteData1
_0805A3E0: .4byte 0x083A9A44
_0805A3E4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAroundSecondPart
RidleyTurningAroundSecondPart: @ 0x0805A3E8
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805A406
	bl RidleyUpdateClawOam
	ldr r0, _0805A40C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
_0805A406:
	pop {r0}
	bx r0
	.align 2, 0
_0805A40C: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwardsInit
RidleyFlyingBackwardsInit: @ 0x0805A410
	ldr r0, _0805A420 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #0xa
	strb r2, [r1]
	adds r0, #0x2b
	strb r2, [r0]
	bx lr
	.align 2, 0
_0805A420: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwards
RidleyFlyingBackwards: @ 0x0805A424
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r1, _0805A44C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A446
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0805A446:
	pop {r0}
	bx r0
	.align 2, 0
_0805A44C: .4byte gCurrentSprite

	thumb_func_start RidleyPreparingTailAttack
RidleyPreparingTailAttack: @ 0x0805A450
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailAttack
RidleyTailAttack: @ 0x0805A45C
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyShootingFireInit
RidleyShootingFireInit: @ 0x0805A468
	ldr r1, _0805A480 @ =gSubSpriteData1
	ldr r0, _0805A484 @ =0x083A9994
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A488 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A480: .4byte gSubSpriteData1
_0805A484: .4byte 0x083A9994
_0805A488: .4byte gCurrentSprite

	thumb_func_start RidleyShootingFire
RidleyShootingFire: @ 0x0805A48C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl RidleyFloatingMovement
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805A4EE
	ldr r2, _0805A4B8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A4C4
	ldr r0, _0805A4BC @ =gSamusData
	ldr r1, _0805A4C0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	blo _0805A4D0
	b _0805A4E4
	.align 2, 0
_0805A4B8: .4byte gCurrentSprite
_0805A4BC: .4byte gSamusData
_0805A4C0: .4byte gSubSpriteData1
_0805A4C4:
	ldr r0, _0805A4DC @ =gSamusData
	ldr r1, _0805A4E0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bls _0805A4E4
_0805A4D0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0805A58E
	.align 2, 0
_0805A4DC: .4byte gSamusData
_0805A4E0: .4byte gSubSpriteData1
_0805A4E4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0805A58E
_0805A4EE:
	ldr r2, _0805A508 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0805A50C
	movs r6, #0x80
	lsls r6, r6, #2
	ldrh r0, [r5, #4]
	adds r0, #0xa0
	b _0805A512
	.align 2, 0
_0805A508: .4byte gCurrentSprite
_0805A50C:
	movs r6, #0
	ldrh r0, [r5, #4]
	subs r0, #0xa0
_0805A512:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r3, r5, #0
	ldrh r0, [r3, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r7, r1, #0
	ldr r2, _0805A550 @ =gSubSpriteData1
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0805A58E
	ldrh r0, [r2, #4]
	cmp r0, #3
	bne _0805A558
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #0
	bl SpriteSpawnSecondary
	ldr r0, _0805A554 @ =0x000001E3
	bl SoundPlay
	b _0805A58E
	.align 2, 0
_0805A550: .4byte gSubSpriteData1
_0805A554: .4byte 0x000001E3
_0805A558:
	cmp r0, #7
	bne _0805A574
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0805A58E
_0805A574:
	cmp r0, #0xb
	bne _0805A58E
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #4
	bl SpriteSpawnSecondary
_0805A58E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartInit
RidleyPartInit: @ 0x0805A598
	push {r4, lr}
	ldr r2, _0805A5CC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805A5D0 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r2]
	ldr r0, _0805A5D4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r3, #3
	adds r0, r3, #0
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	ldrb r1, [r2, #0x1e]
	cmp r1, #1
	beq _0805A5F4
	cmp r1, #1
	bgt _0805A5D8
	cmp r1, #0
	beq _0805A5DE
	b _0805A658
	.align 2, 0
_0805A5CC: .4byte gCurrentSprite
_0805A5D0: .4byte 0x0000FFFB
_0805A5D4: .4byte gIoRegisters
_0805A5D8:
	cmp r1, #3
	beq _0805A624
	b _0805A658
_0805A5DE:
	adds r0, r2, #0
	adds r0, #0x22
	strb r3, [r0]
	adds r0, #5
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _0805A640
_0805A5F4:
	adds r0, r2, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805A620 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	b _0805A65A
	.align 2, 0
_0805A620: .4byte 0x0000FFFC
_0805A624:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
_0805A640:
	ldr r1, _0805A654 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	b _0805A65C
	.align 2, 0
_0805A654: .4byte 0x0000FFFC
_0805A658:
	movs r0, #0
_0805A65A:
	strh r0, [r2]
_0805A65C:
	bl RidleySyncSubSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartidle
RidleyPartidle: @ 0x0805A668
	push {lr}
	ldr r2, _0805A69C @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	ldr r1, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xf0
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	bne _0805A6A0
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #0
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x27
	movs r1, #0x40
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x28
	b _0805A6B2
	.align 2, 0
_0805A69C: .4byte gCurrentSprite
_0805A6A0:
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xe
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x38
_0805A6B2:
	strb r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartInit
RidleyTailPartInit: @ 0x0805A6B8
	push {r4, r5, r6, lr}
	ldr r3, _0805A73C @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r4, _0805A740 @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r6, #0
	strh r4, [r3]
	ldr r0, _0805A744 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
	ldrb r1, [r3, #0x1e]
	adds r0, r1, #4
	subs r2, #0x12
	strb r0, [r2]
	adds r2, #3
	movs r0, #0x18
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bne _0805A754
	ldr r0, _0805A748 @ =gSubSpriteData2
	ldr r1, _0805A74C @ =0x083A9B1C
	str r1, [r0]
	strb r5, [r0, #6]
	strh r6, [r0, #4]
	movs r1, #8
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r5, [r0]
	strh r6, [r3, #6]
	ldr r1, _0805A750 @ =0x0000FFE4
	strh r1, [r3, #0xa]
	movs r0, #0x1c
	b _0805A75A
	.align 2, 0
_0805A73C: .4byte gCurrentSprite
_0805A740: .4byte 0x0000FFFB
_0805A744: .4byte gIoRegisters
_0805A748: .4byte gSubSpriteData2
_0805A74C: .4byte 0x083A9B1C
_0805A750: .4byte 0x0000FFE4
_0805A754:
	ldr r1, _0805A768 @ =0x0000FFEC
	strh r1, [r3, #0xa]
	movs r0, #0x14
_0805A75A:
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A768: .4byte 0x0000FFEC

	thumb_func_start RidleyTailPartHandleRotation
RidleyTailPartHandleRotation: @ 0x0805A76C
	push {r4, lr}
	ldr r1, _0805A790 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0805A79C
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0xe0
	bne _0805A798
	ldr r0, _0805A794 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r1]
	b _0805A7B2
	.align 2, 0
_0805A790: .4byte gCurrentSprite
_0805A794: .4byte 0x0000FBFF
_0805A798:
	subs r0, #1
	b _0805A7B0
_0805A79C:
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0x20
	bne _0805A7AE
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r1]
	b _0805A7B2
_0805A7AE:
	adds r0, #1
_0805A7B0:
	strb r0, [r3]
_0805A7B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartIdle
RidleyTailPartIdle: @ 0x0805A7B8
	push {r4, lr}
	ldr r0, _0805A818 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r4, [r0]
	bl RidleyTailPartHandleRotation
	ldr r0, _0805A81C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805A820 @ =0x083A9A14
	cmp r1, r0
	beq _0805A7E2
	ldr r2, _0805A824 @ =gSubSpriteData2
	ldr r1, [r2]
	ldr r0, _0805A828 @ =0x083A9B9C
	cmp r1, r0
	bne _0805A7E2
	ldr r0, _0805A82C @ =0x083A9B1C
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	strh r0, [r2, #4]
_0805A7E2:
	ldr r0, _0805A830 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x29
	bne _0805A810
	ldr r2, _0805A818 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r1]
	ldr r1, _0805A824 @ =gSubSpriteData2
	ldr r0, _0805A834 @ =0x083A9C1C
	str r0, [r1]
	strb r3, [r1, #6]
	movs r0, #0
	strh r3, [r1, #4]
	adds r2, #0x2b
	strb r0, [r2]
_0805A810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A818: .4byte gCurrentSprite
_0805A81C: .4byte gSubSpriteData1
_0805A820: .4byte 0x083A9A14
_0805A824: .4byte gSubSpriteData2
_0805A828: .4byte 0x083A9B9C
_0805A82C: .4byte 0x083A9B1C
_0805A830: .4byte gSpriteData
_0805A834: .4byte 0x083A9C1C

	thumb_func_start RidleyTailPartWaitingTOWindUp
RidleyTailPartWaitingTOWindUp: @ 0x0805A838
	push {lr}
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805A856
	ldr r1, _0805A85C @ =gSubSpriteData2
	ldr r0, _0805A860 @ =0x083A9C74
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A864 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3a
	strb r1, [r0]
_0805A856:
	pop {r0}
	bx r0
	.align 2, 0
_0805A85C: .4byte gSubSpriteData2
_0805A860: .4byte 0x083A9C74
_0805A864: .4byte gCurrentSprite

	thumb_func_start RidleyTailPartWindingUp1
RidleyTailPartWindingUp1: @ 0x0805A868
	push {r4, lr}
	ldr r4, _0805A8BC @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805A8C0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A8C4 @ =0x00010003
	cmp r0, r1
	bne _0805A87E
	ldr r0, _0805A8C8 @ =0x000001E5
	bl SoundPlay
_0805A87E:
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805A8A6
	ldr r0, _0805A8CC @ =0x083A9CDC
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r1, _0805A8D0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3c
	strb r0, [r2]
	ldr r0, _0805A8D4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #1
	adds r0, #2
	adds r1, #0x2e
	strb r0, [r1]
_0805A8A6:
	ldr r2, _0805A8D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805A8DC @ =0x0000027F
	cmp r1, r0
	bls _0805A8B4
	subs r0, r1, #2
	strh r0, [r2, #8]
_0805A8B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8BC: .4byte gSubSpriteData2
_0805A8C0: .4byte 0x00FFFFFF
_0805A8C4: .4byte 0x00010003
_0805A8C8: .4byte 0x000001E5
_0805A8CC: .4byte 0x083A9CDC
_0805A8D0: .4byte gCurrentSprite
_0805A8D4: .4byte gSpriteRandomNumber
_0805A8D8: .4byte gSubSpriteData1
_0805A8DC: .4byte 0x0000027F

	thumb_func_start RidleyTailPartWindingUp2
RidleyTailPartWindingUp2: @ 0x0805A8E0
	push {r4, r5, r6, lr}
	ldr r0, _0805A940 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805A944 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A948 @ =0x00010003
	cmp r0, r1
	bne _0805A8F6
	ldr r0, _0805A94C @ =0x000001E5
	bl SoundPlay
_0805A8F6:
	ldr r5, _0805A950 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	movs r6, #0
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	bne _0805A90A
	b _0805A9FC
_0805A90A:
	ldr r1, _0805A954 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x19
	strb r0, [r1]
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0805A970
	ldr r0, _0805A958 @ =gSubSpriteData1
	ldr r1, _0805A95C @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A964
	ldr r0, _0805A960 @ =0x0000FDFF
	ands r0, r2
	b _0805A998
	.align 2, 0
_0805A940: .4byte gSubSpriteData2
_0805A944: .4byte 0x00FFFFFF
_0805A948: .4byte 0x00010003
_0805A94C: .4byte 0x000001E5
_0805A950: .4byte gCurrentSprite
_0805A954: .4byte gSpriteData
_0805A958: .4byte gSubSpriteData1
_0805A95C: .4byte gSamusData
_0805A960: .4byte 0x0000FDFF
_0805A964:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
	b _0805A99E
_0805A970:
	ldr r0, _0805A984 @ =gSubSpriteData1
	ldr r1, _0805A988 @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A990
	ldr r0, _0805A98C @ =0x0000FDFF
	ands r0, r2
	strh r0, [r3]
	b _0805A99E
	.align 2, 0
_0805A984: .4byte gSubSpriteData1
_0805A988: .4byte gSamusData
_0805A98C: .4byte 0x0000FDFF
_0805A990:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
_0805A998:
	strh r0, [r3]
	cmp r6, #0
	beq _0805A9C0
_0805A99E:
	ldr r1, _0805A9B4 @ =gSubSpriteData2
	ldr r0, _0805A9B8 @ =0x083A9D44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A9BC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x44
	strb r1, [r0]
	b _0805A9FC
	.align 2, 0
_0805A9B4: .4byte gSubSpriteData2
_0805A9B8: .4byte 0x083A9D44
_0805A9BC: .4byte gCurrentSprite
_0805A9C0:
	ldr r0, _0805A9E8 @ =gSubSpriteData2
	ldr r1, _0805A9EC @ =0x083A9DF4
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	ldr r2, _0805A9F0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A9F4
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0xe0
	b _0805A9FA
	.align 2, 0
_0805A9E8: .4byte gSubSpriteData2
_0805A9EC: .4byte 0x083A9DF4
_0805A9F0: .4byte gCurrentSprite
_0805A9F4:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0x20
_0805A9FA:
	strb r0, [r1]
_0805A9FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailPartStrikingDown1
RidleyTailPartStrikingDown1: @ 0x0805AA04
	push {r4, lr}
	ldr r4, _0805AA38 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805AA3C @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805AA40 @ =0x00010003
	cmp r0, r1
	bne _0805AA1A
	ldr r0, _0805AA44 @ =0x000001E7
	bl SoundPlay
_0805AA1A:
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805AA50
	ldr r0, _0805AA48 @ =0x083A9E64
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r0, _0805AA4C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x40
	strb r1, [r0]
	b _0805AA78
	.align 2, 0
_0805AA38: .4byte gSubSpriteData2
_0805AA3C: .4byte 0x00FFFFFF
_0805AA40: .4byte 0x00010003
_0805AA44: .4byte 0x000001E7
_0805AA48: .4byte 0x083A9E64
_0805AA4C: .4byte gCurrentSprite
_0805AA50:
	ldrh r0, [r4, #4]
	cmp r0, #7
	bhi _0805AA5E
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AA6E
_0805AA5E:
	ldr r2, _0805AA80 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AA84 @ =0x0000027F
	cmp r1, r0
	bls _0805AA6E
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AA6E:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AA78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA80: .4byte gSubSpriteData1
_0805AA84: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown2
RidleyTailPartStrikingDown2: @ 0x0805AA88
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805AB10 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805AB14 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805AAA0
	ldr r0, _0805AB18 @ =0x000001E7
	bl SoundPlay
_0805AAA0:
	movs r5, #0
	ldr r6, _0805AB1C @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805AB5C
	ldr r0, _0805AB20 @ =gSamusData
	ldr r1, _0805AB24 @ =gSubSpriteData1
	ldrh r2, [r0, #0x18]
	adds r7, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #8]
	cmp r2, r0
	blo _0805AAD4
	ldr r0, _0805AB28 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AADC
_0805AAD4:
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AADC:
	ldr r1, _0805AB1C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #0
	beq _0805AB34
	ldr r1, _0805AB28 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AB2C
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bls _0805AB3A
	b _0805AB34
	.align 2, 0
_0805AB10: .4byte gSubSpriteData2
_0805AB14: .4byte 0x00FFFFFF
_0805AB18: .4byte 0x000001E7
_0805AB1C: .4byte gCurrentSprite
_0805AB20: .4byte gSamusData
_0805AB24: .4byte gSubSpriteData1
_0805AB28: .4byte gSpriteData
_0805AB2C:
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bhs _0805AB3A
_0805AB34:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0805AB3A:
	cmp r5, #0
	beq _0805AB5C
	ldr r1, _0805AB54 @ =gSubSpriteData2
	ldr r0, _0805AB58 @ =0x083A9EBC
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	b _0805AB8A
	.align 2, 0
_0805AB54: .4byte gSubSpriteData2
_0805AB58: .4byte 0x083A9EBC
_0805AB5C:
	ldr r0, _0805AB6C @ =gSubSpriteData2
	ldrh r0, [r0, #4]
	cmp r0, #4
	bhi _0805AB70
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AB80
	.align 2, 0
_0805AB6C: .4byte gSubSpriteData2
_0805AB70:
	ldr r2, _0805AB90 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AB94 @ =0x0000027F
	cmp r1, r0
	bls _0805AB80
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AB80:
	movs r0, #4
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AB8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB90: .4byte gSubSpriteData1
_0805AB94: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown3
RidleyTailPartStrikingDown3: @ 0x0805AB98
	push {r4, lr}
	ldr r4, _0805ABD8 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805ABDC @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805ABB0
	ldr r0, _0805ABE0 @ =0x000001E7
	bl SoundPlay
_0805ABB0:
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805AC08
	ldr r2, _0805ABE4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	cmp r1, #0
	beq _0805ABEC
	ldr r0, _0805ABE8 @ =0x083A9CDC
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805ABD8: .4byte gSubSpriteData2
_0805ABDC: .4byte 0x00FFFFFF
_0805ABE0: .4byte 0x000001E7
_0805ABE4: .4byte gCurrentSprite
_0805ABE8: .4byte 0x083A9CDC
_0805ABEC:
	ldr r0, _0805AC04 @ =0x083A9F44
	str r0, [r4]
	strb r1, [r4, #6]
	strh r1, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805AC04: .4byte 0x083A9F44
_0805AC08:
	ldrh r0, [r4, #4]
	cmp r0, #4
	bhi _0805AC16
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AC26
_0805AC16:
	ldr r2, _0805AC38 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AC3C @ =0x0000027F
	cmp r1, r0
	bls _0805AC26
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AC26:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AC30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AC38: .4byte gSubSpriteData1
_0805AC3C: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingForward
RidleyTailPartStrikingForward: @ 0x0805AC40
	push {r4, r5, r6, lr}
	ldr r6, _0805ACBC @ =gSubSpriteData2
	ldr r0, [r6, #4]
	ldr r1, _0805ACC0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805ACC4 @ =0x00010003
	cmp r0, r1
	bne _0805AC58
	movs r0, #0xf3
	lsls r0, r0, #1
	bl SoundPlay
_0805AC58:
	ldr r5, _0805ACC8 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805ACF8
	ldr r0, _0805ACCC @ =gSamusData
	ldr r1, _0805ACD0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x18]
	ldrh r1, [r1, #8]
	cmp r0, r1
	blo _0805AC86
	ldr r0, _0805ACD4 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AC8E
_0805AC86:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AC8E:
	ldr r2, _0805ACC8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805ACDC
	ldr r0, _0805ACBC @ =gSubSpriteData2
	ldr r1, _0805ACD8 @ =0x083A9F44
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACBC: .4byte gSubSpriteData2
_0805ACC0: .4byte 0x00FFFFFF
_0805ACC4: .4byte 0x00010003
_0805ACC8: .4byte gCurrentSprite
_0805ACCC: .4byte gSamusData
_0805ACD0: .4byte gSubSpriteData1
_0805ACD4: .4byte gSpriteData
_0805ACD8: .4byte 0x083A9F44
_0805ACDC:
	ldr r0, _0805ACF0 @ =gSubSpriteData2
	ldr r1, _0805ACF4 @ =0x083A9CDC
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACF0: .4byte gSubSpriteData2
_0805ACF4: .4byte 0x083A9CDC
_0805ACF8:
	ldrh r0, [r6, #4]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0805AD28
	ldr r1, _0805AD1C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805AD24
	ldr r0, _0805AD20 @ =0x083AF4B8
	b _0805AD26
	.align 2, 0
_0805AD1C: .4byte gSpriteData
_0805AD20: .4byte 0x083AF4B8
_0805AD24:
	ldr r0, _0805AD3C @ =0x083AF800
_0805AD26:
	str r0, [r5, #0x18]
_0805AD28:
	movs r0, #4
	bl RidleyTailStrikeYMovement
	movs r0, #1
	bl RidleyTailXMovement
_0805AD34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD3C: .4byte 0x083AF800

	thumb_func_start RidleyTailPartDoneStriking
RidleyTailPartDoneStriking: @ 0x0805AD40
	push {r4, r5, r6, lr}
	ldr r6, _0805ADB0 @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilHasSubSprite2AnimationEnded
	cmp r0, #0
	beq _0805ADCA
	ldr r1, _0805ADB4 @ =gSubSpriteData2
	ldr r0, _0805ADB8 @ =0x083A9B1C
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r5, #0
	strh r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x24
	movs r2, #2
	strb r2, [r0]
	ldr r1, _0805ADBC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xb
	strb r5, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r5, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0805ADC0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805ADC4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	b _0805ADC8
	.align 2, 0
_0805ADB0: .4byte gCurrentSprite
_0805ADB4: .4byte gSubSpriteData2
_0805ADB8: .4byte 0x083A9B1C
_0805ADBC: .4byte gSpriteData
_0805ADC0: .4byte gSpriteRandomNumber
_0805ADC4:
	ldr r0, _0805ADD0 @ =0x0000FDFF
	ands r0, r1
_0805ADC8:
	strh r0, [r3]
_0805ADCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADD0: .4byte 0x0000FDFF

	thumb_func_start RidleyFireInit
RidleyFireInit: @ 0x0805ADD4
	push {r4, r5, r6, lr}
	ldr r0, _0805AE68 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r4, _0805AE6C @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r3, #0
	movs r0, #0x80
	orrs r4, r0
	orrs r4, r5
	mov r1, ip
	strh r4, [r1]
	ldr r0, _0805AE70 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r0, #5
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805AE74 @ =0x0000FFE0
	mov r6, ip
	strh r1, [r6, #0xa]
	movs r0, #0x20
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _0805AE78 @ =0x083AF7F0
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r3, [r6, #0x16]
	mov r0, ip
	adds r0, #0x2b
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x12]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x30
	strb r5, [r0]
	subs r0, #0xc
	strb r2, [r0]
	subs r1, #9
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805AE7C @ =gSamusData
	ldrh r0, [r6, #2]
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	bhs _0805AE60
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
	strh r4, [r6]
_0805AE60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE68: .4byte gCurrentSprite
_0805AE6C: .4byte 0x0000FFFB
_0805AE70: .4byte gIoRegisters
_0805AE74: .4byte 0x0000FFE0
_0805AE78: .4byte 0x083AF7F0
_0805AE7C: .4byte gSamusData

	thumb_func_start RidleyFireMoving
RidleyFireMoving: @ 0x0805AE80
	push {r4, lr}
	ldr r3, _0805AEA8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _0805AEAC
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _0805AEB0
	.align 2, 0
_0805AEA8: .4byte gCurrentSprite
_0805AEAC:
	ldrh r0, [r2, #4]
	subs r0, r0, r4
_0805AEB0:
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AED0
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AED8
_0805AED0:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AED8:
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805AF06
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	strb r3, [r4]
	adds r0, #1
	strb r1, [r0]
_0805AF06:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyFireMovingTowardsSamus
RidleyFireMovingTowardsSamus: @ 0x0805AF0C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0805AF60 @ =gCurrentSprite
	ldrb r0, [r0, #0x1e]
	movs r2, #8
	cmp r0, #4
	beq _0805AF2E
	movs r2, #0x28
	cmp r0, #3
	beq _0805AF2E
	movs r2, #0x48
	cmp r0, #2
	beq _0805AF2E
	movs r2, #0x82
	cmp r0, #1
	bne _0805AF2E
	movs r2, #0x68
_0805AF2E:
	ldr r1, _0805AF64 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0x20
	movs r3, #0x28
	bl SpriteUtilMoveRidleyFireball
	ldr r2, _0805AF60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AF68
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AF70
	.align 2, 0
_0805AF60: .4byte gCurrentSprite
_0805AF64: .4byte gSamusData
_0805AF68:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AF70:
	strb r0, [r1]
	ldr r4, _0805AF94 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805AF98 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805AF8C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_0805AF8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF94: .4byte gCurrentSprite
_0805AF98: .4byte gPreviousCollisionCheck

	thumb_func_start RidleyFireExploding
RidleyFireExploding: @ 0x0805AF9C
	push {lr}
	ldr r1, _0805AFBC @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0xf2
	lsls r0, r0, #1
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805AFBC: .4byte gCurrentSprite

	thumb_func_start Ridley
Ridley: @ 0x0805AFC0
	push {lr}
	bl RidleyWaveBeamCollsiion
	bl RidleySamusGrabbed
	bl RidleyUpdateHealthThreshold
	ldr r0, _0805AFE8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x59
	bls _0805AFDC
	b _0805B1B8
_0805AFDC:
	lsls r0, r0, #2
	ldr r1, _0805AFEC @ =_0805AFF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AFE8: .4byte gCurrentSprite
_0805AFEC: .4byte _0805AFF0
_0805AFF0: @ jump table
	.4byte _0805B180 @ case 0
	.4byte _0805B184 @ case 1
	.4byte _0805B194 @ case 2
	.4byte _0805B198 @ case 3
	.4byte _0805B19E @ case 4
	.4byte _0805B1B8 @ case 5
	.4byte _0805B1B8 @ case 6
	.4byte _0805B1B8 @ case 7
	.4byte _0805B18A @ case 8
	.4byte _0805B18E @ case 9
	.4byte _0805B1B8 @ case 10
	.4byte _0805B1B8 @ case 11
	.4byte _0805B1B8 @ case 12
	.4byte _0805B1B8 @ case 13
	.4byte _0805B1B8 @ case 14
	.4byte _0805B1B8 @ case 15
	.4byte _0805B1B8 @ case 16
	.4byte _0805B1B8 @ case 17
	.4byte _0805B1B8 @ case 18
	.4byte _0805B1B8 @ case 19
	.4byte _0805B1B8 @ case 20
	.4byte _0805B1B8 @ case 21
	.4byte _0805B1B8 @ case 22
	.4byte _0805B164 @ case 23
	.4byte _0805B1B8 @ case 24
	.4byte _0805B16A @ case 25
	.4byte _0805B1B8 @ case 26
	.4byte _0805B1B8 @ case 27
	.4byte _0805B1B8 @ case 28
	.4byte _0805B1B8 @ case 29
	.4byte _0805B170 @ case 30
	.4byte _0805B174 @ case 31
	.4byte _0805B1B8 @ case 32
	.4byte _0805B1B8 @ case 33
	.4byte _0805B1B8 @ case 34
	.4byte _0805B1B8 @ case 35
	.4byte _0805B1B8 @ case 36
	.4byte _0805B1B8 @ case 37
	.4byte _0805B1B8 @ case 38
	.4byte _0805B1B8 @ case 39
	.4byte _0805B1A4 @ case 40
	.4byte _0805B1AA @ case 41
	.4byte _0805B1B8 @ case 42
	.4byte _0805B1B8 @ case 43
	.4byte _0805B1B8 @ case 44
	.4byte _0805B1B8 @ case 45
	.4byte _0805B1B0 @ case 46
	.4byte _0805B1B4 @ case 47
	.4byte _0805B1B8 @ case 48
	.4byte _0805B1B8 @ case 49
	.4byte _0805B1B8 @ case 50
	.4byte _0805B1B8 @ case 51
	.4byte _0805B1B8 @ case 52
	.4byte _0805B1B8 @ case 53
	.4byte _0805B1B8 @ case 54
	.4byte _0805B17A @ case 55
	.4byte _0805B1B8 @ case 56
	.4byte _0805B1B8 @ case 57
	.4byte _0805B1B8 @ case 58
	.4byte _0805B1B8 @ case 59
	.4byte _0805B1B8 @ case 60
	.4byte _0805B1B8 @ case 61
	.4byte _0805B1B8 @ case 62
	.4byte _0805B1B8 @ case 63
	.4byte _0805B1B8 @ case 64
	.4byte _0805B1B8 @ case 65
	.4byte _0805B1B8 @ case 66
	.4byte _0805B1B8 @ case 67
	.4byte _0805B1B8 @ case 68
	.4byte _0805B1B8 @ case 69
	.4byte _0805B1B8 @ case 70
	.4byte _0805B1B8 @ case 71
	.4byte _0805B1B8 @ case 72
	.4byte _0805B1B8 @ case 73
	.4byte _0805B1B8 @ case 74
	.4byte _0805B1B8 @ case 75
	.4byte _0805B1B8 @ case 76
	.4byte _0805B1B8 @ case 77
	.4byte _0805B1B8 @ case 78
	.4byte _0805B1B8 @ case 79
	.4byte _0805B1B8 @ case 80
	.4byte _0805B1B8 @ case 81
	.4byte _0805B1B8 @ case 82
	.4byte _0805B1B8 @ case 83
	.4byte _0805B1B8 @ case 84
	.4byte _0805B1B8 @ case 85
	.4byte _0805B1B8 @ case 86
	.4byte _0805B1B8 @ case 87
	.4byte _0805B158 @ case 88
	.4byte _0805B15E @ case 89
_0805B158:
	bl RidleyInit
	b _0805B1B8
_0805B15E:
	bl RidleyForming
	b _0805B1B8
_0805B164:
	bl RidleyScreamingAfterSpawn
	b _0805B1B8
_0805B16A:
	bl RidleyRisingAfterSpawn
	b _0805B1B8
_0805B170:
	bl RidleyScreamingInit
_0805B174:
	bl RidleyScreaming
	b _0805B1B8
_0805B17A:
	bl RidleyTurningIntoCoreX
	b _0805B1B8
_0805B180:
	bl RidleyIdleInit
_0805B184:
	bl RidleyIdle
	b _0805B1B8
_0805B18A:
	bl RidleyFlyingBackwardsInit
_0805B18E:
	bl RidleyFlyingBackwards
	b _0805B1B8
_0805B194:
	bl RidleyTurningAroundInit
_0805B198:
	bl RidleyTurningAround
	b _0805B1B8
_0805B19E:
	bl RidleyTurningAroundSecondPart
	b _0805B1B8
_0805B1A4:
	bl RidleyPreparingTailAttack
	b _0805B1B8
_0805B1AA:
	bl RidleyTailAttack
	b _0805B1B8
_0805B1B0:
	bl RidleyShootingFireInit
_0805B1B4:
	bl RidleyShootingFire
_0805B1B8:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl RidleySyncSubSprites
	bl RidleySetBackgroundPriority
	bl RidleyUpdatePalette
	pop {r0}
	bx r0

	thumb_func_start RidleyPart
RidleyPart: @ 0x0805B1CC
	push {r4, r5, r6, lr}
	ldr r0, _0805B1E8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r5, [r1]
	adds r1, #1
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _0805B1EC
	bl RidleyPartInit
	b _0805B2B6
	.align 2, 0
_0805B1E8: .4byte gCurrentSprite
_0805B1EC:
	ldr r2, _0805B20C @ =gSpriteData
	lsls r3, r5, #3
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r6, r3, #0
	cmp r0, #0
	beq _0805B210
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B216
	.align 2, 0
_0805B20C: .4byte gSpriteData
_0805B210:
	ldrh r1, [r4]
	ldr r0, _0805B23C @ =0x0000FFBF
	ands r0, r1
_0805B216:
	strh r0, [r4]
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805B240
	ldrh r0, [r4]
	movs r1, #0x20
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x49
	bne _0805B248
	movs r0, #0
	strh r0, [r4]
	b _0805B2B6
	.align 2, 0
_0805B23C: .4byte 0x0000FFBF
_0805B240:
	ldrh r1, [r4]
	ldr r0, _0805B280 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r4]
_0805B248:
	bl RidleySyncSubSprites
	ldr r4, _0805B284 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0805B2B6
	bl RidleyPartidle
	ldr r1, _0805B288 @ =gSpriteData
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805B28C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #0xd
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0805B292
	.align 2, 0
_0805B280: .4byte 0x0000FFDF
_0805B284: .4byte gCurrentSprite
_0805B288: .4byte gSpriteData
_0805B28C:
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
_0805B292:
	ldr r1, _0805B2BC @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0805B2B6
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805B2B6
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805B2B6
	ldr r1, [r1, #0x18]
	ldr r0, _0805B2C0 @ =0x083AF648
	cmp r1, r0
	beq _0805B2B6
	movs r0, #0xf1
	lsls r0, r0, #1
	bl SoundPlay
_0805B2B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2BC: .4byte gCurrentSprite
_0805B2C0: .4byte 0x083AF648

	thumb_func_start RidleyTailPart
RidleyTailPart: @ 0x0805B2C4
	push {r4, r5, r6, lr}
	ldr r3, _0805B2FC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _0805B300 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r2
	ldrh r1, [r6]
	movs r0, #0x20
	ands r0, r1
	adds r4, r3, #0
	cmp r0, #0
	beq _0805B308
	ldrh r0, [r4]
	ldr r3, _0805B304 @ =0x00008020
	adds r1, r3, #0
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r6, #0x1d]
	cmp r0, #0x49
	bne _0805B310
	movs r0, #0
	strh r0, [r4]
	b _0805B54A
	.align 2, 0
_0805B2FC: .4byte gCurrentSprite
_0805B300: .4byte gSpriteData
_0805B304: .4byte 0x00008020
_0805B308:
	ldrh r1, [r4]
	ldr r0, _0805B330 @ =0x00007FDF
	ands r0, r1
	strh r0, [r4]
_0805B310:
	ldrb r0, [r4, #0x1e]
	cmp r0, #7
	beq _0805B354
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805B334
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B33A
	.align 2, 0
_0805B330: .4byte 0x00007FDF
_0805B334:
	ldrh r1, [r4]
	ldr r0, _0805B350 @ =0x0000FFBF
	ands r0, r1
_0805B33A:
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805B34A
	bl RidleyTailPartInit
_0805B34A:
	bl RidleyTailSyncSubSprites
	b _0805B54A
	.align 2, 0
_0805B350: .4byte 0x0000FFBF
_0805B354:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0805B384
	ldrh r1, [r4]
	movs r2, #0
	movs r3, #0
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _0805B380 @ =0x083AF800
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	b _0805B396
	.align 2, 0
_0805B380: .4byte 0x083AF800
_0805B384:
	ldrh r1, [r4]
	ldr r0, _0805B3D0 @ =0x0000FFBF
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	ldr r0, _0805B3D4 @ =0x083AF4B8
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
_0805B396:
	ldr r0, _0805B3D8 @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805B3DC @ =0x083A9A14
	cmp r1, r0
	bne _0805B3BA
	ldr r1, _0805B3E0 @ =gSubSpriteData2
	ldr r0, [r1]
	ldr r2, _0805B3E4 @ =0x083A9B9C
	cmp r0, r2
	beq _0805B3BA
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0805B3BA:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _0805B3C6
	b _0805B542
_0805B3C6:
	lsls r0, r0, #2
	ldr r1, _0805B3E8 @ =_0805B3EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B3D0: .4byte 0x0000FFBF
_0805B3D4: .4byte 0x083AF4B8
_0805B3D8: .4byte gSubSpriteData1
_0805B3DC: .4byte 0x083A9A14
_0805B3E0: .4byte gSubSpriteData2
_0805B3E4: .4byte 0x083A9B9C
_0805B3E8: .4byte _0805B3EC
_0805B3EC: @ jump table
	.4byte _0805B508 @ case 0
	.4byte _0805B542 @ case 1
	.4byte _0805B50E @ case 2
	.4byte _0805B542 @ case 3
	.4byte _0805B542 @ case 4
	.4byte _0805B542 @ case 5
	.4byte _0805B542 @ case 6
	.4byte _0805B542 @ case 7
	.4byte _0805B542 @ case 8
	.4byte _0805B542 @ case 9
	.4byte _0805B542 @ case 10
	.4byte _0805B542 @ case 11
	.4byte _0805B542 @ case 12
	.4byte _0805B542 @ case 13
	.4byte _0805B542 @ case 14
	.4byte _0805B542 @ case 15
	.4byte _0805B542 @ case 16
	.4byte _0805B542 @ case 17
	.4byte _0805B542 @ case 18
	.4byte _0805B542 @ case 19
	.4byte _0805B542 @ case 20
	.4byte _0805B542 @ case 21
	.4byte _0805B542 @ case 22
	.4byte _0805B542 @ case 23
	.4byte _0805B542 @ case 24
	.4byte _0805B542 @ case 25
	.4byte _0805B542 @ case 26
	.4byte _0805B542 @ case 27
	.4byte _0805B542 @ case 28
	.4byte _0805B542 @ case 29
	.4byte _0805B542 @ case 30
	.4byte _0805B542 @ case 31
	.4byte _0805B542 @ case 32
	.4byte _0805B542 @ case 33
	.4byte _0805B542 @ case 34
	.4byte _0805B542 @ case 35
	.4byte _0805B542 @ case 36
	.4byte _0805B542 @ case 37
	.4byte _0805B542 @ case 38
	.4byte _0805B542 @ case 39
	.4byte _0805B542 @ case 40
	.4byte _0805B542 @ case 41
	.4byte _0805B542 @ case 42
	.4byte _0805B542 @ case 43
	.4byte _0805B542 @ case 44
	.4byte _0805B542 @ case 45
	.4byte _0805B542 @ case 46
	.4byte _0805B542 @ case 47
	.4byte _0805B542 @ case 48
	.4byte _0805B542 @ case 49
	.4byte _0805B542 @ case 50
	.4byte _0805B542 @ case 51
	.4byte _0805B542 @ case 52
	.4byte _0805B542 @ case 53
	.4byte _0805B542 @ case 54
	.4byte _0805B542 @ case 55
	.4byte _0805B514 @ case 56
	.4byte _0805B542 @ case 57
	.4byte _0805B51A @ case 58
	.4byte _0805B542 @ case 59
	.4byte _0805B520 @ case 60
	.4byte _0805B542 @ case 61
	.4byte _0805B526 @ case 62
	.4byte _0805B542 @ case 63
	.4byte _0805B52C @ case 64
	.4byte _0805B542 @ case 65
	.4byte _0805B532 @ case 66
	.4byte _0805B542 @ case 67
	.4byte _0805B538 @ case 68
	.4byte _0805B542 @ case 69
	.4byte _0805B53E @ case 70
_0805B508:
	bl RidleyTailPartInit
	b _0805B542
_0805B50E:
	bl RidleyTailPartIdle
	b _0805B542
_0805B514:
	bl RidleyTailPartWaitingTOWindUp
	b _0805B542
_0805B51A:
	bl RidleyTailPartWindingUp1
	b _0805B542
_0805B520:
	bl RidleyTailPartWindingUp2
	b _0805B542
_0805B526:
	bl RidleyTailPartStrikingDown1
	b _0805B542
_0805B52C:
	bl RidleyTailPartStrikingDown2
	b _0805B542
_0805B532:
	bl RidleyTailPartStrikingDown3
	b _0805B542
_0805B538:
	bl RidleyTailPartStrikingForward
	b _0805B542
_0805B53E:
	bl RidleyTailPartDoneStriking
_0805B542:
	bl UpdateSubSpriteData2Animation
	bl RidleySyncSubSpritesPosition
_0805B54A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RidleyFire
RidleyFire: @ 0x0805B550
	push {lr}
	ldr r0, _0805B568 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0805B57C
	cmp r0, #2
	bgt _0805B56C
	cmp r0, #0
	beq _0805B576
	b _0805B58C
	.align 2, 0
_0805B568: .4byte gCurrentSprite
_0805B56C:
	cmp r0, #0x18
	beq _0805B582
	cmp r0, #0x37
	beq _0805B588
	b _0805B58C
_0805B576:
	bl RidleyFireInit
	b _0805B58C
_0805B57C:
	bl RidleyFireMoving
	b _0805B58C
_0805B582:
	bl RidleyFireMovingTowardsSamus
	b _0805B58C
_0805B588:
	bl RidleyFireExploding
_0805B58C:
	pop {r0}
	bx r0

	thumb_func_start RidleyPreSpawnInit
RidleyPreSpawnInit: @ 0x0805B590
	push {r4, r5, lr}
	ldr r0, _0805B5AC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r5, #8
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0805B5B4
	ldr r1, _0805B5B0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805B5FC
	.align 2, 0
_0805B5AC: .4byte gEquipment
_0805B5B0: .4byte gCurrentSprite
_0805B5B4:
	ldr r3, _0805B604 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805B608 @ =0x0000FEE0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0xc0
	strh r0, [r3, #0xe]
	movs r0, #0x60
	strh r0, [r3, #0x10]
	ldr r0, _0805B60C @ =0x083B0A9C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #5
	movs r0, #1
	strb r0, [r1]
_0805B5FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B604: .4byte gCurrentSprite
_0805B608: .4byte 0x0000FEE0
_0805B60C: .4byte 0x083B0A9C

	thumb_func_start RidleyPreSpawnWaitingForSamus
RidleyPreSpawnWaitingForSamus: @ 0x0805B610
	push {lr}
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #8
	bne _0805B642
	ldr r0, _0805B648 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _0805B64C @ =0x083B0AAC
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0xee
	lsls r0, r0, #1
	bl SoundPlay
_0805B642:
	pop {r0}
	bx r0
	.align 2, 0
_0805B648: .4byte gCurrentSprite
_0805B64C: .4byte 0x083B0AAC

	thumb_func_start RidleyPreSpawnOpeningEye
RidleyPreSpawnOpeningEye: @ 0x0805B650
	push {lr}
	ldr r3, _0805B67C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805B676
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	ldr r0, _0805B680 @ =0x083B0AE4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0805B676:
	pop {r0}
	bx r0
	.align 2, 0
_0805B67C: .4byte gCurrentSprite
_0805B680: .4byte 0x083B0AE4

	thumb_func_start RidleyPreSpawnClosingEye
RidleyPreSpawnClosingEye: @ 0x0805B684
	push {lr}
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805B6A8
	ldr r0, _0805B6AC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _0805B6B0 @ =0x083B0A9C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_0805B6A8:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6AC: .4byte gCurrentSprite
_0805B6B0: .4byte 0x083B0A9C

	thumb_func_start RidleyPreSpawnEyeClosed
RidleyPreSpawnEyeClosed: @ 0x0805B6B4
	push {lr}
	ldr r2, _0805B6E8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805B6E2
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x2c
	strh r0, [r2, #6]
	movs r0, #0x42
	movs r1, #7
	bl PlayMusic
_0805B6E2:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6E8: .4byte gCurrentSprite

	thumb_func_start RidleyPreSpawnTurningIntoRidley
RidleyPreSpawnTurningIntoRidley: @ 0x0805B6EC
	push {r4, lr}
	ldr r2, _0805B734 @ =gWrittenToMosaic_H
	ldr r1, _0805B738 @ =sXParasiteMosaicValues
	ldr r4, _0805B73C @ =gCurrentSprite
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
	cmp r0, #0x1f
	bhi _0805B744
	ldrh r2, [r4, #6]
	movs r0, #0xcb
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0805B752
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0xcb
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	ldr r2, _0805B740 @ =0x00008004
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805B752
	.align 2, 0
_0805B734: .4byte gWrittenToMosaic_H
_0805B738: .4byte sXParasiteMosaicValues
_0805B73C: .4byte gCurrentSprite
_0805B740: .4byte 0x00008004
_0805B744:
	cmp r0, #0x20
	bne _0805B752
	movs r0, #0xcb
	movs r1, #0
	movs r2, #8
	bl SpriteLoadPal
_0805B752:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyPreSpawn
RidleyPreSpawn: @ 0x0805B758
	push {lr}
	ldr r0, _0805B770 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0805B80E
	lsls r0, r0, #2
	ldr r1, _0805B774 @ =_0805B778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B770: .4byte gCurrentSprite
_0805B774: .4byte _0805B778
_0805B778: @ jump table
	.4byte _0805B7EC @ case 0
	.4byte _0805B7F2 @ case 1
	.4byte _0805B7F8 @ case 2
	.4byte _0805B80E @ case 3
	.4byte _0805B80E @ case 4
	.4byte _0805B80E @ case 5
	.4byte _0805B80E @ case 6
	.4byte _0805B80E @ case 7
	.4byte _0805B80E @ case 8
	.4byte _0805B80E @ case 9
	.4byte _0805B80E @ case 10
	.4byte _0805B80E @ case 11
	.4byte _0805B80E @ case 12
	.4byte _0805B80E @ case 13
	.4byte _0805B80E @ case 14
	.4byte _0805B80E @ case 15
	.4byte _0805B80E @ case 16
	.4byte _0805B80E @ case 17
	.4byte _0805B80E @ case 18
	.4byte _0805B80E @ case 19
	.4byte _0805B80E @ case 20
	.4byte _0805B80E @ case 21
	.4byte _0805B80E @ case 22
	.4byte _0805B80E @ case 23
	.4byte _0805B7FE @ case 24
	.4byte _0805B80E @ case 25
	.4byte _0805B804 @ case 26
	.4byte _0805B80E @ case 27
	.4byte _0805B80A @ case 28
_0805B7EC:
	bl RidleyPreSpawnInit
	b _0805B80E
_0805B7F2:
	bl RidleyPreSpawnWaitingForSamus
	b _0805B80E
_0805B7F8:
	bl RidleyPreSpawnOpeningEye
	b _0805B80E
_0805B7FE:
	bl RidleyPreSpawnClosingEye
	b _0805B80E
_0805B804:
	bl RidleyPreSpawnEyeClosed
	b _0805B80E
_0805B80A:
	bl RidleyPreSpawnTurningIntoRidley
_0805B80E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaSyncSubSprites
YakuzaSyncSubSprites: @ 0x0805B814
	push {r4, lr}
	ldr r4, _0805B870 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _0805B874 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0805B878 @ =0x0879B784
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805B846
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805B846:
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
_0805B870: .4byte gSubSpriteData1
_0805B874: .4byte gCurrentSprite
_0805B878: .4byte 0x0879B784

	thumb_func_start YakuzaUpdatePalette
YakuzaUpdatePalette: @ 0x0805B87C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805B8A0 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _0805B8A4 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805B8A8 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _0805B8AC
	cmp r1, #1
	beq _0805B8C4
	b _0805B8D2
	.align 2, 0
_0805B8A0: .4byte gCurrentSprite
_0805B8A4: .4byte sPrimarySpriteStats
_0805B8A8: .4byte gBossWork1
_0805B8AC:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _0805B8D2
	ldr r7, _0805B8C0 @ =0x083B5210
	movs r0, #1
	strb r0, [r4]
	b _0805B8D6
	.align 2, 0
_0805B8C0: .4byte 0x083B5210
_0805B8C4:
	lsrs r0, r0, #2
	cmp r5, r0
	bhi _0805B8D2
	ldr r7, _0805B8EC @ =0x083B5230
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_0805B8D2:
	cmp r6, #0
	beq _0805B8E4
_0805B8D6:
	ldr r1, _0805B8F0 @ =0x040000D4
	str r7, [r1]
	ldr r0, _0805B8F4 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0805B8F8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0805B8E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B8EC: .4byte 0x083B5230
_0805B8F0: .4byte 0x040000D4
_0805B8F4: .4byte 0x05000300
_0805B8F8: .4byte 0x80000010

	thumb_func_start YakuzaUpdateGrabbedSamus
YakuzaUpdateGrabbedSamus: @ 0x0805B8FC
	push {lr}
	ldr r2, _0805B90C @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x40
	beq _0805B910
	movs r0, #0
	b _0805B922
	.align 2, 0
_0805B90C: .4byte gSamusData
_0805B910:
	ldr r0, _0805B928 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	adds r1, #0xc0
	strh r1, [r2, #0x18]
	ldrh r0, [r0, #0xa]
	strh r0, [r2, #0x16]
	bl SpriteUtilTakeConstantDamageFromYakuza
	movs r0, #1
_0805B922:
	pop {r1}
	bx r1
	.align 2, 0
_0805B928: .4byte gSubSpriteData1

	thumb_func_start YakuzaCheckCollidingWithRightWall
YakuzaCheckCollidingWithRightWall: @ 0x0805B92C
	push {lr}
	ldr r0, _0805B948 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B94C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xd7
	bhi _0805B950
	movs r0, #0
	b _0805B952
	.align 2, 0
_0805B948: .4byte gSubSpriteData1
_0805B94C: .4byte gBg1XPosition
_0805B950:
	movs r0, #1
_0805B952:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithLeftWall
YakuzaCheckCollidingWithLeftWall: @ 0x0805B958
	push {lr}
	ldr r0, _0805B974 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B978 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x18
	bls _0805B97C
	movs r0, #0
	b _0805B97E
	.align 2, 0
_0805B974: .4byte gSubSpriteData1
_0805B978: .4byte gBg1XPosition
_0805B97C:
	movs r0, #1
_0805B97E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithFloor
YakuzaCheckCollidingWithFloor: @ 0x0805B984
	push {lr}
	ldr r0, _0805B994 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B998 @ =0x0000073E
	cmp r1, r0
	bhi _0805B99C
	movs r0, #0
	b _0805B99E
	.align 2, 0
_0805B994: .4byte gSubSpriteData1
_0805B998: .4byte 0x0000073E
_0805B99C:
	movs r0, #1
_0805B99E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithCeiling
YakuzaCheckCollidingWithCeiling: @ 0x0805B9A4
	push {lr}
	ldr r0, _0805B9B8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805B9C4
	ldr r0, _0805B9BC @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9C0 @ =0x000003FF
	b _0805B9CA
	.align 2, 0
_0805B9B8: .4byte gSamusData
_0805B9BC: .4byte gSubSpriteData1
_0805B9C0: .4byte 0x000003FF
_0805B9C4:
	ldr r0, _0805B9D4 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9D8 @ =0x000005FF
_0805B9CA:
	cmp r1, r0
	bhi _0805B9DC
	movs r0, #1
	b _0805B9DE
	.align 2, 0
_0805B9D4: .4byte gSubSpriteData1
_0805B9D8: .4byte 0x000005FF
_0805B9DC:
	movs r0, #0
_0805B9DE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaXMovement
YakuzaXMovement: @ 0x0805B9E4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r0, _0805BA10 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805BA18
	bl YakuzaCheckCollidingWithRightWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA14 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	b _0805BA2A
	.align 2, 0
_0805BA10: .4byte gCurrentSprite
_0805BA14: .4byte gSubSpriteData1
_0805BA18:
	bl YakuzaCheckCollidingWithLeftWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA34 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r5
_0805BA2A:
	strh r0, [r1, #0xa]
_0805BA2C:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA34: .4byte gSubSpriteData1

	thumb_func_start YakuzaYMovement
YakuzaYMovement: @ 0x0805BA38
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _0805BA64 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805BA7C
	bl YakuzaCheckCollidingWithFloor
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA6C
	ldr r1, _0805BA68 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r5, r0
	b _0805BA8E
	.align 2, 0
_0805BA64: .4byte gCurrentSprite
_0805BA68: .4byte gSubSpriteData1
_0805BA6C:
	ldrh r1, [r4]
	ldr r0, _0805BA78 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
	movs r2, #0
	b _0805BA90
	.align 2, 0
_0805BA78: .4byte 0x0000FBFF
_0805BA7C:
	bl YakuzaCheckCollidingWithCeiling
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA90
	ldr r1, _0805BA98 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, r0, r6
_0805BA8E:
	strh r0, [r1, #8]
_0805BA90:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA98: .4byte gSubSpriteData1

	thumb_func_start YakuzaGrabbedSamusInit
YakuzaGrabbedSamusInit: @ 0x0805BA9C
	push {lr}
	ldr r1, _0805BAD4 @ =gSubSpriteData1
	ldr r0, _0805BAD8 @ =0x083B0F98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805BADC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0805BAE0 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0805BAE4 @ =0x0000013F
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805BAD4: .4byte gSubSpriteData1
_0805BAD8: .4byte 0x083B0F98
_0805BADC: .4byte gCurrentSprite
_0805BAE0: .4byte 0x0000FBFF
_0805BAE4: .4byte 0x0000013F

	thumb_func_start YakuzaGrabbedSamus
YakuzaGrabbedSamus: @ 0x0805BAE8
	push {r4, r5, r6, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB04
	ldr r0, _0805BB00 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BB54
	.align 2, 0
_0805BB00: .4byte gCurrentSprite
_0805BB04:
	ldr r6, _0805BB28 @ =gCurrentSprite
	adds r5, r6, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	cmp r4, #0
	bne _0805BB34
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805BB54
	ldr r0, _0805BB2C @ =gSubSpriteData1
	ldr r1, _0805BB30 @ =0x083B1178
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	ldrb r0, [r5]
	adds r0, #1
	b _0805BB52
	.align 2, 0
_0805BB28: .4byte gCurrentSprite
_0805BB2C: .4byte gSubSpriteData1
_0805BB30: .4byte 0x083B1178
_0805BB34:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805BB54
	adds r1, r6, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r1, _0805BB5C @ =gSubSpriteData1
	ldr r0, _0805BB60 @ =0x083B1188
	str r0, [r1]
	strb r2, [r1, #6]
	movs r0, #0
	strh r2, [r1, #4]
_0805BB52:
	strb r0, [r5]
_0805BB54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB5C: .4byte gSubSpriteData1
_0805BB60: .4byte 0x083B1188

	thumb_func_start YakuzaPullingSamus
YakuzaPullingSamus: @ 0x0805BB64
	push {r4, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB80
	ldr r0, _0805BB7C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC00
	.align 2, 0
_0805BB7C: .4byte gCurrentSprite
_0805BB80:
	ldr r4, _0805BBC4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BBD0
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _0805BBA0
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0805BBA0
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805BBA0:
	movs r0, #4
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805BC00
	ldr r1, _0805BBC8 @ =gSubSpriteData1
	ldr r0, _0805BBCC @ =0x083B11B0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BBC4 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0805BC00
	.align 2, 0
_0805BBC4: .4byte gCurrentSprite
_0805BBC8: .4byte gSubSpriteData1
_0805BBCC: .4byte 0x083B11B0
_0805BBD0:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805BC00
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r1]
	ldr r0, _0805BC08 @ =gSubSpriteData1
	ldr r1, _0805BC0C @ =0x083B11C0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0805BC00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC08: .4byte gSubSpriteData1
_0805BC0C: .4byte 0x083B11C0

	thumb_func_start YakuzaHoldingSamusHigh
YakuzaHoldingSamusHigh: @ 0x0805BC10
	push {lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BC2C
	ldr r0, _0805BC28 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC4C
	.align 2, 0
_0805BC28: .4byte gCurrentSprite
_0805BC2C:
	ldr r2, _0805BC50 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805BC4C
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	adds r0, #0xd
	strb r3, [r0]
_0805BC4C:
	pop {r0}
	bx r0
	.align 2, 0
_0805BC50: .4byte gCurrentSprite

	thumb_func_start YakuzaSlammingSamus
YakuzaSlammingSamus: @ 0x0805BC54
	push {r4, r5, r6, r7, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0805BC8C @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _0805BC90 @ =0x083B0B3E
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805BC94 @ =0x00007FFF
	cmp r1, r0
	bne _0805BC9C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _0805BC98 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	b _0805BCA8
	.align 2, 0
_0805BC8C: .4byte gCurrentSprite
_0805BC90: .4byte 0x083B0B3E
_0805BC94: .4byte 0x00007FFF
_0805BC98: .4byte gSubSpriteData1
_0805BC9C:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
_0805BCA8:
	cmp r6, #0
	beq _0805BCC4
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xc0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805BD1C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805BCC4
	bl SpriteUtilTakeDamageFromYakuzaSlamming
_0805BCC4:
	ldr r5, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	adds r0, #0x48
	ldrh r1, [r5, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r4, r0, #0
	ldr r0, _0805BD20 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0805BD12
	adds r0, r4, #0
	subs r0, #0x48
	strh r0, [r5, #8]
	ldr r0, _0805BD24 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldrh r1, [r5, #0xa]
	adds r0, r4, #0
	movs r2, #0x3c
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x3c
	ldrh r1, [r5, #0xa]
	movs r2, #0x3c
	bl ParticleSet
	movs r0, #0x9d
	lsls r0, r0, #1
	bl SoundPlay
_0805BD12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD18: .4byte gSubSpriteData1
_0805BD1C: .4byte gPreviousCollisionCheck
_0805BD20: .4byte gPreviousVerticalCollisionCheck
_0805BD24: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamusInit
YakuzaReleasingSamusInit: @ 0x0805BD28
	ldr r1, _0805BD40 @ =gSubSpriteData1
	ldr r0, _0805BD44 @ =0x083B0FC0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD48 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD40: .4byte gSubSpriteData1
_0805BD44: .4byte 0x083B0FC0
_0805BD48: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamus
YakuzaReleasingSamus: @ 0x0805BD4C
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805BD5E
	ldr r0, _0805BD64 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #9
	strb r1, [r0]
_0805BD5E:
	pop {r0}
	bx r0
	.align 2, 0
_0805BD64: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamusInit
YakuzaAfterReleasingSamusInit: @ 0x0805BD68
	ldr r1, _0805BD80 @ =gSubSpriteData1
	ldr r0, _0805BD84 @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD88 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0xa
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD80: .4byte gSubSpriteData1
_0805BD84: .4byte 0x083B0F28
_0805BD88: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamus
YakuzaAfterReleasingSamus: @ 0x0805BD8C
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805BDAA
	ldr r0, _0805BDB0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x1c
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	bl SpriteUtilMakeSpriteFaceSamusDirection
_0805BDAA:
	pop {r0}
	bx r0
	.align 2, 0
_0805BDB0: .4byte gCurrentSprite

	thumb_func_start YakuzaInit
YakuzaInit: @ 0x0805BDB4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0805BDD0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0805BDD8
	ldr r1, _0805BDD4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805BEA0
	.align 2, 0
_0805BDD0: .4byte gEquipment
_0805BDD4: .4byte gCurrentSprite
_0805BDD8:
	ldr r0, _0805BEA8 @ =gBossWork1
	strb r6, [r0]
	ldr r0, _0805BEAC @ =gCurrentSprite
	mov ip, r0
	ldr r1, _0805BEB0 @ =0xFFFFFE00
	adds r0, r1, #0
	mov r2, ip
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r5, #0
	mov r1, ip
	strh r0, [r1, #2]
	ldr r4, _0805BEB4 @ =gSubSpriteData1
	strh r0, [r4, #8]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x24
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0805BEB8 @ =0x0000FFC0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x60
	strh r0, [r2, #0xc]
	ldr r0, _0805BEBC @ =0x0000FFB8
	strh r0, [r2, #0xe]
	movs r0, #0x48
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	movs r3, #1
	mov r0, ip
	strb r3, [r0, #0x1e]
	ldr r2, _0805BEC0 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	strh r3, [r4, #0xc]
	ldr r0, _0805BEC4 @ =0x083B0F28
	str r0, [r4]
	strb r5, [r4, #6]
	strh r6, [r4, #4]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	mov r2, ip
	ldrh r0, [r2]
	movs r2, #0x90
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
_0805BEA0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEA8: .4byte gBossWork1
_0805BEAC: .4byte gCurrentSprite
_0805BEB0: .4byte 0xFFFFFE00
_0805BEB4: .4byte gSubSpriteData1
_0805BEB8: .4byte 0x0000FFC0
_0805BEBC: .4byte 0x0000FFB8
_0805BEC0: .4byte sPrimarySpriteStats
_0805BEC4: .4byte 0x083B0F28

	thumb_func_start YakuzaWaitingToAppear
YakuzaWaitingToAppear: @ 0x0805BEC8
	push {lr}
	ldr r0, _0805BEE8 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805BEEC @ =0x000006FF
	cmp r1, r0
	bls _0805BEE4
	ldr r1, _0805BEF0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x38
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
_0805BEE4:
	pop {r0}
	bx r0
	.align 2, 0
_0805BEE8: .4byte gSamusData
_0805BEEC: .4byte 0x000006FF
_0805BEF0: .4byte gCurrentSprite

	thumb_func_start YakuzaAboutToAppear
YakuzaAboutToAppear: @ 0x0805BEF4
	push {lr}
	ldr r2, _0805BF38 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BF32
	subs r1, #0xa
	movs r0, #7
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805BF3C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r1, _0805BF40 @ =gBossWork2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805BF44 @ =0x0000012F
	bl SoundPlay_3b1c
_0805BF32:
	pop {r0}
	bx r0
	.align 2, 0
_0805BF38: .4byte gCurrentSprite
_0805BF3C: .4byte 0x0000DFFF
_0805BF40: .4byte gBossWork2
_0805BF44: .4byte 0x0000012F

	thumb_func_start YakuzaIdleBeforeNewRoundInit
YakuzaIdleBeforeNewRoundInit: @ 0x0805BF48
	ldr r1, _0805BF68 @ =gSubSpriteData1
	ldr r0, _0805BF6C @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BF70 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805BF68: .4byte gSubSpriteData1
_0805BF6C: .4byte 0x083B0F28
_0805BF70: .4byte gCurrentSprite

	thumb_func_start YakuzaIdleBeforeNewRound
YakuzaIdleBeforeNewRound: @ 0x0805BF74
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805BFA6
	ldr r1, _0805BF9C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805BFA0
	subs r0, #1
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0805BFA6
	.align 2, 0
_0805BF9C: .4byte gCurrentSprite
_0805BFA0:
	adds r1, #0x24
	movs r0, #0x31
	strb r0, [r1]
_0805BFA6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaBeginSweepInit
YakuzaBeginSweepInit: @ 0x0805BFAC
	ldr r1, _0805BFC4 @ =gSubSpriteData1
	ldr r0, _0805BFC8 @ =0x083B0F50
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFCC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BFC4: .4byte gSubSpriteData1
_0805BFC8: .4byte 0x083B0F50
_0805BFCC: .4byte gCurrentSprite

	thumb_func_start YakuzaBeginSweep
YakuzaBeginSweep: @ 0x0805BFD0
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805BFEE
	ldr r1, _0805BFF4 @ =gSubSpriteData1
	ldr r0, _0805BFF8 @ =0x083B0F60
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFFC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
_0805BFEE:
	pop {r0}
	bx r0
	.align 2, 0
_0805BFF4: .4byte gSubSpriteData1
_0805BFF8: .4byte 0x083B0F60
_0805BFFC: .4byte gCurrentSprite

	thumb_func_start YakuzaSweeping
YakuzaSweeping: @ 0x0805C000
	push {r4, lr}
	ldr r1, _0805C050 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805C018
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805C018
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805C018:
	movs r0, #3
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C05C
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	beq _0805C076
	ldr r2, _0805C050 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	movs r3, #0
	movs r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805C054 @ =gSubSpriteData1
	ldr r1, _0805C058 @ =0x083B0F88
	str r1, [r0]
	strb r3, [r0, #6]
	strh r4, [r0, #4]
	adds r2, #0x24
	movs r0, #0x1a
	strb r0, [r2]
	b _0805C076
	.align 2, 0
_0805C050: .4byte gCurrentSprite
_0805C054: .4byte gSubSpriteData1
_0805C058: .4byte 0x083B0F88
_0805C05C:
	movs r0, #8
	bl YakuzaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C076
	ldr r0, _0805C07C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0805C076:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C07C: .4byte gCurrentSprite

	thumb_func_start YakuzaSweepingEnd
YakuzaSweepingEnd: @ 0x0805C080
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805C092
	ldr r0, _0805C098 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
_0805C092:
	pop {r0}
	bx r0
	.align 2, 0
_0805C098: .4byte gCurrentSprite

	thumb_func_start YakuzaOpeningMouthInit
YakuzaOpeningMouthInit: @ 0x0805C09C
	push {lr}
	ldr r1, _0805C0E8 @ =gSubSpriteData1
	ldr r0, _0805C0EC @ =0x083B0FE8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805C0F0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x32
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x40
	strh r0, [r3, #0xc]
	ldr r0, _0805C0F4 @ =0x0000FFDC
	strh r0, [r3, #0xe]
	movs r0, #0x24
	strh r0, [r3, #0x10]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805C0F8 @ =0x00000137
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805C0E8: .4byte gSubSpriteData1
_0805C0EC: .4byte 0x083B0FE8
_0805C0F0: .4byte gCurrentSprite
_0805C0F4: .4byte 0x0000FFDC
_0805C0F8: .4byte 0x00000137

	thumb_func_start YakuzaOpeningMouth
YakuzaOpeningMouth: @ 0x0805C0FC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0805C11C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _0805C110
	b _0805C468
_0805C110:
	lsls r0, r0, #2
	ldr r1, _0805C120 @ =_0805C124
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805C11C: .4byte gCurrentSprite
_0805C120: .4byte _0805C124
_0805C124: @ jump table
	.4byte _0805C140 @ case 0
	.4byte _0805C178 @ case 1
	.4byte _0805C1E8 @ case 2
	.4byte _0805C270 @ case 3
	.4byte _0805C338 @ case 4
	.4byte _0805C3A8 @ case 5
	.4byte _0805C420 @ case 6
_0805C140:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	bne _0805C14A
	b _0805C468
_0805C14A:
	ldr r1, _0805C16C @ =gSubSpriteData1
	ldr r0, _0805C170 @ =0x083B1040
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C174 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x9c
	lsls r0, r0, #1
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C16C: .4byte gSubSpriteData1
_0805C170: .4byte 0x083B1040
_0805C174: .4byte gCurrentSprite
_0805C178:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	bne _0805C182
	b _0805C468
_0805C182:
	ldr r1, _0805C1C8 @ =gSubSpriteData1
	ldr r0, _0805C1CC @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C1D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C1D4 @ =0x083B0B6E
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C1D8 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C1DC @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C1E0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C1E4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #3
	b _0805C466
	.align 2, 0
_0805C1C8: .4byte gSubSpriteData1
_0805C1CC: .4byte 0x083B1050
_0805C1D0: .4byte gCurrentSprite
_0805C1D4: .4byte 0x083B0B6E
_0805C1D8: .4byte 0x040000D4
_0805C1DC: .4byte 0x083B52D0
_0805C1E0: .4byte 0x05000320
_0805C1E4: .4byte 0x80000010
_0805C1E8:
	adds r6, r4, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0805C1FC
	b _0805C468
_0805C1FC:
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	cmp r0, #0x10
	bhi _0805C218
	adds r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldr r1, _0805C214 @ =0x083B0B6E
	ldrb r0, [r5]
	b _0805C3D2
	.align 2, 0
_0805C214: .4byte 0x083B0B6E
_0805C218:
	ldr r1, _0805C254 @ =gSubSpriteData1
	ldr r0, _0805C258 @ =0x083B1060
	str r0, [r1]
	strb r2, [r1, #6]
	movs r3, #0
	strh r2, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C25C @ =0x083B0B80
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C260 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C264 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C268 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C26C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	strb r3, [r5]
	movs r0, #4
	strb r0, [r6]
	b _0805C468
	.align 2, 0
_0805C254: .4byte gSubSpriteData1
_0805C258: .4byte 0x083B1060
_0805C25C: .4byte 0x083B0B80
_0805C260: .4byte 0x040000D4
_0805C264: .4byte 0x083B52D0
_0805C268: .4byte 0x05000320
_0805C26C: .4byte 0x80000010
_0805C270:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0805C284
	b _0805C468
_0805C284:
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0xa
	bhi _0805C2A0
	adds r0, #1
	strb r0, [r2]
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805C29C @ =0x083B0B80
	ldrb r0, [r2]
	b _0805C3D2
	.align 2, 0
_0805C29C: .4byte 0x083B0B80
_0805C2A0:
	ldr r0, _0805C320 @ =gSubSpriteData1
	ldr r1, _0805C324 @ =0x083B1078
	str r1, [r0]
	strb r5, [r0, #6]
	strh r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldr r1, _0805C328 @ =gBossWork2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805C32C
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x3f
	movs r1, #7
	bl PlayMusic
	movs r0, #0x98
	lsls r0, r0, #1
	bl SoundPlay_3b1c
	b _0805C468
	.align 2, 0
_0805C320: .4byte gSubSpriteData1
_0805C324: .4byte 0x083B1078
_0805C328: .4byte gBossWork2
_0805C32C:
	ldr r0, _0805C334 @ =0x00000139
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C334: .4byte 0x00000139
_0805C338:
	bl SpriteUtilHasSubSprite1AnimationEnded
	cmp r0, #0
	bne _0805C342
	b _0805C468
_0805C342:
	ldr r1, _0805C388 @ =gSubSpriteData1
	ldr r0, _0805C38C @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C390 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C394 @ =0x083B0B8C
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C398 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C39C @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3A0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C3A4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	b _0805C466
	.align 2, 0
_0805C388: .4byte gSubSpriteData1
_0805C38C: .4byte 0x083B1050
_0805C390: .4byte gCurrentSprite
_0805C394: .4byte 0x083B0B8C
_0805C398: .4byte 0x040000D4
_0805C39C: .4byte 0x083B52D0
_0805C3A0: .4byte 0x05000320
_0805C3A4: .4byte 0x80000010
_0805C3A8:
	adds r1, r4, #0
	adds r5, r1, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805C468
	adds r3, r1, #0
	adds r3, #0x30
	ldrb r0, [r3]
	cmp r0, #5
	bhi _0805C404
	adds r0, #1
	strb r0, [r3]
	movs r0, #2
	strb r0, [r5]
	ldr r1, _0805C3F0 @ =0x083B0B8C
	ldrb r0, [r3]
_0805C3D2:
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C3F4 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C3F8 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3FC @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C400 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0805C468
	.align 2, 0
_0805C3F0: .4byte 0x083B0B8C
_0805C3F4: .4byte 0x040000D4
_0805C3F8: .4byte 0x083B52D0
_0805C3FC: .4byte 0x05000320
_0805C400: .4byte 0x80000010
_0805C404:
	ldr r0, _0805C418 @ =gSubSpriteData1
	ldr r1, _0805C41C @ =0x083B10A0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	b _0805C466
	.align 2, 0
_0805C418: .4byte gSubSpriteData1
_0805C41C: .4byte 0x083B10A0
_0805C420:
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805C468
	ldr r2, _0805C458 @ =sPrimarySpriteStats
	ldr r3, _0805C45C @ =gCurrentSprite
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r1, r0, #1
	ldrh r0, [r3, #0x14]
	cmp r0, r1
	bhs _0805C460
	strh r1, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _0805C468
	.align 2, 0
_0805C458: .4byte sPrimarySpriteStats
_0805C45C: .4byte gCurrentSprite
_0805C460:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
_0805C466:
	strb r0, [r1]
_0805C468:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start YakuzaMouthOpenedInit
YakuzaMouthOpenedInit: @ 0x0805C470
	ldr r1, _0805C490 @ =gSubSpriteData1
	ldr r0, _0805C494 @ =0x083B1000
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C498 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C490: .4byte gSubSpriteData1
_0805C494: .4byte 0x083B1000
_0805C498: .4byte gCurrentSprite

	thumb_func_start YakuzaMouthOpened
YakuzaMouthOpened: @ 0x0805C49C
	push {lr}
	ldr r1, _0805C4BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C4B6
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_0805C4B6:
	pop {r0}
	bx r0
	.align 2, 0
_0805C4BC: .4byte gCurrentSprite

	thumb_func_start YakuzaClosingMouthInit
YakuzaClosingMouthInit: @ 0x0805C4C0
	ldr r1, _0805C4F0 @ =gSubSpriteData1
	ldr r0, _0805C4F4 @ =0x083B1028
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C4F8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1e
	strb r0, [r2]
	movs r0, #0x60
	strh r0, [r1, #0xc]
	ldr r0, _0805C4FC @ =0x0000FFB8
	strh r0, [r1, #0xe]
	movs r0, #0x48
	strh r0, [r1, #0x10]
	adds r1, #0x34
	ldrb r2, [r1]
	movs r0, #0x40
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C4F0: .4byte gSubSpriteData1
_0805C4F4: .4byte 0x083B1028
_0805C4F8: .4byte gCurrentSprite
_0805C4FC: .4byte 0x0000FFB8

	thumb_func_start YakuzaClosingMouth
YakuzaClosingMouth: @ 0x0805C500
	push {lr}
	bl SpriteUtilHasSubSprite1AnimationNearlyEnded
	cmp r0, #0
	beq _0805C520
	ldr r1, _0805C524 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldr r0, _0805C528 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #1
	adds r1, #0x2d
	strb r0, [r1]
_0805C520:
	pop {r0}
	bx r0
	.align 2, 0
_0805C524: .4byte gCurrentSprite
_0805C528: .4byte gSpriteRandomNumber

	thumb_func_start YakuzaPhase1DyingInit
YakuzaPhase1DyingInit: @ 0x0805C52C
	push {lr}
	ldr r3, _0805C560 @ =gSubSpriteData1
	ldr r0, _0805C564 @ =0x083B10B0
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r1, _0805C568 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x20
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x99
	lsls r0, r0, #1
	bl SoundPlay_3b1c
	pop {r0}
	bx r0
	.align 2, 0
_0805C560: .4byte gSubSpriteData1
_0805C564: .4byte 0x083B10B0
_0805C568: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase1Dying
YakuzaPhase1Dying: @ 0x0805C56C
	push {lr}
	ldr r2, _0805C5D0 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805C5D4 @ =0x0000063E
	cmp r1, r0
	bhi _0805C57C
	adds r0, r1, #4
	strh r0, [r2, #8]
_0805C57C:
	ldr r2, _0805C5D8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805C5AC
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805C5A6
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805C5A6:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805C5AC:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805C5CA
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x21
	strb r1, [r0]
	subs r0, #4
	strb r3, [r0]
_0805C5CA:
	pop {r0}
	bx r0
	.align 2, 0
_0805C5D0: .4byte gSubSpriteData1
_0805C5D4: .4byte 0x0000063E
_0805C5D8: .4byte gCurrentSprite

	thumb_func_start YakuzaUpdateHitboxAndImmunity
YakuzaUpdateHitboxAndImmunity: @ 0x0805C5DC
	push {lr}
	ldr r2, _0805C600 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805C608
	ldr r1, _0805C604 @ =0x0000FF80
	strh r1, [r2, #0xa]
	movs r0, #0x80
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	b _0805C61E
	.align 2, 0
_0805C600: .4byte gCurrentSprite
_0805C604: .4byte 0x0000FF80
_0805C608:
	ldr r0, _0805C624 @ =0x0000FF80
	strh r0, [r2, #0xa]
	movs r1, #0x40
	strh r1, [r2, #0xc]
	adds r0, #0x40
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
_0805C61E:
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0805C624: .4byte 0x0000FF80

	thumb_func_start YakuzaLosingLegsInit
YakuzaLosingLegsInit: @ 0x0805C628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _0805C684 @ =gSubSpriteData1
	ldr r0, _0805C688 @ =0x083B1128
	str r0, [r2]
	movs r3, #0
	strb r3, [r2, #6]
	movs r5, #0
	strh r3, [r2, #4]
	ldr r4, _0805C68C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, #0xe2
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r5, [r0]
	ldr r0, _0805C690 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	strh r3, [r2, #0xc]
	ldr r0, _0805C694 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r3, r4, #0
	ldrh r2, [r2, #0xa]
	cmp r0, r2
	bhs _0805C69C
	ldrh r1, [r3]
	ldr r0, _0805C698 @ =0x0000FDFF
	ands r0, r1
	b _0805C6A6
	.align 2, 0
_0805C684: .4byte gSubSpriteData1
_0805C688: .4byte 0x083B1128
_0805C68C: .4byte gCurrentSprite
_0805C690: .4byte gSpriteRandomNumber
_0805C694: .4byte gSamusData
_0805C698: .4byte 0x0000FDFF
_0805C69C:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
_0805C6A6:
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldrh r6, [r3, #2]
	ldrh r3, [r3, #4]
	mov r8, r3
	adds r7, r6, #0
	subs r7, #0x10
	str r7, [sp]
	mov r4, r8
	subs r4, #0x40
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #0
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r0, r0, r6
	mov sl, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #1
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	subs r6, #0x40
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #2
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r7, [sp]
	movs r2, #0x40
	add r8, r2
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #3
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	mov r2, sl
	str r2, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #4
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r6, [sp]
	mov r2, r8
	str r2, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #5
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaLosingLegs
YakuzaLosingLegs: @ 0x0805C754
	push {lr}
	ldr r1, _0805C778 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C76E
	adds r1, #0x24
	movs r0, #0x24
	strb r0, [r1]
_0805C76E:
	bl YakuzaUpdateHitboxAndImmunity
	pop {r0}
	bx r0
	.align 2, 0
_0805C778: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase2Init
YakuzaPhase2Init: @ 0x0805C77C
	push {lr}
	ldr r3, _0805C7A4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x24
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _0805C7A8 @ =gSamusData
	ldr r1, _0805C7AC @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805C7B4
	ldrh r1, [r3]
	ldr r0, _0805C7B0 @ =0x0000FDFF
	ands r0, r1
	b _0805C7BE
	.align 2, 0
_0805C7A4: .4byte gCurrentSprite
_0805C7A8: .4byte gSamusData
_0805C7AC: .4byte gSubSpriteData1
_0805C7B0: .4byte 0x0000FDFF
_0805C7B4:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
_0805C7BE:
	strh r0, [r3]
	pop {r0}
	bx r0

	thumb_func_start YakuzaPhase2
YakuzaPhase2: @ 0x0805C7C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #0
	mov r8, r0
	ldr r4, _0805C81C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r6, [r0]
	subs r0, #4
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bhi _0805C85E
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0805C85E
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0805C832
	ldr r5, _0805C820 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C824 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C82C
	ldrh r1, [r4]
	ldr r0, _0805C828 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C81C: .4byte gCurrentSprite
_0805C820: .4byte gSubSpriteData1
_0805C824: .4byte gPreviousCollisionCheck
_0805C828: .4byte 0x0000FDFF
_0805C82C:
	ldrh r0, [r5, #0xa]
	adds r0, r0, r6
	b _0805C85C
_0805C832:
	ldr r5, _0805C850 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C854 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C858
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C850: .4byte gSubSpriteData1
_0805C854: .4byte gPreviousCollisionCheck
_0805C858:
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
_0805C85C:
	strh r0, [r5, #0xa]
_0805C85E:
	ldr r0, _0805C8A4 @ =0x083B0B94
	ldr r1, _0805C8A8 @ =gCurrentSprite
	mov ip, r1
	mov r4, ip
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	cmp r2, #0x3e
	bhi _0805C87E
	adds r0, r3, #1
	strb r0, [r4]
_0805C87E:
	ldr r4, _0805C8AC @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, r0, r6
	movs r3, #0
	strh r0, [r4, #8]
	lsls r0, r6, #0x10
	cmp r0, #0
	bgt _0805C890
	b _0805CA6C
_0805C890:
	mov r2, ip
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805C8B0
	adds r0, #0x20
	strb r0, [r2]
	b _0805C8F0
	.align 2, 0
_0805C8A4: .4byte 0x083B0B94
_0805C8A8: .4byte gCurrentSprite
_0805C8AC: .4byte gSubSpriteData1
_0805C8B0:
	mov r0, ip
	ldrh r2, [r0]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0805C8F0
	ldr r0, _0805C924 @ =0x083B1128
	str r0, [r4]
	strb r3, [r4, #6]
	strh r1, [r4, #4]
	ldr r0, _0805C928 @ =0x0000FFF7
	ands r0, r2
	mov r2, ip
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r2, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	lsls r0, r0, #1
	bl SoundPlay
_0805C8F0:
	ldr r4, _0805C92C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805C930 @ =gPreviousVerticalCollisionCheck
	ldrb r5, [r0]
	cmp r5, #0
	beq _0805C938
	adds r0, r1, #0
	subs r0, #0x80
	movs r1, #0
	strh r0, [r4, #8]
	ldr r2, _0805C934 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	b _0805CA00
	.align 2, 0
_0805C924: .4byte 0x083B1128
_0805C928: .4byte 0x0000FFF7
_0805C92C: .4byte gSubSpriteData1
_0805C930: .4byte gPreviousVerticalCollisionCheck
_0805C934: .4byte gCurrentSprite
_0805C938:
	ldr r0, _0805CA1C @ =gSamusData
	ldrh r0, [r0, #0x18]
	ldrh r3, [r4, #8]
	cmp r0, r3
	bhs _0805C952
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r0, #0x31
	strb r5, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C952:
	ldrh r0, [r4, #8]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C99A
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	beq _0805C97E
	ldr r0, _0805CA20 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0805C99A
_0805C97E:
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C998
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C998:
	strb r5, [r2]
_0805C99A:
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xe0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C9D4
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _0805C9D4
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C9D0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C9D0:
	movs r0, #0
	strb r0, [r2]
_0805C9D4:
	ldr r2, _0805CA20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CA00
	ldr r0, _0805CA2C @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805CA30 @ =0x0000057E
	cmp r1, r0
	bls _0805CA00
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
_0805CA00:
	mov r3, r8
	cmp r3, #0
	beq _0805CA50
	ldr r0, _0805CA1C @ =gSamusData
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805CA38
	ldrh r1, [r2]
	ldr r0, _0805CA34 @ =0x0000FDFF
	ands r0, r1
	b _0805CA42
	.align 2, 0
_0805CA1C: .4byte gSamusData
_0805CA20: .4byte gCurrentSprite
_0805CA24: .4byte gPreviousCollisionCheck
_0805CA28: .4byte gSpriteRandomNumber
_0805CA2C: .4byte gSubSpriteData1
_0805CA30: .4byte 0x0000057E
_0805CA34: .4byte 0x0000FDFF
_0805CA38:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_0805CA42:
	strh r0, [r2]
	ldr r0, _0805CA64 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r2, #0
	adds r1, #0x30
	strb r0, [r1]
_0805CA50:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CA68 @ =0x0000013B
	bl SoundPlay
	b _0805CAB8
	.align 2, 0
_0805CA64: .4byte gSpriteRandomNumber
_0805CA68: .4byte 0x0000013B
_0805CA6C:
	mov r1, ip
	ldrh r0, [r1]
	ldr r2, _0805CAC8 @ =0x00004008
	adds r1, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CACC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CA9E
	ldrh r1, [r4, #8]
	ldr r0, _0805CAD0 @ =0x0000057E
	cmp r1, r0
	bhi _0805CAA4
_0805CA9E:
	ldrh r0, [r4, #8]
	subs r0, r0, r6
	strh r0, [r4, #8]
_0805CAA4:
	ldr r0, _0805CAD4 @ =gCurrentSprite
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CAD8 @ =0x0000013B
	bl SoundPlay
_0805CAB8:
	bl YakuzaUpdateHitboxAndImmunity
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CAC8: .4byte 0x00004008
_0805CACC: .4byte gPreviousCollisionCheck
_0805CAD0: .4byte 0x0000057E
_0805CAD4: .4byte gCurrentSprite
_0805CAD8: .4byte 0x0000013B

	thumb_func_start YakuzaPhase2DyingInit
YakuzaPhase2DyingInit: @ 0x0805CADC
	push {r4, lr}
	ldr r1, _0805CB24 @ =gSubSpriteData1
	ldr r0, _0805CB28 @ =0x083B1160
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805CB2C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0805CB30 @ =0x0000BFFF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #7
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB24: .4byte gSubSpriteData1
_0805CB28: .4byte 0x083B1160
_0805CB2C: .4byte gCurrentSprite
_0805CB30: .4byte 0x0000BFFF

	thumb_func_start YakuzaPhase2Dying
YakuzaPhase2Dying: @ 0x0805CB34
	push {r4, lr}
	ldr r1, _0805CB6C @ =gSubSpriteData1
	ldrh r2, [r1, #8]
	ldr r0, _0805CB70 @ =0x0000063E
	cmp r2, r0
	bhi _0805CB44
	adds r0, r2, #4
	strh r0, [r1, #8]
_0805CB44:
	ldrh r2, [r1, #8]
	ldrh r3, [r1, #0xa]
	ldr r1, _0805CB74 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r4, ip
	strb r0, [r4]
	ldrb r0, [r4]
	adds r4, r1, #0
	cmp r0, #0x28
	bls _0805CB62
	b _0805CC9C
_0805CB62:
	lsls r0, r0, #2
	ldr r1, _0805CB78 @ =_0805CB7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805CB6C: .4byte gSubSpriteData1
_0805CB70: .4byte 0x0000063E
_0805CB74: .4byte gCurrentSprite
_0805CB78: .4byte _0805CB7C
_0805CB7C: @ jump table
	.4byte _0805CC94 @ case 0
	.4byte _0805CC9C @ case 1
	.4byte _0805CC9C @ case 2
	.4byte _0805CC9C @ case 3
	.4byte _0805CC9C @ case 4
	.4byte _0805CC86 @ case 5
	.4byte _0805CC9C @ case 6
	.4byte _0805CC9C @ case 7
	.4byte _0805CC9C @ case 8
	.4byte _0805CC9C @ case 9
	.4byte _0805CC76 @ case 10
	.4byte _0805CC9C @ case 11
	.4byte _0805CC9C @ case 12
	.4byte _0805CC9C @ case 13
	.4byte _0805CC9C @ case 14
	.4byte _0805CC66 @ case 15
	.4byte _0805CC9C @ case 16
	.4byte _0805CC9C @ case 17
	.4byte _0805CC9C @ case 18
	.4byte _0805CC9C @ case 19
	.4byte _0805CC56 @ case 20
	.4byte _0805CC9C @ case 21
	.4byte _0805CC9C @ case 22
	.4byte _0805CC9C @ case 23
	.4byte _0805CC9C @ case 24
	.4byte _0805CC4C @ case 25
	.4byte _0805CC9C @ case 26
	.4byte _0805CC9C @ case 27
	.4byte _0805CC9C @ case 28
	.4byte _0805CC9C @ case 29
	.4byte _0805CC42 @ case 30
	.4byte _0805CC9C @ case 31
	.4byte _0805CC9C @ case 32
	.4byte _0805CC9C @ case 33
	.4byte _0805CC9C @ case 34
	.4byte _0805CC38 @ case 35
	.4byte _0805CC9C @ case 36
	.4byte _0805CC9C @ case 37
	.4byte _0805CC9C @ case 38
	.4byte _0805CC9C @ case 39
	.4byte _0805CC20 @ case 40
_0805CC20:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x9a
	lsls r0, r0, #1
	bl SoundPlay_3b1c
	b _0805CC9C
_0805CC38:
	adds r0, r2, #0
	adds r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	b _0805CC7E
_0805CC42:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	adds r1, #0x1c
	b _0805CC6E
_0805CC4C:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	adds r1, #0x20
	b _0805CC7E
_0805CC56:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x26
	bl ParticleSet
	b _0805CC9C
_0805CC66:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
_0805CC6E:
	movs r2, #0x2f
	bl ParticleSet
	b _0805CC9C
_0805CC76:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	adds r1, #0x1c
_0805CC7E:
	movs r2, #0x25
	bl ParticleSet
	b _0805CC9C
_0805CC86:
	adds r0, r2, #0
	adds r0, #0x10
	adds r1, r3, #0
	movs r2, #0x3a
	bl ParticleSet
	b _0805CC9C
_0805CC94:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_0805CC9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaTurningIntoCoreXInit
YakuzaTurningIntoCoreXInit: @ 0x0805CCA4
	ldr r1, _0805CCBC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4a
	strb r0, [r2]
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x2c
	strh r0, [r1, #6]
	bx lr
	.align 2, 0
_0805CCBC: .4byte gCurrentSprite

	thumb_func_start YakuzaTurningIntoCoreX
YakuzaTurningIntoCoreX: @ 0x0805CCC0
	push {lr}
	ldr r2, _0805CCEC @ =gWrittenToMosaic_H
	ldr r1, _0805CCF0 @ =sXParasiteMosaicValues
	ldr r3, _0805CCF4 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0805CCF8
	ldrh r2, [r3, #6]
	movs r0, #0x47
	movs r1, #0
	bl SpriteLoadGfx
	b _0805CD06
	.align 2, 0
_0805CCEC: .4byte gWrittenToMosaic_H
_0805CCF0: .4byte sXParasiteMosaicValues
_0805CCF4: .4byte gCurrentSprite
_0805CCF8:
	cmp r0, #0x14
	bne _0805CD06
	movs r0, #0x47
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805CD06:
	ldr r2, _0805CD20 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0805CD1A
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x47
	strb r0, [r2, #0x1d]
_0805CD1A:
	pop {r0}
	bx r0
	.align 2, 0
_0805CD20: .4byte gCurrentSprite

	thumb_func_start YakuzaPartInit
YakuzaPartInit: @ 0x0805CD24
	push {r4, r5, lr}
	ldr r2, _0805CD4C @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805CD50 @ =0x0000FFFB
	ands r0, r1
	movs r5, #0
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrb r4, [r2, #0x1e]
	adds r3, r2, #0
	cmp r4, #0
	beq _0805CD54
	cmp r4, #2
	beq _0805CD9C
	movs r0, #0
	strh r0, [r3]
	b _0805CDD2
	.align 2, 0
_0805CD4C: .4byte gCurrentSprite
_0805CD50: .4byte 0x0000FFFB
_0805CD54:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805CD98 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	subs r0, #0xa
	strb r5, [r0]
	b _0805CDD2
	.align 2, 0
_0805CD98: .4byte 0x0000FFFC
_0805CD9C:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805CDE8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	movs r0, #0x10
	strh r0, [r3, #0xc]
	ldr r0, _0805CDEC @ =0x0000FF60
	strh r0, [r3, #0xe]
	movs r0, #0xa0
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805CDD2:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
	bl YakuzaSyncSubSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CDE8: .4byte 0x0000FF80
_0805CDEC: .4byte 0x0000FF60

	thumb_func_start YakuzaPartLegsIdle
YakuzaPartLegsIdle: @ 0x0805CDF0
	push {r4, r5, r6, lr}
	ldr r1, _0805CE34 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r4
	adds r2, r1, #0
	ldr r6, _0805CE38 @ =gSpriteData
	cmp r0, #0
	beq _0805CE24
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CE64
	ldr r0, _0805CE3C @ =0x0000DFFF
	ands r0, r4
	strh r0, [r2]
_0805CE24:
	ldr r0, _0805CE40 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805CE44
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
	b _0805CE4A
	.align 2, 0
_0805CE34: .4byte gCurrentSprite
_0805CE38: .4byte gSpriteData
_0805CE3C: .4byte 0x0000DFFF
_0805CE40: .4byte gSamusData
_0805CE44:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #2
_0805CE4A:
	strb r0, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0x60
	bne _0805CE60
	movs r0, #0x10
	b _0805CE62
_0805CE60:
	movs r0, #0x2c
_0805CE62:
	strh r0, [r2, #0xc]
_0805CE64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartLegsDead
YakuzaPartLegsDead: @ 0x0805CE6C
	push {r4, r5, lr}
	ldr r3, _0805CE90 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0805CE94 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805CE98
	movs r0, #0
	strh r0, [r3]
	b _0805CEC6
	.align 2, 0
_0805CE90: .4byte gCurrentSprite
_0805CE94: .4byte gSpriteData
_0805CE98:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r5, #0
	adds r2, r0, #0
	orrs r2, r1
	strh r2, [r3]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CEC0
	movs r0, #4
	orrs r2, r0
	b _0805CEC4
_0805CEC0:
	ldr r0, _0805CECC @ =0x0000FFFB
	ands r2, r0
_0805CEC4:
	strh r2, [r3]
_0805CEC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CECC: .4byte 0x0000FFFB

	thumb_func_start YakuzaPartEyeIdle
YakuzaPartEyeIdle: @ 0x0805CED0
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805CF08 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r0, #3
	movs r7, #1
	strb r7, [r0]
	ldr r2, _0805CF0C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CF10
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	b _0805CFF4
	.align 2, 0
_0805CF08: .4byte gCurrentSprite
_0805CF0C: .4byte gSpriteData
_0805CF10:
	ldrh r3, [r4]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _0805CF2C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CFF8
	ldr r0, _0805CF70 @ =0x0000DFFF
	ands r0, r3
	strh r0, [r4]
_0805CF2C:
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r6, r4, #0
	adds r6, #0x2f
	ldrb r5, [r6]
	adds r3, r5, #0
	cmp r3, #0
	bne _0805CFC0
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CF7C
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CF74 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CF78 @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CF70: .4byte 0x0000DFFF
_0805CF74: .4byte 0x083B7240
_0805CF78: .4byte 0x0000FFFB
_0805CF7C:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #7
	beq _0805CF8A
	cmp r0, #9
	bne _0805CFF8
_0805CF8A:
	ldr r0, _0805CFB4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bhi _0805CFF8
	adds r0, r7, #0
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x2e
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CFB8 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CFBC @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CFB4: .4byte gSpriteRandomNumber
_0805CFB8: .4byte 0x083B7240
_0805CFBC: .4byte 0x0000FFFB
_0805CFC0:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0805CFD4
	ldrb r0, [r4, #0x1c]
	adds r0, #2
	strb r0, [r4, #0x1c]
_0805CFD4:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805CFF8
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805CFEE
	subs r0, #1
	strb r0, [r2]
	b _0805CFF8
_0805CFEE:
	strb r1, [r6]
	ldrh r1, [r4]
	movs r0, #4
_0805CFF4:
	orrs r0, r1
_0805CFF6:
	strh r0, [r4]
_0805CFF8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartEyesPhase2
YakuzaPartEyesPhase2: @ 0x0805D000
	push {lr}
	ldr r3, _0805D030 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0805D034 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805D02A
	movs r0, #0
	strh r0, [r3]
_0805D02A:
	pop {r0}
	bx r0
	.align 2, 0
_0805D030: .4byte gCurrentSprite
_0805D034: .4byte gSpriteData

	thumb_func_start YakuzaProjectileInit
YakuzaProjectileInit: @ 0x0805D038
	push {r4, r5, lr}
	ldr r3, _0805D094 @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r1, _0805D098 @ =0x0000FFFB
	ands r1, r0
	movs r5, #0
	movs r4, #0
	strh r1, [r3]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0805D09C @ =gSubSpriteData1
	ldrh r2, [r0, #0xc]
	cmp r2, #0
	beq _0805D0A8
	adds r0, r3, #0
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x27
	movs r0, #0x28
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r2, #2
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0805D0A0 @ =0x0000FFA0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0x48
	strh r0, [r3, #0xe]
	movs r0, #0x18
	strh r0, [r3, #0x10]
	ldr r0, _0805D0A4 @ =0x083B72C0
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r4, [r3, #0x14]
	b _0805D0EE
	.align 2, 0
_0805D094: .4byte gCurrentSprite
_0805D098: .4byte 0x0000FFFB
_0805D09C: .4byte gSubSpriteData1
_0805D0A0: .4byte 0x0000FFA0
_0805D0A4: .4byte 0x083B72C0
_0805D0A8:
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805D0F4 @ =0x0000FFE0
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #4
	strh r0, [r3, #0xe]
	movs r0, #0x1c
	strh r0, [r3, #0x10]
	ldr r0, _0805D0F8 @ =0x083B7288
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r2, [r3, #0x16]
	subs r1, #5
	movs r0, #0x28
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805D0EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D0F4: .4byte 0x0000FFE0
_0805D0F8: .4byte 0x083B7288

	thumb_func_start YakuzaProjectileExploding
YakuzaProjectileExploding: @ 0x0805D0FC
	push {r4, lr}
	ldr r4, _0805D11C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x2d
	bl ParticleSet
	ldr r0, _0805D120 @ =0x000001BF
	bl SoundPlay
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D11C: .4byte gCurrentSprite
_0805D120: .4byte 0x000001BF

	thumb_func_start YakuzaProjectileSpitFalling
YakuzaProjectileSpitFalling: @ 0x0805D124
	push {lr}
	ldr r0, _0805D13C @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _0805D138
	bl YakuzaProjectileExploding
_0805D138:
	pop {r0}
	bx r0
	.align 2, 0
_0805D13C: .4byte gCurrentSprite

	thumb_func_start YakuzaProjectileFireFalling
YakuzaProjectileFireFalling: @ 0x0805D140
	push {r4, lr}
	ldr r0, _0805D170 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrb r1, [r0, #0x1e]
	adds r4, r0, #0
	cmp r1, #0
	beq _0805D192
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805D174
	ldrh r0, [r4, #4]
	adds r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	b _0805D184
	.align 2, 0
_0805D170: .4byte gCurrentSprite
_0805D174:
	ldrh r0, [r4, #4]
	subs r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
_0805D184:
	ldr r0, _0805D1CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	ldr r4, _0805D1D0 @ =gCurrentSprite
	cmp r0, #0
	beq _0805D192
	movs r0, #0
	strb r0, [r4, #0x1e]
_0805D192:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805D1D4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D1C4
	movs r2, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D1C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1CC: .4byte gPreviousCollisionCheck
_0805D1D0: .4byte gCurrentSprite
_0805D1D4: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start YakuzaProjectileFireBurning1
YakuzaProjectileFireBurning1: @ 0x0805D1D8
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D240 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D244 @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D248 @ =0x00007FFF
	cmp r1, r0
	bne _0805D1F8
	ldrh r4, [r5]
	movs r3, #0
_0805D1F8:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D258
	movs r0, #0x50
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _0805D24C @ =0x083B72E0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D250 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	adds r0, #0x30
	strh r0, [r2, #0xe]
	movs r0, #0x10
	strh r0, [r2, #0x10]
	ldr r0, _0805D254 @ =0x0000013D
	bl SoundPlay
	b _0805D268
	.align 2, 0
_0805D240: .4byte gCurrentSprite
_0805D244: .4byte 0x083B0B04
_0805D248: .4byte 0x00007FFF
_0805D24C: .4byte 0x083B72E0
_0805D250: .4byte 0x0000FFC0
_0805D254: .4byte 0x0000013D
_0805D258:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D268
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D268:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaProjectileFireBurning2
YakuzaProjectileFireBurning2: @ 0x0805D270
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D2D8 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D2DC @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D2E0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D290
	ldrh r4, [r5]
	movs r3, #0
_0805D290:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D2EC
	movs r0, #0x3c
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0805D2E4 @ =0x083B7300
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D2E8 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	adds r0, #0x14
	strh r0, [r2, #0xe]
	movs r0, #0xc
	strh r0, [r2, #0x10]
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
	b _0805D2FA
	.align 2, 0
_0805D2D8: .4byte gCurrentSprite
_0805D2DC: .4byte 0x083B0B04
_0805D2E0: .4byte 0x00007FFF
_0805D2E4: .4byte 0x083B7300
_0805D2E8: .4byte 0x0000FFE0
_0805D2EC:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D2FA
	ldr r0, _0805D300 @ =0x0000013D
	bl SoundPlay
_0805D2FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D300: .4byte 0x0000013D

	thumb_func_start YakuzaProjectileFireBurning3
YakuzaProjectileFireBurning3: @ 0x0805D304
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805D364 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r5, _0805D368 @ =0x083B0B04
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D36C @ =0x00007FFF
	cmp r1, r0
	bne _0805D324
	ldrh r4, [r5]
	movs r2, #0
_0805D324:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #4]
	adds r0, r0, r4
	strh r0, [r3, #4]
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D34A
	movs r0, #0x3c
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0805D34A:
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805D35C
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
_0805D35C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D364: .4byte gCurrentSprite
_0805D368: .4byte 0x083B0B04
_0805D36C: .4byte 0x00007FFF

	thumb_func_start YakuzaProjectileFireBurning4
YakuzaProjectileFireBurning4: @ 0x0805D370
	push {lr}
	ldr r0, _0805D3B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #0x1d
	bhi _0805D396
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ands r0, r3
	cmp r0, #0
	bne _0805D396
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0805D396:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805D3AA
	strh r0, [r2]
_0805D3AA:
	pop {r0}
	bx r0
	.align 2, 0
_0805D3B0: .4byte gCurrentSprite

	thumb_func_start YakuzaFallingLegInit
YakuzaFallingLegInit: @ 0x0805D3B4
	push {r4, r5, lr}
	ldr r0, _0805D424 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0805D428 @ =0x0000FFFB
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
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0805D42C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _0805D430 @ =0x0000FFFC
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xd
	strb r3, [r0]
	strh r4, [r5, #0x14]
	ldrb r0, [r5, #0x1e]
	mov r3, ip
	cmp r0, #5
	bls _0805D418
	b _0805D56C
_0805D418:
	lsls r0, r0, #2
	ldr r1, _0805D434 @ =_0805D438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D424: .4byte gCurrentSprite
_0805D428: .4byte 0x0000FFFB
_0805D42C: .4byte gIoRegisters
_0805D430: .4byte 0x0000FFFC
_0805D434: .4byte _0805D438
_0805D438: @ jump table
	.4byte _0805D450 @ case 0
	.4byte _0805D490 @ case 1
	.4byte _0805D4BC @ case 2
	.4byte _0805D4E8 @ case 3
	.4byte _0805D514 @ case 4
	.4byte _0805D540 @ case 5
_0805D450:
	ldr r0, _0805D488 @ =0x083B7320
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _0805D48C @ =0x00000133
	bl SoundPlay_3b1c
	b _0805D570
	.align 2, 0
_0805D488: .4byte 0x083B7320
_0805D48C: .4byte 0x00000133
_0805D490:
	ldr r0, _0805D4B8 @ =0x083B7330
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _0805D570
	.align 2, 0
_0805D4B8: .4byte 0x083B7330
_0805D4BC:
	ldr r0, _0805D4E4 @ =0x083B7340
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #6
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D4E4: .4byte 0x083B7340
_0805D4E8:
	ldr r0, _0805D510 @ =0x083B7350
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #4
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xa
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D510: .4byte 0x083B7350
_0805D514:
	ldr r0, _0805D53C @ =0x083B7360
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D53C: .4byte 0x083B7360
_0805D540:
	ldr r0, _0805D568 @ =0x083B7370
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D568: .4byte 0x083B7370
_0805D56C:
	mov r0, ip
	strh r4, [r0]
_0805D570:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLegMoving
YakuzaFallingLegMoving: @ 0x0805D578
	push {r4, r5, r6, lr}
	ldr r1, _0805D5A0 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, r1, #0
	cmp r0, #0
	beq _0805D5A4
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D5FE
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	movs r2, #0x25
	bl ParticleSet
	b _0805D5FE
	.align 2, 0
_0805D5A0: .4byte gCurrentSprite
_0805D5A4:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _0805D5CC @ =sSpritesFallingSpeed_2e499c
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805D5D0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D5D4
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0805D5DE
	.align 2, 0
_0805D5CC: .4byte sSpritesFallingSpeed_2e499c
_0805D5D0: .4byte 0x00007FFF
_0805D5D4:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_0805D5DE:
	strh r0, [r2, #2]
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bhi _0805D5F2
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	b _0805D5FC
_0805D5F2:
	adds r1, r2, #0
	adds r1, #0x30
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
_0805D5FC:
	strh r0, [r2, #4]
_0805D5FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Yakuza
Yakuza: @ 0x0805D604
	push {r4, lr}
	ldr r1, _0805D648 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r4, r1, #0
	cmp r0, #0
	bne _0805D61C
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805D61C
	movs r0, #0x47
	strb r0, [r1]
_0805D61C:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0805D630
	ldr r0, _0805D64C @ =0x00000131
	bl SoundPlayNotAlreadyPlaying
_0805D630:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4a
	bls _0805D63C
	b _0805D830
_0805D63C:
	lsls r0, r0, #2
	ldr r1, _0805D650 @ =_0805D654
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D648: .4byte gCurrentSprite
_0805D64C: .4byte 0x00000131
_0805D650: .4byte _0805D654
_0805D654: @ jump table
	.4byte _0805D780 @ case 0
	.4byte _0805D792 @ case 1
	.4byte _0805D796 @ case 2
	.4byte _0805D830 @ case 3
	.4byte _0805D830 @ case 4
	.4byte _0805D830 @ case 5
	.4byte _0805D830 @ case 6
	.4byte _0805D7A8 @ case 7
	.4byte _0805D7AC @ case 8
	.4byte _0805D7D8 @ case 9
	.4byte _0805D7DC @ case 10
	.4byte _0805D830 @ case 11
	.4byte _0805D830 @ case 12
	.4byte _0805D830 @ case 13
	.4byte _0805D830 @ case 14
	.4byte _0805D830 @ case 15
	.4byte _0805D830 @ case 16
	.4byte _0805D830 @ case 17
	.4byte _0805D830 @ case 18
	.4byte _0805D830 @ case 19
	.4byte _0805D830 @ case 20
	.4byte _0805D830 @ case 21
	.4byte _0805D830 @ case 22
	.4byte _0805D830 @ case 23
	.4byte _0805D79C @ case 24
	.4byte _0805D830 @ case 25
	.4byte _0805D7A2 @ case 26
	.4byte _0805D7EC @ case 27
	.4byte _0805D7F0 @ case 28
	.4byte _0805D7F6 @ case 29
	.4byte _0805D7FA @ case 30
	.4byte _0805D800 @ case 31
	.4byte _0805D804 @ case 32
	.4byte _0805D80A @ case 33
	.4byte _0805D80E @ case 34
	.4byte _0805D814 @ case 35
	.4byte _0805D818 @ case 36
	.4byte _0805D830 @ case 37
	.4byte _0805D830 @ case 38
	.4byte _0805D7B2 @ case 39
	.4byte _0805D7B6 @ case 40
	.4byte _0805D830 @ case 41
	.4byte _0805D7BC @ case 42
	.4byte _0805D830 @ case 43
	.4byte _0805D7C2 @ case 44
	.4byte _0805D830 @ case 45
	.4byte _0805D7C8 @ case 46
	.4byte _0805D7CE @ case 47
	.4byte _0805D7D2 @ case 48
	.4byte _0805D7E2 @ case 49
	.4byte _0805D7E6 @ case 50
	.4byte _0805D830 @ case 51
	.4byte _0805D830 @ case 52
	.4byte _0805D830 @ case 53
	.4byte _0805D830 @ case 54
	.4byte _0805D786 @ case 55
	.4byte _0805D78C @ case 56
	.4byte _0805D830 @ case 57
	.4byte _0805D830 @ case 58
	.4byte _0805D830 @ case 59
	.4byte _0805D830 @ case 60
	.4byte _0805D830 @ case 61
	.4byte _0805D830 @ case 62
	.4byte _0805D830 @ case 63
	.4byte _0805D830 @ case 64
	.4byte _0805D830 @ case 65
	.4byte _0805D830 @ case 66
	.4byte _0805D830 @ case 67
	.4byte _0805D830 @ case 68
	.4byte _0805D830 @ case 69
	.4byte _0805D830 @ case 70
	.4byte _0805D81E @ case 71
	.4byte _0805D822 @ case 72
	.4byte _0805D828 @ case 73
	.4byte _0805D82C @ case 74
_0805D780:
	bl YakuzaInit
	b _0805D830
_0805D786:
	bl YakuzaWaitingToAppear
	b _0805D830
_0805D78C:
	bl YakuzaAboutToAppear
	b _0805D830
_0805D792:
	bl YakuzaBeginSweepInit
_0805D796:
	bl YakuzaBeginSweep
	b _0805D830
_0805D79C:
	bl YakuzaSweeping
	b _0805D830
_0805D7A2:
	bl YakuzaSweepingEnd
	b _0805D830
_0805D7A8:
	bl YakuzaIdleBeforeNewRoundInit
_0805D7AC:
	bl YakuzaIdleBeforeNewRound
	b _0805D830
_0805D7B2:
	bl YakuzaGrabbedSamusInit
_0805D7B6:
	bl YakuzaGrabbedSamus
	b _0805D830
_0805D7BC:
	bl YakuzaPullingSamus
	b _0805D830
_0805D7C2:
	bl YakuzaHoldingSamusHigh
	b _0805D830
_0805D7C8:
	bl YakuzaSlammingSamus
	b _0805D830
_0805D7CE:
	bl YakuzaReleasingSamusInit
_0805D7D2:
	bl YakuzaReleasingSamus
	b _0805D830
_0805D7D8:
	bl YakuzaAfterReleasingSamusInit
_0805D7DC:
	bl YakuzaAfterReleasingSamus
	b _0805D830
_0805D7E2:
	bl YakuzaOpeningMouthInit
_0805D7E6:
	bl YakuzaOpeningMouth
	b _0805D830
_0805D7EC:
	bl YakuzaMouthOpenedInit
_0805D7F0:
	bl YakuzaMouthOpened
	b _0805D830
_0805D7F6:
	bl YakuzaClosingMouthInit
_0805D7FA:
	bl YakuzaClosingMouth
	b _0805D830
_0805D800:
	bl YakuzaPhase1DyingInit
_0805D804:
	bl YakuzaPhase1Dying
	b _0805D830
_0805D80A:
	bl YakuzaLosingLegsInit
_0805D80E:
	bl YakuzaLosingLegs
	b _0805D830
_0805D814:
	bl YakuzaPhase2Init
_0805D818:
	bl YakuzaPhase2
	b _0805D830
_0805D81E:
	bl YakuzaPhase2DyingInit
_0805D822:
	bl YakuzaPhase2Dying
	b _0805D830
_0805D828:
	bl YakuzaTurningIntoCoreXInit
_0805D82C:
	bl YakuzaTurningIntoCoreX
_0805D830:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl YakuzaSyncSubSprites
	bl YakuzaUpdatePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPart
YakuzaPart: @ 0x0805D844
	push {lr}
	ldr r2, _0805D858 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	cmp r1, #0
	bne _0805D85C
	bl YakuzaPartInit
	b _0805D894
	.align 2, 0
_0805D858: .4byte gCurrentSprite
_0805D85C:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bne _0805D87E
	ldr r0, _0805D870 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0805D874
	bl YakuzaPartLegsIdle
	b _0805D878
	.align 2, 0
_0805D870: .4byte gSubSpriteData1
_0805D874:
	bl YakuzaPartLegsDead
_0805D878:
	bl YakuzaSyncSubSprites
	b _0805D894
_0805D87E:
	cmp r0, #0
	bne _0805D894
	cmp r1, #2
	bne _0805D88C
	bl YakuzaPartEyeIdle
	b _0805D890
_0805D88C:
	bl YakuzaPartEyesPhase2
_0805D890:
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
_0805D894:
	pop {r0}
	bx r0

	thumb_func_start YakuzaProjectile
YakuzaProjectile: @ 0x0805D898
	push {lr}
	ldr r0, _0805D8B0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0805D8A6
	b _0805D9C6
_0805D8A6:
	lsls r0, r0, #2
	ldr r1, _0805D8B4 @ =_0805D8B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D8B0: .4byte gCurrentSprite
_0805D8B4: .4byte _0805D8B8
_0805D8B8: @ jump table
	.4byte _0805D998 @ case 0
	.4byte _0805D9C6 @ case 1
	.4byte _0805D9AA @ case 2
	.4byte _0805D9C6 @ case 3
	.4byte _0805D9C6 @ case 4
	.4byte _0805D9C6 @ case 5
	.4byte _0805D9C6 @ case 6
	.4byte _0805D9C6 @ case 7
	.4byte _0805D9C6 @ case 8
	.4byte _0805D9C6 @ case 9
	.4byte _0805D9C6 @ case 10
	.4byte _0805D9C6 @ case 11
	.4byte _0805D9C6 @ case 12
	.4byte _0805D9C6 @ case 13
	.4byte _0805D9C6 @ case 14
	.4byte _0805D9C6 @ case 15
	.4byte _0805D9C6 @ case 16
	.4byte _0805D9C6 @ case 17
	.4byte _0805D9C6 @ case 18
	.4byte _0805D9C6 @ case 19
	.4byte _0805D9C6 @ case 20
	.4byte _0805D9C6 @ case 21
	.4byte _0805D9C6 @ case 22
	.4byte _0805D9C6 @ case 23
	.4byte _0805D9B0 @ case 24
	.4byte _0805D9C6 @ case 25
	.4byte _0805D9B6 @ case 26
	.4byte _0805D9C6 @ case 27
	.4byte _0805D9BC @ case 28
	.4byte _0805D9C6 @ case 29
	.4byte _0805D9C2 @ case 30
	.4byte _0805D9C6 @ case 31
	.4byte _0805D9C6 @ case 32
	.4byte _0805D9C6 @ case 33
	.4byte _0805D9C6 @ case 34
	.4byte _0805D9C6 @ case 35
	.4byte _0805D9C6 @ case 36
	.4byte _0805D9C6 @ case 37
	.4byte _0805D9C6 @ case 38
	.4byte _0805D9C6 @ case 39
	.4byte _0805D99E @ case 40
	.4byte _0805D9C6 @ case 41
	.4byte _0805D9C6 @ case 42
	.4byte _0805D9C6 @ case 43
	.4byte _0805D9C6 @ case 44
	.4byte _0805D9C6 @ case 45
	.4byte _0805D9C6 @ case 46
	.4byte _0805D9C6 @ case 47
	.4byte _0805D9C6 @ case 48
	.4byte _0805D9C6 @ case 49
	.4byte _0805D9C6 @ case 50
	.4byte _0805D9C6 @ case 51
	.4byte _0805D9C6 @ case 52
	.4byte _0805D9C6 @ case 53
	.4byte _0805D9C6 @ case 54
	.4byte _0805D9A4 @ case 55
_0805D998:
	bl YakuzaProjectileInit
	b _0805D9C6
_0805D99E:
	bl YakuzaProjectileSpitFalling
	b _0805D9C6
_0805D9A4:
	bl YakuzaProjectileExploding
	b _0805D9C6
_0805D9AA:
	bl YakuzaProjectileFireFalling
	b _0805D9C6
_0805D9B0:
	bl YakuzaProjectileFireBurning1
	b _0805D9C6
_0805D9B6:
	bl YakuzaProjectileFireBurning2
	b _0805D9C6
_0805D9BC:
	bl YakuzaProjectileFireBurning3
	b _0805D9C6
_0805D9C2:
	bl YakuzaProjectileFireBurning4
_0805D9C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLeg
YakuzaFallingLeg: @ 0x0805D9CC
	push {lr}
	ldr r0, _0805D9E8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D9EC
	cmp r0, #2
	beq _0805D9F2
	b _0805D9F6
	.align 2, 0
_0805D9E8: .4byte gCurrentSprite
_0805D9EC:
	bl YakuzaFallingLegInit
	b _0805D9F6
_0805D9F2:
	bl YakuzaFallingLegMoving
_0805D9F6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareMoveToPosition
NightmareMoveToPosition: @ 0x0805D9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	mov r8, r6
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sb, r0
	ldr r2, _0805DA60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0805DAA0
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805DA82
	ldr r3, _0805DA64 @ =gSubSpriteData1
	ldrh r1, [r3, #0xa]
	adds r0, r5, #4
	cmp r1, r0
	ble _0805DA68
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r2, ip
	strb r0, [r2]
	b _0805DB34
	.align 2, 0
_0805DA60: .4byte gCurrentSprite
_0805DA64: .4byte gSubSpriteData1
_0805DA68:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r6
	bhs _0805DA76
	adds r0, #1
	strb r0, [r1]
_0805DA76:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r5, [r3, #0xa]
	adds r0, r0, r5
	strh r0, [r3, #0xa]
	b _0805DB34
_0805DA82:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DB3A
	ldr r1, _0805DA9C @ =gSubSpriteData1
	ldrb r0, [r6]
	asrs r0, r4
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	b _0805DB34
	.align 2, 0
_0805DA9C: .4byte gSubSpriteData1
_0805DAA0:
	movs r5, #0x2f
	adds r5, r5, r2
	mov ip, r5
	ldrb r0, [r5]
	adds r5, r0, #0
	cmp r5, #0
	bne _0805DAFA
	ldr r3, _0805DAC4 @ =gSubSpriteData1
	ldrh r1, [r3, #0xa]
	subs r0, r7, #4
	cmp r1, r0
	bge _0805DAC8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r6, ip
	strb r0, [r6]
	b _0805DB34
	.align 2, 0
_0805DAC4: .4byte gSubSpriteData1
_0805DAC8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0805DAD6
	adds r0, #1
	strb r0, [r1]
_0805DAD6:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #0xa]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DAF6
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0805DB34
_0805DAF6:
	strh r1, [r3, #0xa]
	b _0805DB34
_0805DAFA:
	subs r0, #1
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DB30
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _0805DB28 @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DB2C
	movs r5, #1
	mov sb, r5
	mov r6, ip
	strb r3, [r6]
	b _0805DB34
	.align 2, 0
_0805DB28: .4byte gSubSpriteData1
_0805DB2C:
	strh r1, [r2, #0xa]
	b _0805DB34
_0805DB30:
	movs r0, #1
	mov sb, r0
_0805DB34:
	mov r1, sb
	cmp r1, #0
	beq _0805DB54
_0805DB3A:
	ldr r2, _0805DB8C @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0805DB90 @ =0x000002A6
	bl SoundPlayNotAlreadyPlaying
_0805DB54:
	movs r5, #0
	mov sb, r5
	ldr r2, _0805DB8C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0805DBD4
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	cmp r0, #0
	bne _0805DBB4
	ldr r3, _0805DB94 @ =gSubSpriteData1
	ldrh r1, [r3, #8]
	mov r0, sl
	subs r0, #4
	cmp r1, r0
	ble _0805DB98
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _0805DC6C
	.align 2, 0
_0805DB8C: .4byte gCurrentSprite
_0805DB90: .4byte 0x000002A6
_0805DB94: .4byte gSubSpriteData1
_0805DB98:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp]
	cmp r0, r5
	bhs _0805DBA8
	adds r0, #1
	strb r0, [r1]
_0805DBA8:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r3, #8]
	adds r0, r0, r6
	strh r0, [r3, #8]
	b _0805DC6C
_0805DBB4:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DC72
	ldr r1, _0805DBD0 @ =gSubSpriteData1
	mov r3, ip
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r5, [r1, #8]
	adds r0, r0, r5
	strh r0, [r1, #8]
	b _0805DC6C
	.align 2, 0
_0805DBD0: .4byte gSubSpriteData1
_0805DBD4:
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0
	bne _0805DC30
	ldr r3, _0805DBFC @ =gSubSpriteData1
	ldrh r1, [r3, #8]
	mov r0, sl
	adds r0, #4
	cmp r1, r0
	bge _0805DC00
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _0805DC6C
	.align 2, 0
_0805DBFC: .4byte gSubSpriteData1
_0805DC00:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp]
	cmp r0, r6
	bhs _0805DC10
	adds r0, #1
	strb r0, [r1]
_0805DC10:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #8]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DC64
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0805DC6C
_0805DC30:
	subs r0, #1
	mov r3, ip
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DC68
	ldrb r0, [r3]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _0805DC60 @ =gSubSpriteData1
	ldrh r0, [r3, #8]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DC64
	movs r5, #1
	mov sb, r5
	mov r0, ip
	strb r6, [r0]
	b _0805DC6C
	.align 2, 0
_0805DC60: .4byte gSubSpriteData1
_0805DC64:
	strh r1, [r3, #8]
	b _0805DC6C
_0805DC68:
	movs r1, #1
	mov sb, r1
_0805DC6C:
	mov r3, sb
	cmp r3, #0
	beq _0805DC8C
_0805DC72:
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r1, r5, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805DC9C @ =0x000002A6
	bl SoundPlayNotAlreadyPlaying
_0805DC8C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC9C: .4byte 0x000002A6

	thumb_func_start NightmareSyncSubSprites
NightmareSyncSubSprites: @ 0x0805DCA0
	push {r4, lr}
	ldr r4, _0805DCFC @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _0805DD00 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0805DD04 @ =0x0879B7FC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805DCD2
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805DCD2:
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
_0805DCFC: .4byte gSubSpriteData1
_0805DD00: .4byte gCurrentSprite
_0805DD04: .4byte 0x0879B7FC

	thumb_func_start NightmarePlaySound
NightmarePlaySound: @ 0x0805DD08
	push {lr}
	ldr r0, _0805DD30 @ =gCurrentSprite
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805DD2A
	ldr r0, _0805DD34 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _0805DD38 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _0805DD2A
	ldr r0, _0805DD3C @ =0x000002A1
	bl SoundPlay
_0805DD2A:
	pop {r0}
	bx r0
	.align 2, 0
_0805DD30: .4byte gCurrentSprite
_0805DD34: .4byte gSubSpriteData1
_0805DD38: .4byte 0x00FFFFFF
_0805DD3C: .4byte 0x000002A1

	thumb_func_start NightmareMakeMissilesFall
NightmareMakeMissilesFall: @ 0x0805DD40
	push {r4, r5, lr}
	movs r5, #0xc
	movs r3, #0
	ldr r4, _0805DD94 @ =gProjectileData
_0805DD48:
	lsls r0, r3, #5
	adds r1, r0, r4
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0805DD82
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0805DD82
	ldrb r0, [r1, #0xf]
	cmp r0, r5
	bne _0805DD82
	ldrb r2, [r1, #0x13]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0805DD72
	adds r0, r2, #1
	strb r0, [r1, #0x13]
_0805DD72:
	ldrb r0, [r1, #0x13]
	movs r2, #0x2a
	cmp r0, #0x29
	bhi _0805DD7C
	adds r2, r0, #0
_0805DD7C:
	ldrh r0, [r1, #8]
	adds r0, r2, r0
	strh r0, [r1, #8]
_0805DD82:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0805DD48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD94: .4byte gProjectileData

	thumb_func_start NightmareReduceSamusXVelocity
NightmareReduceSamusXVelocity: @ 0x0805DD98
	push {lr}
	ldr r0, _0805DDB4 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	beq _0805DDC8
	ldr r2, _0805DDB8 @ =gSamusData
	ldrh r3, [r2, #0x1a]
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	cmp r1, #4
	ble _0805DDBC
	subs r0, r3, #2
	b _0805DDC6
	.align 2, 0
_0805DDB4: .4byte gEquipment
_0805DDB8: .4byte gSamusData
_0805DDBC:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0805DDC8
	adds r0, r3, #2
_0805DDC6:
	strh r0, [r2, #0x1a]
_0805DDC8:
	pop {r0}
	bx r0

	thumb_func_start NightmareInit
NightmareInit: @ 0x0805DDCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _0805DDEC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0805DDF4
	ldr r1, _0805DDF0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805DFA0
	.align 2, 0
_0805DDEC: .4byte gEquipment
_0805DDF0: .4byte gCurrentSprite
_0805DDF4:
	ldr r0, _0805DFAC @ =gCurrentSprite
	mov r8, r0
	movs r2, #0xb0
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r5, [r0, #2]
	adds r1, r1, r5
	movs r4, #0
	strh r1, [r0, #2]
	ldrh r0, [r0, #4]
	adds r0, #0x40
	mov r2, r8
	strh r0, [r2, #4]
	ldr r3, _0805DFB0 @ =gSubSpriteData1
	strh r1, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0xa
	strb r0, [r2, #0x1e]
	mov r1, r8
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x50
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r2, #0x40
	movs r0, #0x40
	strb r0, [r1]
	movs r0, #0xff
	lsls r0, r0, #8
	mov r5, r8
	strh r0, [r5, #0xa]
	adds r0, #0xe0
	strh r0, [r5, #0xc]
	subs r0, #0x80
	strh r0, [r5, #0xe]
	movs r0, #0xc0
	strh r0, [r5, #0x10]
	ldrh r0, [r5]
	movs r5, #0x80
	lsls r5, r5, #8
	adds r1, r5, #0
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _0805DFB4 @ =sPrimarySpriteStats
	mov r5, r8
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	ldr r0, _0805DFB8 @ =0x083B83BC
	str r0, [r3]
	strb r4, [r3, #6]
	strh r7, [r3, #4]
	mov r0, r8
	adds r0, #0x25
	strb r4, [r0]
	adds r0, #8
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x2e
	movs r1, #0xb4
	strb r1, [r0]
	ldr r0, _0805DFBC @ =gBossWork3
	strb r1, [r0]
	ldrh r5, [r3, #8]
	ldrh r6, [r3, #0xa]
	mov r0, r8
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #1
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #2
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #3
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	ldr r2, _0805DFC0 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x36
	strb r0, [r1]
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #4
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #5
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #6
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #7
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #8
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #9
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xb
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xc
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xd
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
_0805DFA0:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DFAC: .4byte gCurrentSprite
_0805DFB0: .4byte gSubSpriteData1
_0805DFB4: .4byte sPrimarySpriteStats
_0805DFB8: .4byte 0x083B83BC
_0805DFBC: .4byte gBossWork3
_0805DFC0: .4byte gSpriteData

	thumb_func_start NightmareWaitingToAppear
NightmareWaitingToAppear: @ 0x0805DFC4
	push {r4, lr}
	ldr r1, _0805E000 @ =gCurrentSprite
	adds r4, r1, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805DFFA
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0x3c
	strb r0, [r4]
	movs r0, #0xa8
	lsls r0, r0, #2
	bl SoundPlay_3b1c
_0805DFFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E000: .4byte gCurrentSprite

	thumb_func_start NightmareAppearing
NightmareAppearing: @ 0x0805E004
	push {r4, r5, lr}
	ldr r5, _0805E050 @ =gCurrentSprite
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E03C
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0x3c
	strb r0, [r4]
	movs r0, #0xa8
	lsls r0, r0, #2
	bl SoundPlay_3b1c
_0805E03C:
	ldr r2, _0805E054 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bls _0805E058
	subs r0, r1, #1
	strh r0, [r2, #8]
	b _0805E060
	.align 2, 0
_0805E050: .4byte gCurrentSprite
_0805E054: .4byte gSubSpriteData1
_0805E058:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
_0805E060:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePhase1Init
NightmarePhase1Init: @ 0x0805E068
	push {lr}
	ldr r3, _0805E0A4 @ =gCurrentSprite
	adds r0, r3, #0
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
	ldrh r1, [r3]
	ldr r0, _0805E0A8 @ =0x00007FFB
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3a
	strb r0, [r1]
	movs r0, #0x41
	movs r1, #7
	bl PlayMusic
	pop {r0}
	bx r0
	.align 2, 0
_0805E0A4: .4byte gCurrentSprite
_0805E0A8: .4byte 0x00007FFB

	thumb_func_start NightmarePhase1
NightmarePhase1: @ 0x0805E0AC
	push {lr}
	sub sp, #4
	ldr r1, _0805E0DC @ =gSamusData
	ldr r2, _0805E0E0 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0805E0E4 @ =gAbilityRestingXPosition
	ldrh r1, [r1]
	adds r1, #0xc0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	str r2, [sp]
	movs r2, #0x28
	movs r3, #8
	bl NightmareMoveToPosition
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805E0DC: .4byte gSamusData
_0805E0E0: .4byte 0xFFFFFF00
_0805E0E4: .4byte gAbilityRestingXPosition

	thumb_func_start NightmarePhase2ResettingPosition
NightmarePhase2ResettingPosition: @ 0x0805E0E8
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805E120 @ =gAbilityRestingYPosition
	ldrh r0, [r0]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0805E124 @ =gAbilityRestingXPosition
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0805E128 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	adds r3, r0, #0
	cmp r1, r5
	bhs _0805E130
	ldr r0, _0805E12C @ =gCurrentSprite
	ldrh r2, [r0]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r1, r2
	b _0805E138
	.align 2, 0
_0805E120: .4byte gAbilityRestingYPosition
_0805E124: .4byte gAbilityRestingXPosition
_0805E128: .4byte gSubSpriteData1
_0805E12C: .4byte gCurrentSprite
_0805E130:
	ldr r0, _0805E150 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E154 @ =0x0000FDFF
	ands r1, r2
_0805E138:
	strh r1, [r0]
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	cmp r0, r4
	bhs _0805E158
	ldrh r1, [r2]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E15E
	.align 2, 0
_0805E150: .4byte gCurrentSprite
_0805E154: .4byte 0x0000FDFF
_0805E158:
	ldrh r1, [r2]
	ldr r0, _0805E178 @ =0x0000FBFF
	ands r0, r1
_0805E15E:
	strh r0, [r2]
	ldrh r1, [r3, #8]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E17C
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E17C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E194
	.align 2, 0
_0805E178: .4byte 0x0000FBFF
_0805E17C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E18E
	ldrh r0, [r3, #8]
	adds r0, #1
	b _0805E192
_0805E18E:
	ldrh r0, [r3, #8]
	subs r0, #1
_0805E192:
	strh r0, [r3, #8]
_0805E194:
	ldrh r1, [r3, #0xa]
	adds r0, r5, #6
	cmp r1, r0
	bge _0805E1AA
	subs r0, r5, #6
	cmp r1, r0
	ble _0805E1AA
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E1C2
_0805E1AA:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E1BC
	ldrh r0, [r3, #0xa]
	adds r0, #1
	b _0805E1C0
_0805E1BC:
	ldrh r0, [r3, #0xa]
	subs r0, #1
_0805E1C0:
	strh r0, [r3, #0xa]
_0805E1C2:
	cmp r6, #2
	bne _0805E1DA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805E1E0 @ =0x0000FDFF
	ands r0, r1
	ldr r1, _0805E1E4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
_0805E1DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E1E0: .4byte 0x0000FDFF
_0805E1E4: .4byte 0x0000FBFF

	thumb_func_start NightmarePhase2MovementInit
NightmarePhase2MovementInit: @ 0x0805E1E8
	ldr r1, _0805E200 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	movs r0, #0
	strh r3, [r1, #6]
	adds r1, #0x31
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805E200: .4byte gCurrentSprite

	thumb_func_start NightmarePhase2Movement
NightmarePhase2Movement: @ 0x0805E204
	push {r4, r5, r6, lr}
	ldr r3, _0805E224 @ =0x083B7380
	ldr r2, _0805E228 @ =gCurrentSprite
	ldrh r4, [r2, #6]
	lsls r1, r4, #0x10
	lsrs r0, r1, #0x15
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r3, [r0]
	movs r0, #0xcf
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0805E22C
	adds r0, r4, #1
	strh r0, [r2, #6]
	b _0805E23C
	.align 2, 0
_0805E224: .4byte 0x083B7380
_0805E228: .4byte gCurrentSprite
_0805E22C:
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	eors r0, r1
	movs r1, #0
	strh r0, [r2]
	strh r1, [r2, #6]
_0805E23C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E254
	ldr r1, _0805E250 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r3, r0
	b _0805E25A
	.align 2, 0
_0805E250: .4byte gSubSpriteData1
_0805E254:
	ldr r1, _0805E27C @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r3
_0805E25A:
	strh r0, [r1, #0xa]
	adds r6, r1, #0
	ldr r0, _0805E280 @ =0x083B739A
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	lsls r1, r5, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1b
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	cmp r2, #0xfe
	bhi _0805E284
	adds r0, r5, #1
	b _0805E286
	.align 2, 0
_0805E27C: .4byte gSubSpriteData1
_0805E280: .4byte 0x083B739A
_0805E284:
	movs r0, #0
_0805E286:
	strb r0, [r4]
	ldrh r0, [r6, #8]
	adds r0, r3, r0
	strh r0, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NightmareMovingToPhase3Init
NightmareMovingToPhase3Init: @ 0x0805E294
	ldr r0, _0805E2A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805E2A0: .4byte gCurrentSprite

	thumb_func_start NightmareMovingToPhase3
NightmareMovingToPhase3: @ 0x0805E2A4
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805E2D0 @ =gAbilityRestingYPosition
	ldrh r4, [r0]
	ldr r0, _0805E2D4 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	adds r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0805E2D8 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	adds r3, r0, #0
	cmp r1, r5
	bhs _0805E2E0
	ldr r0, _0805E2DC @ =gCurrentSprite
	ldrh r2, [r0]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r1, r2
	b _0805E2E8
	.align 2, 0
_0805E2D0: .4byte gAbilityRestingYPosition
_0805E2D4: .4byte gAbilityRestingXPosition
_0805E2D8: .4byte gSubSpriteData1
_0805E2DC: .4byte gCurrentSprite
_0805E2E0:
	ldr r0, _0805E300 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E304 @ =0x0000FDFF
	ands r1, r2
_0805E2E8:
	strh r1, [r0]
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	cmp r0, r4
	bhs _0805E308
	ldrh r1, [r2]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E30E
	.align 2, 0
_0805E300: .4byte gCurrentSprite
_0805E304: .4byte 0x0000FDFF
_0805E308:
	ldrh r1, [r2]
	ldr r0, _0805E328 @ =0x0000FBFF
	ands r0, r1
_0805E30E:
	strh r0, [r2]
	ldrh r1, [r3, #8]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E32C
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E32C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E344
	.align 2, 0
_0805E328: .4byte 0x0000FBFF
_0805E32C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E33E
	ldrh r0, [r3, #8]
	adds r0, #1
	b _0805E342
_0805E33E:
	ldrh r0, [r3, #8]
	subs r0, #1
_0805E342:
	strh r0, [r3, #8]
_0805E344:
	ldrh r1, [r3, #0xa]
	adds r0, r5, #6
	cmp r1, r0
	bge _0805E35A
	subs r0, r5, #6
	cmp r1, r0
	ble _0805E35A
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E372
_0805E35A:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E36C
	ldrh r0, [r3, #0xa]
	adds r0, #1
	b _0805E370
_0805E36C:
	ldrh r0, [r3, #0xa]
	subs r0, #1
_0805E370:
	strh r0, [r3, #0xa]
_0805E372:
	cmp r6, #2
	bne _0805E37E
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_0805E37E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NightmareReachedPhase3Position
NightmareReachedPhase3Position: @ 0x0805E384
	bx lr
	.align 2, 0

	thumb_func_start NightmarePhase3SlotMovementInit
NightmarePhase3SlotMovementInit: @ 0x0805E388
	bx lr
	.align 2, 0

	thumb_func_start NightmarePhase3SlowMovement
NightmarePhase3SlowMovement: @ 0x0805E38C
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0805E3A8 @ =gSubSpriteData1
	ldrh r2, [r1, #8]
	ldr r0, _0805E3AC @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x80
	adds r4, r1, #0
	cmp r2, r0
	bge _0805E3B0
	adds r0, r2, #1
	strh r0, [r4, #8]
	b _0805E3B2
	.align 2, 0
_0805E3A8: .4byte gSubSpriteData1
_0805E3AC: .4byte gSamusData
_0805E3B0:
	movs r5, #1
_0805E3B2:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	subs r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805E3CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805E3D0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0805E3D6
	.align 2, 0
_0805E3CC: .4byte gPreviousCollisionCheck
_0805E3D0:
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
_0805E3D6:
	cmp r5, #2
	bne _0805E3E2
	ldr r0, _0805E3E8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1b
	strb r1, [r0]
_0805E3E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte gCurrentSprite

	thumb_func_start NightmarePhase3FastMovementInit
NightmarePhase3FastMovementInit: @ 0x0805E3EC
	ldr r3, _0805E414 @ =gCurrentSprite
	adds r0, r3, #0
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
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r3, #6]
	bx lr
	.align 2, 0
_0805E414: .4byte gCurrentSprite

	thumb_func_start NightmarePhase3FastMovement
NightmarePhase3FastMovement: @ 0x0805E418
	push {lr}
	sub sp, #4
	ldr r0, _0805E430 @ =gCurrentSprite
	ldrh r0, [r0, #6]
	cmp r0, #0xf0
	bls _0805E43C
	ldr r0, _0805E434 @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	ldr r0, _0805E438 @ =gXParasiteTargetXPosition
	ldrh r1, [r0]
	b _0805E448
	.align 2, 0
_0805E430: .4byte gCurrentSprite
_0805E434: .4byte gXParasiteTargetYPosition
_0805E438: .4byte gXParasiteTargetXPosition
_0805E43C:
	ldr r1, _0805E464 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r1, #0x16]
_0805E448:
	movs r0, #2
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0x30
	movs r3, #0x30
	bl NightmareMoveToPosition
	ldr r3, _0805E468 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	cmp r0, #0
	beq _0805E46C
	subs r0, #1
	strh r0, [r3, #6]
	b _0805E4B2
	.align 2, 0
_0805E464: .4byte gSamusData
_0805E468: .4byte gCurrentSprite
_0805E46C:
	ldr r2, _0805E4B8 @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	lsrs r0, r0, #2
	ldr r1, _0805E4BC @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _0805E4C0 @ =0xFF730000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x4a
	bhi _0805E4B2
	ldrh r0, [r2, #8]
	lsrs r0, r0, #2
	ldr r1, _0805E4C4 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _0805E4C8 @ =0xFFEB0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x4e
	bhi _0805E4B2
	ldr r0, _0805E4CC @ =gSamusData
	ldrh r1, [r0, #0x16]
	ldrh r0, [r2, #0xa]
	subs r0, #0x40
	cmp r1, r0
	bge _0805E4B2
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0805E4B2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805E4B8: .4byte gSubSpriteData1
_0805E4BC: .4byte gBg1XPosition
_0805E4C0: .4byte 0xFF730000
_0805E4C4: .4byte gBg1YPosition
_0805E4C8: .4byte 0xFFEB0000
_0805E4CC: .4byte gSamusData

	thumb_func_start NightmareDeathFlash
NightmareDeathFlash: @ 0x0805E4D0
	push {lr}
	ldr r2, _0805E510 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805E50A
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805E504
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805E504:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805E50A:
	pop {r0}
	bx r0
	.align 2, 0
_0805E510: .4byte gCurrentSprite

	thumb_func_start NightmareMovingToDeathPosition
NightmareMovingToDeathPosition: @ 0x0805E514
	push {r4, r5, r6, r7, lr}
	bl NightmareDeathFlash
	movs r6, #0
	ldr r0, _0805E540 @ =gAbilityRestingYPosition
	ldrh r3, [r0]
	ldr r0, _0805E544 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	adds r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0805E548 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r0, r4
	bhs _0805E550
	ldr r0, _0805E54C @ =gCurrentSprite
	ldrh r2, [r0]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r1, r2
	b _0805E558
	.align 2, 0
_0805E540: .4byte gAbilityRestingYPosition
_0805E544: .4byte gAbilityRestingXPosition
_0805E548: .4byte gSubSpriteData1
_0805E54C: .4byte gCurrentSprite
_0805E550:
	ldr r0, _0805E574 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E578 @ =0x0000FDFF
	ands r1, r2
_0805E558:
	strh r1, [r0]
	adds r5, r0, #0
	ldr r0, _0805E57C @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, r3
	bhs _0805E580
	ldrh r1, [r5]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E586
	.align 2, 0
_0805E574: .4byte gCurrentSprite
_0805E578: .4byte 0x0000FDFF
_0805E57C: .4byte gSubSpriteData1
_0805E580:
	ldrh r1, [r5]
	ldr r0, _0805E5A0 @ =0x0000FBFF
	ands r0, r1
_0805E586:
	strh r0, [r5]
	ldrh r1, [r2, #8]
	adds r0, r3, #6
	cmp r1, r0
	bge _0805E5A4
	subs r0, r3, #6
	cmp r1, r0
	ble _0805E5A4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E5BC
	.align 2, 0
_0805E5A0: .4byte 0x0000FBFF
_0805E5A4:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E5B6
	ldrh r0, [r2, #8]
	adds r0, #1
	b _0805E5BA
_0805E5B6:
	ldrh r0, [r2, #8]
	subs r0, #1
_0805E5BA:
	strh r0, [r2, #8]
_0805E5BC:
	ldrh r1, [r2, #0xa]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E5D2
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E5D2
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E5EA
_0805E5D2:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E5E4
	ldrh r0, [r2, #0xa]
	adds r0, #1
	b _0805E5E8
_0805E5E4:
	ldrh r0, [r2, #0xa]
	subs r0, #1
_0805E5E8:
	strh r0, [r2, #0xa]
_0805E5EA:
	cmp r6, #2
	bne _0805E612
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E612
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	movs r0, #0x3c
	strb r0, [r2]
	movs r0, #0xa9
	lsls r0, r0, #2
	bl SoundPlay_3b1c
_0805E612:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NightmareTurningIntoCoreX
NightmareTurningIntoCoreX: @ 0x0805E618
	push {r4, r5, lr}
	ldr r4, _0805E650 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _0805E654
	bl NightmareDeathFlash
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E6A2
	ldrh r1, [r4]
	movs r0, #0x20
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0805E6A2
	.align 2, 0
_0805E650: .4byte gCurrentSprite
_0805E654:
	ldr r2, _0805E68C @ =gWrittenToMosaic_H
	ldr r1, _0805E690 @ =sXParasiteMosaicValues
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805E67A
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x48
	strb r0, [r4, #0x1d]
_0805E67A:
	ldrh r0, [r4, #6]
	cmp r0, #0x13
	bhi _0805E694
	adds r2, r0, #0
	movs r0, #0x48
	movs r1, #0
	bl SpriteLoadGfx
	b _0805E6A2
	.align 2, 0
_0805E68C: .4byte gWrittenToMosaic_H
_0805E690: .4byte sXParasiteMosaicValues
_0805E694:
	cmp r0, #0x14
	bne _0805E6A2
	movs r0, #0x48
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805E6A2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NightmarePartInit
NightmarePartInit: @ 0x0805E6A8
	push {r4, lr}
	ldr r3, _0805E6D8 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _0805E6DC @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r2, [r0]
	ldrb r0, [r3, #0x1e]
	mov ip, r3
	cmp r0, #0xd
	bls _0805E6CE
	b _0805EAC8
_0805E6CE:
	lsls r0, r0, #2
	ldr r1, _0805E6E0 @ =_0805E6E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805E6D8: .4byte gCurrentSprite
_0805E6DC: .4byte 0x0000FFFB
_0805E6E0: .4byte _0805E6E4
_0805E6E4: @ jump table
	.4byte _0805E71C @ case 0
	.4byte _0805E764 @ case 1
	.4byte _0805E7A8 @ case 2
	.4byte _0805E7F4 @ case 3
	.4byte _0805E844 @ case 4
	.4byte _0805E880 @ case 5
	.4byte _0805E8B8 @ case 6
	.4byte _0805E8F0 @ case 7
	.4byte _0805E928 @ case 8
	.4byte _0805E960 @ case 9
	.4byte _0805EAC8 @ case 10
	.4byte _0805E9D8 @ case 11
	.4byte _0805EA14 @ case 12
	.4byte _0805EA70 @ case 13
_0805E71C:
	mov r2, ip
	adds r2, #0x22
	movs r1, #0
	movs r0, #9
	strb r0, [r2]
	adds r2, #5
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _0805E760 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r2, #4
	movs r0, #4
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	b _0805E838
	.align 2, 0
_0805E760: .4byte 0x0000FFFC
_0805E764:
	mov r1, ip
	adds r1, #0x22
	movs r2, #0
	movs r0, #9
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805E7A4 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r2, #4
	movs r0, #4
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	b _0805E838
	.align 2, 0
_0805E7A4: .4byte 0x0000FFFC
_0805E7A8:
	mov r1, ip
	adds r1, #0x22
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	movs r3, #0
	ldr r1, _0805E7EC @ =0x0000FF60
	mov r0, ip
	strh r1, [r0, #0xa]
	ldr r0, _0805E7F0 @ =0x0000FFB0
	mov r4, ip
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r2, [r4, #0x10]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	b _0805EACE
	.align 2, 0
_0805E7EC: .4byte 0x0000FF60
_0805E7F0: .4byte 0x0000FFB0
_0805E7F4:
	mov r2, ip
	adds r2, #0x22
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	adds r2, #5
	movs r0, #0x38
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x30
	strb r0, [r1]
	ldr r1, _0805E840 @ =0x0000FFFC
	mov r3, ip
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4]
_0805E838:
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EACE
	.align 2, 0
_0805E840: .4byte 0x0000FFFC
_0805E844:
	mov r1, ip
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r0, _0805E87C @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r1, #0x20
	mov r3, ip
	strh r1, [r3, #0xc]
	adds r0, #0x20
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EAA4
	.align 2, 0
_0805E87C: .4byte 0x0000FFC0
_0805E880:
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E8B0 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #8
	strh r0, [r2, #0xc]
	ldr r0, _0805E8B4 @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x30
	b _0805EA42
	.align 2, 0
_0805E8B0: .4byte 0x0000FFA0
_0805E8B4: .4byte 0x0000FFE8
_0805E8B8:
	mov r1, ip
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E8E8 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #8
	strh r0, [r2, #0xc]
	ldr r0, _0805E8EC @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x40
	b _0805EA42
	.align 2, 0
_0805E8E8: .4byte 0x0000FFA0
_0805E8EC: .4byte 0x0000FFE8
_0805E8F0:
	mov r1, ip
	adds r1, #0x22
	movs r0, #7
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E920 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0805E924 @ =0x0000FFFC
	strh r0, [r2, #0xe]
	movs r0, #0x40
	b _0805EA42
	.align 2, 0
_0805E920: .4byte 0x0000FFA0
_0805E924: .4byte 0x0000FFFC
_0805E928:
	mov r1, ip
	adds r1, #0x22
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E958 @ =0x0000FFC0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _0805E95C @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x48
	b _0805EA42
	.align 2, 0
_0805E958: .4byte 0x0000FFC0
_0805E95C: .4byte 0x0000FFD0
_0805E960:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #5
	movs r0, #4
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0805E9CC @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r0, #0x60
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	movs r0, #0x80
	strh r0, [r3, #0x10]
	mov r1, ip
	adds r1, #0x35
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0805E9D0 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r3, #0x14]
	ldr r0, _0805E9D4 @ =gSubSpriteData1
	strh r1, [r0, #0xc]
	mov r0, ip
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0805EACE
	.align 2, 0
_0805E9CC: .4byte 0x0000FFFC
_0805E9D0: .4byte sSecondarySpriteStats
_0805E9D4: .4byte gSubSpriteData1
_0805E9D8:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r2, #0
	ldr r0, _0805EA10 @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r1, #0x20
	mov r3, ip
	strh r1, [r3, #0xc]
	adds r0, #0x50
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EAA4
	.align 2, 0
_0805EA10: .4byte 0x0000FFA0
_0805EA14:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xe
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r1, #0
	ldr r0, _0805EA68 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0805EA6C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0805EA42:
	strh r0, [r2, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r1, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	mov r4, ip
	strh r0, [r4, #0x14]
	b _0805EACE
	.align 2, 0
_0805EA68: .4byte 0x0000FFA0
_0805EA6C: .4byte 0x0000FFF0
_0805EA70:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xf
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r1, #0
	ldr r0, _0805EAC4 @ =0x0000FFC0
	mov r3, ip
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #0x30
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r1, [r0]
_0805EAA4:
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
	b _0805EACE
	.align 2, 0
_0805EAC4: .4byte 0x0000FFC0
_0805EAC8:
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
_0805EACE:
	bl NightmareSyncSubSprites
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NightmarePartDying
NightmarePartDying: @ 0x0805EAD8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805EB0C @ =gCurrentSprite
	ldrh r3, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	movs r4, #0
	orrs r1, r3
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x25
	strb r4, [r1]
	ldr r3, _0805EB10 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x20
	ldrb r0, [r1]
	adds r2, #0x20
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB0C: .4byte gCurrentSprite
_0805EB10: .4byte gSpriteData

	thumb_func_start NightmarePartSpawnBeam
NightmarePartSpawnBeam: @ 0x0805EB14
	push {lr}
	sub sp, #0xc
	ldr r1, _0805EB4C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0xb
	bne _0805EB44
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	bne _0805EB44
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x81
	movs r1, #0
	bl SpriteSpawnSecondary
_0805EB44:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0805EB4C: .4byte gCurrentSprite

	thumb_func_start NightmarePartRightArmTop
NightmarePartRightArmTop: @ 0x0805EB50
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0805EB84 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805EB8C
	cmp r0, #0x18
	beq _0805EBC4
	ldr r1, _0805EB88 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805EC0E
	movs r0, #0
	strh r0, [r4]
	b _0805EC0E
	.align 2, 0
_0805EB84: .4byte gCurrentSprite
_0805EB88: .4byte gSpriteData
_0805EB8C:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EBBC @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0805EC0E
	ldr r0, _0805EBC0 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	strb r0, [r5]
	b _0805EC0E
	.align 2, 0
_0805EBBC: .4byte gSpriteData
_0805EBC0: .4byte 0x00007FFB
_0805EBC4:
	ldr r1, _0805EC00 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0805EC04
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r5]
	b _0805EC0E
	.align 2, 0
_0805EC00: .4byte gSpriteData
_0805EC04:
	cmp r0, #0x20
	bne _0805EC0E
	adds r0, r3, #0
	bl NightmarePartDying
_0805EC0E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePartRightArmBottom
NightmarePartRightArmBottom: @ 0x0805EC18
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0805EC4C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805EC54
	cmp r0, #0x18
	beq _0805EC8C
	ldr r1, _0805EC50 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805ECD6
	movs r0, #0
	strh r0, [r4]
	b _0805ECD6
	.align 2, 0
_0805EC4C: .4byte gCurrentSprite
_0805EC50: .4byte gSpriteData
_0805EC54:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EC84 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0805ECD6
	ldr r0, _0805EC88 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	strb r0, [r5]
	b _0805ECD6
	.align 2, 0
_0805EC84: .4byte gSpriteData
_0805EC88: .4byte 0x00007FFB
_0805EC8C:
	ldr r1, _0805ECC8 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0805ECCC
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #4
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r5]
	b _0805ECD6
	.align 2, 0
_0805ECC8: .4byte gSpriteData
_0805ECCC:
	cmp r0, #0x20
	bne _0805ECD6
	adds r0, r3, #0
	bl NightmarePartDying
_0805ECD6:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePartRightTurret1
NightmarePartRightTurret1: @ 0x0805ECE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805ED04 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805ED54
	cmp r1, #0x18
	bgt _0805ED08
	cmp r1, #2
	beq _0805ED14
	b _0805EE64
	.align 2, 0
_0805ED04: .4byte gCurrentSprite
_0805ED08:
	cmp r1, #0x1a
	beq _0805EDB0
	cmp r1, #0x1c
	bne _0805ED12
	b _0805EE1C
_0805ED12:
	b _0805EE64
_0805ED14:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805ED4C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805ED32
	b _0805EE7C
_0805ED32:
	ldr r0, _0805ED50 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x6c
	strb r0, [r1]
	strb r2, [r7]
	b _0805EE7C
	.align 2, 0
_0805ED4C: .4byte gSpriteData
_0805ED50: .4byte 0x00007FFB
_0805ED54:
	ldr r0, _0805ED84 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805EDC2
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805ED78
	b _0805EE7C
_0805ED78:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805ED8C
	ldr r0, _0805ED88 @ =0x083BDBEC
	b _0805ED9A
	.align 2, 0
_0805ED84: .4byte gSpriteData
_0805ED88: .4byte 0x083BDBEC
_0805ED8C:
	cmp r1, #0x1c
	bne _0805ED98
	ldr r0, _0805ED94 @ =0x083BDBEC
	b _0805ED9A
	.align 2, 0
_0805ED94: .4byte 0x083BDBEC
_0805ED98:
	ldr r0, _0805EDAC @ =0x083BD8E4
_0805ED9A:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805EE7C
	.align 2, 0
_0805EDAC: .4byte 0x083BD8E4
_0805EDB0:
	ldr r0, _0805EDD8 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805EDE0
_0805EDC2:
	ldr r0, _0805EDDC @ =0x083BD874
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805EE7C
	.align 2, 0
_0805EDD8: .4byte gSpriteData
_0805EDDC: .4byte 0x083BD874
_0805EDE0:
	ldr r1, [r4, #0x18]
	ldr r0, _0805EE10 @ =0x083BD8E4
	cmp r1, r0
	bne _0805EDEC
	bl NightmarePartSpawnBeam
_0805EDEC:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805EE7C
	ldr r0, _0805EE14 @ =0x083BD874
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805EE18 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805EE7C
	.align 2, 0
_0805EE10: .4byte 0x083BD8E4
_0805EE14: .4byte 0x083BD874
_0805EE18: .4byte gBossWork2
_0805EE1C:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805EE60 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805EE7C
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805EE7C
	.align 2, 0
_0805EE60: .4byte gSpriteData
_0805EE64:
	ldr r1, _0805EE84 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805EE7C
	movs r0, #0
	strh r0, [r4]
_0805EE7C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE84: .4byte gSpriteData

	thumb_func_start NightmarePartRightTurret2
NightmarePartRightTurret2: @ 0x0805EE88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805EEAC @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805EEFC
	cmp r1, #0x18
	bgt _0805EEB0
	cmp r1, #2
	beq _0805EEBC
	b _0805F00C
	.align 2, 0
_0805EEAC: .4byte gCurrentSprite
_0805EEB0:
	cmp r1, #0x1a
	beq _0805EF58
	cmp r1, #0x1c
	bne _0805EEBA
	b _0805EFC4
_0805EEBA:
	b _0805F00C
_0805EEBC:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EEF4 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805EEDA
	b _0805F024
_0805EEDA:
	ldr r0, _0805EEF8 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x68
	strb r0, [r1]
	strb r2, [r7]
	b _0805F024
	.align 2, 0
_0805EEF4: .4byte gSpriteData
_0805EEF8: .4byte 0x00007FFB
_0805EEFC:
	ldr r0, _0805EF2C @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805EF6A
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805EF20
	b _0805F024
_0805EF20:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805EF34
	ldr r0, _0805EF30 @ =0x083BDC64
	b _0805EF42
	.align 2, 0
_0805EF2C: .4byte gSpriteData
_0805EF30: .4byte 0x083BDC64
_0805EF34:
	cmp r1, #0x1c
	bne _0805EF40
	ldr r0, _0805EF3C @ =0x083BDC64
	b _0805EF42
	.align 2, 0
_0805EF3C: .4byte 0x083BDC64
_0805EF40:
	ldr r0, _0805EF54 @ =0x083BD95C
_0805EF42:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F024
	.align 2, 0
_0805EF54: .4byte 0x083BD95C
_0805EF58:
	ldr r0, _0805EF80 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805EF88
_0805EF6A:
	ldr r0, _0805EF84 @ =0x083BD884
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F024
	.align 2, 0
_0805EF80: .4byte gSpriteData
_0805EF84: .4byte 0x083BD884
_0805EF88:
	ldr r1, [r4, #0x18]
	ldr r0, _0805EFB8 @ =0x083BD95C
	cmp r1, r0
	bne _0805EF94
	bl NightmarePartSpawnBeam
_0805EF94:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805F024
	ldr r0, _0805EFBC @ =0x083BD884
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805EFC0 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F024
	.align 2, 0
_0805EFB8: .4byte 0x083BD95C
_0805EFBC: .4byte 0x083BD884
_0805EFC0: .4byte gBossWork2
_0805EFC4:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F008 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F024
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F024
	.align 2, 0
_0805F008: .4byte gSpriteData
_0805F00C:
	ldr r1, _0805F02C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F024
	movs r0, #0
	strh r0, [r4]
_0805F024:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F02C: .4byte gSpriteData

	thumb_func_start NightmarePartRightTurret3
NightmarePartRightTurret3: @ 0x0805F030
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F054 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F0A4
	cmp r1, #0x18
	bgt _0805F058
	cmp r1, #2
	beq _0805F064
	b _0805F1B0
	.align 2, 0
_0805F054: .4byte gCurrentSprite
_0805F058:
	cmp r1, #0x1a
	beq _0805F0F4
	cmp r1, #0x1c
	bne _0805F062
	b _0805F168
_0805F062:
	b _0805F1B0
_0805F064:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F09C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F082
	b _0805F1C8
_0805F082:
	ldr r0, _0805F0A0 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	strb r2, [r7]
	b _0805F1C8
	.align 2, 0
_0805F09C: .4byte gSpriteData
_0805F0A0: .4byte 0x00007FFB
_0805F0A4:
	ldr r0, _0805F0D4 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F106
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F0C8
	b _0805F1C8
_0805F0C8:
	ldrb r0, [r1]
	cmp r0, #0x1c
	bne _0805F0DC
	ldr r0, _0805F0D8 @ =0x083BDCDC
	b _0805F0DE
	.align 2, 0
_0805F0D4: .4byte gSpriteData
_0805F0D8: .4byte 0x083BDCDC
_0805F0DC:
	ldr r0, _0805F0F0 @ =0x083BD9D4
_0805F0DE:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F1C8
	.align 2, 0
_0805F0F0: .4byte 0x083BD9D4
_0805F0F4:
	ldr r0, _0805F11C @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F124
_0805F106:
	ldr r0, _0805F120 @ =0x083BD894
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F1C8
	.align 2, 0
_0805F11C: .4byte gSpriteData
_0805F120: .4byte 0x083BD894
_0805F124:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F158 @ =0x083BD9D4
	cmp r1, r0
	bne _0805F130
	bl NightmarePartSpawnBeam
_0805F130:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805F1C8
	ldr r0, _0805F15C @ =0x083BD894
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r2, _0805F160 @ =gBossWork2
	ldr r0, _0805F164 @ =gBossWork3
	ldrb r1, [r0]
	strb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F1C8
	.align 2, 0
_0805F158: .4byte 0x083BD9D4
_0805F15C: .4byte 0x083BD894
_0805F160: .4byte gBossWork2
_0805F164: .4byte gBossWork3
_0805F168:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F1AC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F1C8
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #3
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F1C8
	.align 2, 0
_0805F1AC: .4byte gSpriteData
_0805F1B0:
	ldr r1, _0805F1D0 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F1C8
	movs r0, #0
	strh r0, [r4]
_0805F1C8:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1D0: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret1
NightmarePartLeftTurret1: @ 0x0805F1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F1F8 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F248
	cmp r1, #0x18
	bgt _0805F1FC
	cmp r1, #2
	beq _0805F208
	b _0805F358
	.align 2, 0
_0805F1F8: .4byte gCurrentSprite
_0805F1FC:
	cmp r1, #0x1a
	beq _0805F2A4
	cmp r1, #0x1c
	bne _0805F206
	b _0805F310
_0805F206:
	b _0805F358
_0805F208:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F240 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F226
	b _0805F370
_0805F226:
	ldr r0, _0805F244 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	strb r2, [r7]
	b _0805F370
	.align 2, 0
_0805F240: .4byte gSpriteData
_0805F244: .4byte 0x00007FFB
_0805F248:
	ldr r0, _0805F278 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F2B6
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F26C
	b _0805F370
_0805F26C:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805F280
	ldr r0, _0805F27C @ =0x083BDD54
	b _0805F28E
	.align 2, 0
_0805F278: .4byte gSpriteData
_0805F27C: .4byte 0x083BDD54
_0805F280:
	cmp r1, #0x1c
	bne _0805F28C
	ldr r0, _0805F288 @ =0x083BDD54
	b _0805F28E
	.align 2, 0
_0805F288: .4byte 0x083BDD54
_0805F28C:
	ldr r0, _0805F2A0 @ =0x083BDA4C
_0805F28E:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F370
	.align 2, 0
_0805F2A0: .4byte 0x083BDA4C
_0805F2A4:
	ldr r0, _0805F2CC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F2D4
_0805F2B6:
	ldr r0, _0805F2D0 @ =0x083BD8B4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F370
	.align 2, 0
_0805F2CC: .4byte gSpriteData
_0805F2D0: .4byte 0x083BD8B4
_0805F2D4:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F304 @ =0x083BDA4C
	cmp r1, r0
	bne _0805F2E0
	bl NightmarePartSpawnBeam
_0805F2E0:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805F370
	ldr r0, _0805F308 @ =0x083BD8B4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F30C @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F370
	.align 2, 0
_0805F304: .4byte 0x083BDA4C
_0805F308: .4byte 0x083BD8B4
_0805F30C: .4byte gBossWork2
_0805F310:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F354 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F370
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #5
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F370
	.align 2, 0
_0805F354: .4byte gSpriteData
_0805F358:
	ldr r1, _0805F378 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F370
	movs r0, #0
	strh r0, [r4]
_0805F370:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F378: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret2
NightmarePartLeftTurret2: @ 0x0805F37C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F3A0 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F3F0
	cmp r1, #0x18
	bgt _0805F3A4
	cmp r1, #2
	beq _0805F3B0
	b _0805F500
	.align 2, 0
_0805F3A0: .4byte gCurrentSprite
_0805F3A4:
	cmp r1, #0x1a
	beq _0805F44C
	cmp r1, #0x1c
	bne _0805F3AE
	b _0805F4B8
_0805F3AE:
	b _0805F500
_0805F3B0:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F3E8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F3CE
	b _0805F518
_0805F3CE:
	ldr r0, _0805F3EC @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x74
	strb r0, [r1]
	strb r2, [r7]
	b _0805F518
	.align 2, 0
_0805F3E8: .4byte gSpriteData
_0805F3EC: .4byte 0x00007FFB
_0805F3F0:
	ldr r0, _0805F420 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F45E
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F414
	b _0805F518
_0805F414:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805F428
	ldr r0, _0805F424 @ =0x083BDDCC
	b _0805F436
	.align 2, 0
_0805F420: .4byte gSpriteData
_0805F424: .4byte 0x083BDDCC
_0805F428:
	cmp r1, #0x1c
	bne _0805F434
	ldr r0, _0805F430 @ =0x083BDDCC
	b _0805F436
	.align 2, 0
_0805F430: .4byte 0x083BDDCC
_0805F434:
	ldr r0, _0805F448 @ =0x083BDAC4
_0805F436:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F518
	.align 2, 0
_0805F448: .4byte 0x083BDAC4
_0805F44C:
	ldr r0, _0805F474 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F47C
_0805F45E:
	ldr r0, _0805F478 @ =0x083BD8C4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F518
	.align 2, 0
_0805F474: .4byte gSpriteData
_0805F478: .4byte 0x083BD8C4
_0805F47C:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F4AC @ =0x083BDAC4
	cmp r1, r0
	bne _0805F488
	bl NightmarePartSpawnBeam
_0805F488:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805F518
	ldr r0, _0805F4B0 @ =0x083BD8C4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F4B4 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F518
	.align 2, 0
_0805F4AC: .4byte 0x083BDAC4
_0805F4B0: .4byte 0x083BD8C4
_0805F4B4: .4byte gBossWork2
_0805F4B8:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F4FC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F518
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #6
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F518
	.align 2, 0
_0805F4FC: .4byte gSpriteData
_0805F500:
	ldr r1, _0805F520 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F518
	movs r0, #0
	strh r0, [r4]
_0805F518:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F520: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret3
NightmarePartLeftTurret3: @ 0x0805F524
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F548 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F598
	cmp r1, #0x18
	bgt _0805F54C
	cmp r1, #2
	beq _0805F558
	b _0805F69C
	.align 2, 0
_0805F548: .4byte gCurrentSprite
_0805F54C:
	cmp r1, #0x1a
	beq _0805F5E8
	cmp r1, #0x1c
	bne _0805F556
	b _0805F654
_0805F556:
	b _0805F69C
_0805F558:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F590 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F576
	b _0805F6B4
_0805F576:
	ldr r0, _0805F594 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x70
	strb r0, [r1]
	strb r2, [r7]
	b _0805F6B4
	.align 2, 0
_0805F590: .4byte gSpriteData
_0805F594: .4byte 0x00007FFB
_0805F598:
	ldr r0, _0805F5C8 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F5FA
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F5BC
	b _0805F6B4
_0805F5BC:
	ldrb r0, [r1]
	cmp r0, #0x1c
	bne _0805F5D0
	ldr r0, _0805F5CC @ =0x083BDE44
	b _0805F5D2
	.align 2, 0
_0805F5C8: .4byte gSpriteData
_0805F5CC: .4byte 0x083BDE44
_0805F5D0:
	ldr r0, _0805F5E4 @ =0x083BDB3C
_0805F5D2:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F6B4
	.align 2, 0
_0805F5E4: .4byte 0x083BDB3C
_0805F5E8:
	ldr r0, _0805F610 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F618
_0805F5FA:
	ldr r0, _0805F614 @ =0x083BD8D4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F6B4
	.align 2, 0
_0805F610: .4byte gSpriteData
_0805F614: .4byte 0x083BD8D4
_0805F618:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F648 @ =0x083BDB3C
	cmp r1, r0
	bne _0805F624
	bl NightmarePartSpawnBeam
_0805F624:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	beq _0805F6B4
	ldr r0, _0805F64C @ =0x083BD8D4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F650 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F6B4
	.align 2, 0
_0805F648: .4byte 0x083BDB3C
_0805F64C: .4byte 0x083BD8D4
_0805F650: .4byte gBossWork2
_0805F654:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F698 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F6B4
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #7
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F6B4
	.align 2, 0
_0805F698: .4byte gSpriteData
_0805F69C:
	ldr r1, _0805F6BC @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F6B4
	movs r0, #0
	strh r0, [r4]
_0805F6B4:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F6BC: .4byte gSpriteData

	thumb_func_start NightmarePartEye
NightmarePartEye: @ 0x0805F6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0805F6F8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r6, [r0]
	adds r0, #0x13
	ldrb r4, [r0]
	ldr r1, _0805F6FC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r7, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805F704
	ldr r0, _0805F700 @ =0x000002A7
	bl SoundPlayNotAlreadyPlaying
	b _0805F70E
	.align 2, 0
_0805F6F8: .4byte gCurrentSprite
_0805F6FC: .4byte gSpriteData
_0805F700: .4byte 0x000002A7
_0805F704:
	cmp r1, #5
	bne _0805F70E
	ldr r0, _0805F72C @ =0x000002AA
	bl SoundPlayNotAlreadyPlaying
_0805F70E:
	ldr r1, _0805F730 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #2
	adds r5, r1, #0
	cmp r0, #0x20
	bls _0805F720
	b _0805FAB8
_0805F720:
	lsls r0, r0, #2
	ldr r1, _0805F734 @ =_0805F738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805F72C: .4byte 0x000002AA
_0805F730: .4byte gCurrentSprite
_0805F734: .4byte _0805F738
_0805F738: @ jump table
	.4byte _0805F7BC @ case 0
	.4byte _0805FAB8 @ case 1
	.4byte _0805FAB8 @ case 2
	.4byte _0805FAB8 @ case 3
	.4byte _0805FAB8 @ case 4
	.4byte _0805FAB8 @ case 5
	.4byte _0805FAB8 @ case 6
	.4byte _0805FAB8 @ case 7
	.4byte _0805FAB8 @ case 8
	.4byte _0805FAB8 @ case 9
	.4byte _0805FAB8 @ case 10
	.4byte _0805FAB8 @ case 11
	.4byte _0805FAB8 @ case 12
	.4byte _0805FAB8 @ case 13
	.4byte _0805FAB8 @ case 14
	.4byte _0805FAB8 @ case 15
	.4byte _0805FAB8 @ case 16
	.4byte _0805FAB8 @ case 17
	.4byte _0805FAB8 @ case 18
	.4byte _0805FAB8 @ case 19
	.4byte _0805FAB8 @ case 20
	.4byte _0805FAB8 @ case 21
	.4byte _0805F81C @ case 22
	.4byte _0805FAB8 @ case 23
	.4byte _0805F860 @ case 24
	.4byte _0805FAB8 @ case 25
	.4byte _0805F8E8 @ case 26
	.4byte _0805FAB8 @ case 27
	.4byte _0805F94C @ case 28
	.4byte _0805FAB8 @ case 29
	.4byte _0805F9D0 @ case 30
	.4byte _0805FAB8 @ case 31
	.4byte _0805FA40 @ case 32
_0805F7BC:
	ldr r0, _0805F808 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x1a
	beq _0805F7D0
	b _0805FACC
_0805F7D0:
	ldrh r1, [r5]
	ldr r0, _0805F80C @ =0x0000DFFF
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r5]
	ldr r0, _0805F810 @ =0x083BD5D4
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	strh r7, [r5, #0x14]
	ldr r0, _0805F814 @ =gSubSpriteData1
	strh r7, [r0, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #0x80
	ldrh r1, [r5, #4]
	subs r1, #0x50
	movs r2, #0x3a
	bl ParticleSet
	ldr r0, _0805F818 @ =0x000002A9
	bl SoundPlay_3b1c
	b _0805FACC
	.align 2, 0
_0805F808: .4byte gSpriteData
_0805F80C: .4byte 0x0000DFFF
_0805F810: .4byte 0x083BD5D4
_0805F814: .4byte gSubSpriteData1
_0805F818: .4byte 0x000002A9
_0805F81C:
	ldr r1, _0805F854 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r6, r0, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, _0805F858 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	strh r0, [r1, #0xc]
	ldrh r4, [r1, #0xc]
	lsls r0, r7, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	blt _0805F848
	b _0805FACC
_0805F848:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _0805F85C @ =0x083BD754
	b _0805F920
	.align 2, 0
_0805F854: .4byte gSpriteData
_0805F858: .4byte gSubSpriteData1
_0805F85C: .4byte 0x083BD754
_0805F860:
	ldr r0, _0805F8D4 @ =gSpriteData
	mov sb, r0
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r6, r0, #3
	mov r1, sb
	adds r4, r6, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	movs r2, #0
	mov r8, r2
	strb r1, [r0]
	ldr r1, _0805F8D8 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _0805F894
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
_0805F894:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	bne _0805F89E
	b _0805FACC
_0805F89E:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0805F8DC @ =0x083BD654
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r0, sb
	adds r0, #0x18
	adds r0, r6, r0
	ldr r1, _0805F8E0 @ =0x083BD67C
	str r1, [r0]
	strb r7, [r4, #0x1c]
	mov r1, r8
	strh r1, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805F8E4 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	b _0805FACC
	.align 2, 0
_0805F8D4: .4byte gSpriteData
_0805F8D8: .4byte gSubSpriteData1
_0805F8DC: .4byte 0x083BD654
_0805F8E0: .4byte 0x083BD67C
_0805F8E4: .4byte 0x0000FFFB
_0805F8E8:
	ldr r1, _0805F93C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r6, r0, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0805F940 @ =gSubSpriteData1
	ldrh r4, [r5, #0x14]
	strh r4, [r0, #0xc]
	adds r0, r7, #0
	movs r1, #3
	bl __udivsi3
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	blo _0805F916
	b _0805FACC
_0805F916:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _0805F944 @ =0x083BD76C
_0805F920:
	str r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x16]
	ldrh r0, [r6]
	movs r1, #4
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0805F948 @ =0x000002AD
	bl SoundPlay
	b _0805FACC
	.align 2, 0
_0805F93C: .4byte gSpriteData
_0805F940: .4byte gSubSpriteData1
_0805F944: .4byte 0x083BD76C
_0805F948: .4byte 0x000002AD
_0805F94C:
	ldr r2, _0805F9BC @ =gSpriteData
	mov sb, r2
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r6, r0, #3
	adds r4, r6, r2
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	movs r2, #0
	mov r8, r2
	strb r1, [r0]
	ldr r1, _0805F9C0 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _0805F97E
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
_0805F97E:
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	bne _0805F988
	b _0805FACC
_0805F988:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0805F9C4 @ =0x083BD6D4
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r0, sb
	adds r0, #0x18
	adds r0, r6, r0
	ldr r1, _0805F9C8 @ =0x083BD6FC
	str r1, [r0]
	strb r7, [r4, #0x1c]
	mov r1, r8
	strh r1, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805F9CC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	b _0805FACC
	.align 2, 0
_0805F9BC: .4byte gSpriteData
_0805F9C0: .4byte gSubSpriteData1
_0805F9C4: .4byte 0x083BD6D4
_0805F9C8: .4byte 0x083BD6FC
_0805F9CC: .4byte 0x0000FFFB
_0805F9D0:
	ldr r2, _0805FA38 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, _0805FA3C @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r3, #0
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805FACC
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2e
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r2
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	b _0805FACC
	.align 2, 0
_0805FA38: .4byte gSpriteData
_0805FA3C: .4byte gSubSpriteData1
_0805FA40:
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805FA76
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805FA70
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805FA70:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
_0805FA76:
	ldr r2, _0805FAB4 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FAA0
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x24
	strb r0, [r1]
	ldrh r1, [r5]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r5]
_0805FAA0:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
	b _0805FACC
	.align 2, 0
_0805FAB4: .4byte gSpriteData
_0805FAB8:
	ldr r0, _0805FAD8 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x48
	bne _0805FACC
	movs r0, #0
	strh r0, [r5]
_0805FACC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAD8: .4byte gSpriteData

	thumb_func_start NightmarePartMouth
NightmarePartMouth: @ 0x0805FADC
	push {r4, r5, lr}
	ldr r3, _0805FB0C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r4, [r0]
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805FB14
	cmp r0, #0x18
	beq _0805FB54
	ldr r0, _0805FB10 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x48
	bne _0805FB94
	movs r0, #0
	strh r0, [r3]
	b _0805FB94
	.align 2, 0
_0805FB0C: .4byte gCurrentSprite
_0805FB10: .4byte gSpriteData
_0805FB14:
	ldr r0, _0805FB48 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r4, r1, #0
	adds r4, #0x24
	ldrb r0, [r4]
	cmp r0, #0x1a
	bne _0805FB94
	ldrh r1, [r3]
	ldr r0, _0805FB4C @ =0x0000DFFF
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r3]
	ldr r0, _0805FB50 @ =0x083BD5FC
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r2, [r3, #0x16]
	movs r0, #0x18
	strb r0, [r5]
	movs r0, #0x1e
	strb r0, [r4]
	b _0805FB94
	.align 2, 0
_0805FB48: .4byte gSpriteData
_0805FB4C: .4byte 0x0000DFFF
_0805FB50: .4byte 0x083BD5FC
_0805FB54:
	ldrh r0, [r3, #0x16]
	cmp r0, #0
	bne _0805FB68
	ldrb r0, [r3, #0x1c]
	cmp r0, #1
	bne _0805FB68
	movs r0, #0xab
	lsls r0, r0, #2
	bl SoundPlay
_0805FB68:
	ldr r1, _0805FB9C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FB94
	ldr r2, _0805FBA0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x24
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
_0805FB94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB9C: .4byte gSpriteData
_0805FBA0: .4byte gCurrentSprite

	thumb_func_start NightmarePartEyeSludge
NightmarePartEyeSludge: @ 0x0805FBA4
	push {r4, r5, r6, lr}
	ldr r2, _0805FBD4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r1, _0805FBD8 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #2
	adds r5, r2, #0
	cmp r0, #0x1c
	bls _0805FBC8
	b _0805FD86
_0805FBC8:
	lsls r0, r0, #2
	ldr r1, _0805FBDC @ =_0805FBE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FBD4: .4byte gCurrentSprite
_0805FBD8: .4byte sSecondarySpriteStats
_0805FBDC: .4byte _0805FBE0
_0805FBE0: @ jump table
	.4byte _0805FC54 @ case 0
	.4byte _0805FD86 @ case 1
	.4byte _0805FD86 @ case 2
	.4byte _0805FD86 @ case 3
	.4byte _0805FD86 @ case 4
	.4byte _0805FD86 @ case 5
	.4byte _0805FD86 @ case 6
	.4byte _0805FD86 @ case 7
	.4byte _0805FD86 @ case 8
	.4byte _0805FD86 @ case 9
	.4byte _0805FD86 @ case 10
	.4byte _0805FD86 @ case 11
	.4byte _0805FD86 @ case 12
	.4byte _0805FD86 @ case 13
	.4byte _0805FD86 @ case 14
	.4byte _0805FD86 @ case 15
	.4byte _0805FD86 @ case 16
	.4byte _0805FD86 @ case 17
	.4byte _0805FD86 @ case 18
	.4byte _0805FD86 @ case 19
	.4byte _0805FD86 @ case 20
	.4byte _0805FD86 @ case 21
	.4byte _0805FC90 @ case 22
	.4byte _0805FD86 @ case 23
	.4byte _0805FCC8 @ case 24
	.4byte _0805FD86 @ case 25
	.4byte _0805FD10 @ case 26
	.4byte _0805FD86 @ case 27
	.4byte _0805FD58 @ case 28
_0805FC54:
	ldr r0, _0805FC84 @ =gSubSpriteData1
	ldrh r4, [r0, #0xc]
	lsls r0, r3, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	blt _0805FC66
	b _0805FD9E
_0805FC66:
	ldrh r1, [r5]
	ldr r0, _0805FC88 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r5]
	ldr r0, _0805FC8C @ =0x083BD4EC
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	b _0805FD00
	.align 2, 0
_0805FC84: .4byte gSubSpriteData1
_0805FC88: .4byte 0x0000FFFB
_0805FC8C: .4byte 0x083BD4EC
_0805FC90:
	ldr r4, _0805FCC0 @ =gSubSpriteData1
	adds r0, r3, #0
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blo _0805FCA6
	b _0805FD9E
_0805FCA6:
	ldr r0, _0805FCC4 @ =0x083BD51C
	str r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x1a
	b _0805FD00
	.align 2, 0
_0805FCC0: .4byte gSubSpriteData1
_0805FCC4: .4byte 0x083BD51C
_0805FCC8:
	ldr r0, _0805FCE4 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	bne _0805FCE8
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x1c
	b _0805FD00
	.align 2, 0
_0805FCE4: .4byte gSubSpriteData1
_0805FCE8:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FD9E
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x78
_0805FD00:
	strb r0, [r1]
	ldr r0, _0805FD0C @ =0x000002AB
	bl SoundPlay
	b _0805FD9E
	.align 2, 0
_0805FD0C: .4byte 0x000002AB
_0805FD10:
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FD30
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x50
	strb r0, [r6]
	ldr r0, _0805FD50 @ =0x000002AB
	bl SoundPlay
_0805FD30:
	ldr r0, _0805FD54 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _0805FD9E
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	movs r0, #0x50
	strb r0, [r6]
	b _0805FD9E
	.align 2, 0
_0805FD50: .4byte 0x000002AB
_0805FD54: .4byte gSpriteData
_0805FD58:
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805FD9E
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	b _0805FD9E
_0805FD86:
	ldr r1, _0805FDA4 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FD9E
	movs r0, #0
	strh r0, [r5]
_0805FD9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDA4: .4byte gSpriteData

	thumb_func_start NightmarePartChinSludge
NightmarePartChinSludge: @ 0x0805FDA8
	push {r4, r5, r6, lr}
	ldr r2, _0805FDD4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldr r1, _0805FDD8 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r6, r2, #0
	adds r6, #0x24
	ldrb r1, [r6]
	adds r5, r2, #0
	cmp r1, #0x18
	beq _0805FE0C
	cmp r1, #0x18
	bgt _0805FDDC
	cmp r1, #2
	beq _0805FDE6
	b _0805FEC0
	.align 2, 0
_0805FDD4: .4byte gCurrentSprite
_0805FDD8: .4byte sSecondarySpriteStats
_0805FDDC:
	cmp r1, #0x1a
	beq _0805FE44
	cmp r1, #0x1c
	beq _0805FE80
	b _0805FEC0
_0805FDE6:
	ldr r4, _0805FE08 @ =gSubSpriteData1
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhs _0805FED8
	adds r0, r5, #0
	adds r0, #0x2e
	movs r1, #0x78
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r6]
	b _0805FED8
	.align 2, 0
_0805FE08: .4byte gSubSpriteData1
_0805FE0C:
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805FED8
	ldrh r1, [r5]
	ldr r0, _0805FE3C @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r5]
	ldr r0, _0805FE40 @ =0x083BD574
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	movs r0, #0x1a
	strb r0, [r6]
	movs r0, #0x64
	strb r0, [r3]
	b _0805FED8
	.align 2, 0
_0805FE3C: .4byte 0x0000FFFB
_0805FE40: .4byte 0x083BD574
_0805FE44:
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FE5E
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x64
	strb r0, [r2]
_0805FE5E:
	ldr r0, _0805FE7C @ =gSpriteData
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _0805FED8
	movs r0, #0x1c
	strb r0, [r6]
	movs r0, #0x50
	strb r0, [r2]
	b _0805FED8
	.align 2, 0
_0805FE7C: .4byte gSpriteData
_0805FE80:
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805FED8
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	movs r0, #0x1e
	strb r0, [r6]
	ldr r1, _0805FEBC @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
	b _0805FED8
	.align 2, 0
_0805FEBC: .4byte gSpriteData
_0805FEC0:
	ldr r1, _0805FEE0 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FED8
	movs r0, #0
	strh r0, [r5]
_0805FED8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FEE0: .4byte gSpriteData

	thumb_func_start NightmarePartGeneratorUpdateGlowingPalette
NightmarePartGeneratorUpdateGlowingPalette: @ 0x0805FEE4
	push {r4, r5, lr}
	ldr r3, _0805FF24 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r4, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0805FF14
	ldr r2, _0805FF28 @ =0x083B73DA
	adds r5, r3, #0
	adds r5, #0x2f
	ldrb r1, [r5]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r1, #1
	strb r1, [r5]
_0805FF14:
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF24: .4byte gCurrentSprite
_0805FF28: .4byte 0x083B73DA

	thumb_func_start NightmarePartGeneratorUpdateDyingPalette
NightmarePartGeneratorUpdateDyingPalette: @ 0x0805FF2C
	push {lr}
	ldr r2, _0805FF6C @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805FF66
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805FF60
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805FF60:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805FF66:
	pop {r0}
	bx r0
	.align 2, 0
_0805FF6C: .4byte gCurrentSprite

	thumb_func_start NightmarePartGenerator
NightmarePartGenerator: @ 0x0805FF70
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805FF90 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r6, [r1]
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805FF98
	ldr r0, _0805FF94 @ =0x000002A7
	bl SoundPlayNotAlreadyPlaying
	b _0805FFA2
	.align 2, 0
_0805FF90: .4byte gCurrentSprite
_0805FF94: .4byte 0x000002A7
_0805FF98:
	cmp r1, #5
	bne _0805FFA2
	ldr r0, _0805FFC0 @ =0x000002AA
	bl SoundPlayNotAlreadyPlaying
_0805FFA2:
	ldr r1, _0805FFC4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #0x1f
	bls _0805FFB4
	b _08060330
_0805FFB4:
	lsls r0, r0, #2
	ldr r1, _0805FFC8 @ =_0805FFCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FFC0: .4byte 0x000002AA
_0805FFC4: .4byte gCurrentSprite
_0805FFC8: .4byte _0805FFCC
_0805FFCC: @ jump table
	.4byte _0806004C @ case 0
	.4byte _08060088 @ case 1
	.4byte _08060330 @ case 2
	.4byte _08060330 @ case 3
	.4byte _08060330 @ case 4
	.4byte _08060330 @ case 5
	.4byte _08060330 @ case 6
	.4byte _08060330 @ case 7
	.4byte _08060330 @ case 8
	.4byte _08060330 @ case 9
	.4byte _08060330 @ case 10
	.4byte _08060330 @ case 11
	.4byte _08060330 @ case 12
	.4byte _08060330 @ case 13
	.4byte _08060330 @ case 14
	.4byte _08060330 @ case 15
	.4byte _08060330 @ case 16
	.4byte _08060330 @ case 17
	.4byte _08060330 @ case 18
	.4byte _08060330 @ case 19
	.4byte _08060330 @ case 20
	.4byte _08060330 @ case 21
	.4byte _08060330 @ case 22
	.4byte _0806010C @ case 23
	.4byte _08060330 @ case 24
	.4byte _08060188 @ case 25
	.4byte _08060330 @ case 26
	.4byte _080601F4 @ case 27
	.4byte _08060330 @ case 28
	.4byte _0806029C @ case 29
	.4byte _08060330 @ case 30
	.4byte _080602C4 @ case 31
_0806004C:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _08060080 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0806006A
	b _08060348
_0806006A:
	ldr r0, _08060084 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #1
	movs r0, #2
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060080: .4byte gSpriteData
_08060084: .4byte 0x00007FFB
_08060088:
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r2, _080600EC @ =gSubSpriteData1
	ldr r5, _080600F0 @ =gCurrentSprite
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r2, #0xc]
	ldr r1, _080600F4 @ =sSecondarySpriteStats
	ldrb r0, [r5, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r4, [r2, #0xc]
	lsls r0, r0, #2
	movs r1, #5
	bl __divsi3
	cmp r4, r0
	blt _080600B0
	b _08060348
_080600B0:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _080600F8 @ =0x083BD844
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r1, _080600FC @ =gSamusPhysics
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08060100 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x3b
	strb r1, [r0]
	ldr r1, _08060104 @ =gBossWork3
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08060108 @ =0x000002A5
	bl SoundPlay
	b _08060348
	.align 2, 0
_080600EC: .4byte gSubSpriteData1
_080600F0: .4byte gCurrentSprite
_080600F4: .4byte sSecondarySpriteStats
_080600F8: .4byte 0x083BD844
_080600FC: .4byte gSamusPhysics
_08060100: .4byte gSpriteData
_08060104: .4byte gBossWork3
_08060108: .4byte 0x000002A5
_0806010C:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r0, _0806013C @ =gSubSpriteData1
	ldr r4, _08060140 @ =gCurrentSprite
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0xc]
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	bne _08060126
	b _08060348
_08060126:
	movs r0, #0
	strb r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08060148
	ldr r0, _08060144 @ =0x083BD824
	b _0806017A
	.align 2, 0
_0806013C: .4byte gSubSpriteData1
_08060140: .4byte gCurrentSprite
_08060144: .4byte 0x083BD824
_08060148:
	cmp r0, #1
	bne _08060154
	ldr r0, _08060150 @ =0x083BD804
	b _0806017A
	.align 2, 0
_08060150: .4byte 0x083BD804
_08060154:
	cmp r0, #2
	bne _08060160
	ldr r0, _0806015C @ =0x083BD7E4
	b _0806017A
	.align 2, 0
_0806015C: .4byte 0x083BD7E4
_08060160:
	cmp r0, #3
	beq _08060178
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
	ldr r0, _08060174 @ =0x083BD7A4
	str r0, [r4, #0x18]
	b _08060348
	.align 2, 0
_08060174: .4byte 0x083BD7A4
_08060178:
	ldr r0, _08060180 @ =0x083BD7C4
_0806017A:
	str r0, [r4, #0x18]
	ldr r1, _08060184 @ =gCurrentSprite
	b _0806028E
	.align 2, 0
_08060180: .4byte 0x083BD7C4
_08060184: .4byte gCurrentSprite
_08060188:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r1, _080601DC @ =gSubSpriteData1
	ldr r2, _080601E0 @ =gCurrentSprite
	ldrh r0, [r2, #0x14]
	movs r3, #0
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080601A4
	b _08060348
_080601A4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	ldr r0, _080601E4 @ =0x083BD7C4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r2, _080601E8 @ =0x080A8CDC
	ldr r0, _080601EC @ =0x080A8D3C
	ldr r1, _080601F0 @ =0x0000152C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x78
	bl ApplyMusicSoundFading
	b _08060348
	.align 2, 0
_080601DC: .4byte gSubSpriteData1
_080601E0: .4byte gCurrentSprite
_080601E4: .4byte 0x083BD7C4
_080601E8: .4byte 0x080A8CDC
_080601EC: .4byte 0x080A8D3C
_080601F0: .4byte 0x0000152C
_080601F4:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateDyingPalette
	bl SpriteUtilHasCurrentAnimationEnded
	cmp r0, #0
	bne _08060206
	b _08060348
_08060206:
	ldr r1, _08060220 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	movs r3, #0
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	adds r4, r1, #0
	cmp r0, #0
	bne _08060228
	ldr r0, _08060224 @ =0x083BD7E4
	b _0806028A
	.align 2, 0
_08060220: .4byte gCurrentSprite
_08060224: .4byte 0x083BD7E4
_08060228:
	cmp r0, #1
	bne _08060234
	ldr r0, _08060230 @ =0x083BD804
	b _0806028A
	.align 2, 0
_08060230: .4byte 0x083BD804
_08060234:
	cmp r0, #2
	bne _08060240
	ldr r0, _0806023C @ =0x083BD824
	b _0806028A
	.align 2, 0
_0806023C: .4byte 0x083BD824
_08060240:
	cmp r0, #3
	beq _08060288
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08060278 @ =0x083BD794
	str r0, [r4, #0x18]
	movs r0, #0x3c
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _0806027C @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
	ldr r0, _08060280 @ =gSamusPhysics
	strb r3, [r0]
	ldr r1, _08060284 @ =gBossWork3
	movs r0, #0x64
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060278: .4byte 0x083BD794
_0806027C: .4byte gSpriteData
_08060280: .4byte gSamusPhysics
_08060284: .4byte gBossWork3
_08060288:
	ldr r0, _08060298 @ =0x083BD844
_0806028A:
	str r0, [r4, #0x18]
	adds r1, r4, #0
_0806028E:
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060298: .4byte 0x083BD844
_0806029C:
	bl NightmarePartGeneratorUpdateDyingPalette
	ldr r0, _080602BC @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _08060348
	ldr r0, _080602C0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x20
	strb r1, [r0]
	b _08060348
	.align 2, 0
_080602BC: .4byte gSpriteData
_080602C0: .4byte gCurrentSprite
_080602C4:
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bhi _08060306
	ldrh r0, [r4]
	movs r1, #4
	eors r1, r0
	strh r1, [r4]
	ldrb r0, [r2]
	cmp r0, #0
	bne _08060348
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x50
	movs r2, #0x30
	bl ParticleSet
	b _08060348
_08060306:
	cmp r0, #0x1e
	bne _0806032A
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x40
	movs r2, #0x3a
	bl ParticleSet
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xaa
	lsls r0, r0, #2
	bl SoundPlay_3b1c
	b _08060348
_0806032A:
	bl NightmarePartGeneratorUpdateDyingPalette
	b _08060348
_08060330:
	ldr r1, _0806035C @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060348
	movs r0, #0
	strh r0, [r4]
_08060348:
	ldr r0, _08060360 @ =gSamusPhysics
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08060354
	bl NightmareReduceSamusXVelocity
_08060354:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806035C: .4byte gSpriteData
_08060360: .4byte gSamusPhysics

	thumb_func_start NightmareBeamInit
NightmareBeamInit: @ 0x08060364
	push {r4, r5, lr}
	ldr r0, _080603DC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r1, _080603E0 @ =0x0000FFFB
	ands r1, r0
	movs r4, #0
	movs r5, #0
	mov r3, ip
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #4
	orrs r0, r2
	strb r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r2, ip
	adds r2, #0x29
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _080603E4 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	subs r0, #0x18
	strh r0, [r2, #0xe]
	movs r0, #0x20
	strh r0, [r2, #0x10]
	ldr r0, _080603E8 @ =0x083BD59C
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r2, #0x22
	movs r0, #3
	strb r0, [r2]
	adds r2, #3
	movs r0, #0x18
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x35
	strb r1, [r0]
	ldr r0, _080603EC @ =0x000002A2
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080603DC: .4byte gCurrentSprite
_080603E0: .4byte 0x0000FFFB
_080603E4: .4byte 0x0000FFF8
_080603E8: .4byte 0x083BD59C
_080603EC: .4byte 0x000002A2

	thumb_func_start NightmareBeamMoving
NightmareBeamMoving: @ 0x080603F0
	ldr r1, _080603FC @ =gCurrentSprite
	ldrh r0, [r1, #4]
	subs r0, #0x14
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_080603FC: .4byte gCurrentSprite

	thumb_func_start NightmareFallingArmInit
NightmareFallingArmInit: @ 0x08060400
	push {r4, lr}
	ldr r0, _08060474 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08060478 @ =0x0000FFFB
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
	mov r1, ip
	adds r1, #0x22
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806047C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _08060480 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	strh r4, [r2, #0x14]
	ldrb r0, [r2, #0x1e]
	mov r3, ip
	cmp r0, #7
	bls _08060468
	b _080605CC
_08060468:
	lsls r0, r0, #2
	ldr r1, _08060484 @ =_08060488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060474: .4byte gCurrentSprite
_08060478: .4byte 0x0000FFFB
_0806047C: .4byte gIoRegisters
_08060480: .4byte 0x0000FFFC
_08060484: .4byte _08060488
_08060488: @ jump table
	.4byte _080604A8 @ case 0
	.4byte _080604D4 @ case 1
	.4byte _080604DC @ case 2
	.4byte _080604FC @ case 3
	.4byte _0806051C @ case 4
	.4byte _08060548 @ case 5
	.4byte _08060574 @ case 6
	.4byte _080605A0 @ case 7
_080604A8:
	ldr r0, _080604D0 @ =0x083BD864
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xa
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_080604D0: .4byte 0x083BD864
_080604D4:
	ldr r0, _080604D8 @ =0x083BD874
	b _0806054A
	.align 2, 0
_080604D8: .4byte 0x083BD874
_080604DC:
	ldr r0, _080604F8 @ =0x083BD884
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	b _08060590
	.align 2, 0
_080604F8: .4byte 0x083BD884
_080604FC:
	ldr r0, _08060518 @ =0x083BD894
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x1c
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #7
	b _080605BC
	.align 2, 0
_08060518: .4byte 0x083BD894
_0806051C:
	ldr r0, _08060544 @ =0x083BD8A4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #6
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_08060544: .4byte 0x083BD8A4
_08060548:
	ldr r0, _08060570 @ =0x083BD8B4
_0806054A:
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	movs r2, #8
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #3
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _080605D0
	.align 2, 0
_08060570: .4byte 0x083BD8B4
_08060574:
	ldr r0, _0806059C @ =0x083BD8C4
	str r0, [r3, #0x18]
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
	adds r1, #8
_08060590:
	movs r0, #4
	strb r0, [r1]
	subs r1, #2
	movs r0, #6
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_0806059C: .4byte 0x083BD8C4
_080605A0:
	ldr r0, _080605C8 @ =0x083BD8D4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r1, #8
_080605BC:
	movs r0, #5
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_080605C8: .4byte 0x083BD8D4
_080605CC:
	mov r0, ip
	strh r4, [r0]
_080605D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareFallingArmMoving
NightmareFallingArmMoving: @ 0x080605D8
	push {r4, r5, r6, lr}
	ldr r1, _0806060C @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, r1, #0
	cmp r0, #0
	beq _0806061E
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806067A
	ldrb r0, [r2, #0x1e]
	cmp r0, #0
	beq _080605FC
	cmp r0, #5
	bne _08060610
_080605FC:
	ldrh r0, [r2, #2]
	subs r0, #0x50
	ldrh r1, [r2, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _0806067A
	.align 2, 0
_0806060C: .4byte gCurrentSprite
_08060610:
	ldrh r0, [r2, #2]
	subs r0, #0x50
	ldrh r1, [r2, #4]
	movs r2, #0x22
	bl ParticleSet
	b _0806067A
_0806061E:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08060648 @ =sSpritesFallingSpeedFast
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0806064C @ =0x00007FFF
	cmp r1, r0
	bne _08060650
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0806065A
	.align 2, 0
_08060648: .4byte sSpritesFallingSpeedFast
_0806064C: .4byte 0x00007FFF
_08060650:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_0806065A:
	strh r0, [r2, #2]
	ldrb r0, [r2, #0x1e]
	cmp r0, #4
	bhi _0806066E
	adds r1, r2, #0
	adds r1, #0x30
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
	b _08060678
_0806066E:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
_08060678:
	strh r0, [r2, #4]
_0806067A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Nightmare
Nightmare: @ 0x08060680
	push {lr}
	ldr r0, _08060698 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0806068E
	b _080607EE
_0806068E:
	lsls r0, r0, #2
	ldr r1, _0806069C @ =_080606A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060698: .4byte gCurrentSprite
_0806069C: .4byte _080606A0
_080606A0: @ jump table
	.4byte _08060790 @ case 0
	.4byte _080607B2 @ case 1
	.4byte _080607B8 @ case 2
	.4byte _080607EE @ case 3
	.4byte _080607EE @ case 4
	.4byte _080607EE @ case 5
	.4byte _080607EE @ case 6
	.4byte _080607EE @ case 7
	.4byte _080607EE @ case 8
	.4byte _080607EE @ case 9
	.4byte _080607EE @ case 10
	.4byte _080607EE @ case 11
	.4byte _080607EE @ case 12
	.4byte _080607EE @ case 13
	.4byte _080607EE @ case 14
	.4byte _080607EE @ case 15
	.4byte _080607EE @ case 16
	.4byte _080607EE @ case 17
	.4byte _080607EE @ case 18
	.4byte _080607EE @ case 19
	.4byte _080607EE @ case 20
	.4byte _080607EE @ case 21
	.4byte _080607EE @ case 22
	.4byte _080607BE @ case 23
	.4byte _080607C2 @ case 24
	.4byte _080607C8 @ case 25
	.4byte _080607CE @ case 26
	.4byte _080607D4 @ case 27
	.4byte _080607D8 @ case 28
	.4byte _080607EE @ case 29
	.4byte _080607DE @ case 30
	.4byte _080607EE @ case 31
	.4byte _080607E4 @ case 32
	.4byte _080607EE @ case 33
	.4byte _080607EA @ case 34
	.4byte _080607EE @ case 35
	.4byte _080607EE @ case 36
	.4byte _080607EE @ case 37
	.4byte _080607EE @ case 38
	.4byte _080607EE @ case 39
	.4byte _080607EE @ case 40
	.4byte _080607EE @ case 41
	.4byte _080607EE @ case 42
	.4byte _080607EE @ case 43
	.4byte _080607EE @ case 44
	.4byte _080607EE @ case 45
	.4byte _080607EE @ case 46
	.4byte _080607EE @ case 47
	.4byte _080607EE @ case 48
	.4byte _080607EE @ case 49
	.4byte _080607EE @ case 50
	.4byte _080607EE @ case 51
	.4byte _080607EE @ case 52
	.4byte _080607EE @ case 53
	.4byte _080607EE @ case 54
	.4byte _08060796 @ case 55
	.4byte _0806079C @ case 56
	.4byte _080607A2 @ case 57
	.4byte _080607A6 @ case 58
	.4byte _080607AC @ case 59
_08060790:
	bl NightmareInit
	b _080607EE
_08060796:
	bl NightmareWaitingToAppear
	b _080607EE
_0806079C:
	bl NightmareAppearing
	b _080607EE
_080607A2:
	bl NightmarePhase1Init
_080607A6:
	bl NightmarePhase1
	b _080607EE
_080607AC:
	bl NightmarePhase2ResettingPosition
	b _080607EE
_080607B2:
	bl NightmarePhase2MovementInit
	b _080607EE
_080607B8:
	bl NightmarePhase2Movement
	b _080607EE
_080607BE:
	bl NightmareMovingToPhase3Init
_080607C2:
	bl NightmareMovingToPhase3
	b _080607EE
_080607C8:
	bl NightmareReachedPhase3Position
	b _080607EE
_080607CE:
	bl NightmarePhase3SlotMovementInit
	b _080607EE
_080607D4:
	bl NightmarePhase3FastMovementInit
_080607D8:
	bl NightmarePhase3FastMovement
	b _080607EE
_080607DE:
	bl NightmarePhase3SlowMovement
	b _080607EE
_080607E4:
	bl NightmareMovingToDeathPosition
	b _080607EE
_080607EA:
	bl NightmareTurningIntoCoreX
_080607EE:
	bl NightmarePlaySound
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl NightmareSyncSubSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NigthmarePart
NigthmarePart: @ 0x08060800
	push {lr}
	ldr r1, _08060814 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08060818
	bl NightmarePartInit
	b _080608E4
	.align 2, 0
_08060814: .4byte gCurrentSprite
_08060818:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0xd
	bhi _080608E4
	lsls r0, r0, #2
	ldr r1, _08060828 @ =_0806082C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060828: .4byte _0806082C
_0806082C: @ jump table
	.4byte _08060878 @ case 0
	.4byte _0806086E @ case 1
	.4byte _08060882 @ case 2
	.4byte _0806088C @ case 3
	.4byte _080608D2 @ case 4
	.4byte _08060896 @ case 5
	.4byte _080608A0 @ case 6
	.4byte _080608AA @ case 7
	.4byte _080608DC @ case 8
	.4byte _08060864 @ case 9
	.4byte _080608E4 @ case 10
	.4byte _080608B4 @ case 11
	.4byte _080608BE @ case 12
	.4byte _080608C8 @ case 13
_08060864:
	bl NightmarePartGenerator
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_0806086E:
	bl NightmarePartEyeSludge
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060878:
	bl NightmarePartChinSludge
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060882:
	bl NightmarePartEye
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_0806088C:
	bl NightmarePartMouth
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060896:
	bl NightmarePartRightTurret1
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608A0:
	bl NightmarePartRightTurret2
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608AA:
	bl NightmarePartRightTurret3
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608B4:
	bl NightmarePartLeftTurret1
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608BE:
	bl NightmarePartLeftTurret2
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608C8:
	bl NightmarePartLeftTurret3
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608D2:
	bl NightmarePartRightArmTop
	bl NightmareSyncSubSprites
	b _080608E4
_080608DC:
	bl NightmarePartRightArmBottom
	bl NightmareSyncSubSprites
_080608E4:
	pop {r0}
	bx r0

	thumb_func_start NightmareBeam
NightmareBeam: @ 0x080608E8
	push {lr}
	ldr r0, _080608FC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060900
	cmp r0, #2
	beq _08060906
	b _0806090A
	.align 2, 0
_080608FC: .4byte gCurrentSprite
_08060900:
	bl NightmareBeamInit
	b _0806090A
_08060906:
	bl NightmareBeamMoving
_0806090A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareFallingArm
NightmareFallingArm: @ 0x08060910
	push {lr}
	ldr r0, _0806092C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060930
	cmp r0, #2
	beq _08060936
	b _0806093A
	.align 2, 0
_0806092C: .4byte gCurrentSprite
_08060930:
	bl NightmareFallingArmInit
	b _0806093A
_08060936:
	bl NightmareFallingArmMoving
_0806093A:
	pop {r0}
	bx r0
	.align 2, 0
