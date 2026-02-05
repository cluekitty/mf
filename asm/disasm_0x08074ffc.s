    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LoadInitialMinimap
LoadInitialMinimap: @ 0x08074FFC
	push {r4, r5, lr}
	ldr r5, _08075060 @ =gPreviousArea
	ldrb r0, [r5]
	ldr r4, _08075064 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _08075068 @ =0x040000D4
	str r4, [r1]
	ldr r0, _0807506C @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075070 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _08075074 @ =gSamusData
	ldrh r0, [r1, #0x16]
	subs r0, #0x80
	asrs r0, r0, #6
	ldrh r4, [r1, #0x18]
	subs r4, #0x80
	asrs r4, r4, #6
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldr r3, _08075078 @ =0x03000031
	ldr r1, _0807507C @ =0x0879B8BC
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r1, r1, r5
	strb r1, [r3]
	ldr r3, _08075080 @ =0x03000032
	adds r2, #0x36
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r3]
	bl MinimapSetTileAsExplored
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075060: .4byte gPreviousArea
_08075064: .4byte 0x02034000
_08075068: .4byte 0x040000D4
_0807506C: .4byte 0x02034800
_08075070: .4byte 0x80000400
_08075074: .4byte gSamusData
_08075078: .4byte 0x03000031
_0807507C: .4byte 0x0879B8BC
_08075080: .4byte 0x03000032

	thumb_func_start MinimapUpdate
MinimapUpdate: @ 0x08075084
	push {lr}
	bl MinimapCheckForUnexploredTile
	ldr r0, _080750A4 @ =gMinimapUpdateFlag
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807509A
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807509A:
	bl MinimapDraw
	pop {r0}
	bx r0
	.align 2, 0
_080750A4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapSetTileAsExplored
MinimapSetTileAsExplored: @ 0x080750A8
	push {lr}
	ldr r1, _080750D8 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _080750D4
	adds r2, r0, #0
	ldr r0, _080750DC @ =0x03000032
	lsls r2, r2, #5
	ldrb r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080750E0 @ =0x02037C00
	adds r2, r2, r0
	ldr r1, _080750E4 @ =0x0879BDDC
	ldr r0, _080750E8 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_080750D4:
	pop {r0}
	bx r0
	.align 2, 0
_080750D8: .4byte gCurrentArea
_080750DC: .4byte 0x03000032
_080750E0: .4byte 0x02037C00
_080750E4: .4byte 0x0879BDDC
_080750E8: .4byte 0x03000031

	thumb_func_start MinimapCheckForUnexploredTile
MinimapCheckForUnexploredTile: @ 0x080750EC
	push {r4, r5, r6, lr}
	ldr r0, _0807511C @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _080751AC
	ldr r1, _08075120 @ =gSamusData
	ldrh r3, [r1, #0x16]
	adds r0, r3, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08075124
	movs r4, #0
	b _0807513C
	.align 2, 0
_0807511C: .4byte gMinimapUpdateFlag
_08075120: .4byte gSamusData
_08075124:
	ldr r0, _0807514C @ =gBackgroundsData
	ldrh r0, [r0, #0x1c]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	cmp r3, r2
	blo _0807513C
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807513C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08075150
	movs r5, #0
	b _0807516A
	.align 2, 0
_0807514C: .4byte gBackgroundsData
_08075150:
	ldr r0, _080751B4 @ =gBackgroundsData
	ldrh r0, [r0, #0x1e]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #0x18]
	cmp r0, r2
	blo _0807516A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807516A:
	lsrs r4, r4, #6
	lsrs r5, r5, #6
	adds r0, r4, #0
	movs r1, #0xf
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _080751B8 @ =0x03000031
	ldrb r1, [r2]
	ldr r3, _080751BC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0xe]
	adds r0, r4, r0
	cmp r1, r0
	beq _0807519A
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_0807519A:
	ldr r2, _080751C0 @ =0x03000032
	ldrb r1, [r2]
	ldrb r0, [r3, #0xf]
	adds r0, r5, r0
	cmp r1, r0
	beq _080751AC
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_080751AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080751B4: .4byte gBackgroundsData
_080751B8: .4byte 0x03000031
_080751BC: .4byte gCurrentRoomEntry
_080751C0: .4byte 0x03000032

	thumb_func_start MinimapCheckOnTransition
MinimapCheckOnTransition: @ 0x080751C4
	push {r4, r5, lr}
	ldr r0, _0807524C @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	ldr r5, _08075250 @ =gPreviousArea
	cmp r1, #0
	bne _080751E2
	ldr r0, _08075254 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _080751E2
	cmp r0, #0xa
	bne _080751E2
	movs r0, #0x80
	strb r0, [r5]
_080751E2:
	ldrb r1, [r2]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08075214
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r4, _08075258 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _0807525C @ =0x040000D4
	str r4, [r1]
	ldr r0, _08075260 @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075264 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r0, _08075268 @ =0x03000031
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0807526C @ =0x03000032
	strb r1, [r0]
_08075214:
	ldr r4, _08075270 @ =gMinimapUpdateFlag
	movs r0, #0
	strb r0, [r4]
	bl MinimapCheckForUnexploredTile
	ldrb r0, [r4]
	cmp r0, #3
	bne _0807522C
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807522C:
	movs r0, #1
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #2
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #3
	strb r0, [r4]
	bl MinimapDraw
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807524C: .4byte gCurrentArea
_08075250: .4byte gPreviousArea
_08075254: .4byte gCurrentCutscene
_08075258: .4byte 0x02034000
_0807525C: .4byte 0x040000D4
_08075260: .4byte 0x02034800
_08075264: .4byte 0x80000400
_08075268: .4byte 0x03000031
_0807526C: .4byte 0x03000032
_08075270: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapDraw
MinimapDraw: @ 0x08075274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08075298 @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807535A
	ldr r0, _0807529C @ =0x02034000
	mov r8, r0
	ldr r0, _080752A0 @ =0x02035C00
	str r0, [sp]
	adds r0, r1, #0
	cmp r0, #3
	bne _080752A4
	movs r6, #1
	b _080752B4
	.align 2, 0
_08075298: .4byte gMinimapUpdateFlag
_0807529C: .4byte 0x02034000
_080752A0: .4byte 0x02035C00
_080752A4:
	cmp r0, #2
	bne _080752AC
	movs r6, #0
	b _080752B4
_080752AC:
	cmp r1, #1
	bne _080752B4
	movs r6, #1
	rsbs r6, r6, #0
_080752B4:
	ldrb r0, [r2]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	add r4, sp, #4
_080752CA:
	ldr r0, _0807531C @ =0x03000031
	ldrb r0, [r0]
	adds r1, r0, r5
	cmp r1, #0x1f
	bls _080752D6
	movs r1, #0xff
_080752D6:
	ldr r0, _08075320 @ =0x03000032
	ldrb r0, [r0]
	adds r0, r0, r6
	cmp r0, #0x1f
	bls _080752E2
	movs r0, #0xff
_080752E2:
	cmp r0, #0xff
	beq _080752EA
	cmp r1, #0xff
	bne _080752EE
_080752EA:
	movs r1, #0x1f
	movs r0, #0x1f
_080752EE:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r3, r0, #0
	ands r3, r1
	lsrs r2, r1, #0xc
	ldr r7, _08075324 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	str r0, [sp, #4]
	cmp r3, #0
	bne _08075328
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileGfx
	b _08075354
	.align 2, 0
_0807531C: .4byte 0x03000031
_08075320: .4byte 0x03000032
_08075324: .4byte 0x000003FF
_08075328:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r3, r0
	bne _0807533A
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXFlippedGfx
	b _08075354
_0807533A:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r3, r0
	bne _0807534C
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileYFlippedGfx
	b _08075354
_0807534C:
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXYFlippedGfx
_08075354:
	adds r5, #1
	cmp r5, #1
	ble _080752CA
_0807535A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MinimapCopyTileGfx
MinimapCopyTileGfx: @ 0x08075368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, _080753C0 @ =0x08561FA8
	mov r8, r0
	ldr r0, _080753C4 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _080753C8 @ =0x08576190
	movs r6, #0x1f
_08075382:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	cmp r6, #0
	bge _08075382
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753C0: .4byte 0x08561FA8
_080753C4: .4byte 0x085761C0
_080753C8: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXFlippedGfx
MinimapCopyTileXFlippedGfx: @ 0x080753CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r6, r2, #0x14
	ldr r0, _0807543C @ =0x08561FA8
	mov sb, r0
	ldr r0, _08075440 @ =0x085761C0
	mov r8, r0
	ldr r0, _08075444 @ =0x08576190
	mov ip, r0
_080753EA:
	ldr r0, [r4]
	adds r0, #3
	str r0, [r4]
	adds r7, r1, #1
	movs r2, #3
_080753F4:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r6
	add r1, ip
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _080753F4
	adds r0, r1, #4
	str r0, [r4]
	adds r1, r7, #0
	cmp r1, #7
	ble _080753EA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807543C: .4byte 0x08561FA8
_08075440: .4byte 0x085761C0
_08075444: .4byte 0x08576190

	thumb_func_start MinimapCopyTileYFlippedGfx
MinimapCopyTileYFlippedGfx: @ 0x08075448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1c
	str r0, [r4]
	movs r0, #0
	lsrs r6, r2, #0x14
	ldr r1, _080754B8 @ =0x08561FA8
	mov sb, r1
	ldr r1, _080754BC @ =0x085761C0
	mov r8, r1
	ldr r1, _080754C0 @ =0x08576190
	mov ip, r1
_0807546C:
	adds r7, r0, #1
	movs r2, #3
_08075470:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, ip
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _08075470
	subs r0, r1, #7
	str r0, [r4]
	adds r0, r7, #0
	cmp r0, #7
	ble _0807546C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080754B8: .4byte 0x08561FA8
_080754BC: .4byte 0x085761C0
_080754C0: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXYFlippedGfx
MinimapCopyTileXYFlippedGfx: @ 0x080754C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1f
	str r0, [r4]
	ldr r0, _08075520 @ =0x08561FA8
	mov r8, r0
	ldr r0, _08075524 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _08075528 @ =0x08576190
	movs r6, #0x1f
_080754E4:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r2
	adds r1, r1, r7
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r6, #0
	bge _080754E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075520: .4byte 0x08561FA8
_08075524: .4byte 0x085761C0
_08075528: .4byte 0x08576190

	thumb_func_start MapScreenSubroutine
MapScreenSubroutine: @ 0x0807552C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r7, #0
	ldr r0, _080755F8 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075548
	b _080756CA
_08075548:
	ldr r2, _080755FC @ =gNonGameplayRam
	ldr r0, _08075600 @ =0x00000259
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _08075604 @ =0x00000256
	adds r0, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	mov r3, sp
	strb r1, [r3, #0x10]
	mov r1, r8
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r3
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov sl, r0
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #0
	mov ip, r0
	ldr r1, _08075608 @ =0x00000257
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, r3
	ble _08075592
	movs r3, #1
	mov ip, r3
_08075592:
	ldr r1, _0807560C @ =0x00000261
	adds r0, r6, r1
	mov r3, ip
	strb r3, [r0]
	movs r4, #0
	subs r1, #0xd
	adds r0, r6, r1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r5, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r5]
	mov sb, r1
	movs r2, #0
	ldrsb r2, [r5, r2]
	cmp r0, r2
	ble _080755BA
	movs r4, #1
_080755BA:
	ldr r3, _08075610 @ =0x0000025E
	adds r0, r6, r3
	strb r4, [r0]
	ldr r1, _08075614 @ =0x00000255
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	ldr r1, _08075618 @ =0x0000025F
	adds r0, r6, r1
	strb r3, [r0]
	ldr r0, _0807561C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	mov r2, sb
	cmp r0, #0
	beq _08075620
	mov r1, sl
	cmp r1, #0
	beq _0807565E
	mov r3, sp
	ldrb r0, [r3, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1]
	b _0807565C
	.align 2, 0
_080755F8: .4byte gButtonInput
_080755FC: .4byte gNonGameplayRam
_08075600: .4byte 0x00000259
_08075604: .4byte 0x00000256
_08075608: .4byte 0x00000257
_0807560C: .4byte 0x00000261
_08075610: .4byte 0x0000025E
_08075614: .4byte 0x00000255
_08075618: .4byte 0x0000025F
_0807561C: .4byte gChangedInput
_08075620:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807563A
	mov r3, ip
	cmp r3, #0
	beq _0807565E
	mov r1, sp
	ldrb r0, [r1, #0x10]
	adds r0, #1
	mov r3, r8
	strb r0, [r3]
	b _0807565C
_0807563A:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807564A
	cmp r4, #0
	beq _0807565E
	adds r0, r2, #1
	b _0807565A
_0807564A:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807565E
	cmp r3, #0
	beq _0807565E
	mov r0, sb
	subs r0, #1
_0807565A:
	strb r0, [r5]
_0807565C:
	movs r7, #1
_0807565E:
	ldr r2, _080756AC @ =gBackgroundPositions
	adds r4, r6, #0
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	subs r0, r3, r0
	movs r5, #0
	strh r0, [r2, #0xc]
	adds r1, #0x59
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r3, r0
	strh r0, [r2, #0xe]
	ldr r0, _080756B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756B4
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #6
	strb r0, [r1]
	strb r5, [r4, #6]
	strb r5, [r4, #7]
	b _080756C8
	.align 2, 0
_080756AC: .4byte gBackgroundPositions
_080756B0: .4byte gChangedInput
_080756B4:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080756CA
	adds r1, r6, #0
	adds r1, #0x28
	movs r0, #0xb
	strb r0, [r1]
	strb r5, [r6, #6]
	strb r5, [r6, #7]
_080756C8:
	movs r7, #3
_080756CA:
	ldr r3, _080756E8 @ =gChangedInput
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756D8
	movs r7, #2
_080756D8:
	cmp r7, #0
	beq _08075710
	cmp r7, #1
	bne _080756EC
	movs r0, #1
	bl unk_77840
	b _0807572C
	.align 2, 0
_080756E8: .4byte gChangedInput
_080756EC:
	cmp r7, #2
	bne _0807572C
	ldr r0, _0807570C @ =gNonGameplayRam
	ldrb r0, [r0, #1]
	cmp r0, #4
	beq _08075700
	cmp r0, #5
	beq _08075702
	cmp r0, #9
	bne _08075702
_08075700:
	movs r7, #1
_08075702:
	adds r0, r7, #0
	bl unk_77840
	b _0807572C
	.align 2, 0
_0807570C: .4byte gNonGameplayRam
_08075710:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807572C
	ldr r0, _0807573C @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807572C
	movs r0, #1
	bl PauseScreenDrawIgtAndTanks
_0807572C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807573C: .4byte gNonGameplayRam

	thumb_func_start SetMapScreenSamusHeadPosition
SetMapScreenSamusHeadPosition: @ 0x08075740
	ldr r2, _08075760 @ =gNonGameplayRam
	ldr r0, _08075764 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r3, #0xd7
	lsls r3, r3, #1
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08075768 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #3
	subs r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	bx lr
	.align 2, 0
_08075760: .4byte gNonGameplayRam
_08075764: .4byte 0x03000031
_08075768: .4byte 0x03000032

	thumb_func_start MinimapSetVisitedTilesAndCollectedItems
MinimapSetVisitedTilesAndCollectedItems: @ 0x0807576C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #7
	bls _0807577A
	movs r4, #7
_0807577A:
	adds r0, r4, #0
	bl MinimapSetVisitedTiles
	adds r0, r4, #0
	bl MinimapSetCollectedItems
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetVisitedTiles
MinimapSetVisitedTiles: @ 0x0807578C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	cmp r0, #6
	bhi _080757A2
	adds r1, r0, #0
_080757A2:
	lsls r0, r1, #7
	ldr r3, _080757F0 @ =0x02037C00
	adds r2, r0, r3
	ldr r3, _080757F4 @ =0x02034000
	ldr r0, _080757F8 @ =gEquipment
	ldrb r0, [r0, #0xe]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08075822
	movs r1, #0
	ldr r5, _080757FC @ =0x0879BDDC
	mov r8, r5
	movs r0, #0x80
	lsls r0, r0, #6
	mov ip, r0
_080757C4:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	mov sb, r0
	mov r2, r8
	movs r4, #0x1f
_080757D0:
	ldr r0, [r2]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08075800
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _0807580E
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	orrs r0, r1
	b _0807580C
	.align 2, 0
_080757F0: .4byte 0x02037C00
_080757F4: .4byte 0x02034000
_080757F8: .4byte gEquipment
_080757FC: .4byte 0x0879BDDC
_08075800:
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _0807580E
	movs r0, #0xa0
_0807580C:
	strh r0, [r3]
_0807580E:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _080757D0
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _080757C4
	b _08075876
_08075822:
	movs r1, #0
	ldr r0, _0807585C @ =0x0879BDDC
	mov sl, r0
	movs r5, #0x80
	lsls r5, r5, #6
	mov sb, r5
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	movs r5, #0xa0
	mov ip, r5
_08075838:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	adds r5, r0, #0
	mov r2, sl
	movs r4, #0x1f
_08075844:
	ldr r0, [r2]
	ands r0, r5
	cmp r0, #0
	beq _08075860
	ldrh r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _08075864
	mov r0, r8
	orrs r0, r1
	b _08075862
	.align 2, 0
_0807585C: .4byte 0x0879BDDC
_08075860:
	mov r0, ip
_08075862:
	strh r0, [r3]
_08075864:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _08075844
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _08075838
_08075876:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetCollectedItems
MinimapSetCollectedItems: @ 0x08075884
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #7
	cmp r2, #6
	bhi _08075898
	adds r6, r2, #0
_08075898:
	ldr r0, _080758A8 @ =0x02034000
	mov sb, r0
	movs r7, #0x40
	cmp r6, #0
	beq _080758AC
	adds r6, #1
	b _080758AE
	.align 2, 0
_080758A8: .4byte 0x02034000
_080758AC:
	movs r7, #0x80
_080758AE:
	lsls r0, r6, #8
	ldr r1, _08075920 @ =0x02037200
	adds r5, r0, r1
	movs r6, #0
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08075914
	ldr r1, _08075924 @ =0x0879B8BC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
_080758CA:
	ldrb r0, [r5, #2]
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldrb r0, [r5, #3]
	subs r0, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r2, [r5]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r2, [r2]
	adds r4, r4, r2
	adds r1, #0x36
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r6, #1
	adds r5, #4
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _080758CA
_08075914:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075920: .4byte 0x02037200
_08075924: .4byte 0x0879B8BC

	thumb_func_start MinimapUpdateForExploredTiles
MinimapUpdateForExploredTiles: @ 0x08075928
	push {lr}
	ldr r0, _0807596C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bhi _08075982
	ldr r1, _08075970 @ =0x03000031
	ldr r0, _08075974 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r3, r0, #1
	ldr r0, _08075978 @ =0x02034000
	adds r2, r3, r0
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075982
	ldr r1, _0807597C @ =0x02034800
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075980
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08075982
	.align 2, 0
_0807596C: .4byte gCurrentArea
_08075970: .4byte 0x03000031
_08075974: .4byte 0x03000032
_08075978: .4byte 0x02034000
_0807597C: .4byte 0x02034800
_08075980:
	strh r1, [r2]
_08075982:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_75988
unk_75988: @ 0x08075988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080759EC @ =gNonGameplayRam
	ldr r2, _080759F0 @ =0x0000025E
	adds r0, r1, r2
	movs r3, #0
	strb r3, [r0]
	ldr r4, _080759F4 @ =0x0000025F
	adds r0, r1, r4
	strb r3, [r0]
	adds r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, #2
	adds r0, r1, r4
	strb r3, [r0]
	subs r2, #0xb
	adds r0, r1, r2
	movs r2, #0x1f
	strb r2, [r0]
	ldr r0, _080759F8 @ =0x00000256
	adds r4, r1, r0
	strb r2, [r4]
	movs r2, #0x95
	lsls r2, r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #3
	adds r0, r1, r2
	strb r3, [r0]
	ldr r6, _080759FC @ =0x02034000
	movs r5, #0
	mov ip, r1
	ldr r0, _08075A00 @ =gBackgroundPositions
	mov sb, r0
	adds r7, r4, #0
	adds r4, r6, #0
_080759DC:
	movs r2, #0
	ldrh r0, [r4]
	lsls r1, r3, #5
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	b _08075A26
	.align 2, 0
_080759EC: .4byte gNonGameplayRam
_080759F0: .4byte 0x0000025E
_080759F4: .4byte 0x0000025F
_080759F8: .4byte 0x00000256
_080759FC: .4byte 0x02034000
_08075A00: .4byte gBackgroundPositions
_08075A04:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A1A
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	movs r5, #1
_08075A1A:
	cmp r5, #0
	bne _08075A26
	adds r4, #0x40
	adds r3, #1
	cmp r3, #0x1f
	ble _080759DC
_08075A26:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075A44 @ =0x030016DB
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r6, r0
_08075A32:
	subs r1, #0x40
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	b _08075A68
	.align 2, 0
_08075A44: .4byte 0x030016DB
_08075A48:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A60
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	movs r5, #1
_08075A60:
	cmp r5, #0
	bne _08075A68
	cmp r3, #0
	bgt _08075A32
_08075A68:
	movs r5, #0
	movs r3, #0
	ldr r4, _08075A7C @ =0x030016D9
	adds r1, r6, #0
_08075A70:
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	b _08075AA4
	.align 2, 0
_08075A7C: .4byte 0x030016D9
_08075A80:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075A98
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	movs r5, #1
_08075A98:
	cmp r5, #0
	bne _08075AA4
	adds r1, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _08075A70
_08075AA4:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075AC0 @ =0x030016D8
	adds r1, r6, #0
	adds r1, #0x40
_08075AAE:
	subs r1, #2
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	b _08075AE4
	.align 2, 0
_08075AC0: .4byte 0x030016D8
_08075AC4:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075ADC
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	movs r5, #1
_08075ADC:
	cmp r5, #0
	bne _08075AE4
	cmp r3, #0
	bgt _08075AAE
_08075AE4:
	ldr r6, _08075B50 @ =0x00000255
	add r6, ip
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	ldrb r2, [r6]
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	ble _08075AFE
	strb r2, [r4]
_08075AFE:
	ldr r5, _08075B54 @ =0x00000256
	add r5, ip
	ldr r3, _08075B58 @ =0x00000257
	add r3, ip
	ldrb r2, [r5]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	ble _08075B16
	strb r2, [r3]
_08075B16:
	ldrb r1, [r4]
	ldr r0, _08075B5C @ =0x0000025A
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r6]
	ldr r0, _08075B60 @ =0x0000025B
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r5]
	movs r0, #0x97
	lsls r0, r0, #2
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r3]
	ldr r0, _08075B64 @ =0x0000025D
	add r0, ip
	strb r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _08075B6C
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r4, [r0]
	ldr r0, _08075B68 @ =0x00000211
	add r0, ip
	ldrb r1, [r0]
	b _08075BC6
	.align 2, 0
_08075B50: .4byte 0x00000255
_08075B54: .4byte 0x00000256
_08075B58: .4byte 0x00000257
_08075B5C: .4byte 0x0000025A
_08075B60: .4byte 0x0000025B
_08075B64: .4byte 0x0000025D
_08075B68: .4byte 0x00000211
_08075B6C:
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	asrs r4, r0, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r1, r0, #1
	adds r3, r1, #4
	subs r2, r1, #7
	ldr r0, _08075B98 @ =0x00000211
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075B9C
	subs r0, r0, r3
	adds r1, r1, r0
	b _08075BA4
	.align 2, 0
_08075B98: .4byte 0x00000211
_08075B9C:
	cmp r2, r0
	ble _08075BA4
	subs r0, r2, r0
	subs r1, r1, r0
_08075BA4:
	adds r3, r4, #0
	adds r3, #0xc
	adds r2, r4, #0
	subs r2, #0xc
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075BBE
	subs r0, r0, r3
	adds r4, r4, r0
	b _08075BC6
_08075BBE:
	cmp r2, r0
	ble _08075BC6
	subs r0, r2, r0
	subs r4, r4, r0
_08075BC6:
	mov r3, ip
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r4, [r0]
	ldr r4, _08075C54 @ =0x00000259
	adds r2, r3, r4
	strb r1, [r2]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r4, #0x59
	adds r1, r4, #0
	subs r0, r1, r0
	mov r4, sb
	strh r0, [r4, #0xc]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0xa
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	ldr r0, _08075C58 @ =0x00000257
	adds r4, r3, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, _08075C5C @ =0x00000256
	adds r2, r3, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C14
	movs r3, #3
_08075C14:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, _08075C60 @ =0x00000255
	add r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C3C
	movs r3, #3
_08075C3C:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C54: .4byte 0x00000259
_08075C58: .4byte 0x00000257
_08075C5C: .4byte 0x00000256
_08075C60: .4byte 0x00000255

	thumb_func_start MinimapUpdateForCollectedItem
MinimapUpdateForCollectedItem: @ 0x08075C64
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	ldr r6, _08075CB8 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r5, r5, r0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r5, r5, r0
	lsls r5, r5, #1
	ldr r0, _08075CBC @ =0x02034000
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08075CC0 @ =0x02034800
	adds r5, r5, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _08075CC4 @ =gMinimapUpdateFlag
	movs r0, #3
	strb r0, [r1]
	bl MinimapDraw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075CB8: .4byte gCurrentRoomEntry
_08075CBC: .4byte 0x02034000
_08075CC0: .4byte 0x02034800
_08075CC4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapCheckIsTileExplored
MinimapCheckIsTileExplored: @ 0x08075CC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _08075D10 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08075D20
	adds r5, r0, #0
	lsls r5, r5, #5
	subs r0, r2, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldr r6, _08075D14 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r4, r4, r0
	subs r0, r7, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08075D18 @ =0x02037C00
	adds r0, r0, r1
	ldr r1, _08075D1C @ =0x0879BDDC
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r0, [r0]
	ldr r1, [r4]
	ands r0, r1
	b _08075D22
	.align 2, 0
_08075D10: .4byte gCurrentArea
_08075D14: .4byte gCurrentRoomEntry
_08075D18: .4byte 0x02037C00
_08075D1C: .4byte 0x0879BDDC
_08075D20:
	movs r0, #1
_08075D22:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start MapScreenCountTanks
MapScreenCountTanks: @ 0x08075D28
	push {r4, r5, r6, r7, lr}
	ldr r4, _08075DE4 @ =gNonGameplayRam
	ldr r7, _08075DE8 @ =0x08575F88
	ldrb r1, [r7, #0x15]
	ldr r2, _08075DEC @ =0x0000027B
	adds r0, r4, r2
	movs r6, #0
	strb r1, [r0]
	ldrb r1, [r7, #0x16]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r1, [r7, #0x17]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldr r5, _08075DF0 @ =gEquipment
	ldrh r0, [r5, #2]
	subs r0, #0x63
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldrh r0, [r5, #6]
	subs r0, #0xa
	movs r1, #5
	bl __divsi3
	ldr r2, _08075DF4 @ =0x0000027E
	adds r1, r4, r2
	strb r0, [r1]
	ldrb r0, [r5, #9]
	subs r0, #0xa
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldr r0, _08075DF8 @ =0x00000275
	adds r3, r4, r0
	strb r6, [r3]
	ldr r1, _08075DFC @ =0x00000277
	adds r5, r4, r1
	strb r6, [r5]
	subs r2, #7
	adds r2, r2, r4
	mov ip, r2
	strb r6, [r2]
	subs r1, #1
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _08075E00 @ =0x0000027A
	adds r4, r4, r0
	strb r6, [r4]
	ldr r2, _08075E04 @ =gCurrentArea
	ldrb r0, [r2]
	cmp r0, #6
	bhi _08075E5C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r2]
	movs r6, #0x40
	cmp r1, #0
	beq _08075E08
	adds r1, #1
	b _08075E0A
	.align 2, 0
_08075DE4: .4byte gNonGameplayRam
_08075DE8: .4byte 0x08575F88
_08075DEC: .4byte 0x0000027B
_08075DF0: .4byte gEquipment
_08075DF4: .4byte 0x0000027E
_08075DF8: .4byte 0x00000275
_08075DFC: .4byte 0x00000277
_08075E00: .4byte 0x0000027A
_08075E04: .4byte gCurrentArea
_08075E08:
	movs r6, #0x80
_08075E0A:
	lsls r0, r1, #8
	ldr r1, _08075E30 @ =0x02037200
	adds r2, r0, r1
	movs r1, #0
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08075E5C
	ldr r3, _08075E34 @ =0x030016FC
	subs r5, r3, #2
	adds r4, r3, #2
_08075E22:
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _08075E38
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08075E4E
	.align 2, 0
_08075E30: .4byte 0x02037200
_08075E34: .4byte 0x030016FC
_08075E38:
	cmp r0, #2
	bne _08075E44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08075E4E
_08075E44:
	cmp r0, #3
	bne _08075E4E
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08075E4E:
	adds r1, #1
	adds r2, #4
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08075E22
_08075E5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenDrawIgtAndTanks
PauseScreenDrawIgtAndTanks: @ 0x08075E64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075EA4
	ldr r0, _08075E90 @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r3, r0, r1
	ldrb r1, [r3]
	cmp r1, #1
	bne _08075E94
	movs r0, #2
	strb r0, [r3]
	movs r2, #1
	str r2, [sp]
	b _08075EB4
	.align 2, 0
_08075E90: .4byte gNonGameplayRam
_08075E94:
	cmp r1, #2
	beq _08075E9A
	b _080761B4
_08075E9A:
	movs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	b _08075EB4
_08075EA4:
	ldr r2, _08075F50 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	str r1, [sp]
_08075EB4:
	ldr r2, _08075F54 @ =gInGameTimer
	mov sb, r2
	ldrb r0, [r2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	ldr r4, _08075F58 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _08075F5C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	ldr r2, _08075F60 @ =0x085761F0
	mov sl, r2
	ldr r5, [r2, #0x18]
	str r5, [r4, #4]
	ldr r6, _08075F64 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r2, sb
	ldrb r0, [r2, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	mov r0, sl
	ldr r5, [r0, #0x1c]
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1, #1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov sb, sl
	ldr r2, [sp]
	cmp r2, #0
	bne _08075F68
	ldr r1, _08075F50 @ =gNonGameplayRam
	movs r2, #0x9f
	lsls r2, r2, #2
	b _08075F6C
	.align 2, 0
_08075F50: .4byte gNonGameplayRam
_08075F54: .4byte gInGameTimer
_08075F58: .4byte 0x040000D4
_08075F5C: .4byte 0x06017EC0
_08075F60: .4byte 0x085761F0
_08075F64: .4byte 0x84000008
_08075F68:
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FBC @ =0x00000276
_08075F6C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08075FC0 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08075FC4 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2]
	str r5, [r4, #4]
	ldr r6, _08075FC8 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08075FD0
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FCC @ =0x0000027B
	b _08075FD4
	.align 2, 0
_08075FB8: .4byte gNonGameplayRam
_08075FBC: .4byte 0x00000276
_08075FC0: .4byte 0x040000D4
_08075FC4: .4byte 0x06017EC0
_08075FC8: .4byte 0x84000008
_08075FCC: .4byte 0x0000027B
_08075FD0:
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076024 @ =0x00000275
_08075FD4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076028 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _0807602C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #4]
	str r5, [r4, #4]
	ldr r6, _08076030 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076038
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076034 @ =0x0000027E
	b _0807603E
	.align 2, 0
_08076020: .4byte gNonGameplayRam
_08076024: .4byte 0x00000275
_08076028: .4byte 0x040000D4
_0807602C: .4byte 0x06017EC0
_08076030: .4byte 0x84000008
_08076034: .4byte 0x0000027E
_08076038:
	ldr r1, _0807608C @ =gNonGameplayRam
	movs r2, #0x9e
	lsls r2, r2, #2
_0807603E:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076090 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076094 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #8]
	str r5, [r4, #4]
	ldr r6, _08076098 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _080760A0
	ldr r1, _0807608C @ =gNonGameplayRam
	ldr r2, _0807609C @ =0x0000027D
	b _080760A4
	.align 2, 0
_0807608C: .4byte gNonGameplayRam
_08076090: .4byte 0x040000D4
_08076094: .4byte 0x06017EC0
_08076098: .4byte 0x84000008
_0807609C: .4byte 0x0000027D
_080760A0:
	ldr r1, _080760F4 @ =gNonGameplayRam
	ldr r2, _080760F8 @ =0x00000277
_080760A4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080760FC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076100 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0xc]
	str r5, [r4, #4]
	ldr r6, _08076104 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076108
	ldr r1, _080760F4 @ =gNonGameplayRam
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0807610C
	.align 2, 0
_080760F4: .4byte gNonGameplayRam
_080760F8: .4byte 0x00000277
_080760FC: .4byte 0x040000D4
_08076100: .4byte 0x06017EC0
_08076104: .4byte 0x84000008
_08076108:
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807615C @ =0x0000027A
_0807610C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076160 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076164 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x10]
	str r5, [r4, #4]
	ldr r6, _08076168 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076170
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807616C @ =0x0000027F
	b _08076174
	.align 2, 0
_08076158: .4byte gNonGameplayRam
_0807615C: .4byte 0x0000027A
_08076160: .4byte 0x040000D4
_08076164: .4byte 0x06017EC0
_08076168: .4byte 0x84000008
_0807616C: .4byte 0x0000027F
_08076170:
	ldr r1, _080761C4 @ =gNonGameplayRam
	ldr r2, _080761C8 @ =0x00000279
_08076174:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080761CC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _080761D0 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x14]
	str r5, [r4, #4]
	ldr r6, _080761D4 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
_080761B4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080761C4: .4byte gNonGameplayRam
_080761C8: .4byte 0x00000279
_080761CC: .4byte 0x040000D4
_080761D0: .4byte 0x06017EC0
_080761D4: .4byte 0x84000008

	thumb_func_start PauseScreenMapDownload
PauseScreenMapDownload: @ 0x080761D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08076210 @ =gNonGameplayRam
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r2, _08076214 @ =0x00000231
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #6
	bls _08076204
	b _080765E2
_08076204:
	lsls r0, r0, #2
	ldr r1, _08076218 @ =_0807621C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08076210: .4byte gNonGameplayRam
_08076214: .4byte 0x00000231
_08076218: .4byte _0807621C
_0807621C: @ jump table
	.4byte _08076238 @ case 0
	.4byte _08076350 @ case 1
	.4byte _080763C4 @ case 2
	.4byte _080764D0 @ case 3
	.4byte _0807650C @ case 4
	.4byte _08076540 @ case 5
	.4byte _080765C8 @ case 6
_08076238:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08076246
	b _080765E2
_08076246:
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x5a
	movs r0, #0x11
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #0x74
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x50
	ldr r3, _08076344 @ =0x0000FFF8
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x5b
	ldrb r1, [r4]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r4]
	movs r5, #4
	ldr r0, _08076348 @ =0x0879BEBC
	mov ip, r0
	adds r4, r6, #0
	movs r7, #0
	mov sb, r3
	mov sl, r2
	movs r1, #0xd
	rsbs r1, r1, #0
	mov r8, r1
_080762A2:
	subs r5, #1
	mov r2, ip
	adds r3, r5, r2
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x74
	strh r1, [r0, #0x2e]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, sb
	strh r1, [r0, #0x2c]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, r8
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	cmp r5, #0
	bgt _080762A2
	ldr r2, _0807634C @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_08076344: .4byte 0x0000FFF8
_08076348: .4byte 0x0879BEBC
_0807634C: .4byte 0x00000231
_08076350:
	ldr r0, _08076374 @ =0x00000233
	adds r3, r6, r0
	movs r0, #0
	strb r0, [r3]
	ldr r2, _08076378 @ =gBackgroundPositions
	ldrh r1, [r2, #0xe]
	ldr r0, _0807637C @ =0x000001FF
	cmp r1, r0
	bhi _08076380
	adds r0, r1, #0
	movs r1, #0x80
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r1, r1, #3
	movs r0, #0x20
	subs r0, r0, r1
	b _08076390
	.align 2, 0
_08076374: .4byte 0x00000233
_08076378: .4byte gBackgroundPositions
_0807637C: .4byte 0x000001FF
_08076380:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bls _08076392
	ldrh r0, [r2, #0xe]
	ldr r1, _080763B4 @ =0xFFFFFE00
	adds r0, r0, r1
	asrs r0, r0, #3
_08076390:
	strb r0, [r3]
_08076392:
	ldr r2, _080763B8 @ =0x00000232
	adds r0, r6, r2
	movs r4, #0
	strb r4, [r0]
	ldr r0, _080763BC @ =0x0000011B
	bl SoundPlay
	ldr r0, _080763C0 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080763B4: .4byte 0xFFFFFE00
_080763B8: .4byte 0x00000232
_080763BC: .4byte 0x0000011B
_080763C0: .4byte 0x00000231
_080763C4:
	movs r5, #1
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #7
	bls _08076442
	ldr r0, _08076414 @ =0x00000232
	adds r7, r6, r0
	ldrb r4, [r7]
	cmp r4, #0x13
	bhi _0807642C
	ldr r2, _08076418 @ =0x040000D4
	ldr r1, _0807641C @ =0x00000233
	adds r3, r6, r1
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076420 @ =0x02034000
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076424 @ =0x0600E000
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08076428 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	strb r0, [r7]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08076438
	movs r0, #0
	strb r0, [r3]
	b _08076438
	.align 2, 0
_08076414: .4byte 0x00000232
_08076418: .4byte 0x040000D4
_0807641C: .4byte 0x00000233
_08076420: .4byte 0x02034000
_08076424: .4byte 0x0600E000
_08076428: .4byte 0x80000020
_0807642C:
	ldr r2, _080764C4 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r5, #0
_08076438:
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
_08076442:
	cmp r5, #0
	bne _08076448
	b _080765E2
_08076448:
	ldr r1, _080764C8 @ =0x00000232
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	subs r0, #5
	adds r7, r6, #0
	adds r7, #0x50
	movs r4, #0
	strh r0, [r7]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807647A
	strb r4, [r3]
_0807647A:
	ldrb r5, [r3]
	ldr r0, _080764CC @ =0x0879BEBC
	adds r2, r5, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r7]
	subs r1, #1
	strh r1, [r0, #0x2c]
	cmp r5, #2
	ble _08076496
	b _080765E2
_08076496:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x36
	movs r1, #0x10
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x35
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080764C4: .4byte 0x00000231
_080764C8: .4byte 0x00000232
_080764CC: .4byte 0x0879BEBC
_080764D0:
	ldr r1, _080764F8 @ =0x040000D4
	ldr r0, _080764FC @ =0x02034000
	str r0, [r1]
	ldr r0, _08076500 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _08076504 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08076508 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	b _080765E2
	.align 2, 0
_080764F8: .4byte 0x040000D4
_080764FC: .4byte 0x02034000
_08076500: .4byte 0x0600E000
_08076504: .4byte 0x80000400
_08076508: .4byte 0x00000231
_0807650C:
	movs r5, #3
	ldr r4, _08076534 @ =gMinimapUpdateFlag
_08076510:
	strb r5, [r4]
	bl MinimapDraw
	subs r5, #1
	cmp r5, #0
	bgt _08076510
	ldr r1, _08076538 @ =gNonGameplayRam
	ldr r0, _0807653C @ =0x00000231
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r3, [r1]
	b _080765E2
	.align 2, 0
_08076534: .4byte gMinimapUpdateFlag
_08076538: .4byte gNonGameplayRam
_0807653C: .4byte 0x00000231
_08076540:
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r2, r6, r0
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r2, #0xda
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5a
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #4
	ldr r0, _080765C0 @ =0x0879BEBC
	mov ip, r0
	adds r3, r6, #0
	movs r4, #0
	mov r2, ip
	adds r2, #4
_08076576:
	subs r2, #1
	subs r5, #1
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x35
	strb r4, [r0]
	cmp r5, #0
	bgt _08076576
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080765C4 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_080765C0: .4byte 0x0879BEBC
_080765C4: .4byte 0x00000231
_080765C8:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r2, r6, r1
	ldrb r0, [r2]
	cmp r0, #0x1d
	bls _080765E2
	movs r1, #0
	strb r1, [r2]
	ldr r2, _080765F4 @ =0x00000231
	adds r0, r6, r2
	strb r1, [r0]
	movs r0, #1
	str r0, [sp]
_080765E2:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080765F4: .4byte 0x00000231

	thumb_func_start PauseScreenSubroutine
PauseScreenSubroutine: @ 0x080765F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0807661C @ =gNextOamSlot
	movs r1, #0
	strb r1, [r0]
	movs r7, #0
	ldr r0, _08076620 @ =0x03000B85
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #4
	bls _08076610
	b _08076872
_08076610:
	lsls r0, r1, #2
	ldr r1, _08076624 @ =_08076628
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807661C: .4byte gNextOamSlot
_08076620: .4byte 0x03000B85
_08076624: .4byte _08076628
_08076628: @ jump table
	.4byte _0807663C @ case 0
	.4byte _08076644 @ case 1
	.4byte _08076720 @ case 2
	.4byte _080767A0 @ case 3
	.4byte _08076834 @ case 4
_0807663C:
	bl PauseScreenInit
	strb r0, [r5]
	b _08076872
_08076644:
	ldr r0, _08076678 @ =gNonGameplayRam
	ldrb r3, [r0]
	cmp r3, #0
	beq _080766E0
	ldr r0, _0807667C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08076688
	ldr r3, _08076680 @ =gWrittenToBldalpha_Evb
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _08076684 @ =gWrittenToBldalpha_Eva
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #1
	b _080766A4
	.align 2, 0
_08076678: .4byte gNonGameplayRam
_0807667C: .4byte gPauseScreenFlag
_08076680: .4byte gWrittenToBldalpha_Evb
_08076684: .4byte gWrittenToBldalpha_Eva
_08076688:
	ldr r3, _080766C0 @ =gWrittenToBldalpha_Evb
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _080766C4 @ =gWrittenToBldalpha_Eva
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #2
_080766A4:
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _080766B2
	movs r0, #8
	strh r0, [r2]
_080766B2:
	ldrh r0, [r6]
	cmp r0, #5
	bne _080766BA
	b _080767FA
_080766BA:
	adds r0, #1
	strh r0, [r6]
	b _080767FA
	.align 2, 0
_080766C0: .4byte gWrittenToBldalpha_Evb
_080766C4: .4byte gWrittenToBldalpha_Eva
_080766C8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _080766D8 @ =0x04000050
	ldr r3, _080766DC @ =0x00003F44
	adds r0, r3, #0
	strh r0, [r1]
	b _080767FA
	.align 2, 0
_080766D8: .4byte 0x04000050
_080766DC: .4byte 0x00003F44
_080766E0:
	ldr r2, _080766F4 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _080766FC
	cmp r1, #4
	bls _080766F8
	subs r0, #4
	strh r0, [r2]
	b _08076872
	.align 2, 0
_080766F4: .4byte gWrittenToBldy
_080766F8:
	strh r3, [r2]
	b _08076872
_080766FC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08076718 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0807671C @ =0x0000040C
	adds r0, r3, #0
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076718: .4byte 0x04000050
_0807671C: .4byte 0x0000040C
_08076720:
	bl PauseScreenCallCurrentSubroutine
	cmp r0, #0
	beq _08076776
	ldr r0, _0807674C @ =gNonGameplayRam
	ldrb r1, [r0]
	cmp r1, #0
	beq _08076764
	ldr r1, _08076750 @ =0x04000050
	ldr r2, _08076754 @ =0x00003F7F
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _08076758 @ =gWrittenToBldalpha_Eva
	ldr r0, _0807675C @ =0x04000052
	ldrh r2, [r0]
	ldr r1, _08076760 @ =gWrittenToBldalpha_Evb
	lsrs r0, r2, #8
	strh r0, [r1]
	movs r0, #0xff
	ands r0, r2
	strh r0, [r3]
	b _0807676E
	.align 2, 0
_0807674C: .4byte gNonGameplayRam
_08076750: .4byte 0x04000050
_08076754: .4byte 0x00003F7F
_08076758: .4byte gWrittenToBldalpha_Eva
_0807675C: .4byte 0x04000052
_08076760: .4byte gWrittenToBldalpha_Evb
_08076764:
	ldr r0, _08076790 @ =gWrittenToBldy
	strh r1, [r0]
	ldr r1, _08076794 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
_0807676E:
	ldr r1, _08076798 @ =0x03000B85
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08076776:
	ldr r0, _0807679C @ =gNonGameplayRam
	movs r3, #0x99
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076872
	bl unk_7c440
	bl unk_7cfb0
	b _08076872
	.align 2, 0
_08076790: .4byte gWrittenToBldy
_08076794: .4byte 0x04000050
_08076798: .4byte 0x03000B85
_0807679C: .4byte gNonGameplayRam
_080767A0:
	ldr r0, _080767D4 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807680C
	ldr r0, _080767D8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #4
	bne _080767B8
	movs r4, #1
_080767B8:
	ldr r2, _080767DC @ =gWrittenToBldalpha_Evb
	ldr r3, _080767E0 @ =gWrittenToBldalpha_Eva
	ldrh r1, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	adds r6, r2, #0
	adds r2, r3, #0
	cmp r0, #0
	beq _080767F4
	ldrh r0, [r2]
	cmp r0, r4
	blt _080767E4
	subs r0, r0, r4
	b _080767E6
	.align 2, 0
_080767D4: .4byte gNonGameplayRam
_080767D8: .4byte gPauseScreenFlag
_080767DC: .4byte gWrittenToBldalpha_Evb
_080767E0: .4byte gWrittenToBldalpha_Eva
_080767E4:
	movs r0, #0
_080767E6:
	strh r0, [r2]
	ldrh r0, [r6]
	cmp r0, #0
	beq _080767FA
	subs r0, #1
	strh r0, [r6]
	b _080767FA
_080767F4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080767FA:
	ldr r0, _08076808 @ =0x04000052
	ldrh r1, [r6]
	lsls r1, r1, #8
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
	b _08076872
	.align 2, 0
_08076808: .4byte 0x04000052
_0807680C:
	ldr r1, _08076828 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0807682C
	adds r0, #4
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _08076872
	movs r0, #0x10
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076828: .4byte gWrittenToBldy
_0807682C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08076872
_08076834:
	ldr r1, _08076888 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bne _0807686A
	ldr r0, _0807688C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x61
	bne _0807686A
	ldr r0, _08076890 @ =gPreviousCutscene
	ldrb r0, [r0]
	cmp r0, #7
	beq _0807686A
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08076894 @ =gCurrentCutscene
	movs r0, #7
	strb r0, [r1]
	ldr r1, _08076898 @ =0x0201C000
	ldr r2, _0807689C @ =0x06010000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_0807686A:
	movs r7, #1
	ldr r1, _080768A0 @ =0x03000B85
	movs r0, #0
	strb r0, [r1]
_08076872:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	bl PauseScreenProcessOam
	bl ResetFreeOam
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08076888: .4byte gPauseScreenFlag
_0807688C: .4byte gEventCounter
_08076890: .4byte gPreviousCutscene
_08076894: .4byte gCurrentCutscene
_08076898: .4byte 0x0201C000
_0807689C: .4byte 0x06010000
_080768A0: .4byte 0x03000B85

	thumb_func_start PauseScreenVBLank
PauseScreenVBLank: @ 0x080768A4
	ldr r1, _08076908 @ =0x040000D4
	ldr r0, _0807690C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076910 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	ldr r0, _08076914 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x54
	ldr r0, _08076918 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #8
	ldr r0, _0807691C @ =gWrittenToMosaic_L
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08076920 @ =0x04000010
	ldr r1, _08076924 @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08076908: .4byte 0x040000D4
_0807690C: .4byte gOamData
_08076910: .4byte 0x84000100
_08076914: .4byte gNonGameplayRam
_08076918: .4byte gWrittenToBldy
_0807691C: .4byte gWrittenToMosaic_L
_08076920: .4byte 0x04000010
_08076924: .4byte gBackgroundPositions

	thumb_func_start PauseScreenVBLank_Unused
PauseScreenVBLank_Unused: @ 0x08076928
	push {lr}
	ldr r0, _08076968 @ =0x0400001C
	movs r2, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0807696C @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08076970 @ =0x0300000A
	ldrh r1, [r3]
	cmp r1, #0
	beq _08076952
	ldr r0, _08076974 @ =0x0400000E
	strh r1, [r0]
	strh r2, [r3]
_08076952:
	ldr r2, _08076978 @ =0x04000052
	ldr r0, _0807697C @ =gWrittenToBldalpha_Evb
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08076980 @ =gWrittenToBldalpha_Eva
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08076968: .4byte 0x0400001C
_0807696C: .4byte gNonGameplayRam
_08076970: .4byte 0x0300000A
_08076974: .4byte 0x0400000E
_08076978: .4byte 0x04000052
_0807697C: .4byte gWrittenToBldalpha_Evb
_08076980: .4byte gWrittenToBldalpha_Eva

	thumb_func_start PauseScreenInitVBlank
PauseScreenInitVBlank: @ 0x08076984
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenInit
PauseScreenInit: @ 0x08076990
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08076A50 @ =PauseScreenInitVBlank
	bl CallbackSetVBlank
	movs r0, #1
	mov sb, r0
	ldr r1, _08076A54 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r2, _08076A58 @ =0x04000054
	ldr r1, _08076A5C @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08076A60 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08076A64 @ =gNextOamSlot
	strb r5, [r0]
	movs r3, #0xa8
	lsls r3, r3, #3
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	bl ResetFreeOam
	ldr r1, _08076A68 @ =0x040000D4
	ldr r0, _08076A6C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076A70 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r6, _08076A74 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #4
	beq _08076A10
	ldr r1, _08076A78 @ =0x06010000
	ldr r2, _08076A7C @ =0x0201C000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08076A10:
	ldr r0, _08076A80 @ =gCurrentArea
	ldrb r2, [r0]
	ldr r3, _08076A84 @ =0x00000212
	adds r0, r4, r3
	strb r2, [r0]
	ldr r0, _08076A88 @ =0x03000031
	ldrb r1, [r0]
	subs r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _08076A8C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	strb r5, [r4, #2]
	mov r0, sb
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #3
	bne _08076A94
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08076AA8
	ldr r0, _08076A90 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076AA8
	movs r0, #2
	strb r0, [r4]
	b _08076AA8
	.align 2, 0
_08076A50: .4byte PauseScreenInitVBlank
_08076A54: .4byte 0x04000050
_08076A58: .4byte 0x04000054
_08076A5C: .4byte gWrittenToBldy
_08076A60: .4byte gNonGameplayRam
_08076A64: .4byte gNextOamSlot
_08076A68: .4byte 0x040000D4
_08076A6C: .4byte gOamData
_08076A70: .4byte 0x84000100
_08076A74: .4byte gPauseScreenFlag
_08076A78: .4byte 0x06010000
_08076A7C: .4byte 0x0201C000
_08076A80: .4byte gCurrentArea
_08076A84: .4byte 0x00000212
_08076A88: .4byte 0x03000031
_08076A8C: .4byte 0x03000032
_08076A90: .4byte gCurrentRoom
_08076A94:
	cmp r0, #1
	bne _08076AA2
	movs r0, #2
	strb r0, [r4]
	bl unk_36c4
	b _08076AA8
_08076AA2:
	cmp r0, #4
	beq _08076AA8
	strb r5, [r4]
_08076AA8:
	ldr r4, _08076B04 @ =0x040000D4
	ldr r0, _08076B08 @ =0x085657A8
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08076B0C @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B10 @ =0x0856F71C
	ldr r1, _08076B14 @ =0x06010000
	bl CallLZ77UncompVram
	ldr r1, _08076B18 @ =0x08561FA8
	ldr r2, _08076B1C @ =0x06008000
	movs r3, #0xe0
	lsls r3, r3, #6
	movs r5, #0x10
	str r5, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _08076B20 @ =0x08565B48
	str r0, [r4]
	ldr r0, _08076B24 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08076B28 @ =0x80000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B2C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076B40
	ldr r0, _08076B30 @ =0x0856A254
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B34 @ =0x08565808
	str r0, [r4]
	ldr r0, _08076B38 @ =0x05000060
	str r0, [r4, #4]
	ldr r0, _08076B3C @ =0x800000D0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	b _08076BAA
	.align 2, 0
_08076B04: .4byte 0x040000D4
_08076B08: .4byte 0x085657A8
_08076B0C: .4byte 0x80000030
_08076B10: .4byte 0x0856F71C
_08076B14: .4byte 0x06010000
_08076B18: .4byte 0x08561FA8
_08076B1C: .4byte 0x06008000
_08076B20: .4byte 0x08565B48
_08076B24: .4byte 0x05000200
_08076B28: .4byte 0x80000100
_08076B2C: .4byte gNonGameplayRam
_08076B30: .4byte 0x0856A254
_08076B34: .4byte 0x08565808
_08076B38: .4byte 0x05000060
_08076B3C: .4byte 0x800000D0
_08076B40:
	cmp r0, #1
	bne _08076BA0
	ldr r0, _08076B60 @ =0x0856C868
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B64 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08076B68
	movs r3, #2
	b _08076B78
	.align 2, 0
_08076B60: .4byte 0x0856C868
_08076B64: .4byte gEquipment
_08076B68:
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	cmp r3, #0
	beq _08076BAA
_08076B78:
	ldr r2, _08076B90 @ =0x040000D4
	lsls r0, r3, #5
	ldr r1, _08076B94 @ =0x08565D48
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08076B98 @ =0x05000200
	str r0, [r2, #4]
	ldr r0, _08076B9C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08076BAA
	.align 2, 0
_08076B90: .4byte 0x040000D4
_08076B94: .4byte 0x08565D48
_08076B98: .4byte 0x05000200
_08076B9C: .4byte 0x80000010
_08076BA0:
	ldr r0, _08076C44 @ =0x0856DE80
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
_08076BAA:
	ldr r1, _08076C48 @ =gNonGameplayRam
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076BD2
	ldr r1, _08076C4C @ =0x040000D4
	ldr r0, _08076C50 @ =0x06009800
	str r0, [r1]
	ldr r0, _08076C54 @ =0x06009400
	str r0, [r1, #4]
	ldr r0, _08076C58 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076C5C @ =0x085659A8
	str r0, [r1]
	ldr r0, _08076C60 @ =0x05000060
	str r0, [r1, #4]
	ldr r0, _08076C64 @ =0x800000D0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076BD2:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r6, _08076C68 @ =0x02034800
	movs r0, #0xa
	adds r1, r6, #0
	bl GetMinimapData
	ldr r5, _08076C4C @ =0x040000D4
	str r6, [r5]
	ldr r0, _08076C6C @ =0x0600E800
	str r0, [r5, #4]
	ldr r7, _08076C70 @ =0x80000400
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C74 @ =0x0600F000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C78 @ =0x0600F800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C7C @ =gCurrentArea
	ldrb r3, [r0]
	ldr r0, _08076C80 @ =0x02034000
	str r0, [r5]
	ldr r0, _08076C84 @ =0x0600E000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C88 @ =0x085742E8
	ldr r4, _08076C8C @ =0x0200F800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	str r4, [r5]
	ldr r0, _08076C90 @ =0x0600C000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08076CC8
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08076C98
	ldr r0, _08076C94 @ =0x08573EA0
	adds r1, r6, #0
	bl CallLZ77UncompVram
	b _08076CA0
	.align 2, 0
_08076C44: .4byte 0x0856DE80
_08076C48: .4byte gNonGameplayRam
_08076C4C: .4byte 0x040000D4
_08076C50: .4byte 0x06009800
_08076C54: .4byte 0x06009400
_08076C58: .4byte 0x80000200
_08076C5C: .4byte 0x085659A8
_08076C60: .4byte 0x05000060
_08076C64: .4byte 0x800000D0
_08076C68: .4byte 0x02034800
_08076C6C: .4byte 0x0600E800
_08076C70: .4byte 0x80000400
_08076C74: .4byte 0x0600F000
_08076C78: .4byte 0x0600F800
_08076C7C: .4byte gCurrentArea
_08076C80: .4byte 0x02034000
_08076C84: .4byte 0x0600E000
_08076C88: .4byte 0x085742E8
_08076C8C: .4byte 0x0200F800
_08076C90: .4byte 0x0600C000
_08076C94: .4byte 0x08573EA0
_08076C98:
	ldr r0, _08076CB4 @ =0x085748AC
	adds r1, r6, #0
	bl CallLZ77UncompVram
_08076CA0:
	ldr r1, _08076CB8 @ =0x040000D4
	ldr r0, _08076CBC @ =0x02034800
	str r0, [r1]
	ldr r0, _08076CC0 @ =0x0600C800
	str r0, [r1, #4]
	ldr r0, _08076CC4 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08076CE6
	.align 2, 0
_08076CB4: .4byte 0x085748AC
_08076CB8: .4byte 0x040000D4
_08076CBC: .4byte 0x02034800
_08076CC0: .4byte 0x0600C800
_08076CC4: .4byte 0x80000400
_08076CC8:
	cmp r0, #1
	bne _08076CD4
	ldr r0, _08076CD0 @ =0x08574D48
	b _08076CD6
	.align 2, 0
_08076CD0: .4byte 0x08574D48
_08076CD4:
	ldr r0, _08076D10 @ =0x085753E8
_08076CD6:
	adds r1, r6, #0
	bl CallLZ77UncompVram
	str r6, [r5]
	ldr r0, _08076D14 @ =0x0600D800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
_08076CE6:
	ldr r0, _08076D18 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076D38
	ldr r0, _08076D1C @ =0x085740FC
	ldr r4, _08076D20 @ =0x02034800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	ldr r1, _08076D24 @ =0x040000D4
	str r4, [r1]
	ldr r0, _08076D28 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076D2C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076D30 @ =0x085745A8
	ldr r1, _08076D34 @ =0x02010000
	bl CallLZ77UncompVram
	b _08076D74
	.align 2, 0
_08076D10: .4byte 0x085753E8
_08076D14: .4byte 0x0600D800
_08076D18: .4byte gNonGameplayRam
_08076D1C: .4byte 0x085740FC
_08076D20: .4byte 0x02034800
_08076D24: .4byte 0x040000D4
_08076D28: .4byte 0x0600D000
_08076D2C: .4byte 0x80000400
_08076D30: .4byte 0x085745A8
_08076D34: .4byte 0x02010000
_08076D38:
	ldr r0, _08076D50 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08076D5C
	ldr r0, _08076D54 @ =0x08573DA4
	ldr r1, _08076D58 @ =0x02034800
	bl CallLZ77UncompVram
	b _08076D64
	.align 2, 0
_08076D50: .4byte gPauseScreenFlag
_08076D54: .4byte 0x08573DA4
_08076D58: .4byte 0x02034800
_08076D5C:
	ldr r0, _08076DBC @ =0x08573DA4
	ldr r1, _08076DC0 @ =0x02034800
	bl CallLZ77UncompVram
_08076D64:
	ldr r1, _08076DC4 @ =0x040000D4
	ldr r0, _08076DC0 @ =0x02034800
	str r0, [r1]
	ldr r0, _08076DC8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076DCC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076D74:
	ldr r0, _08076DD0 @ =gCurrentArea
	ldrb r0, [r0]
	ldr r1, _08076DC0 @ =0x02034800
	bl GetMinimapData
	movs r1, #0
	ldr r2, _08076DD4 @ =gBackgroundPositions
	adds r0, r2, #0
	movs r3, #3
_08076D86:
	strh r1, [r0]
	strh r1, [r0, #2]
	adds r0, #4
	subs r3, #1
	cmp r3, #0
	bge _08076D86
	ldr r1, _08076DD8 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #9]
	strb r0, [r1, #6]
	strb r0, [r1, #8]
	ldr r0, _08076DDC @ =0x0879BE88
	ldr r0, [r0]
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #3
	strb r0, [r1, #1]
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	beq _08076DE0
	movs r0, #1
	b _08076DF6
	.align 2, 0
_08076DBC: .4byte 0x08573DA4
_08076DC0: .4byte 0x02034800
_08076DC4: .4byte 0x040000D4
_08076DC8: .4byte 0x0600D000
_08076DCC: .4byte 0x80000400
_08076DD0: .4byte gCurrentArea
_08076DD4: .4byte gBackgroundPositions
_08076DD8: .4byte gNonGameplayRam
_08076DDC: .4byte 0x0879BE88
_08076DE0:
	ldr r0, _08076DF0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _08076DF4
	movs r0, #0
	b _08076DF6
	.align 2, 0
_08076DF0: .4byte gPauseScreenFlag
_08076DF4:
	movs r0, #2
_08076DF6:
	strb r0, [r5, #1]
	ldrb r0, [r5]
	cmp r0, #0
	beq _08076E4C
	bl EventCheckSetNavigationRoomEvent
	cmp r0, #0
	beq _08076E28
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #4
	strb r0, [r1]
	ldr r4, _08076E20 @ =gCurrentArea
	ldrb r0, [r4]
	ldr r1, _08076E24 @ =0x02034000
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	b _08076E30
	.align 2, 0
_08076E20: .4byte gCurrentArea
_08076E24: .4byte 0x02034000
_08076E28:
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #0xa
	strb r0, [r1]
_08076E30:
	ldr r0, _08076E5C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _08076E4C
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _08076E60 @ =0x040000D4
	add r3, sp, #4
	str r3, [r1]
	ldr r0, _08076E64 @ =0x06017C00
	str r0, [r1, #4]
	ldr r0, _08076E68 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076E4C:
	ldr r0, _08076E6C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08076E70
	bl PauseDebugDrawEverything
	b _08076E74
	.align 2, 0
_08076E5C: .4byte gEventCounter
_08076E60: .4byte 0x040000D4
_08076E64: .4byte 0x06017C00
_08076E68: .4byte 0x85000010
_08076E6C: .4byte gNonGameplayRam
_08076E70:
	bl StatusScreenDrawEverything
_08076E74:
	movs r0, #0
	bl unk_75988
	bl ProcessPauseScreenText
	bl ProcessEasySleepText
	bl PauseScreenSetupOam
	bl NavigationConversationGetCurrentConversation
	bl NavigationConversationLoadPopUpGraphics
	bl NavigationConversationLoadSpecialGraphics
	movs r0, #0xff
	bl unk_77840
	bl unk_7ce6c
	ldr r2, _08076EF8 @ =0x04000010
	ldr r1, _08076EFC @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	ldr r5, _08076F00 @ =gWrittenToBldy
	movs r1, #0
	strh r1, [r5]
	ldr r4, _08076F04 @ =gWrittenToBldalpha_Evb
	strh r1, [r4]
	ldr r3, _08076F08 @ =gWrittenToBldalpha_Eva
	movs r2, #0x10
	strh r2, [r3]
	ldr r0, _08076F0C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076F18
	strh r1, [r4]
	strh r1, [r3]
	ldr r1, _08076F10 @ =0x04000050
	ldr r4, _08076F14 @ =0x00003F7F
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	b _08076F1E
	.align 2, 0
_08076EF8: .4byte 0x04000010
_08076EFC: .4byte gBackgroundPositions
_08076F00: .4byte gWrittenToBldy
_08076F04: .4byte gWrittenToBldalpha_Evb
_08076F08: .4byte gWrittenToBldalpha_Eva
_08076F0C: .4byte gNonGameplayRam
_08076F10: .4byte 0x04000050
_08076F14: .4byte 0x00003F7F
_08076F18:
	strh r2, [r5]
	ldr r1, _08076F3C @ =0x04000050
	movs r0, #0xff
_08076F1E:
	strh r0, [r1]
	ldr r1, _08076F40 @ =0x04000040
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076F44 @ =gNonGameplayRam
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08076F4C
	ldr r1, _08076F48 @ =0x0400004A
	movs r0, #0x37
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3f
	b _08076F56
	.align 2, 0
_08076F3C: .4byte 0x04000050
_08076F40: .4byte 0x04000040
_08076F44: .4byte gNonGameplayRam
_08076F48: .4byte 0x0400004A
_08076F4C:
	ldr r1, _08076FDC @ =0x0400004A
	movs r0, #0x35
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3d
_08076F56:
	strb r0, [r1]
	ldr r1, _08076FE0 @ =0x04000048
	movs r0, #0x3f
	strb r0, [r1]
	adds r4, r5, #0
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	movs r3, #0
	cmp r0, #1
	beq _08076F6E
	movs r3, #0xa0
_08076F6E:
	ldr r1, _08076FE4 @ =0x04000044
	lsls r0, r3, #8
	movs r2, #0xa0
	orrs r0, r2
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076FE8 @ =0x04000046
	strh r2, [r0]
	ldr r0, _08076FEC @ =gWrittenToMosaic_L
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08076FF0 @ =0x0400004C
	strh r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08077018
	ldr r1, _08076FF4 @ =0x0400000A
	ldr r2, _08076FF8 @ =0x00001B03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r3, _08076FFC @ =0x0000DC49
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #6
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r2, #0xbe
	lsls r2, r2, #7
	strh r2, [r3]
	ldr r0, _08077000 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077008
	adds r1, #4
	ldr r4, _08077004 @ =0x00001A0A
	adds r0, r4, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r0, r2, #0
	eors r0, r1
	strh r0, [r3]
	b _08077046
	.align 2, 0
_08076FDC: .4byte 0x0400004A
_08076FE0: .4byte 0x04000048
_08076FE4: .4byte 0x04000044
_08076FE8: .4byte 0x04000046
_08076FEC: .4byte gWrittenToMosaic_L
_08076FF0: .4byte 0x0400004C
_08076FF4: .4byte 0x0400000A
_08076FF8: .4byte 0x00001B03
_08076FFC: .4byte 0x0000DC49
_08077000: .4byte gPauseScreenFlag
_08077004: .4byte 0x00001A0A
_08077008:
	ldr r1, _08077010 @ =0x0400000C
	ldr r2, _08077014 @ =0x00001A0A
	adds r0, r2, #0
	b _08077044
	.align 2, 0
_08077010: .4byte 0x0400000C
_08077014: .4byte 0x00001A0A
_08077018:
	ldr r1, _0807706C @ =0x0400000E
	ldr r3, _08077070 @ =0x0000DC4B
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #2
	ldr r4, _08077074 @ =0x00001A02
	adds r0, r4, #0
	strh r0, [r1]
	subs r1, #4
	ldr r2, _08077078 @ =0x00001801
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0xc8
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	movs r4, #0x9a
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #0xfc
	lsls r0, r0, #7
_08077044:
	strh r0, [r1]
_08077046:
	ldr r0, _0807707C @ =PauseScreenVBLank
	bl CallbackSetVBlank
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08077080 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807706C: .4byte 0x0400000E
_08077070: .4byte 0x0000DC4B
_08077074: .4byte 0x00001A02
_08077078: .4byte 0x00001801
_0807707C: .4byte PauseScreenVBLank
_08077080: .4byte gNonGameplayRam

	thumb_func_start GetMinimapData
GetMinimapData: @ 0x08077084
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0807709A
	ldr r0, _080770AC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	bls _0807709A
	movs r1, #9
_0807709A:
	ldr r0, _080770B0 @ =0x0879BE5C
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r2, #0
	bl CallLZ77UncompVram
	pop {r0}
	bx r0
	.align 2, 0
_080770AC: .4byte gEventCounter
_080770B0: .4byte 0x0879BE5C

	thumb_func_start PauseScreenCallCurrentSubroutine
PauseScreenCallCurrentSubroutine: @ 0x080770B4
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080770E8 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x28
	ldrb r0, [r5]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080770CE
	bl CheckForMaintainedInput
_080770CE:
	ldrb r0, [r4, #6]
	adds r0, #1
	strb r0, [r4, #6]
	ldrb r0, [r5]
	cmp r0, #0xc
	bls _080770DC
	b _08077262
_080770DC:
	lsls r0, r0, #2
	ldr r1, _080770EC @ =_080770F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080770E8: .4byte gNonGameplayRam
_080770EC: .4byte _080770F0
_080770F0: @ jump table
	.4byte _08077124 @ case 0
	.4byte _0807714A @ case 1
	.4byte _08077136 @ case 2
	.4byte _08077166 @ case 3
	.4byte _08077196 @ case 4
	.4byte _080771AC @ case 5
	.4byte _080771C4 @ case 6
	.4byte _080771DC @ case 7
	.4byte _080771E2 @ case 8
	.4byte _08077208 @ case 9
	.4byte _080771E2 @ case 10
	.4byte _0807722C @ case 11
	.4byte _0807724C @ case 12
_08077124:
	ldr r2, _0807713C @ =gChangedInput
	ldr r0, _08077140 @ =gButtonAssignments
	ldrh r0, [r0, #6]
	movs r1, #2
	orrs r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08077144
_08077136:
	movs r6, #1
	b _08077262
	.align 2, 0
_0807713C: .4byte gChangedInput
_08077140: .4byte gButtonAssignments
_08077144:
	bl MapScreenSubroutine
	b _08077262
_0807714A:
	ldr r0, _0807715C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08077160
	bl PauseScreenMoveDebugCursor
	bl PauseDebugSubroutine
	b _08077262
	.align 2, 0
_0807715C: .4byte gNonGameplayRam
_08077160:
	bl StatusScreenSubroutine
	b _08077262
_08077166:
	ldr r4, _0807717C @ =gNonGameplayRam
	movs r1, #0x99
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077180
	bl unk_7c630
	b _08077262
	.align 2, 0
_0807717C: .4byte gNonGameplayRam
_08077180:
	bl NavigationConversationUpdatePopUp
	bl NavigationConversationSubroutine
	cmp r0, #0
	beq _08077262
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #9
	strb r0, [r1]
	b _08077262
_08077196:
	bl PauseScreenMapDownload
	cmp r0, #0
	beq _08077262
	ldr r0, _080771A8 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #8
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771A8: .4byte gNonGameplayRam
_080771AC:
	bl EasySleepMenuSubroutine
	cmp r0, #0
	beq _08077262
	ldr r0, _080771C0 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #0xc
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771C0: .4byte gNonGameplayRam
_080771C4:
	bl PauseDebugWindowAppearing
	cmp r0, #0
	beq _08077262
	ldr r1, _080771D8 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #1
	b _0807723E
	.align 2, 0
_080771D8: .4byte gNonGameplayRam
_080771DC:
	bl PauseDebugWindowDisappearing
	b _08077250
_080771E2:
	ldr r0, _08077204 @ =gNonGameplayRam
	adds r3, r0, #0
	adds r3, #0x28
	movs r2, #0
	movs r1, #3
	strb r1, [r3]
	movs r1, #0
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	b _0807725E
	.align 2, 0
_08077204: .4byte gNonGameplayRam
_08077208:
	ldr r0, _0807721C @ =gNonGameplayRam
	ldrb r2, [r0]
	cmp r2, #0
	beq _08077220
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #2
	strb r0, [r1]
	b _08077262
	.align 2, 0
_0807721C: .4byte gNonGameplayRam
_08077220:
	adds r0, #0x28
	strb r2, [r0]
	movs r0, #4
	bl unk_77840
	b _08077262
_0807722C:
	bl EasySleepMenuInit
	cmp r0, #0
	beq _08077262
	ldr r1, _08077248 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #5
_0807723E:
	strb r0, [r3]
	strb r2, [r1, #7]
	strb r2, [r1, #6]
	b _08077262
	.align 2, 0
_08077248: .4byte gNonGameplayRam
_0807724C:
	bl EasySleepMenuQuit
_08077250:
	cmp r0, #0
	beq _08077262
	ldr r0, _0807726C @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x28
	movs r1, #0
	strb r1, [r2]
_0807725E:
	strb r1, [r0, #7]
	strb r1, [r0, #6]
_08077262:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807726C: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveDebugCursor
PauseScreenMoveDebugCursor: @ 0x08077270
	push {r4, lr}
	movs r2, #0
	ldr r0, _080772AC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807728A
	ldr r0, _080772B0 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0807728A
	movs r2, #1
_0807728A:
	cmp r2, #0
	beq _0807730E
	ldr r1, _080772B4 @ =gChangedInput
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080772B8
	ldr r2, _080772B0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _080772D2
	adds r0, r3, #0
	subs r0, #8
	b _080772D0
	.align 2, 0
_080772AC: .4byte gButtonInput
_080772B0: .4byte gNonGameplayRam
_080772B4: .4byte gChangedInput
_080772B8:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080772D2
	ldr r2, _080772F0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0x8f
	bgt _080772D2
	adds r0, r3, #0
	adds r0, #8
_080772D0:
	strh r0, [r2, #0x2c]
_080772D2:
	ldrh r1, [r1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080772F4
	ldr r1, _080772F0 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0xe7
	bgt _0807730E
	adds r0, r2, #0
	adds r0, #8
	b _0807730C
	.align 2, 0
_080772F0: .4byte gNonGameplayRam
_080772F4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807730E
	ldr r1, _08077314 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r4, #0x2e
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0807730E
	adds r0, r2, #0
	subs r0, #8
_0807730C:
	strh r0, [r1, #0x2e]
_0807730E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077314: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveBackgroundToXPosition
PauseScreenMoveBackgroundToXPosition: @ 0x08077318
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r7, #0
	ldr r1, _08077344 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3]
	movs r6, #1
	cmp r2, r4
	bls _08077334
	subs r6, #2
_08077334:
	ldr r0, _08077348 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _0807734C
	muls r0, r6, r0
	b _0807734E
	.align 2, 0
_08077344: .4byte gBackgroundPositions
_08077348: .4byte gNonGameplayRam
_0807734C:
	lsls r0, r6, #5
_0807734E:
	adds r0, r2, r0
	strh r0, [r3]
	cmp r6, #0
	ble _08077364
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r4
	blo _0807737A
	strh r4, [r1]
	b _08077378
_08077364:
	lsls r0, r5, #2
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bgt _0807737A
	subs r0, r4, r0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08077378:
	movs r7, #1
_0807737A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PauseScreenMoveBackgroundToYPosition
PauseScreenMoveBackgroundToYPosition: @ 0x08077384
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	mov ip, r0
	ldr r1, _080773B4 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3, #2]
	movs r4, #1
	adds r7, r1, #0
	cmp r2, r6
	bls _080773A4
	subs r4, #2
_080773A4:
	ldr r0, _080773B8 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _080773BC
	muls r0, r4, r0
	b _080773BE
	.align 2, 0
_080773B4: .4byte gBackgroundPositions
_080773B8: .4byte gNonGameplayRam
_080773BC:
	lsls r0, r4, #5
_080773BE:
	adds r0, r2, r0
	strh r0, [r3, #2]
	cmp r4, #0
	ble _080773D6
	lsls r0, r5, #2
	adds r1, r0, r7
	ldrh r1, [r1, #2]
	cmp r1, r6
	blo _080773E6
	movs r1, #1
	mov ip, r1
	b _080773EC
_080773D6:
	lsls r0, r5, #2
	adds r1, r0, r7
	movs r2, #2
	ldrsh r1, [r1, r2]
	cmp r1, r6
	bgt _080773E6
	movs r1, #1
	mov ip, r1
_080773E6:
	mov r2, ip
	cmp r2, #0
	beq _080773F0
_080773EC:
	adds r0, r0, r7
	strh r6, [r0, #2]
_080773F0:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start PauseScreenSetPauseDebugWindow
PauseScreenSetPauseDebugWindow: @ 0x080773F8
	push {lr}
	ldr r0, _08077418 @ =gBackgroundPositions
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	subs r1, r0, r1
	cmp r1, #0xa0
	ble _0807740A
	movs r1, #0xa0
_0807740A:
	ldr r0, _0807741C @ =0x04000044
	lsls r1, r1, #8
	movs r2, #0xa0
	orrs r1, r2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08077418: .4byte gBackgroundPositions
_0807741C: .4byte 0x04000044

	thumb_func_start PauseDebugWindowAppearing
PauseDebugWindowAppearing: @ 0x08077420
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08077438 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _08077454
	cmp r0, #1
	bgt _0807743C
	cmp r0, #0
	beq _08077442
	b _08077496
	.align 2, 0
_08077438: .4byte gNonGameplayRam
_0807743C:
	cmp r0, #2
	beq _08077462
	b _08077496
_08077442:
	movs r0, #0x80
	lsls r0, r0, #2
	bl SoundPlay
	movs r0, #0x10
	movs r1, #0x29
	bl UpdateMenuOamDataId
	b _0807745A
_08077454:
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bls _08077496
_0807745A:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _08077496
_08077462:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _08077492
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataId
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataId
	movs r0, #3
	bl unk_77840
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08077490
	bl PauseDebugSetupCursor
_08077490:
	movs r5, #1
_08077492:
	bl PauseScreenSetPauseDebugWindow
_08077496:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PauseDebugWindowDisappearing
PauseDebugWindowDisappearing: @ 0x080774A0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080774B8 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _080774D4
	cmp r0, #1
	bgt _080774BC
	cmp r0, #0
	beq _080774C2
	b _080774F6
	.align 2, 0
_080774B8: .4byte gNonGameplayRam
_080774BC:
	cmp r0, #2
	beq _080774E2
	b _080774F6
_080774C2:
	ldr r0, _080774D0 @ =0x00000201
	bl SoundPlay
	movs r0, #4
	bl unk_77840
	b _080774DA
	.align 2, 0
_080774D0: .4byte 0x00000201
_080774D4:
	ldrb r0, [r4, #6]
	cmp r0, #4
	bls _080774F6
_080774DA:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _080774F6
_080774E2:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _080774F2
	movs r5, #1
_080774F2:
	bl PauseScreenSetPauseDebugWindow
_080774F6:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EasySleepMenuInit
EasySleepMenuInit: @ 0x08077500
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807751C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #8
	bls _08077512
	b _080776FC
_08077512:
	lsls r0, r1, #2
	ldr r1, _08077520 @ =_08077524
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807751C: .4byte gNonGameplayRam
_08077520: .4byte _08077524
_08077524: @ jump table
	.4byte _08077548 @ case 0
	.4byte _08077564 @ case 1
	.4byte _08077588 @ case 2
	.4byte _080775A0 @ case 3
	.4byte _080775F8 @ case 4
	.4byte _08077658 @ case 5
	.4byte _08077668 @ case 6
	.4byte _08077684 @ case 7
	.4byte _080776EE @ case 8
_08077548:
	ldr r0, _08077560 @ =0x00000202
	bl SoundPlay
	movs r0, #0x11
	movs r1, #0x2b
	bl UpdateMenuOamDataId
	movs r0, #3
	bl unk_77840
	b _08077702
	.align 2, 0
_08077560: .4byte 0x00000202
_08077564:
	ldr r1, _08077578 @ =0x040000D4
	ldr r0, _0807757C @ =0x02010000
	str r0, [r1]
	ldr r0, _08077580 @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _08077584 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077702
	.align 2, 0
_08077578: .4byte 0x040000D4
_0807757C: .4byte 0x02010000
_08077580: .4byte 0x0600C000
_08077584: .4byte 0x80000400
_08077588:
	ldr r1, _08077598 @ =0x04000050
	ldr r2, _0807759C @ =0x00003FFE
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	b _08077702
	.align 2, 0
_08077598: .4byte 0x04000050
_0807759C: .4byte 0x00003FFE
_080775A0:
	ldr r0, _080775D0 @ =0x040000D4
	ldr r1, _080775D4 @ =0x0200F000
	str r1, [r0]
	ldr r1, _080775D8 @ =0x0200D380
	str r1, [r0, #4]
	ldr r2, _080775DC @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E0 @ =0x0200F400
	str r1, [r0]
	ldr r1, _080775E4 @ =0x0200D780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E8 @ =0x0200F080
	str r1, [r0]
	ldr r1, _080775EC @ =0x0200DB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775F0 @ =0x0200F480
	str r1, [r0]
	ldr r1, _080775F4 @ =0x0200DF80
	b _08077626
	.align 2, 0
_080775D0: .4byte 0x040000D4
_080775D4: .4byte 0x0200F000
_080775D8: .4byte 0x0200D380
_080775DC: .4byte 0x80000040
_080775E0: .4byte 0x0200F400
_080775E4: .4byte 0x0200D780
_080775E8: .4byte 0x0200F080
_080775EC: .4byte 0x0200DB80
_080775F0: .4byte 0x0200F480
_080775F4: .4byte 0x0200DF80
_080775F8:
	ldr r0, _08077630 @ =0x040000D4
	ldr r1, _08077634 @ =0x0200F1C0
	str r1, [r0]
	ldr r1, _08077638 @ =0x0200E380
	str r1, [r0, #4]
	ldr r2, _0807763C @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077640 @ =0x0200F5C0
	str r1, [r0]
	ldr r1, _08077644 @ =0x0200E780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077648 @ =0x0200F240
	str r1, [r0]
	ldr r1, _0807764C @ =0x0200EB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077650 @ =0x0200F640
	str r1, [r0]
	ldr r1, _08077654 @ =0x0200EF80
_08077626:
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	b _08077702
	.align 2, 0
_08077630: .4byte 0x040000D4
_08077634: .4byte 0x0200F1C0
_08077638: .4byte 0x0200E380
_0807763C: .4byte 0x80000040
_08077640: .4byte 0x0200F5C0
_08077644: .4byte 0x0200E780
_08077648: .4byte 0x0200F240
_0807764C: .4byte 0x0200EB80
_08077650: .4byte 0x0200F640
_08077654: .4byte 0x0200EF80
_08077658:
	ldr r1, _08077660 @ =0x0200D000
	ldr r2, _08077664 @ =0x06006000
	b _0807766C
	.align 2, 0
_08077660: .4byte 0x0200D000
_08077664: .4byte 0x06006000
_08077668:
	ldr r1, _0807767C @ =0x0200E000
	ldr r2, _08077680 @ =0x06007000
_0807766C:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _08077702
	.align 2, 0
_0807767C: .4byte 0x0200E000
_08077680: .4byte 0x06007000
_08077684:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _080776FC
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080776D8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xb
	bhi _080776DC
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _080776FC
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r4, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #2
	bl UpdateMenuOamDataId
	movs r0, #0x8c
	strh r0, [r4, #0x3a]
	movs r0, #0x44
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	subs r0, #0x51
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	b _080776FC
	.align 2, 0
_080776D8: .4byte gWrittenToBldy
_080776DC:
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataId
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataId
	b _08077702
_080776EE:
	ldr r0, _08077718 @ =gDisableSoftReset
	movs r1, #1
	strb r1, [r0]
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_080776FC:
	movs r0, #0
	cmp r0, #0
	beq _0807770E
_08077702:
	ldr r0, _0807771C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_0807770E:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077718: .4byte gDisableSoftReset
_0807771C: .4byte gNonGameplayRam

	thumb_func_start EasySleepMenuQuit
EasySleepMenuQuit: @ 0x08077720
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807773C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #6
	bls _08077732
	b _08077820
_08077732:
	lsls r0, r1, #2
	ldr r1, _08077740 @ =_08077744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807773C: .4byte gNonGameplayRam
_08077740: .4byte _08077744
_08077744: @ jump table
	.4byte _08077760 @ case 0
	.4byte _0807776C @ case 1
	.4byte _08077824 @ case 2
	.4byte _080777B8 @ case 3
	.4byte _080777D0 @ case 4
	.4byte _080777F4 @ case 5
	.4byte _08077818 @ case 6
_08077760:
	ldr r1, _08077768 @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
	b _08077824
	.align 2, 0
_08077768: .4byte gDisableSoftReset
_0807776C:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _08077820
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080777B0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08077824
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _08077820
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	ldr r0, _080777B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #0
	bl UpdateMenuOamDataId
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _08077820
	.align 2, 0
_080777B0: .4byte gWrittenToBldy
_080777B4: .4byte 0x0000FEFF
_080777B8:
	ldr r2, _080777CC @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08077824
	.align 2, 0
_080777CC: .4byte 0x06006000
_080777D0:
	ldr r1, _080777E4 @ =0x040000D4
	ldr r0, _080777E8 @ =0x0200F800
	str r0, [r1]
	ldr r0, _080777EC @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _080777F0 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077824
	.align 2, 0
_080777E4: .4byte 0x040000D4
_080777E8: .4byte 0x0200F800
_080777EC: .4byte 0x0600C000
_080777F0: .4byte 0x80000400
_080777F4:
	ldr r1, _08077810 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08077814 @ =0x0000040C
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #4
	bl unk_77840
	b _08077824
	.align 2, 0
_08077810: .4byte 0x04000050
_08077814: .4byte 0x0000040C
_08077818:
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_08077820:
	cmp r6, #0
	beq _08077830
_08077824:
	ldr r0, _0807783C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_08077830:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807783C: .4byte gNonGameplayRam

	thumb_func_start unk_77840
unk_77840: @ 0x08077840
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r6, #0
	ldr r1, _08077860 @ =gNonGameplayRam
	ldrb r0, [r1, #1]
	adds r5, r1, #0
	cmp r0, #0xb
	bls _08077856
	b _08077ADA
_08077856:
	lsls r0, r0, #2
	ldr r1, _08077864 @ =_08077868
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077860: .4byte gNonGameplayRam
_08077864: .4byte _08077868
_08077868: @ jump table
	.4byte _08077898 @ case 0
	.4byte _08077ADA @ case 1
	.4byte _08077ADA @ case 2
	.4byte _080778C0 @ case 3
	.4byte _080778EC @ case 4
	.4byte _08077944 @ case 5
	.4byte _0807796A @ case 6
	.4byte _080779A4 @ case 7
	.4byte _080779DC @ case 8
	.4byte _08077A24 @ case 9
	.4byte _08077A78 @ case 10
	.4byte _08077AB0 @ case 11
_08077898:
	movs r6, #5
	ldr r1, _080778B4 @ =0x0200C000
	ldr r2, _080778B8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _080778BC @ =gNonGameplayRam
	movs r0, #8
	strb r0, [r1, #1]
	b _08077ADA
	.align 2, 0
_080778B4: .4byte 0x0200C000
_080778B8: .4byte 0x06007000
_080778BC: .4byte gNonGameplayRam
_080778C0:
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	ldr r1, _080778E4 @ =0x0200C000
	ldr r2, _080778E8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #4
	b _08077AD8
	.align 2, 0
_080778E4: .4byte 0x0200C000
_080778E8: .4byte 0x06007000
_080778EC:
	cmp r4, #1
	bne _08077908
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	movs r0, #5
	b _08077AD8
_08077908:
	cmp r4, #3
	bne _08077924
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077920 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077920: .4byte 0x0000FEFF
_08077924:
	cmp r4, #5
	beq _0807792A
	b _08077ADA
_0807792A:
	movs r6, #3
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077940 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077940: .4byte 0x0000FEFF
_08077944:
	cmp r4, #2
	bne _08077960
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	b _080779F6
_08077960:
	cmp r4, #3
	beq _08077966
	b _08077ADA
_08077966:
	movs r0, #7
	b _08077AD8
_0807796A:
	cmp r4, #4
	beq _08077970
	b _08077ADA
_08077970:
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0807799C @ =0x0200C000
	ldr r2, _080779A0 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	strb r4, [r5, #1]
	b _08077ADA
	.align 2, 0
_0807799C: .4byte 0x0200C000
_080779A0: .4byte 0x06007000
_080779A4:
	cmp r4, #4
	beq _080779AA
	b _08077ADA
_080779AA:
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _080779D0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080779D4 @ =0x0200C000
	ldr r2, _080779D8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #5
	b _08077AD8
	.align 2, 0
_080779D0: .4byte 0x0000FEFF
_080779D4: .4byte 0x0200C000
_080779D8: .4byte 0x06007000
_080779DC:
	cmp r4, #2
	bne _08077A04
	movs r6, #4
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #9
_080779F6:
	strb r0, [r5, #1]
	ldr r0, _08077A00 @ =0x00000203
	bl SoundPlay
	b _08077ADA
	.align 2, 0
_08077A00: .4byte 0x00000203
_08077A04:
	cmp r4, #3
	beq _08077A0C
	cmp r4, #5
	bne _08077ADA
_08077A0C:
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A20 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xb
	b _08077AD8
	.align 2, 0
_08077A20: .4byte 0x0000FEFF
_08077A24:
	cmp r4, #1
	bne _08077A40
	movs r6, #5
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A3C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08077AD6
	.align 2, 0
_08077A3C: .4byte 0x0000FEFF
_08077A40:
	cmp r4, #3
	bne _08077A5C
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A58 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A58: .4byte 0x0000FEFF
_08077A5C:
	cmp r4, #5
	bne _08077ADA
	movs r6, #6
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A74 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A74: .4byte 0x0000FEFF
_08077A78:
	cmp r4, #4
	bne _08077ADA
	movs r6, #4
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08077AA8 @ =0x0200C000
	ldr r2, _08077AAC @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #9
	b _08077AD8
	.align 2, 0
_08077AA8: .4byte 0x0200C000
_08077AAC: .4byte 0x06007000
_08077AB0:
	cmp r4, #4
	bne _08077ADA
	movs r6, #5
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077AEC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08077AF0 @ =0x0200C000
	ldr r2, _08077AF4 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08077AD6:
	movs r0, #8
_08077AD8:
	strb r0, [r5, #1]
_08077ADA:
	subs r0, r6, #1
	cmp r0, #5
	bls _08077AE2
	b _08077C6E
_08077AE2:
	lsls r0, r0, #2
	ldr r1, _08077AF8 @ =_08077AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077AEC: .4byte 0x0000FEFF
_08077AF0: .4byte 0x0200C000
_08077AF4: .4byte 0x06007000
_08077AF8: .4byte _08077AFC
_08077AFC: @ jump table
	.4byte _08077B14 @ case 0
	.4byte _08077B74 @ case 1
	.4byte _08077B94 @ case 2
	.4byte _08077BA8 @ case 3
	.4byte _08077C18 @ case 4
	.4byte _08077C60 @ case 5
_08077B14:
	ldr r4, _08077B70 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xbe
	movs r0, #0x1c
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B70: .4byte gNonGameplayRam
_08077B74:
	ldr r1, _08077B8C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0xd2
	movs r0, #0
	strb r0, [r2]
	adds r2, #0xc
	strb r0, [r2]
	adds r1, #0xbe
	ldr r0, _08077B90 @ =0x0000FF9C
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B8C: .4byte gNonGameplayRam
_08077B90: .4byte 0x0000FF9C
_08077B94:
	ldr r0, _08077BA4 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xd2
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xde
	b _08077C6C
	.align 2, 0
_08077BA4: .4byte gNonGameplayRam
_08077BA8:
	ldr r4, _08077C14 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r3, #0
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd0
	strb r3, [r0]
	adds r0, #0xc
	strb r3, [r0]
	b _08077C6E
	.align 2, 0
_08077C14: .4byte gNonGameplayRam
_08077C18:
	ldr r3, _08077C5C @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xde
	movs r0, #0
	strb r0, [r1]
	subs r1, #0xc
	movs r0, #0x34
	strb r0, [r1]
	subs r1, #8
	movs r2, #0
	movs r0, #0xca
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x8e
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xd1
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0xd3
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	b _08077C6E
	.align 2, 0
_08077C5C: .4byte gNonGameplayRam
_08077C60:
	ldr r0, _08077C78 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xde
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xd2
_08077C6C:
	strb r1, [r0]
_08077C6E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077C78: .4byte gNonGameplayRam

	thumb_func_start MapScreenUpdateArrowsAndBlinkingSquare
MapScreenUpdateArrowsAndBlinkingSquare: @ 0x08077C7C
	push {r4, r5, lr}
	ldr r3, _08077D4C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r2, _08077D50 @ =gBackgroundPositions
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r4, #0xd7
	lsls r4, r4, #1
	adds r1, r3, r4
	strh r0, [r1]
	ldr r5, _08077D54 @ =0x00000211
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	subs r4, #2
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, #1
	subs r5, #0x67
	adds r0, r3, r5
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x12
	beq _08077CCE
	cmp r0, #0x13
	beq _08077CCE
	cmp r0, #0x14
	beq _08077CCE
	cmp r0, #0x15
	beq _08077CCE
	cmp r0, #0xe
	beq _08077CCE
	cmp r0, #0xf
	beq _08077CCE
	movs r1, #0
_08077CCE:
	cmp r1, #0
	beq _08077CFC
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r1, r4, r3
	strh r0, [r1]
	ldr r5, _08077D58 @ =0x0000020D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r1, r4, r2
	strh r0, [r1]
_08077CFC:
	ldr r0, _08077D5C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08077D0A
	b _08077E38
_08077D0A:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077D64
	ldr r3, _08077D60 @ =0x08576158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	b _08077E38
	.align 2, 0
_08077D4C: .4byte gNonGameplayRam
_08077D50: .4byte gBackgroundPositions
_08077D54: .4byte 0x00000211
_08077D58: .4byte 0x0000020D
_08077D5C: .4byte gPauseScreenFlag
_08077D60: .4byte 0x08576158
_08077D64:
	ldr r2, _08077D8C @ =0x08576158
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077D90 @ =0x0000025A
	adds r0, r4, r5
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
	cmp r1, #0xd
	ble _08077D94
	ldrb r0, [r2, #2]
	b _08077D9A
	.align 2, 0
_08077D8C: .4byte 0x08576158
_08077D90: .4byte 0x0000025A
_08077D94:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077D9A:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	movs r5, #0x96
	lsls r5, r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #0xe
	ble _08077DC6
	ldrb r0, [r2, #6]
	b _08077DCC
_08077DC6:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077DCC:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077DF8 @ =0x00000259
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077DFC
	ldrb r0, [r2, #0xa]
	b _08077E02
	.align 2, 0
_08077DF8: .4byte 0x00000259
_08077DFC:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E02:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077E2C @ =0x0000025D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r5, #4
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077E30
	ldrb r0, [r2, #0xe]
	b _08077E36
	.align 2, 0
_08077E2C: .4byte 0x0000025D
_08077E30:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E36:
	strh r0, [r3, #0x2e]
_08077E38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MapScreenDrawSpecialOam
MapScreenDrawSpecialOam: @ 0x08077E40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08077E70 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077E5E
	b _080780E0
_08077E5E:
	mov r0, r8
	cmp r0, #1
	beq _08077EF0
	cmp r0, #1
	bgt _08077E74
	cmp r0, #0
	beq _08077E7C
	b _08077F5A
	.align 2, 0
_08077E70: .4byte gPauseScreenFlag
_08077E74:
	mov r1, r8
	cmp r1, #2
	beq _08077F3C
	b _08077F5A
_08077E7C:
	ldr r0, _08077EE0 @ =gNonGameplayRam
	ldrb r1, [r0]
	movs r2, #3
	cmp r1, #0
	beq _08077E88
	movs r2, #1
_08077E88:
	movs r4, #0
	ldr r7, _08077EE4 @ =gEquipment
	ldr r5, _08077EE8 @ =0x08576150
	mov sb, r2
	movs r2, #4
	rsbs r2, r2, #0
	mov sl, r2
_08077E96:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077EA6
	cmp r0, r3
	blt _08077EA6
	movs r6, #1
_08077EA6:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08077EE0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldr r0, _08077EEC @ =0x08576151
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r0, r0, r6
	movs r2, #0x36
	strb r0, [r2, r1]
	movs r0, #0x24
	strh r0, [r1, #0x2c]
	movs r0, #0xd4
	strh r0, [r1, #0x2e]
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077E96
	b _08077F5A
	.align 2, 0
_08077EE0: .4byte gNonGameplayRam
_08077EE4: .4byte gEquipment
_08077EE8: .4byte 0x08576150
_08077EEC: .4byte 0x08576151
_08077EF0:
	movs r4, #0
	ldr r7, _08077F30 @ =gEquipment
	ldr r3, _08077F34 @ =gNonGameplayRam
	mov ip, r3
	ldr r5, _08077F38 @ =0x08576150
	adds r0, r5, #1
	mov sb, r0
_08077EFE:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077F0E
	cmp r0, r3
	blt _08077F0E
	movs r6, #1
_08077F0E:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	add r2, sb
	ldrb r1, [r2]
	adds r1, r1, r6
	adds r0, #0x36
	strb r1, [r0]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077EFE
	b _08077F5A
	.align 2, 0
_08077F30: .4byte gEquipment
_08077F34: .4byte gNonGameplayRam
_08077F38: .4byte 0x08576150
_08077F3C:
	movs r4, #0
	ldr r5, _08077F84 @ =gNonGameplayRam
	movs r3, #0
	ldr r2, _08077F88 @ =0x08576150
_08077F44:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r3, [r0]
	adds r2, #2
	adds r4, #1
	cmp r4, #3
	bls _08077F44
_08077F5A:
	movs r4, #0
	ldr r1, _08077F8C @ =0x03000014
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08077F68
	movs r4, #1
_08077F68:
	ldr r2, _08077F84 @ =gNonGameplayRam
	ldrb r0, [r2]
	cmp r0, #0
	beq _08077F72
	movs r4, #1
_08077F72:
	cmp r4, #0
	beq _08077F90
	ldr r3, _08077F84 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0
	b _080780DE
	.align 2, 0
_08077F84: .4byte gNonGameplayRam
_08077F88: .4byte 0x08576150
_08077F8C: .4byte 0x03000014
_08077F90:
	mov r1, r8
	cmp r1, #0
	beq _08077F98
	b _080780E0
_08077F98:
	movs r4, #3
	cmp r0, #0
	beq _08077FA0
	movs r4, #1
_08077FA0:
	bl MapScreenCountTanks
	movs r0, #0
	bl PauseScreenDrawIgtAndTanks
	movs r6, #0
	ldr r7, _080780F0 @ =gNonGameplayRam
	ldr r2, _080780F4 @ =0x0879BE8C
	mov r8, r2
	movs r0, #3
	mov ip, r4
	mov r3, ip
	ands r3, r0
	mov ip, r3
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	mov r5, r8
_08077FC4:
	lsls r3, r6, #2
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r0, r8
	adds r0, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, ip
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r1, r8
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r5, #3]
	strh r1, [r0, #0x2c]
	adds r5, #4
	adds r6, #1
	cmp r6, #3
	bls _08077FC4
	movs r6, #0
	ldr r7, _080780F8 @ =0x0879BE9C
	ldr r5, _080780F0 @ =gNonGameplayRam
	mov ip, r7
	movs r0, #3
	ands r4, r0
	mov r8, r4
	movs r3, #4
	rsbs r3, r3, #0
	mov sb, r3
	adds r4, r7, #0
_08078034:
	lsls r3, r6, #2
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, ip
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4, #3]
	strh r1, [r0, #0x2c]
	adds r4, #4
	adds r6, #1
	cmp r6, #2
	bls _08078034
	ldr r2, _080780F0 @ =gNonGameplayRam
	ldr r3, _080780FC @ =0x00000275
	adds r0, r2, r3
	adds r3, #1
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807809A
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #1]
	adds r1, #0x36
	strb r0, [r1]
_0807809A:
	ldr r1, _08078100 @ =0x00000277
	adds r0, r2, r1
	movs r3, #0x9e
	lsls r3, r3, #2
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780BC
	ldrb r0, [r7, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #5]
	adds r1, #0x36
	strb r0, [r1]
_080780BC:
	ldr r1, _080780F0 @ =gNonGameplayRam
	ldr r2, _08078104 @ =0x00000279
	adds r0, r1, r2
	ldr r3, _08078108 @ =0x0000027A
	adds r1, r1, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780E0
	ldrb r0, [r7, #8]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080780F0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldrb r0, [r7, #9]
	adds r1, #0x36
_080780DE:
	strb r0, [r1]
_080780E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780F0: .4byte gNonGameplayRam
_080780F4: .4byte 0x0879BE8C
_080780F8: .4byte 0x0879BE9C
_080780FC: .4byte 0x00000275
_08078100: .4byte 0x00000277
_08078104: .4byte 0x00000279
_08078108: .4byte 0x0000027A

	thumb_func_start PauseScreenSetupOam
PauseScreenSetupOam: @ 0x0807810C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080781A0 @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	strh r1, [r0, #0x14]
	strb r2, [r0, #0x17]
	strb r2, [r0, #0x18]
	adds r7, r0, #0
	movs r3, #0
	movs r6, #4
	rsbs r6, r6, #0
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r2, r7, #0
	adds r2, #0x2c
	movs r4, #0x27
_0807813A:
	strb r3, [r2, #0xa]
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strh r3, [r2, #2]
	strh r3, [r2]
	ldrb r1, [r2, #0xb]
	adds r0, r6, #0
	ands r0, r1
	ands r0, r5
	strb r0, [r2, #0xb]
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0807813A
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	beq _08078176
	ldr r0, _080781A4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08078176
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
_08078176:
	ldr r3, _080781A0 @ =gNonGameplayRam
	ldrb r0, [r3]
	cmp r0, #0
	beq _080781B0
	ldr r1, _080781A8 @ =0x000001B7
	adds r4, r3, r1
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _080781AC @ =0x000001AB
	adds r3, r3, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	b _080781C6
	.align 2, 0
_080781A0: .4byte gNonGameplayRam
_080781A4: .4byte gPauseScreenFlag
_080781A8: .4byte 0x000001B7
_080781AC: .4byte 0x000001AB
_080781B0:
	ldr r1, _080781E4 @ =0x000001B7
	adds r2, r3, r1
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080781E8 @ =0x000001AB
	adds r2, r3, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
_080781C6:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	ldr r1, _080781EC @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _080781F0
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _080781FC
	bl PauseDebugSetupCursor
	b _080781FC
	.align 2, 0
_080781E4: .4byte 0x000001B7
_080781E8: .4byte 0x000001AB
_080781EC: .4byte gNonGameplayRam
_080781F0:
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
_080781FC:
	ldr r1, _08078270 @ =gNonGameplayRam
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080782AE
	adds r1, #0xf6
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xec
	movs r3, #2
	strh r3, [r0]
	mov r1, ip
	adds r1, #0xee
	movs r0, #0xd6
	strh r0, [r1]
	mov r4, ip
	adds r4, #0xf7
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4]
	movs r4, #0x81
	lsls r4, r4, #1
	add r4, ip
	movs r0, #0x2a
	strb r0, [r4]
	mov r0, ip
	adds r0, #0xf8
	strh r3, [r0]
	mov r3, ip
	adds r3, #0xfa
	movs r0, #0x12
	strh r0, [r3]
	ldr r3, _08078274 @ =0x00000103
	add r3, ip
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08078278 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08078280
	ldr r0, _0807827C @ =0x08576142
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x12
	bl UpdateMenuOamDataId
	b _08078288
	.align 2, 0
_08078270: .4byte gNonGameplayRam
_08078274: .4byte 0x00000103
_08078278: .4byte gCurrentArea
_0807827C: .4byte 0x08576142
_08078280:
	movs r0, #0x12
	movs r1, #0
	bl UpdateMenuOamDataId
_08078288:
	ldr r2, _080783D4 @ =gNonGameplayRam
	movs r0, #0x82
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x74
	strh r0, [r1]
	ldr r1, _080783D8 @ =0x0000010F
	adds r2, r2, r1
	ldrb r1, [r2]
	subs r0, #0x78
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_080782AE:
	movs r0, #0
	bl MapScreenDrawSpecialOam
	ldr r3, _080783D4 @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xe0
	movs r2, #0
	movs r0, #0x20
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xea
	strb r2, [r0]
	adds r7, r3, #0
	adds r4, r7, #0
	ldr r5, _080783DC @ =0x08576158
	adds r3, r5, #0
	adds r3, #0x10
	movs r6, #4
	rsbs r6, r6, #0
_080782DA:
	subs r3, #4
	ldrb r0, [r4]
	cmp r0, #0
	bne _080782F2
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r3, #1]
	adds r1, #0x36
	strb r0, [r1]
_080782F2:
	ldrb r0, [r3]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x2e]
	ldrb r0, [r3, #3]
	strh r0, [r2, #0x2c]
	adds r2, #0x37
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	cmp r3, r5
	bgt _080782DA
	adds r5, r7, #0
	ldrb r6, [r5]
	cmp r6, #1
	bne _080783C6
	movs r2, #0xf4
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x7c
	strh r0, [r1]
	movs r0, #0xf5
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x74
	strh r0, [r1]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x3e
	strb r0, [r1]
	adds r2, #0xb
	adds r1, r5, r2
	ldrb r0, [r1]
	movs r2, #3
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	bl unk_65618
	adds r4, r0, #0
	ldr r0, _080783E0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0807836A
	movs r4, #3
	movs r0, #0x3d
	mov r1, r8
	strb r0, [r1]
_0807836A:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0807839A
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x4c
	strh r0, [r1]
	movs r0, #0xfb
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x18
	strh r0, [r1]
	adds r2, #0xa
	adds r1, r5, r2
	movs r0, #0x3f
	strb r0, [r1]
	ldr r0, _080783E4 @ =0x000001FF
	adds r1, r5, r0
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_0807839A:
	ands r6, r4
	cmp r6, #0
	beq _080783C6
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0x4c
	strh r0, [r1]
	ldr r2, _080783E8 @ =0x00000202
	adds r1, r7, r2
	movs r0, #0xd0
	strh r0, [r1]
	ldr r0, _080783EC @ =0x0000020A
	adds r1, r7, r0
	movs r0, #0x40
	strb r0, [r1]
	adds r2, #9
	adds r1, r7, r2
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_080783C6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080783D4: .4byte gNonGameplayRam
_080783D8: .4byte 0x0000010F
_080783DC: .4byte 0x08576158
_080783E0: .4byte gPauseScreenFlag
_080783E4: .4byte 0x000001FF
_080783E8: .4byte 0x00000202
_080783EC: .4byte 0x0000020A

	thumb_func_start PauseScreenProcessOam
PauseScreenProcessOam: @ 0x080783F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0807844C @ =gOamData
	str r0, [sp, #8]
	ldr r0, _08078450 @ =gNextOamSlot
	ldrb r1, [r0]
	lsls r0, r1, #3
	ldr r2, [sp, #8]
	adds r2, r0, r2
	str r2, [sp, #8]
	str r1, [sp]
	mov sb, r1
	movs r3, #0
	str r3, [sp, #0xc]
_08078414:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #1
	adds r1, r0, r1
	lsls r1, r1, #2
	ldr r3, _08078454 @ =gNonGameplayRam
	adds r2, r1, r3
	adds r3, r2, #0
	adds r3, #0x36
	ldrb r1, [r3]
	adds r7, r0, #0
	cmp r1, #0
	bne _0807842E
	b _08078A36
_0807842E:
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r3]
	cmp r0, #0x8b
	bls _08078442
	b _0807868C
_08078442:
	lsls r0, r0, #2
	ldr r1, _08078458 @ =_0807845C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807844C: .4byte gOamData
_08078450: .4byte gNextOamSlot
_08078454: .4byte gNonGameplayRam
_08078458: .4byte _0807845C
_0807845C: @ jump table
	.4byte _08078962 @ case 0
	.4byte _080786B4 @ case 1
	.4byte _080786B4 @ case 2
	.4byte _080786B4 @ case 3
	.4byte _080786B4 @ case 4
	.4byte _080786B4 @ case 5
	.4byte _080786B4 @ case 6
	.4byte _080786B4 @ case 7
	.4byte _080786B4 @ case 8
	.4byte _080786B4 @ case 9
	.4byte _0807868C @ case 10
	.4byte _080786B4 @ case 11
	.4byte _080786B4 @ case 12
	.4byte _0807868C @ case 13
	.4byte _080786B4 @ case 14
	.4byte _080786B4 @ case 15
	.4byte _080787F0 @ case 16
	.4byte _0807868C @ case 17
	.4byte _08078708 @ case 18
	.4byte _08078708 @ case 19
	.4byte _08078708 @ case 20
	.4byte _08078708 @ case 21
	.4byte _080786B4 @ case 22
	.4byte _080786B4 @ case 23
	.4byte _080786B4 @ case 24
	.4byte _080786B4 @ case 25
	.4byte _0807868C @ case 26
	.4byte _0807890C @ case 27
	.4byte _0807868C @ case 28
	.4byte _0807890C @ case 29
	.4byte _0807868C @ case 30
	.4byte _0807890C @ case 31
	.4byte _0807868C @ case 32
	.4byte _0807890C @ case 33
	.4byte _0807868C @ case 34
	.4byte _0807890C @ case 35
	.4byte _0807868C @ case 36
	.4byte _0807890C @ case 37
	.4byte _0807868C @ case 38
	.4byte _0807890C @ case 39
	.4byte _080786B4 @ case 40
	.4byte _080786B4 @ case 41
	.4byte _080786B4 @ case 42
	.4byte _080786B4 @ case 43
	.4byte _0807868C @ case 44
	.4byte _0807868C @ case 45
	.4byte _0807868C @ case 46
	.4byte _0807868C @ case 47
	.4byte _0807868C @ case 48
	.4byte _0807868C @ case 49
	.4byte _0807868C @ case 50
	.4byte _0807868C @ case 51
	.4byte _0807868C @ case 52
	.4byte _0807890C @ case 53
	.4byte _0807868C @ case 54
	.4byte _0807868C @ case 55
	.4byte _0807868C @ case 56
	.4byte _0807868C @ case 57
	.4byte _0807868C @ case 58
	.4byte _0807868C @ case 59
	.4byte _0807868C @ case 60
	.4byte _080786B4 @ case 61
	.4byte _080786B4 @ case 62
	.4byte _0807868C @ case 63
	.4byte _0807868C @ case 64
	.4byte _08078780 @ case 65
	.4byte _080787F0 @ case 66
	.4byte _08078780 @ case 67
	.4byte _0807868C @ case 68
	.4byte _08078780 @ case 69
	.4byte _08078780 @ case 70
	.4byte _0807868C @ case 71
	.4byte _08078780 @ case 72
	.4byte _08078780 @ case 73
	.4byte _08078780 @ case 74
	.4byte _080786B4 @ case 75
	.4byte _080786B4 @ case 76
	.4byte _08078780 @ case 77
	.4byte _0807868C @ case 78
	.4byte _080787F0 @ case 79
	.4byte _08078780 @ case 80
	.4byte _0807868C @ case 81
	.4byte _080787F0 @ case 82
	.4byte _08078780 @ case 83
	.4byte _0807868C @ case 84
	.4byte _080787F0 @ case 85
	.4byte _08078780 @ case 86
	.4byte _0807868C @ case 87
	.4byte _080787F0 @ case 88
	.4byte _08078780 @ case 89
	.4byte _0807868C @ case 90
	.4byte _080787F0 @ case 91
	.4byte _08078780 @ case 92
	.4byte _0807868C @ case 93
	.4byte _080787F0 @ case 94
	.4byte _08078844 @ case 95
	.4byte _080786B4 @ case 96
	.4byte _0807868C @ case 97
	.4byte _080787F0 @ case 98
	.4byte _08078898 @ case 99
	.4byte _0807868C @ case 100
	.4byte _0807890C @ case 101
	.4byte _080787F0 @ case 102
	.4byte _080786B4 @ case 103
	.4byte _0807868C @ case 104
	.4byte _0807868C @ case 105
	.4byte _0807868C @ case 106
	.4byte _0807868C @ case 107
	.4byte _0807868C @ case 108
	.4byte _0807868C @ case 109
	.4byte _0807868C @ case 110
	.4byte _0807868C @ case 111
	.4byte _0807868C @ case 112
	.4byte _0807868C @ case 113
	.4byte _0807868C @ case 114
	.4byte _0807868C @ case 115
	.4byte _0807868C @ case 116
	.4byte _0807868C @ case 117
	.4byte _0807868C @ case 118
	.4byte _0807868C @ case 119
	.4byte _0807868C @ case 120
	.4byte _0807868C @ case 121
	.4byte _0807868C @ case 122
	.4byte _0807868C @ case 123
	.4byte _0807868C @ case 124
	.4byte _0807868C @ case 125
	.4byte _0807868C @ case 126
	.4byte _0807868C @ case 127
	.4byte _0807868C @ case 128
	.4byte _0807868C @ case 129
	.4byte _0807868C @ case 130
	.4byte _0807868C @ case 131
	.4byte _0807868C @ case 132
	.4byte _0807868C @ case 133
	.4byte _0807868C @ case 134
	.4byte _0807868C @ case 135
	.4byte _0807868C @ case 136
	.4byte _0807868C @ case 137
	.4byte _0807868C @ case 138
	.4byte _0807868C @ case 139
_0807868C:
	ldr r2, _080786AC @ =0x0879BEC0
	ldr r0, _080786B0 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r1, r7, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	b _08078962
	.align 2, 0
_080786AC: .4byte 0x0879BEC0
_080786B0: .4byte gNonGameplayRam
_080786B4:
	ldr r2, _08078700 @ =0x0879BEC0
	ldr r1, _08078704 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r3, r1, #0
	adds r3, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080786E4
	b _08078962
_080786E4:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080786FC
	b _08078962
_080786FC:
	strb r0, [r2]
	b _08078962
	.align 2, 0
_08078700: .4byte 0x0879BEC0
_08078704: .4byte gNonGameplayRam
_08078708:
	ldr r1, _0807876C @ =0x0879BEC0
	ldr r4, _08078770 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r2, r0, r4
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _08078736
	b _08078962
_08078736:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0807874E
	b _08078962
_0807874E:
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807875C
	b _08078962
_0807875C:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08078774
	movs r0, #0x8d
	lsls r0, r0, #1
	bl SoundPlay
	b _08078962
	.align 2, 0
_0807876C: .4byte 0x0879BEC0
_08078770: .4byte gNonGameplayRam
_08078774:
	ldr r0, _0807877C @ =0x0000012B
	bl SoundPlay
	b _08078962
	.align 2, 0
_0807877C: .4byte 0x0000012B
_08078780:
	ldr r2, _080787E8 @ =0x0879BEC0
	ldr r1, _080787EC @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080787B4
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_080787B4:
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r2]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080787C8
	b _08078962
_080787C8:
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080787E0
	b _08078962
_080787E0:
	subs r0, r1, #1
	strb r0, [r4]
	b _08078962
	.align 2, 0
_080787E8: .4byte 0x0879BEC0
_080787EC: .4byte gNonGameplayRam
_080787F0:
	ldr r1, _0807883C @ =0x0879BEC0
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	ldr r3, _08078840 @ =gNonGameplayRam
	adds r2, r0, r3
	adds r4, r2, #0
	adds r4, #0x36
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _0807881E
	b _08078962
_0807881E:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08078836
	b _08078962
_08078836:
	strb r0, [r4]
	strb r0, [r2]
	b _08078A36
	.align 2, 0
_0807883C: .4byte 0x0879BEC0
_08078840: .4byte gNonGameplayRam
_08078844:
	ldr r6, _08078890 @ =0x0879BEC0
	ldr r1, _08078894 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	b _08078954
	.align 2, 0
_08078890: .4byte 0x0879BEC0
_08078894: .4byte gNonGameplayRam
_08078898:
	ldr r3, _08078904 @ =0x0879BEC0
	mov r8, r3
	ldr r6, _08078908 @ =gNonGameplayRam
	ldr r1, [sp, #0xc]
	adds r0, r7, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
	adds r2, r6, #0
	adds r2, #0x7e
	movs r0, #0x67
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x7c
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _08078962
	.align 2, 0
_08078904: .4byte 0x0879BEC0
_08078908: .4byte gNonGameplayRam
_0807890C:
	ldr r6, _08078A5C @ =0x0879BEC0
	ldr r1, _08078A60 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	subs r0, #1
_08078954:
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
_08078962:
	ldr r2, _08078A60 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #0x2c]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r3, #0x2e]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r5, r5, r0
	ldr r4, [r5]
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	lsrs r6, r0, #0x1e
	lsls r1, r1, #0x1c
	lsrs r3, r1, #0x1e
	ldrh r0, [r4]
	ldr r1, [sp]
	adds r0, r1, r0
	cmp r0, #0x7f
	bgt _08078A42
	str r0, [sp]
	adds r4, #2
	cmp sb, r0
	bge _08078A36
	ldr r0, _08078A64 @ =gOamData
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	lsls r6, r6, #2
	mov ip, r6
	lsls r7, r3, #2
	mov r2, sb
	lsls r1, r2, #3
	adds r3, r1, r0
	ldr r0, _08078A68 @ =0x000001FF
	mov sl, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ldr r1, [sp]
	subs r1, r1, r2
	mov sb, r1
_080789D6:
	ldrh r0, [r4]
	adds r4, #2
	ldr r2, [sp, #8]
	strh r0, [r2]
	adds r2, #2
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strb r0, [r3]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r2]
	adds r2, #2
	str r2, [sp, #8]
	add r1, r8
	mov r2, sl
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08078A6C @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	ldr r1, [sp, #8]
	strh r0, [r1]
	adds r4, #2
	ldrb r1, [r3, #5]
	adds r0, r6, #0
	ands r0, r1
	mov r2, ip
	orrs r0, r2
	strb r0, [r3, #5]
	ldrb r1, [r3, #1]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r7
	strb r0, [r3, #1]
	ldr r0, [sp, #8]
	adds r0, #4
	str r0, [sp, #8]
	adds r3, #8
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bne _080789D6
	ldr r3, [sp]
	mov sb, r3
_08078A36:
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x27
	bgt _08078A42
	b _08078414
_08078A42:
	ldr r0, _08078A70 @ =gNextOamSlot
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078A5C: .4byte 0x0879BEC0
_08078A60: .4byte gNonGameplayRam
_08078A64: .4byte gOamData
_08078A68: .4byte 0x000001FF
_08078A6C: .4byte 0xFFFFFE00
_08078A70: .4byte gNextOamSlot

	thumb_func_start CheckForMaintainedInput
CheckForMaintainedInput: @ 0x08078A74
	push {lr}
	sub sp, #8
	ldr r1, _08078A9C @ =0x08576210
	mov r0, sp
	movs r2, #7
	bl memcpy
	ldr r0, _08078AA0 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	beq _08078AA8
	ldr r1, _08078AA4 @ =0x03005400
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r3, r1, #0
	b _08078AB0
	.align 2, 0
_08078A9C: .4byte 0x08576210
_08078AA0: .4byte gButtonInput
_08078AA4: .4byte 0x03005400
_08078AA8:
	ldr r0, _08078AE4 @ =0x03005400
	strb r1, [r0]
	strb r1, [r0, #1]
	adds r3, r0, #0
_08078AB0:
	ldrb r0, [r3, #1]
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	blo _08078ADC
	ldr r2, _08078AE8 @ =gChangedInput
	ldr r0, _08078AEC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #5
	bhi _08078ADC
	adds r0, #1
	strb r0, [r3, #1]
_08078ADC:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08078AE4: .4byte 0x03005400
_08078AE8: .4byte gChangedInput
_08078AEC: .4byte gButtonInput

	thumb_func_start unk_78af0
unk_78af0: @ 0x08078AF0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	ldr r2, _08078B14 @ =gNonGameplayRam
	cmp r3, #0
	beq _08078B7A
	movs r4, #0
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078B0C
	movs r4, #3
_08078B0C:
	cmp r3, #1
	bne _08078B18
	movs r5, #0
	b _08078B38
	.align 2, 0
_08078B14: .4byte gNonGameplayRam
_08078B18:
	cmp r3, #2
	bne _08078B2C
	ldr r0, _08078B28 @ =0x0000020A
	bl SoundPlay
	movs r5, #1
	b _08078B38
	.align 2, 0
_08078B28: .4byte 0x0000020A
_08078B2C:
	cmp r6, #3
	bne _08078B38
	ldr r0, _08078B98 @ =0x0000020B
	bl SoundPlay
	movs r5, #2
_08078B38:
	adds r4, r4, r5
	ldr r0, _08078B9C @ =gNonGameplayRam
	mov ip, r0
	ldr r2, _08078BA0 @ =0x085767F0
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r4, ip
	adds r4, #0x96
	movs r3, #0
	strb r0, [r4]
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r4, #0xc
	strb r0, [r4]
	adds r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	mov r1, ip
	adds r1, #0x8a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x94
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #0xb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
_08078B7A:
	adds r0, r2, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x9a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x8c
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078B98: .4byte 0x0000020B
_08078B9C: .4byte gNonGameplayRam
_08078BA0: .4byte 0x085767F0

	thumb_func_start PauseScreenSetNavigationTextPanelOam
PauseScreenSetNavigationTextPanelOam: @ 0x08078BA4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _08078BC4
	ldr r0, _08078BC0 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x66
	movs r1, #0x44
	strb r1, [r2]
	adds r0, #0x72
	movs r1, #0x47
	strb r1, [r0]
	b _08078C02
	.align 2, 0
_08078BC0: .4byte gNonGameplayRam
_08078BC4:
	cmp r4, #2
	bne _08078BE8
	ldr r1, _08078BE0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x43
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x46
	strb r0, [r1]
	ldr r0, _08078BE4 @ =0x0000020A
	bl SoundPlay
	b _08078C02
	.align 2, 0
_08078BE0: .4byte gNonGameplayRam
_08078BE4: .4byte 0x0000020A
_08078BE8:
	cmp r4, #3
	bne _08078C02
	ldr r1, _08078C3C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x45
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x48
	strb r0, [r1]
	ldr r0, _08078C40 @ =0x0000020B
	bl SoundPlay
_08078C02:
	ldr r3, _08078C3C @ =gNonGameplayRam
	cmp r4, #0
	beq _08078C1C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08078C1C:
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	adds r0, #0xc
	strh r2, [r0]
	subs r0, #0xe
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	subs r0, #0x16
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C3C: .4byte gNonGameplayRam
_08078C40: .4byte 0x0000020B

	thumb_func_start unk_78c44
unk_78c44: @ 0x08078C44
	push {r4, r5, lr}
	ldr r2, _08078C60 @ =gNonGameplayRam
	ldrh r0, [r2, #4]
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	bne _08078C64
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r2, r3
	b _08078E96
	.align 2, 0
_08078C60: .4byte gNonGameplayRam
_08078C64:
	ldr r1, _08078C88 @ =0x0000023D
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #8
	bls _08078C7C
	b _08078E76
_08078C7C:
	lsls r0, r0, #2
	ldr r1, _08078C8C @ =_08078C90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078C88: .4byte 0x0000023D
_08078C8C: .4byte _08078C90
_08078C90: @ jump table
	.4byte _08078CB4 @ case 0
	.4byte _08078CDC @ case 1
	.4byte _08078D18 @ case 2
	.4byte _08078D50 @ case 3
	.4byte _08078DA8 @ case 4
	.4byte _08078DCC @ case 5
	.4byte _08078DFC @ case 6
	.4byte _08078E34 @ case 7
	.4byte _08078E76 @ case 8
_08078CB4:
	ldr r1, _08078CD4 @ =gNonGameplayRam
	ldr r0, _08078CD8 @ =0x0000023D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x10
	bhi _08078CC2
	b _08078E76
_08078CC2:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	strb r2, [r3]
	b _08078E76
	.align 2, 0
_08078CD4: .4byte gNonGameplayRam
_08078CD8: .4byte 0x0000023D
_08078CDC:
	ldr r5, _08078D10 @ =gNonGameplayRam
	adds r1, r5, #0
	adds r1, #0x8e
	movs r4, #0
	movs r0, #0x74
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x1c
	strh r0, [r1]
	movs r0, #2
	bl unk_78af0
	movs r0, #2
	bl MapScreenDrawSpecialOam
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08078D14 @ =0x0000023D
	adds r0, r5, r1
	strb r4, [r0]
	b _08078E76
	.align 2, 0
_08078D10: .4byte gNonGameplayRam
_08078D14: .4byte 0x0000023D
_08078D18:
	ldr r3, _08078D4C @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x97
	ldrb r1, [r0]
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D2C
	b _08078E76
_08078D2C:
	adds r0, r3, #0
	adds r0, #0xa3
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D3C
	b _08078E76
_08078D3C:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	b _08078DEA
	.align 2, 0
_08078D4C: .4byte gNonGameplayRam
_08078D50:
	ldr r3, _08078D9C @ =gNonGameplayRam
	ldr r2, _08078DA0 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bhi _08078D5E
	b _08078E76
_08078D5E:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	movs r2, #0
	orrs r0, r1
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	ldr r0, _08078DA4 @ =0x085766E0
	ldrb r1, [r0, #2]
	adds r0, r3, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	strb r2, [r4]
	b _08078E76
	.align 2, 0
_08078D9C: .4byte gNonGameplayRam
_08078DA0: .4byte 0x0000023D
_08078DA4: .4byte 0x085766E0
_08078DA8:
	ldr r3, _08078DC8 @ =gNonGameplayRam
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _08078DEC
	.align 2, 0
_08078DC8: .4byte gNonGameplayRam
_08078DCC:
	movs r0, #3
	bl unk_78af0
	ldr r3, _08078DF4 @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	strb r2, [r0]
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
_08078DEA:
	strb r0, [r1]
_08078DEC:
	ldr r1, _08078DF8 @ =0x0000023D
	adds r0, r3, r1
	strb r2, [r0]
	b _08078E76
	.align 2, 0
_08078DF4: .4byte gNonGameplayRam
_08078DF8: .4byte 0x0000023D
_08078DFC:
	ldr r2, _08078E2C @ =gNonGameplayRam
	adds r0, r2, #0
	adds r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078E76
	adds r0, r2, #0
	adds r0, #0xa2
	ldrb r3, [r0]
	cmp r3, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08078E30 @ =0x0000023D
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #1
	bl MapScreenDrawSpecialOam
	b _08078E76
	.align 2, 0
_08078E2C: .4byte gNonGameplayRam
_08078E30: .4byte 0x0000023D
_08078E34:
	ldr r3, _08078E60 @ =gNonGameplayRam
	ldr r2, _08078E64 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bls _08078E76
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0
	strb r0, [r2]
	strb r1, [r4]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08078E68
	movs r0, #2
	b _08078E72
	.align 2, 0
_08078E60: .4byte gNonGameplayRam
_08078E64: .4byte 0x0000023D
_08078E68:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078E76
	movs r0, #4
_08078E72:
	eors r0, r1
	strh r0, [r3, #4]
_08078E76:
	ldr r2, _08078EA0 @ =gNonGameplayRam
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bls _08078E98
	adds r3, r2, #0
	adds r3, #0x8a
	ldrb r0, [r3]
	cmp r0, #0x64
	bne _08078E98
	adds r0, #1
	movs r1, #0
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x88
	strb r1, [r0]
	adds r0, #1
_08078E96:
	strb r1, [r0]
_08078E98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078EA0: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationUpdatePanel
NavigationConversationUpdatePanel: @ 0x08078EA4
	push {r4, r5, lr}
	ldr r1, _08078EC0 @ =gNonGameplayRam
	ldrh r0, [r1, #4]
	movs r2, #1
	ands r2, r0
	adds r5, r1, #0
	cmp r2, #0
	bne _08078EC4
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r2, [r0]
	b _080790A8
	.align 2, 0
_08078EC0: .4byte gNonGameplayRam
_08078EC4:
	ldr r1, _08078EE8 @ =0x00000239
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _08078EDC
	b _0807910E
_08078EDC:
	lsls r0, r0, #2
	ldr r1, _08078EEC @ =_08078EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078EE8: .4byte 0x00000239
_08078EEC: .4byte _08078EF0
_08078EF0: @ jump table
	.4byte _08078F28 @ case 0
	.4byte _08078F3E @ case 1
	.4byte _08078F60 @ case 2
	.4byte _0807908C @ case 3
	.4byte _08078F68 @ case 4
	.4byte _08078F90 @ case 5
	.4byte _08078FE0 @ case 6
	.4byte _08079038 @ case 7
	.4byte _08079060 @ case 8
	.4byte _08079066 @ case 9
	.4byte _0807908C @ case 10
	.4byte _080790B4 @ case 11
	.4byte _080790EC @ case 12
	.4byte _0807910E @ case 13
_08078F28:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x7c
	bne _08078F38
	b _080790D0
_08078F38:
	adds r0, r2, #0
	subs r0, #8
	b _080790C6
_08078F3E:
	ldr r2, _08078F5C @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bhi _08078F4A
	b _0807910E
_08078F4A:
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	b _0807910C
	.align 2, 0
_08078F5C: .4byte 0x00000239
_08078F60:
	movs r0, #2
	bl PauseScreenSetNavigationTextPanelOam
	b _08079040
_08078F68:
	movs r0, #3
	movs r1, #0x49
	bl UpdateMenuOamDataId
	ldr r1, _08078F88 @ =gNonGameplayRam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r2, _08078F8C @ =0x00000239
	adds r1, r1, r2
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08078F88: .4byte gNonGameplayRam
_08078F8C: .4byte 0x00000239
_08078F90:
	adds r0, r5, #0
	adds r0, #0x5b
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08078FA0
	b _0807910E
_08078FA0:
	ldrh r1, [r5, #4]
	movs r0, #8
	movs r2, #0
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #8
	strh r0, [r5, #0x3a]
	ldr r0, _08078FDC @ =0x085766E0
	ldrb r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x40
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08078FCC
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0xb
	strb r0, [r1]
_08078FCC:
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _080790DE
	.align 2, 0
_08078FDC: .4byte 0x085766E0
_08078FE0:
	ldr r2, _08079004 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0807900C
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08079008 @ =0x00000239
	adds r0, r2, r1
	strb r3, [r0]
	b _0807901E
	.align 2, 0
_08079004: .4byte gNonGameplayRam
_08079008: .4byte 0x00000239
_0807900C:
	ldr r3, _08079030 @ =0x00000239
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807901E
	movs r0, #3
	movs r1, #0x4c
	bl UpdateMenuOamDataId
_0807901E:
	ldr r0, _08079034 @ =gNonGameplayRam
	ldr r2, _08079030 @ =0x00000239
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0807910E
	movs r0, #0x3c
	strb r0, [r1]
	b _0807910E
	.align 2, 0
_08079030: .4byte 0x00000239
_08079034: .4byte gNonGameplayRam
_08079038:
	movs r0, #3
	movs r1, #0x4a
	bl UpdateMenuOamDataId
_08079040:
	ldr r1, _08079058 @ =gNonGameplayRam
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r0, _0807905C @ =0x00000239
	adds r1, r1, r0
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08079058: .4byte gNonGameplayRam
_0807905C: .4byte 0x00000239
_08079060:
	adds r0, r5, #0
	adds r0, #0x5b
	b _08079090
_08079066:
	adds r0, r5, #0
	adds r0, #0x42
	movs r4, #0
	strb r4, [r0]
	movs r0, #3
	bl PauseScreenSetNavigationTextPanelOam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08079088 @ =0x00000239
	adds r0, r5, r1
	strb r4, [r0]
	b _0807910E
	.align 2, 0
_08079088: .4byte 0x00000239
_0807908C:
	adds r0, r5, #0
	adds r0, #0x67
_08079090:
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807910E
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790A8:
	ldr r3, _080790B0 @ =0x00000239
	adds r0, r5, r3
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790B0: .4byte 0x00000239
_080790B4:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0xcc
	beq _080790D0
	adds r0, r2, #0
	adds r0, #8
_080790C6:
	strh r0, [r1]
	movs r0, #0
	bl PauseScreenSetNavigationTextPanelOam
	b _0807910E
_080790D0:
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790DE:
	ldr r1, _080790E8 @ =0x00000239
	adds r0, r5, r1
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790E8: .4byte 0x00000239
_080790EC:
	ldr r2, _08079114 @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bls _0807910E
	ldrh r0, [r5, #4]
	movs r1, #1
	eors r0, r1
	movs r2, #0
	strh r0, [r5, #4]
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807910C:
	strb r2, [r3]
_0807910E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079114: .4byte 0x00000239

	thumb_func_start GetCharacterWidth
GetCharacterWidth: @ 0x08079118
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807912C @ =0x0000049F
	cmp r1, r0
	bhi _08079134
	ldr r0, _08079130 @ =0x08576234
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08079136
	.align 2, 0
_0807912C: .4byte 0x0000049F
_08079130: .4byte 0x08576234
_08079134:
	movs r0, #0xa
_08079136:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DrawCharacter
DrawCharacter: @ 0x0807913C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #0
	mov r8, r0
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	str r0, [sp, #0x14]
_08079170:
	ldr r6, _080791D4 @ =0x02035DA0
	mov r1, r8
	cmp r1, #0
	beq _0807917A
	adds r6, #0x40
_0807917A:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, r8
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807918E
	movs r1, #0x40
_0807918E:
	mov r0, r8
	lsls r0, r0, #8
	mov sb, r0
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _080791E8
	ldr r7, _080791D8 @ =0x08682FAC
	adds r5, r1, #0
_080791A2:
	adds r0, r3, r7
	ldrb r4, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080791DC
	movs r2, #0xf
	ands r2, r4
	movs r1, #0xf0
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080791C0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
_080791C0:
	cmp r1, #0x20
	beq _080791C8
	cmp r1, #0x30
	bne _080791CE
_080791C8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
_080791CE:
	orrs r1, r2
	strb r1, [r6]
	b _080791DE
	.align 2, 0
_080791D4: .4byte 0x02035DA0
_080791D8: .4byte 0x08682FAC
_080791DC:
	strb r4, [r6]
_080791DE:
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080791A2
_080791E8:
	ldr r0, _08079290 @ =0x02035DA0
	mov sl, r0
	mov r1, r8
	cmp r1, #0
	beq _080791F6
	ldr r2, _08079294 @ =0x02035DE0
	mov sl, r2
_080791F6:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _08079216
	ldr r0, _08079298 @ =0x0879C128
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	mov r2, sl
	adds r2, #0x20
	movs r3, #7
_08079208:
	ldr r0, [r2]
	ldr r1, [r5]
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08079208
_08079216:
	mov r4, sb
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080792C4
	lsls r6, r0, #2
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov sb, r1
	mov ip, r6
	movs r0, #0x20
	subs r7, r0, r6
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	movs r3, #7
_08079238:
	ldr r1, [r5]
	mov r0, ip
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	lsrs r1, r7
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079238
	mov r1, sb
	cmp r1, #0x10
	ble _0807929C
	adds r5, r6, #0
	movs r0, #0x20
	subs r6, r0, r5
	lsls r0, r4, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x20
	mov r4, sl
	adds r4, #0x20
	movs r3, #7
_08079272:
	ldr r1, [r4]
	lsls r1, r5
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	lsrs r1, r6
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079272
	b _080792EC
	.align 2, 0
_08079290: .4byte 0x02035DA0
_08079294: .4byte 0x02035DE0
_08079298: .4byte 0x0879C128
_0807929C:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _080792EC
	lsls r0, r4, #2
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	mov r5, sl
	adds r5, #0x20
	movs r3, #7
_080792B2:
	ldm r5!, {r1}
	lsls r1, r6
	ldr r0, [r2]
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080792B2
	b _080792EC
_080792C4:
	movs r1, #8
	ldr r0, [sp, #4]
	cmp r0, #8
	bls _080792CE
	movs r1, #0x10
_080792CE:
	cmp r1, #0
	beq _080792EC
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	adds r3, r1, #0
_080792DE:
	ldr r0, [r2]
	ldm r5!, {r1}
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _080792DE
_080792EC:
	ldr r4, [sp, #0x18]
	mov r8, r4
	cmp r4, #1
	bgt _080792F6
	b _08079170
_080792F6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawCharacterPauseDebug
DrawCharacterPauseDebug: @ 0x08079308
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r6, #0
	beq _080793B4
	movs r3, #0
	lsls r0, r0, #5
	mov sb, r0
	ldr r0, _08079354 @ =0x08682FAC
	mov sl, r0
	ldr r1, _08079358 @ =0x040000D4
	mov r8, r1
_08079330:
	lsls r0, r3, #0xa
	mov r1, sb
	adds r2, r1, r0
	ldr r5, _0807935C @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
	add r2, sl
_08079342:
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #2
	cmp r0, #1
	bhi _08079360
	lsls r0, r6, #1
	adds r1, r1, r0
	b _08079366
	.align 2, 0
_08079354: .4byte 0x08682FAC
_08079358: .4byte 0x040000D4
_0807935C: .4byte 0x02035DA0
_08079360:
	cmp r1, #0
	bne _08079366
	movs r1, #0xf
_08079366:
	ldrb r0, [r2]
	movs r3, #0xf0
	ands r3, r0
	cmp r3, #0x20
	beq _08079374
	cmp r3, #0x30
	bne _0807937A
_08079374:
	lsls r0, r6, #5
	adds r3, r3, r0
	b _08079380
_0807937A:
	cmp r3, #0
	bne _08079380
	movs r3, #0xf0
_08079380:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _08079342
	ldr r0, _080793AC @ =0x02035DA0
	mov r1, r8
	str r0, [r1]
	ldr r1, [sp]
	adds r0, r1, r7
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _080793B0 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r3, ip
	cmp r3, #1
	ble _08079330
	b _08079416
	.align 2, 0
_080793AC: .4byte 0x02035DA0
_080793B0: .4byte 0x84000008
_080793B4:
	movs r3, #0
	lsls r0, r0, #5
	str r0, [sp, #4]
	ldr r0, _08079428 @ =0x08682FAC
	mov sl, r0
	ldr r6, _0807942C @ =0x040000D4
	movs r1, #0xf
	mov sb, r1
	movs r0, #0xf0
	mov r8, r0
_080793C8:
	lsls r0, r3, #0xa
	ldr r1, [sp, #4]
	adds r2, r1, r0
	ldr r5, _08079430 @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
_080793D8:
	mov r1, sl
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r1, sb
	ands r1, r0
	cmp r1, #0
	bne _080793E8
	movs r1, #0xf
_080793E8:
	mov r3, r8
	ands r3, r0
	cmp r3, #0
	bne _080793F2
	movs r3, #0xf0
_080793F2:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _080793D8
	ldr r0, _08079430 @ =0x02035DA0
	str r0, [r6]
	ldr r1, [sp]
	adds r0, r1, r7
	str r0, [r6, #4]
	ldr r0, _08079434 @ =0x84000008
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r3, ip
	cmp r3, #1
	ble _080793C8
_08079416:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079428: .4byte 0x08682FAC
_0807942C: .4byte 0x040000D4
_08079430: .4byte 0x02035DA0
_08079434: .4byte 0x84000008

	thumb_func_start DrawCharacterForMessage
DrawCharacterForMessage: @ 0x08079438
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, [sp, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x14]
	movs r0, #0
	mov ip, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r0, r0, #2
	str r0, [sp, #0x18]
_0807946C:
	ldr r6, _080794C8 @ =0x02035DA0
	mov r1, ip
	cmp r1, #0
	beq _08079476
	adds r6, #0x40
_08079476:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, ip
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807948A
	movs r1, #0x40
_0807948A:
	mov r7, ip
	lsls r7, r7, #8
	mov sb, r7
	mov r0, ip
	adds r0, #1
	str r0, [sp, #0x20]
	cmp r1, #0
	beq _08079508
	movs r7, #0xf
	movs r2, #0xf0
	mov r8, r2
	ldr r4, _080794CC @ =0x08682FAC
	mov sl, r4
	adds r5, r1, #0
_080794A6:
	mov r1, sl
	adds r0, r3, r1
	ldrb r4, [r0]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080794E6
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080794D0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
	b _080794D6
	.align 2, 0
_080794C8: .4byte 0x02035DA0
_080794CC: .4byte 0x08682FAC
_080794D0:
	cmp r2, #0
	bne _080794D6
	movs r2, #0xf
_080794D6:
	cmp r1, #0x20
	beq _080794DE
	cmp r1, #0x30
	bne _080794F4
_080794DE:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
	b _080794FA
_080794E6:
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	cmp r2, #0
	bne _080794F4
	movs r2, #0xf
_080794F4:
	cmp r1, #0
	bne _080794FA
	movs r1, #0xf0
_080794FA:
	orrs r1, r2
	strb r1, [r6]
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080794A6
_08079508:
	ldr r7, _080795C8 @ =0x02035DA0
	str r7, [sp, #0x10]
	mov r0, ip
	cmp r0, #0
	beq _08079516
	ldr r1, _080795CC @ =0x02035DE0
	str r1, [sp, #0x10]
_08079516:
	mov r4, sb
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _08079610
	lsls r6, r2, #2
	ldr r3, [sp, #4]
	adds r3, r3, r2
	str r3, [sp, #0x1c]
	mov sl, r6
	ldr r7, _080795D0 @ =0x0879C128
	adds r7, r7, r6
	mov sb, r7
	movs r0, #0x20
	subs r0, r0, r6
	mov r8, r0
	ldr r0, [sp, #0x18]
	ldr r1, _080795D4 @ =0x0879C14C
	adds r0, r0, r1
	str r0, [sp, #0x24]
	mov r2, ip
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	movs r3, #7
_08079548:
	ldr r1, [r5]
	mov r7, sl
	lsls r1, r7
	mov r7, sb
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	mov r0, r8
	lsrs r1, r0
	ldr r7, [sp, #0x24]
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079548
	ldr r0, [sp, #0x1c]
	cmp r0, #0x10
	ble _080795D8
	adds r5, r6, #0
	ldr r1, _080795D0 @ =0x0879C128
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x20
	subs r0, r0, r5
	mov sb, r0
	ldr r2, [sp, #0x18]
	ldr r3, _080795D4 @ =0x0879C14C
	adds r6, r2, r3
	lsls r0, r4, #2
	ldr r4, [sp, #0x14]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	ldr r4, [sp, #0x10]
	adds r4, #0x20
	movs r3, #7
_0807959E:
	ldr r1, [r4]
	lsls r1, r5
	mov r7, r8
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	mov r0, sb
	lsrs r1, r0
	ldr r0, [r6]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0807959E
	b _08079638
	.align 2, 0
_080795C8: .4byte 0x02035DA0
_080795CC: .4byte 0x02035DE0
_080795D0: .4byte 0x0879C128
_080795D4: .4byte 0x0879C14C
_080795D8:
	ldr r1, [sp, #4]
	cmp r1, #8
	bls _08079638
	adds r5, r6, #0
	ldr r2, _0807960C @ =0x0879C128
	adds r7, r5, r2
	lsls r0, r4, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r2, r0, #0
	adds r2, #0x20
	ldr r6, [sp, #0x10]
	adds r6, #0x20
	movs r3, #7
_080795F4:
	ldm r6!, {r0}
	lsls r0, r5
	ldr r1, [r7]
	orrs r0, r1
	ldr r1, [r2]
	ands r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _080795F4
	b _08079638
	.align 2, 0
_0807960C: .4byte 0x0879C128
_08079610:
	movs r1, #8
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807961A
	movs r1, #0x10
_0807961A:
	cmp r1, #0
	beq _08079638
	mov r7, ip
	lsls r0, r7, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	adds r3, r1, #0
_0807962A:
	ldr r0, [r2]
	ldm r5!, {r1}
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _0807962A
_08079638:
	ldr r4, [sp, #0x20]
	mov ip, r4
	cmp r4, #1
	bgt _08079642
	b _0807946C
_08079642:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawLocationTextCharacters
DrawLocationTextCharacters: @ 0x08079654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08079672
	movs r0, #0x80
	lsls r0, r0, #0x12
	mov sb, r0
	b _0807969C
_08079672:
	cmp r0, #2
	bne _08079730
	ldr r1, _080796D4 @ =0x02000800
	mov sb, r1
	ldr r2, [r5]
	ldrh r0, [r2]
	movs r1, #0xfe
	lsls r1, r1, #8
	cmp r0, r1
	beq _08079696
	adds r3, r1, #0
_08079688:
	adds r0, r2, #0
	adds r1, r0, #2
	adds r2, r1, #0
	ldrh r0, [r0, #2]
	cmp r0, r3
	bne _08079688
	str r1, [r5]
_08079696:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
_0807969C:
	movs r6, #0
	ldr r3, [r5]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r7, r2, #0
	ldrh r1, [r3]
	cmp r1, r7
	beq _08079730
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _08079730
	movs r4, #0x80
	lsls r4, r4, #8
	mov sl, r4
_080796BA:
	movs r4, #1
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	cmp r1, sl
	bne _080796D8
	movs r0, #0xff
	mov r8, r0
	mov r1, r8
	ands r1, r2
	mov r8, r1
	b _08079712
	.align 2, 0
_080796D4: .4byte 0x02000800
_080796D8:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796E8
	movs r4, #0
	mov r8, r4
	movs r6, #0xff
	ands r6, r2
_080796E8:
	cmp r4, #0
	beq _08079712
	ldrh r0, [r3]
	bl GetCharacterWidth
	mov r8, r0
	asrs r0, r6, #3
	lsls r4, r0, #5
	movs r3, #7
	ldr r0, [r5]
	ldrh r0, [r0]
	mov r2, sb
	adds r1, r2, r4
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r6
	movs r4, #0
	str r4, [sp]
	bl DrawCharacterForMessage
_08079712:
	ldr r0, [r5]
	adds r2, r0, #2
	str r2, [r5]
	add r6, r8
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r1, #0
	ldrh r1, [r0, #2]
	cmp r1, r7
	beq _08079730
	adds r3, r2, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796BA
_08079730:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DrawLocationText
DrawLocationText: @ 0x08079740
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r2, sp
	ldr r3, _080797AC @ =0x0000FFFF
	adds r1, r3, #0
	strh r1, [r2]
	ldr r4, _080797B0 @ =0x040000D4
	str r2, [r4]
	movs r6, #0x80
	lsls r6, r6, #0x12
	str r6, [r4, #4]
	ldr r1, _080797B4 @ =0x81000400
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	ldr r2, _080797B8 @ =0x0879CDD8
	ldr r1, _080797BC @ =0x03000011
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	add r1, sp, #4
	movs r0, #1
	bl DrawLocationTextCharacters
	str r6, [r4]
	lsls r5, r5, #0xb
	ldr r1, _080797C0 @ =0x06014000
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r1, _080797C4 @ =0x840000E0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080797C8 @ =0x02000400
	str r0, [r4]
	ldr r3, _080797CC @ =0x06014400
	adds r5, r5, r3
	str r5, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080797AC: .4byte 0x0000FFFF
_080797B0: .4byte 0x040000D4
_080797B4: .4byte 0x81000400
_080797B8: .4byte 0x0879CDD8
_080797BC: .4byte 0x03000011
_080797C0: .4byte 0x06014000
_080797C4: .4byte 0x840000E0
_080797C8: .4byte 0x02000400
_080797CC: .4byte 0x06014400

	thumb_func_start TextDrawMessageBanner
TextDrawMessageBanner: @ 0x080797D0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r1, #0xfc
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	cmp r2, #1
	bhi _0807980E
	adds r2, r0, #0
	cmp r2, #0x15
	ble _080797F4
	movs r2, #0x15
_080797F4:
	adds r2, #0x15
	ldr r1, _0807981C @ =0x0879CDF4
	ldr r0, _08079820 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_0807980E:
	cmp r3, #7
	bne _08079828
	ldr r1, _08079824 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079830
	.align 2, 0
_0807981C: .4byte 0x0879CDF4
_08079820: .4byte 0x03000011
_08079824: .4byte 0x0000FFFF
_08079828:
	cmp r3, #6
	bne _08079848
	ldr r1, _08079840 @ =0x0000FFFF
	ldr r2, _08079844 @ =0x02000800
_08079830:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _080798C8
	.align 2, 0
_08079840: .4byte 0x0000FFFF
_08079844: .4byte 0x02000800
_08079848:
	cmp r3, #5
	bne _08079850
	movs r0, #1
	b _08079856
_08079850:
	cmp r3, #4
	bne _0807985E
	movs r0, #2
_08079856:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _080798C8
_0807985E:
	cmp r3, #3
	bne _08079878
	ldr r1, _08079870 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079874 @ =0x06014000
	b _080798BE
	.align 2, 0
_08079870: .4byte 0x040000D4
_08079874: .4byte 0x06014000
_08079878:
	cmp r3, #2
	bne _08079894
	ldr r1, _08079888 @ =0x040000D4
	ldr r0, _0807988C @ =0x02000400
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079890 @ =0x06014400
	b _080798BE
	.align 2, 0
_08079888: .4byte 0x040000D4
_0807988C: .4byte 0x02000400
_08079890: .4byte 0x06014400
_08079894:
	cmp r3, #1
	bne _080798B0
	ldr r1, _080798A4 @ =0x040000D4
	ldr r0, _080798A8 @ =0x02000800
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798AC @ =0x06014800
	b _080798BE
	.align 2, 0
_080798A4: .4byte 0x040000D4
_080798A8: .4byte 0x02000800
_080798AC: .4byte 0x06014800
_080798B0:
	cmp r3, #0
	bne _080798C8
	ldr r1, _080798D0 @ =0x040000D4
	ldr r0, _080798D4 @ =0x02000C00
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798D8 @ =0x06014C00
_080798BE:
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _080798DC @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080798C8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798D0: .4byte 0x040000D4
_080798D4: .4byte 0x02000C00
_080798D8: .4byte 0x06014C00
_080798DC: .4byte 0x840000E0

	thumb_func_start DisplayMessage
DisplayMessage: @ 0x080798E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r0, #0xfc
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _08079964
	movs r2, #0x12
	ldr r0, _0807992C @ =gEventCounter
	ldr r1, _08079930 @ =0x08575FA0
	ldrb r0, [r0]
	ldr r7, _08079934 @ =0x0879CDF4
	ldr r6, _08079938 @ =0x03000011
	ldrb r4, [r1, #0x12]
	cmp r0, r4
	beq _0807991C
	adds r4, r1, #0
	adds r1, r0, #0
_0807990E:
	subs r2, #1
	cmp r2, #0
	beq _08079940
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807990E
_0807991C:
	cmp r2, #0
	beq _08079940
	ldr r1, _0807993C @ =0x08575FB4
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	b _08079952
	.align 2, 0
_0807992C: .4byte gEventCounter
_08079930: .4byte 0x08575FA0
_08079934: .4byte 0x0879CDF4
_08079938: .4byte 0x03000011
_0807993C: .4byte 0x08575FB4
_08079940:
	ldr r1, _08079970 @ =gEquipment
	ldrb r0, [r1, #0xd]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08079952
	ldrb r0, [r1, #0xd]
	subs r2, r0, #1
_08079952:
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_08079964:
	cmp r3, #7
	bne _08079978
	ldr r1, _08079974 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079980
	.align 2, 0
_08079970: .4byte gEquipment
_08079974: .4byte 0x0000FFFF
_08079978:
	cmp r3, #6
	bne _08079998
	ldr r1, _08079990 @ =0x0000FFFF
	ldr r2, _08079994 @ =0x02000800
_08079980:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _08079A20
	.align 2, 0
_08079990: .4byte 0x0000FFFF
_08079994: .4byte 0x02000800
_08079998:
	cmp r3, #5
	bne _080799A0
	movs r0, #1
	b _080799A6
_080799A0:
	cmp r3, #4
	bne _080799AE
	movs r0, #2
_080799A6:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _08079A20
_080799AE:
	cmp r3, #3
	bne _080799CC
	ldr r1, _080799C4 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _080799C8 @ =0x06014000
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799C4: .4byte 0x040000D4
_080799C8: .4byte 0x06014000
_080799CC:
	cmp r3, #2
	bne _080799E8
	ldr r1, _080799DC @ =0x040000D4
	ldr r0, _080799E0 @ =0x02000400
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _080799E4 @ =0x06014400
	b _08079A16
	.align 2, 0
_080799DC: .4byte 0x040000D4
_080799E0: .4byte 0x02000400
_080799E4: .4byte 0x06014400
_080799E8:
	cmp r3, #1
	bne _08079A08
	ldr r1, _080799FC @ =0x040000D4
	ldr r0, _08079A00 @ =0x02000800
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _08079A04 @ =0x06014800
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799FC: .4byte 0x040000D4
_08079A00: .4byte 0x02000800
_08079A04: .4byte 0x06014800
_08079A08:
	cmp r3, #0
	bne _08079A20
	ldr r1, _08079A28 @ =0x040000D4
	ldr r0, _08079A2C @ =0x02000C00
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _08079A30 @ =0x06014C00
_08079A16:
	adds r0, r0, r4
_08079A18:
	str r0, [r1, #4]
	ldr r0, _08079A34 @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08079A20:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079A28: .4byte 0x040000D4
_08079A2C: .4byte 0x02000C00
_08079A30: .4byte 0x06014C00
_08079A34: .4byte 0x840000E0

	thumb_func_start ClearTextGraphics
ClearTextGraphics: @ 0x08079A38
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08079A58
	ldr r0, _08079A54 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #3
	cmp r0, #0
	beq _08079A68
	movs r1, #5
	b _08079A68
	.align 2, 0
_08079A54: .4byte gNonGameplayRam
_08079A58:
	cmp r1, #2
	bne _08079A68
	ldr r0, _08079A70 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #4
	cmp r0, #0
	beq _08079A68
	movs r1, #6
_08079A68:
	cmp r1, #3
	bne _08079A78
	ldr r2, _08079A74 @ =0x06007000
	b _08079A92
	.align 2, 0
_08079A70: .4byte gNonGameplayRam
_08079A74: .4byte 0x06007000
_08079A78:
	cmp r1, #4
	bne _08079A8C
	ldr r6, _08079A84 @ =0x06007800
	ldr r2, _08079A88 @ =0x06007000
	b _08079AB0
	.align 2, 0
_08079A84: .4byte 0x06007800
_08079A88: .4byte 0x06007000
_08079A8C:
	cmp r1, #5
	bne _08079AA8
	ldr r2, _08079AA4 @ =0x06006000
_08079A92:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AA4: .4byte 0x06006000
_08079AA8:
	cmp r1, #6
	bne _08079ADC
	ldr r6, _08079AD4 @ =0x06006800
	ldr r2, _08079AD8 @ =0x06006000
_08079AB0:
	movs r5, #0x80
	lsls r5, r5, #4
	movs r4, #0x20
	str r4, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r3, r5, #0
	bl DmaTransfer
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AD4: .4byte 0x06006800
_08079AD8: .4byte 0x06006000
_08079ADC:
	ldr r2, _08079AF8 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #6
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
_08079AEE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079AF8: .4byte 0x06006000

	thumb_func_start NavigationConversationProcessText
NavigationConversationProcessText: @ 0x08079AFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08079B14 @ =gNonGameplayRam
	ldrb r1, [r0, #0x17]
	adds r5, r0, #0
	cmp r1, #0
	beq _08079B18
	ldrh r1, [r5, #4]
	movs r0, #0x10
	b _08079B1C
	.align 2, 0
_08079B14: .4byte gNonGameplayRam
_08079B18:
	ldrh r1, [r5, #4]
	movs r0, #8
_08079B1C:
	ands r0, r1
	cmp r0, #0
	bne _08079B24
	b _0807A0EC
_08079B24:
	ldrb r0, [r5, #0x18]
	ldr r1, _08079B70 @ =0x06007000
	mov r8, r1
	cmp r0, #0
	beq _08079B32
	ldr r2, _08079B74 @ =0x06006000
	mov r8, r2
_08079B32:
	movs r7, #0
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0xe
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079B80
	ldr r0, _08079B78 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079B56
	b _0807A0EC
_08079B56:
	ldr r0, _08079B7C @ =0x00000203
	bl SoundPlay
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	strh r7, [r0]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, #4
	b _08079B94
	.align 2, 0
_08079B70: .4byte 0x06007000
_08079B74: .4byte 0x06006000
_08079B78: .4byte gChangedInput
_08079B7C: .4byte 0x00000203
_08079B80:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079BDA
	movs r6, #0
	strh r7, [r2]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0x12
_08079B94:
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xe0
	bls _08079BA2
	movs r0, #2
	bl ClearTextGraphics
_08079BA2:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0xe0
	strh r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r6, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r6, [r0]
	b _0807A0EC
_08079BDA:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079C48
	ldr r0, _08079C40 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079BF0
	b _0807A0EC
_08079BF0:
	ldr r0, _08079C44 @ =0x00000203
	bl SoundPlay
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r4, #0
	strh r7, [r0]
	movs r0, #1
	bl ClearTextGraphics
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	b _0807A0EC
	.align 2, 0
_08079C40: .4byte gChangedInput
_08079C44: .4byte 0x00000203
_08079C48:
	ldr r0, _08079C60 @ =0x0000E001
	cmp r1, r0
	bne _08079C64
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08079C5C
	b _0807A0EC
_08079C5C:
	strh r7, [r2]
	b _0807A0EC
	.align 2, 0
_08079C60: .4byte 0x0000E001
_08079C64:
	ldrb r0, [r5, #0x1f]
	cmp r0, #0
	beq _08079C70
	subs r0, #1
	strb r0, [r5, #0x1f]
	b _0807A0EC
_08079C70:
	ldrb r0, [r5, #0x1a]
	ldr r2, _08079CA8 @ =gButtonInput
	cmp r0, #0
	beq _08079C84
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079C84
	strb r7, [r5, #0x1a]
_08079C84:
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0xe
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _08079CAC
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	bne _08079CAC
	movs r7, #1
	b _08079CC0
	.align 2, 0
_08079CA8: .4byte gButtonInput
_08079CAC:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5, #0x1d]
	cmp r0, r1
	bhs _08079CC0
	b _0807A0EC
_08079CC0:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r1, [r0]
	subs r0, r1, #1
	lsls r3, r0, #1
	ldr r0, _08079D24 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	cmp r1, r0
	bne _08079CE4
	adds r3, #1
_08079CE4:
	ldr r1, _08079D28 @ =0x0879C0F0
	ldr r0, _08079D2C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldrh r0, [r5, #0xc]
	lsls r1, r0, #1
	adds r6, r6, r1
	adds r0, #1
	strh r0, [r5, #0xc]
_08079D04:
	movs r3, #0
	ldrh r0, [r6]
	lsrs r1, r0, #0xc
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r0
	subs r1, #8
	adds r2, r0, #0
	cmp r1, #7
	bls _08079D1A
	b _08079F9C
_08079D1A:
	lsls r0, r1, #2
	ldr r1, _08079D30 @ =_08079D34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079D24: .4byte gPreviousNavigationConversation
_08079D28: .4byte 0x0879C0F0
_08079D2C: .4byte 0x03000011
_08079D30: .4byte _08079D34
_08079D34: @ jump table
	.4byte _08079F2C @ case 0
	.4byte _08079F0C @ case 1
	.4byte _08079EEC @ case 2
	.4byte _08079E96 @ case 3
	.4byte _08079E90 @ case 4
	.4byte _08079F9C @ case 5
	.4byte _08079DCE @ case 6
	.4byte _08079D54 @ case 7
_08079D54:
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D60
	movs r0, #1
	b _08079DB8
_08079D60:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D78
_08079D68:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
_08079D74:
	movs r3, #1
	b _08079F9C
_08079D78:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079D88
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079DAC
_08079D88:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #0x1a]
	movs r3, #2
	b _08079F9C
_08079DAC:
	movs r0, #0xfb
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079DB6
	b _08079F9C
_08079DB6:
	movs r0, #2
_08079DB8:
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r3, #2
	b _08079F9C
_08079DCE:
	movs r0, #0xe0
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E00
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	bne _08079DF4
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08079D74
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _08079E82
_08079DF4:
	ldr r0, _08079DFC @ =0x0000E001
	cmp r2, r0
	bne _08079D74
	b _08079D68
	.align 2, 0
_08079DFC: .4byte 0x0000E001
_08079E00:
	movs r0, #0xe1
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E0C
	strb r2, [r5, #0x1f]
	b _08079D74
_08079E0C:
	movs r0, #0xe2
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E5C
	ldrh r1, [r6]
	adds r0, #1
	cmp r1, r0
	bne _08079E2C
	ldrh r0, [r5, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	strb r1, [r5, #0x19]
	b _08079E56
_08079E2C:
	ldr r0, _08079E44 @ =0x0000E202
	cmp r1, r0
	bne _08079E48
	ldrh r1, [r5, #4]
	movs r0, #4
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	movs r0, #2
	strb r0, [r5, #0x19]
	b _08079E56
	.align 2, 0
_08079E44: .4byte 0x0000E202
_08079E48:
	ldrh r0, [r5, #4]
	movs r2, #1
	movs r1, #0
	orrs r0, r2
	strh r0, [r5, #4]
	strb r1, [r5, #0x18]
	strb r2, [r5, #0x19]
_08079E56:
	ldrh r0, [r6]
	strb r0, [r5, #0x17]
	b _08079D74
_08079E5C:
	movs r0, #0xe3
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079D74
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bne _08079E74
	ldrh r1, [r5, #4]
	movs r0, #0x40
	orrs r0, r1
	b _08079E82
_08079E74:
	ldr r0, _08079E88 @ =0x0000E301
	cmp r1, r0
	beq _08079E7C
	b _08079D74
_08079E7C:
	ldrh r1, [r5, #4]
	ldr r0, _08079E8C @ =0x0000FFBF
	ands r0, r1
_08079E82:
	strh r0, [r5, #4]
	b _08079D74
	.align 2, 0
_08079E88: .4byte 0x0000E301
_08079E8C: .4byte 0x0000FFBF
_08079E90:
	movs r0, #6
	strb r0, [r5, #0x1c]
	b _08079D74
_08079E96:
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08079EA8 @ =0x0000B001
	cmp r1, r0
	bne _08079EAC
	movs r0, #0x99
	lsls r0, r0, #2
	adds r1, r5, r0
	b _08079EB8
	.align 2, 0
_08079EA8: .4byte 0x0000B001
_08079EAC:
	ldr r0, _08079EC0 @ =0x0000B002
	cmp r1, r0
	bne _08079EC4
	movs r2, #0x99
	lsls r2, r2, #2
	adds r1, r5, r2
_08079EB8:
	movs r0, #1
	strb r0, [r1]
	b _08079D74
	.align 2, 0
_08079EC0: .4byte 0x0000B002
_08079EC4:
	ldr r0, _08079EE8 @ =0x0000B003
	cmp r1, r0
	bne _08079F9C
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08079F9A
	cmp r0, #3
	beq _08079F9A
	movs r0, #0x2a
	movs r1, #2
	bl PlayMusic
	movs r0, #0
	movs r1, #0xb
	bl SoundEventUpdate
	b _08079F9A
	.align 2, 0
_08079EE8: .4byte 0x0000B003
_08079EEC:
	ldr r1, _08079F04 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F08 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3c14
	b _08079F9A
	.align 2, 0
_08079F04: .4byte 0x00000221
_08079F08: .4byte 0x00000FFF
_08079F0C:
	ldr r1, _08079F24 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F28 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3bd4
	b _08079F9A
	.align 2, 0
_08079F24: .4byte 0x00000221
_08079F28: .4byte 0x00000FFF
_08079F2C:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F46
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	movs r0, #0xff
	ands r0, r2
	ldrh r2, [r1]
	b _08079F96
_08079F46:
	movs r0, #0x81
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F52
	strb r2, [r5, #0x1e]
	b _08079F9A
_08079F52:
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F68
	strb r2, [r5, #0x1d]
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08079F9A
	movs r0, #8
	strb r0, [r5, #0x1d]
	b _08079F9A
_08079F68:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F9A
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0xdf
	bls _08079F84
	movs r0, #0xe0
	b _08079F86
_08079F84:
	movs r0, #0
_08079F86:
	strh r0, [r1]
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r6]
_08079F96:
	adds r0, r0, r2
	strh r0, [r1]
_08079F9A:
	movs r3, #3
_08079F9C:
	cmp r3, #3
	bne _08079FB4
	ldr r1, _08079FB0 @ =gNonGameplayRam
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	adds r6, #2
	adds r5, r1, #0
	b _08079D04
	.align 2, 0
_08079FB0: .4byte gNonGameplayRam
_08079FB4:
	cmp r3, #2
	bne _08079FE0
	ldr r2, _08079FDC @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	movs r3, #0
	strb r3, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r3, [r0]
	b _0807A0EC
	.align 2, 0
_08079FDC: .4byte gNonGameplayRam
_08079FE0:
	cmp r3, #1
	bne _08079FE6
	b _0807A0EC
_08079FE6:
	ldrh r0, [r6]
	bl GetCharacterWidth
	ldr r4, _0807A01C @ =gNonGameplayRam
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x12
	adds r2, r0, r5
	ldrh r1, [r2]
	ldrb r0, [r4, #0x16]
	adds r3, r1, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r3, r0
	ble _0807A020
	movs r0, #2
	bl ClearTextGraphics
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0xe0
	strh r1, [r0]
	b _0807A02C
	.align 2, 0
_0807A01C: .4byte gNonGameplayRam
_0807A020:
	cmp r3, #0xe0
	ble _0807A02C
	cmp r1, #0xdf
	bhi _0807A02C
	movs r0, #0xe0
	strh r0, [r2]
_0807A02C:
	ldr r0, _0807A098 @ =gNonGameplayRam
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x12
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r5, r0, #0
	cmp r2, #0
	beq _0807A044
	cmp r2, #0xe0
	bne _0807A046
_0807A044:
	strh r2, [r1]
_0807A046:
	adds r4, r5, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r3, [r1]
	cmp r3, #0xdf
	bls _0807A060
	movs r0, #0x80
	lsls r0, r0, #4
	add r8, r0
	subs r3, #0xe0
_0807A060:
	asrs r0, r3, #3
	lsls r3, r0, #5
	add r8, r3
	ldrh r1, [r1]
	movs r3, #7
	ldrh r0, [r6]
	ldrb r2, [r4, #0x16]
	ands r3, r1
	ldrb r1, [r4, #0x1e]
	str r1, [sp]
	mov r1, r8
	bl DrawCharacter
	cmp r7, #0
	bne _0807A0BA
	ldrh r0, [r6]
	cmp r0, #0x40
	beq _0807A0BA
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0807A09C
	ldrh r0, [r6]
	movs r1, #0x21
	bl PlayCharacterAppearingSound
	movs r0, #2
	strb r0, [r4, #0x1b]
	b _0807A0BA
	.align 2, 0
_0807A098: .4byte gNonGameplayRam
_0807A09C:
	cmp r0, #2
	bne _0807A0AE
	ldrh r0, [r6]
	movs r1, #0x41
	bl PlayCharacterAppearingSound
	movs r0, #3
	strb r0, [r4, #0x1b]
	b _0807A0BA
_0807A0AE:
	ldrh r0, [r6]
	movs r1, #1
	bl PlayCharacterAppearingSound
	movs r0, #1
	strb r0, [r5, #0x1b]
_0807A0BA:
	movs r3, #1
	ldrh r2, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0807A0D4
	movs r1, #0xf0
	lsls r1, r1, #8
	bics r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
_0807A0D4:
	cmp r3, #0
	beq _0807A0EC
	ldr r2, _0807A0F8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x18]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r2, #0x16]
	adds r0, r0, r2
	strh r0, [r1]
_0807A0EC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A0F8: .4byte gNonGameplayRam

	thumb_func_start unk_7a0fc
unk_7a0fc: @ 0x0807A0FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0807A120 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	bne _0807A124
	movs r0, #0
	b _0807A2C2
	.align 2, 0
_0807A120: .4byte gNonGameplayRam
_0807A124:
	movs r0, #0
	mov sl, r0
	mov sb, r0
	lsls r3, r3, #2
	str r3, [sp, #4]
	mov r5, ip
	mov r6, ip
	adds r6, #0x21
	movs r1, #0x20
	add r1, ip
	mov r8, r1
_0807A13A:
	ldr r1, _0807A174 @ =0x0879CDF4
	ldr r0, _0807A178 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [sp, #4]
	adds r0, r2, r0
	adds r0, #0xac
	ldr r4, [r0]
	ldr r7, _0807A17C @ =0x06007000
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldrh r1, [r4]
	adds r3, r1, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r3, r0
	bne _0807A180
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0xe0
	mov r2, ip
	b _0807A1D2
	.align 2, 0
_0807A174: .4byte 0x0879CDF4
_0807A178: .4byte 0x03000011
_0807A17C: .4byte 0x06007000
_0807A180:
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1A0
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r5, #0x22]
	ldrb r4, [r4]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	b _0807A1D4
_0807A1A0:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1E0
	movs r1, #0
	mov r2, r8
	strb r1, [r2]
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bls _0807A1BA
	movs r0, #0xe0
	strh r0, [r5, #0x22]
	b _0807A1BC
_0807A1BA:
	strh r1, [r5, #0x22]
_0807A1BC:
	ldrb r1, [r4]
	mov r2, ip
	ldrh r0, [r2, #0x22]
	adds r3, r0, r1
	strh r3, [r2, #0x22]
	ldrh r1, [r4]
	ldr r0, _0807A1DC @ =0x000083A0
	cmp r1, r0
	bne _0807A1D4
	adds r0, r3, #0
	subs r0, #0x10
_0807A1D2:
	strh r0, [r2, #0x22]
_0807A1D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _0807A13A
	.align 2, 0
_0807A1DC: .4byte 0x000083A0
_0807A1E0:
	mov r0, sb
	cmp r0, #0
	bne _0807A22E
	cmp r3, #0x40
	beq _0807A228
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bhi _0807A228
	ldrb r0, [r5, #0x1a]
	ldr r2, _0807A2D4 @ =gButtonInput
	cmp r0, #0
	beq _0807A206
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A206
	mov r1, sb
	strb r1, [r5, #0x1a]
_0807A206:
	mov r1, r8
	ldrb r0, [r1]
	adds r3, r0, #1
	strb r3, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A220
	mov r2, ip
	ldrb r0, [r2, #0x1a]
	cmp r0, #0
	beq _0807A228
_0807A220:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807A2C0
_0807A228:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_0807A22E:
	ldrh r0, [r4]
	bl GetCharacterWidth
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	strb r0, [r2, #0x16]
	ldrh r1, [r2, #0x22]
	ldrb r0, [r2, #0x16]
	adds r0, r1, r0
	cmp r0, #0xe0
	ble _0807A24A
	cmp r1, #0xdf
	bhi _0807A24A
	movs r0, #0xe0
	strh r0, [r2, #0x22]
_0807A24A:
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r1, #0x22]
	cmp r0, #0
	beq _0807A256
	cmp r0, #0xe0
	bne _0807A258
_0807A256:
	strh r0, [r1, #0x22]
_0807A258:
	ldrh r0, [r4]
	cmp r0, #0x40
	beq _0807A292
	movs r1, #1
	bl PlayCharacterAppearingSound
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r2, #0x22]
	cmp r0, #0xdf
	bls _0807A278
	movs r1, #1
	mov sb, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r7, r7, r1
	subs r0, #0xe0
_0807A278:
	asrs r0, r0, #3
	lsls r0, r0, #5
	adds r7, r7, r0
	ldrh r1, [r2, #0x22]
	movs r3, #7
	ldrh r0, [r4]
	ldrb r2, [r2, #0x16]
	ands r3, r1
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	bl DrawCharacter
_0807A292:
	ldrh r0, [r5, #0x22]
	ldrb r2, [r5, #0x16]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	mov ip, r1
	movs r2, #0xff
	lsls r2, r2, #8
	cmp r0, r2
	bne _0807A2B2
	movs r0, #1
	mov sl, r0
_0807A2B2:
	mov r1, sb
	cmp r1, #0
	beq _0807A2C0
	mov r2, sl
	cmp r2, #0
	bne _0807A2C0
	b _0807A13A
_0807A2C0:
	mov r0, sl
_0807A2C2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A2D4: .4byte gButtonInput
_0807A2D8: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationGetCurrentConversation
NavigationConversationGetCurrentConversation: @ 0x0807A2DC
	push {r4, r5, lr}
	ldr r0, _0807A330 @ =gEventCounter
	ldrb r2, [r0]
	ldr r3, _0807A334 @ =0x08575A60
	ldr r4, _0807A338 @ =gNonGameplayRam
	ldr r5, _0807A33C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807A310
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r1, r0, #2
	adds r0, r1, r3
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807A310
	adds r1, r1, r3
_0807A300:
	subs r1, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807A310
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0807A300
_0807A310:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r5, [r5]
	cmp r1, r5
	bne _0807A344
	ldr r3, _0807A340 @ =0x00000221
	adds r1, r4, r3
	movs r0, #1
	b _0807A34A
	.align 2, 0
_0807A330: .4byte gEventCounter
_0807A334: .4byte 0x08575A60
_0807A338: .4byte gNonGameplayRam
_0807A33C: .4byte gPreviousNavigationConversation
_0807A340: .4byte 0x00000221
_0807A344:
	ldr r0, _0807A394 @ =0x00000221
	adds r1, r4, r0
	movs r0, #0
_0807A34A:
	strb r0, [r1]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #1
	bl NavigationConversationUpdateTarget
	bl NavigationConversationSetupOam
	ldr r0, _0807A398 @ =gNonGameplayRam
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _0807A39C @ =0x00000239
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #3
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #0x13
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807A3A0 @ =0x00000252
	adds r0, r0, r1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A394: .4byte 0x00000221
_0807A398: .4byte gNonGameplayRam
_0807A39C: .4byte 0x00000239
_0807A3A0: .4byte 0x00000252

	thumb_func_start NavigationConversationSubroutine
NavigationConversationSubroutine: @ 0x0807A3A4
	push {r4, r5, r6, r7, lr}
	bl unk_7b674
	bl NavigationConversionScrollToTarget
	bl unk_7b56c
	bl NavigationConversationUpdatePanel
	bl unk_78c44
	movs r7, #0
	ldr r0, _0807A3D4 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0x15
	bls _0807A3C8
	bl _0807AE42
_0807A3C8:
	lsls r0, r0, #2
	ldr r1, _0807A3D8 @ =_0807A3DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A3D4: .4byte gNonGameplayRam
_0807A3D8: .4byte _0807A3DC
_0807A3DC: @ jump table
	.4byte _0807A434 @ case 0
	.4byte _0807A468 @ case 1
	.4byte _0807A51A @ case 2
	.4byte _0807A6C0 @ case 3
	.4byte _0807A700 @ case 4
	.4byte _0807A718 @ case 5
	.4byte _0807A76C @ case 6
	.4byte _0807A79E @ case 7
	.4byte _0807A7B0 @ case 8
	.4byte _0807A890 @ case 9
	.4byte _0807A938 @ case 10
	.4byte _0807AA2A @ case 11
	.4byte _0807AA48 @ case 12
	.4byte _0807AA84 @ case 13
	.4byte _0807AAE0 @ case 14
	.4byte _0807AB14 @ case 15
	.4byte _0807AB40 @ case 16
	.4byte _0807ABB4 @ case 17
	.4byte _0807AC28 @ case 18
	.4byte _0807ACAE @ case 19
	.4byte _0807AD6C @ case 20
	.4byte _0807ADE8 @ case 21
_0807A434:
	ldr r4, _0807A454 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r4, #6]
	bl NavigationConversationSetupOam
	ldr r1, _0807A458 @ =0x00000221
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A45C
	movs r0, #4
	strb r0, [r4, #0x1c]
	movs r0, #0x11
	strb r0, [r4, #7]
	bl _0807AE42
	.align 2, 0
_0807A454: .4byte gNonGameplayRam
_0807A458: .4byte 0x00000221
_0807A45C:
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #7]
	adds r0, #1
	strb r0, [r4, #7]
	bl _0807AE42
_0807A468:
	ldr r1, _0807A4D4 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r3, r1, r2
	ldrh r2, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r5, #0
	orrs r0, r2
	strh r0, [r3]
	movs r2, #1
	strb r2, [r1, #9]
	strb r2, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0x1d]
	strb r5, [r1, #0x1e]
	strb r5, [r1, #0x1f]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	subs r0, #1
	lsls r3, r0, #1
	ldr r4, _0807A4D8 @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _0807A4A6
	adds r3, #1
_0807A4A6:
	ldr r1, _0807A4DC @ =0x0879C0F0
	ldr r0, _0807A4E0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0]
	ldr r0, _0807A4E4 @ =0x0000E201
	cmp r3, r0
	bne _0807A4E8
	ldrh r0, [r4, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r2, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A4D4: .4byte gNonGameplayRam
_0807A4D8: .4byte 0x00000221
_0807A4DC: .4byte 0x0879C0F0
_0807A4E0: .4byte 0x03000011
_0807A4E4: .4byte 0x0000E201
_0807A4E8:
	ldr r0, _0807A500 @ =0x0000E202
	cmp r3, r0
	bne _0807A504
	ldrh r0, [r4, #4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	movs r0, #2
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A500: .4byte 0x0000E202
_0807A504:
	ldrh r0, [r4, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r4, #4]
	strb r5, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r5, [r4, #0x17]
_0807A512:
	ldrb r0, [r4, #7]
	adds r0, #1
	movs r1, #0
	b _0807AC3E
_0807A51A:
	ldr r1, _0807A584 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	ldrb r0, [r1, #0x1c]
	adds r4, r1, #0
	cmp r0, #1
	bne _0807A5B8
	ldr r0, _0807A588 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A590
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A59C
	ldr r1, _0807A58C @ =0x00000241
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, #0
	bne _0807A590
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r5, [r0]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #3
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	bl _0807AE42
	.align 2, 0
_0807A584: .4byte gNonGameplayRam
_0807A588: .4byte gChangedInput
_0807A58C: .4byte 0x00000241
_0807A590:
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807A5F2
_0807A59C:
	ldrh r1, [r4, #4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807A5AE
	bl _0807AE42
_0807A5AE:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #4]
	bl _0807AE42
_0807A5B8:
	cmp r0, #2
	bne _0807A5E6
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0807A5F2
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x25
	movs r0, #1
	strb r0, [r2]
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	movs r0, #8
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807A5F2
_0807A5E6:
	cmp r0, #6
	bne _0807A5EE
	movs r7, #1
	b _0807A5F2
_0807A5EE:
	bl NavigationConversationProcessText
_0807A5F2:
	ldr r3, _0807A628 @ =gNonGameplayRam
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807A630
	movs r0, #0x74
	strh r0, [r1, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A62C @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A628: .4byte gNonGameplayRam
_0807A62C: .4byte 0x085766E0
_0807A630:
	movs r2, #0
	strh r2, [r1, #0x2e]
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x2c]
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0xdf
	bls _0807A68C
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r4, _0807A684 @ =0x0000FF28
	adds r1, r2, r4
	ldrh r2, [r0, #0x2e]
	adds r1, r1, r2
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A688 @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x10
	ldrh r3, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A684: .4byte 0x0000FF28
_0807A688: .4byte 0x085766E0
_0807A68C:
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r2, #0
	adds r1, #8
	ldrh r4, [r0, #0x2e]
	adds r1, r1, r4
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0807A6BC @ =0x085766E0
	ldrb r1, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r2, #0x2c]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0x2c]
	b _0807AE42
	.align 2, 0
_0807A6BC: .4byte 0x085766E0
_0807A6C0:
	ldr r1, _0807A6F4 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r2, _0807A6F8 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	ldrb r3, [r2]
	cmp r0, r3
	beq _0807A6E6
	strb r0, [r2]
	ldr r4, _0807A6FC @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A6E6
	bl SoundEventUpdateForNavConversation
_0807A6E6:
	ldr r0, _0807A6F4 @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
	b _0807AE42
	.align 2, 0
_0807A6F4: .4byte gNonGameplayRam
_0807A6F8: .4byte gPreviousNavigationConversation
_0807A6FC: .4byte 0x00000221
_0807A700:
	ldr r2, _0807A714 @ =gNonGameplayRam
	ldrb r0, [r2, #6]
	cmp r0, #8
	bhi _0807A70A
	b _0807AE42
_0807A70A:
	ldrb r0, [r2, #7]
	adds r0, #1
	movs r1, #0
	b _0807A798
	.align 2, 0
_0807A714: .4byte gNonGameplayRam
_0807A718:
	ldr r3, _0807A768 @ =gNonGameplayRam
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	eors r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807A73C
	movs r0, #0x40
	eors r0, r1
	strh r0, [r3, #4]
_0807A73C:
	ldrh r1, [r3, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807A74C
	movs r0, #8
	eors r0, r1
	strh r0, [r3, #4]
_0807A74C:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A75C
	movs r0, #0x10
	eors r0, r1
	strh r0, [r3, #4]
_0807A75C:
	ldrb r0, [r3, #7]
	adds r0, #1
	strb r0, [r3, #7]
	movs r0, #0
	strb r0, [r3, #6]
	b _0807AE42
	.align 2, 0
_0807A768: .4byte gNonGameplayRam
_0807A76C:
	ldr r2, _0807A790 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0807A794
_0807A78C:
	movs r0, #0
	b _0807AE44
	.align 2, 0
_0807A790: .4byte gNonGameplayRam
_0807A794:
	ldrb r0, [r2, #7]
	adds r0, #1
_0807A798:
	strb r0, [r2, #7]
	strb r1, [r2, #6]
	b _0807AE42
_0807A79E:
	movs r7, #1
	ldr r1, _0807A7AC @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _0807AE42
	.align 2, 0
_0807A7AC: .4byte gNonGameplayRam
_0807A7B0:
	ldr r5, _0807A818 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x24
	ldrb r4, [r6]
	cmp r4, #0
	bne _0807A824
	ldr r0, _0807A81C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A7CA
	b _0807AE42
_0807A7CA:
	ldr r0, _0807A820 @ =0x00000203
	bl SoundPlay
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	bl ClearTextGraphics
	movs r0, #1
	strb r0, [r6]
	movs r0, #3
	strb r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	strh r4, [r5, #0x22]
	b _0807AE42
	.align 2, 0
_0807A818: .4byte gNonGameplayRam
_0807A81C: .4byte gChangedInput
_0807A820: .4byte 0x00000203
_0807A824:
	cmp r4, #2
	bne _0807A832
	movs r1, #0
	movs r0, #9
	strb r0, [r5, #7]
	strb r1, [r5, #6]
	b _0807AE42
_0807A832:
	movs r0, #0
	bl unk_7a0fc
	cmp r0, #0
	bne _0807A83E
	b _0807AE42
_0807A83E:
	movs r3, #0
	movs r2, #2
	strb r2, [r6]
	movs r0, #1
	strb r0, [r5, #0x1a]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x34
	strh r1, [r0, #0x2e]
	b _0807AE42
_0807A890:
	movs r3, #0
	ldr r2, _0807A8C8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807A8CC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807A8D0
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807A8F8
	.align 2, 0
_0807A8C8: .4byte gNonGameplayRam
_0807A8CC: .4byte gChangedInput
_0807A8D0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A8E8
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807A8E4
	movs r3, #1
_0807A8E4:
	strb r5, [r1]
	b _0807A8F8
_0807A8E8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807A8F8
	movs r3, #2
	movs r0, #0xa
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807A8F8:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A910
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807A91C
_0807A910:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807A91C:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807A924
	b _0807AD3E
_0807A924:
	cmp r3, #2
	beq _0807A92A
	b _0807AE42
_0807A92A:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A936
	b _0807AD56
_0807A936:
	b _0807AD60
_0807A938:
	ldr r2, _0807A994 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #0xc0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807AA18
	movs r0, #0x10
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r2, [r0]
	cmp r2, #0
	bne _0807A9DA
	ldr r0, _0807A998 @ =0x03000031
	ldrb r1, [r0]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _0807A99C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _0807A9A0 @ =0x00000212
	adds r0, r4, r1
	ldr r1, _0807A9A4 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0807A9A8
	movs r0, #0xb
	strb r0, [r4, #7]
	subs r3, #0x5b
	adds r0, r4, r3
	strb r2, [r0]
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r2, [r0]
	subs r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	b _0807A9B8
	.align 2, 0
_0807A994: .4byte gNonGameplayRam
_0807A998: .4byte 0x03000031
_0807A99C: .4byte 0x03000032
_0807A9A0: .4byte 0x00000212
_0807A9A4: .4byte gCurrentArea
_0807A9A8:
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A9B8
	movs r0, #0xf
	strb r0, [r4, #7]
_0807A9B8:
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r3, #0xd4
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	movs r2, #0
	strh r1, [r4, #0xc]
	adds r3, #0x71
	adds r0, r4, r3
	strb r2, [r0]
_0807A9DA:
	movs r0, #1
	bl ClearTextGraphics
	ldr r2, _0807AA14 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	strb r0, [r2, #0x1a]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strh r3, [r0]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r3, [r0]
	strb r4, [r2, #0x1c]
	b _0807AE40
	.align 2, 0
_0807AA14: .4byte gNonGameplayRam
_0807AA18:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0807AA22
	b _0807AE42
_0807AA22:
	movs r0, #0x40
	eors r0, r1
	strh r0, [r4, #4]
	b _0807AE42
_0807AA2A:
	ldr r1, _0807AA44 @ =gNonGameplayRam
	movs r0, #0x94
	lsls r0, r0, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	movs r0, #1
	movs r3, #0
	orrs r0, r2
	strb r0, [r4]
	strb r3, [r1, #6]
	movs r0, #0xc
	strb r0, [r1, #7]
	b _0807AE42
	.align 2, 0
_0807AA44: .4byte gNonGameplayRam
_0807AA48:
	ldr r5, _0807AA78 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA5C
	b _0807AE42
_0807AA5C:
	ldr r0, _0807AA7C @ =gCurrentArea
	ldrb r1, [r0]
	ldr r2, _0807AA80 @ =0x00000212
	adds r0, r5, r2
	movs r4, #0
	strb r1, [r0]
	movs r0, #1
	bl unk_75988
	strb r4, [r5, #6]
	movs r0, #0xd
	strb r0, [r5, #7]
	b _0807AE42
	.align 2, 0
_0807AA78: .4byte gNonGameplayRam
_0807AA7C: .4byte gCurrentArea
_0807AA80: .4byte 0x00000212
_0807AA84:
	ldr r6, _0807AAC8 @ =gNonGameplayRam
	ldrb r0, [r6, #6]
	cmp r0, #4
	bhi _0807AA8E
	b _0807AE42
_0807AA8E:
	ldr r3, _0807AACC @ =0x00000212
	adds r4, r6, r3
	ldrb r0, [r4]
	ldr r5, _0807AAD0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807AAD4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807AAD8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807AADC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0
	movs r0, #0xe
	strb r0, [r6, #7]
	strb r1, [r6, #6]
	movs r4, #0x94
	lsls r4, r4, #2
	adds r2, r6, r4
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807AE42
	.align 2, 0
_0807AAC8: .4byte gNonGameplayRam
_0807AACC: .4byte 0x00000212
_0807AAD0: .4byte 0x02034000
_0807AAD4: .4byte 0x040000D4
_0807AAD8: .4byte 0x0600E000
_0807AADC: .4byte 0x80000400
_0807AAE0:
	ldr r2, _0807AB10 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0807AAF0
	b _0807AE42
_0807AAF0:
	movs r4, #0xdb
	lsls r4, r4, #1
	adds r3, r2, r4
	movs r0, #1
	strb r0, [r3]
	movs r3, #0xda
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	subs r4, #1
	adds r0, r2, r4
	strb r1, [r0]
	strb r1, [r2, #6]
	movs r0, #0x10
	strb r0, [r2, #7]
	b _0807AE42
	.align 2, 0
_0807AB10: .4byte gNonGameplayRam
_0807AB14:
	ldr r4, _0807AB38 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0807AB3C @ =0x00000211
	adds r1, r4, r2
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807AB2E
	b _0807AE42
_0807AB2E:
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #0x10
	strb r0, [r4, #7]
	b _0807AE42
	.align 2, 0
_0807AB38: .4byte gNonGameplayRam
_0807AB3C: .4byte 0x00000211
_0807AB40:
	ldr r4, _0807ABAC @ =gNonGameplayRam
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bhi _0807AB4A
	b _0807AE42
_0807AB4A:
	movs r0, #0
	bl NavigationConversationUpdateTarget
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r3, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r2, _0807ABB0 @ =0x085766E0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	movs r0, #1
	strb r0, [r4, #7]
	strb r3, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ABAC: .4byte gNonGameplayRam
_0807ABB0: .4byte 0x085766E0
_0807ABB4:
	ldr r5, _0807AC24 @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrh r3, [r1]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r2, #0
	movs r4, #0
	orrs r0, r3
	strh r0, [r1]
	movs r0, #8
	strb r0, [r5, #0x1d]
	strb r2, [r5, #0x1e]
	strb r2, [r5, #0x1f]
	ldrh r0, [r5, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r5, #4]
	strb r2, [r5, #0x18]
	strb r1, [r5, #0x19]
	strb r2, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, #0x1e
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r4, [r5, #0x22]
	movs r0, #5
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	strb r2, [r5, #6]
	b _0807AE42
	.align 2, 0
_0807AC24: .4byte gNonGameplayRam
_0807AC28:
	ldr r4, _0807AC44 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0
	bne _0807AC36
	b _0807AE42
_0807AC36:
	cmp r0, #2
	bne _0807AC48
	movs r1, #0
	movs r0, #0x13
_0807AC3E:
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807AC44: .4byte gNonGameplayRam
_0807AC48:
	movs r0, #1
	bl unk_7a0fc
	cmp r0, #0
	bne _0807AC54
	b _0807AE42
_0807AC54:
	movs r3, #0
	movs r2, #2
	strb r2, [r5]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x84
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	b _0807AE42
_0807ACAE:
	movs r3, #0
	ldr r2, _0807ACE4 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807ACE8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807ACEC
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807AD14
	.align 2, 0
_0807ACE4: .4byte gNonGameplayRam
_0807ACE8: .4byte gChangedInput
_0807ACEC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807AD04
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807AD00
	movs r3, #1
_0807AD00:
	strb r5, [r1]
	b _0807AD14
_0807AD04:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807AD14
	movs r3, #2
	movs r0, #0x14
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807AD14:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD2C
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807AD38
_0807AD2C:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807AD38:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807AD48
_0807AD3E:
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _0807AE42
_0807AD48:
	cmp r3, #2
	bne _0807AE42
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD60
_0807AD56:
	movs r0, #0x81
	lsls r0, r0, #2
	bl SoundPlay
	b _0807AE42
_0807AD60:
	ldr r0, _0807AD68 @ =0x00000205
	bl SoundPlay
	b _0807AE42
	.align 2, 0
_0807AD68: .4byte 0x00000205
_0807AD6C:
	ldr r4, _0807ADDC @ =gNonGameplayRam
	movs r5, #0
	movs r0, #0x15
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807ADA4
	ldr r1, _0807ADE0 @ =gPreviousNavigationConversation
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807ADE4 @ =0x000001A9
	adds r0, r4, r3
	strb r5, [r0]
	movs r1, #0
	strh r5, [r4, #0xc]
	adds r2, #0x71
	adds r0, r4, r2
	strb r1, [r0]
_0807ADA4:
	movs r0, #1
	bl ClearTextGraphics
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r5, [r0]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r5, [r0]
	strb r2, [r4, #0x1c]
	strb r2, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ADDC: .4byte gNonGameplayRam
_0807ADE0: .4byte gPreviousNavigationConversation
_0807ADE4: .4byte 0x000001A9
_0807ADE8:
	ldr r2, _0807AE4C @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r4, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r2, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, _0807AE50 @ =0x085766E0
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	strb r0, [r2, #7]
_0807AE40:
	strb r4, [r2, #6]
_0807AE42:
	adds r0, r7, #0
_0807AE44:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807AE4C: .4byte gNonGameplayRam
_0807AE50: .4byte 0x085766E0

	thumb_func_start NavigationConversationSetupOam
NavigationConversationSetupOam: @ 0x0807AE54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _0807AF60 @ =gNonGameplayRam
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #0
	mov sb, r0
	movs r2, #0
	mov sl, r2
	movs r0, #0x7c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xcc
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x4b
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	movs r0, #1
	bl PauseScreenSetNavigationTextPanelOam
	movs r4, #0x73
	adds r4, r4, r6
	mov r8, r4
	ldrb r1, [r4]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strb r0, [r4]
	movs r0, #0x43
	adds r0, r0, r6
	mov ip, r0
	ldrb r1, [r0]
	movs r7, #4
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r3, #0x5b
	adds r3, r3, r6
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	movs r4, #0x67
	adds r4, r4, r6
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r4]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r6, r5
	ldr r0, _0807AF64 @ =0x085766D4
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	mov r0, sb
	strb r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #4]
	adds r5, r6, #0
	adds r5, #0xa3
	ldrb r0, [r5]
	adds r4, r2, #0
	ands r4, r0
	movs r3, #4
	orrs r4, r3
	strb r4, [r5]
	adds r3, r6, #0
	adds r3, #0x4f
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r3, #0x48
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r0, r6, #0
	adds r0, #0x82
	movs r2, #0xd4
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x44
	strh r1, [r0]
	subs r0, #0xa
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	ldrb r0, [r6]
	cmp r0, #0
	beq _0807AF68
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r7, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	mov r2, r8
	strb r1, [r2]
	ands r4, r7
	orrs r4, r0
	strb r4, [r5]
	b _0807AF7C
	.align 2, 0
_0807AF60: .4byte gNonGameplayRam
_0807AF64: .4byte 0x085766D4
_0807AF68:
	ands r4, r7
	movs r2, #2
	orrs r4, r2
	strb r4, [r5]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
_0807AF7C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationUpdateTarget
NavigationConversationUpdateTarget: @ 0x0807AF8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl NavigationConverstionFindTarget
	cmp r0, #0
	beq _0807AFF2
	cmp r4, #0
	beq _0807AFF2
	ldr r1, _0807AFCC @ =gNonGameplayRam
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0807AFD0 @ =0x000001A9
	adds r0, r1, r3
	strb r2, [r0]
	ldr r2, _0807AFD4 @ =0x0000020F
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #1
	bne _0807AFDC
	ldr r1, _0807AFD8 @ =0x085767EC
	adds r3, #0x6a
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	b _0807AFEA
	.align 2, 0
_0807AFCC: .4byte gNonGameplayRam
_0807AFD0: .4byte 0x000001A9
_0807AFD4: .4byte 0x0000020F
_0807AFD8: .4byte 0x085767EC
_0807AFDC:
	ldr r1, _0807AFF8 @ =0x00000212
	adds r0, r2, r1
	ldrb r0, [r0]
	movs r1, #0xe
	cmp r0, #0
	bne _0807AFEA
	movs r1, #0xf
_0807AFEA:
	movs r3, #0xd5
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
_0807AFF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AFF8: .4byte 0x00000212

	thumb_func_start NavigationConverstionFindTarget
NavigationConverstionFindTarget: @ 0x0807AFFC
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807B03C @ =gNonGameplayRam
	ldr r1, _0807B040 @ =0x0000020F
	adds r0, r2, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x83
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B044 @ =0x0000020D
	adds r1, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0807B048 @ =0x0000020E
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, #5
	adds r0, r2, r1
	strb r3, [r0]
	ldr r0, _0807B04C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r2, #0
	cmp r0, #4
	bne _0807B060
_0807B036:
	movs r0, #0
	b _0807B146
	.align 2, 0
_0807B03C: .4byte gNonGameplayRam
_0807B040: .4byte 0x0000020F
_0807B044: .4byte 0x0000020D
_0807B048: .4byte 0x0000020E
_0807B04C: .4byte gPauseScreenFlag
_0807B050:
	movs r4, #1
	ldrb r1, [r1, #4]
	ldr r3, _0807B05C @ =0x00000213
	adds r0, r5, r3
	strb r1, [r0]
	b _0807B086
	.align 2, 0
_0807B05C: .4byte 0x00000213
_0807B060:
	ldr r0, _0807B0B8 @ =0x0300004C
	strb r3, [r0]
	movs r4, #0
	movs r2, #0
	adds r7, r0, #0
	ldr r6, _0807B0BC @ =0x085766E4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r3, [r0]
	adds r1, r6, #0
_0807B076:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r3, r0
	beq _0807B050
	adds r1, #8
	adds r2, #1
	cmp r2, #0x20
	bls _0807B076
_0807B086:
	cmp r4, #0
	beq _0807B036
	lsls r0, r2, #3
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	strb r0, [r7]
	ldr r1, _0807B0C0 @ =0x08576066
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0807B0C4 @ =0x0000020E
	adds r6, r5, r3
	strb r0, [r6]
	ldr r1, _0807B0C8 @ =0x00000212
	adds r3, r5, r1
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, r4
	bne _0807B0D0
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	ldr r0, _0807B0CC @ =0x0000020F
	adds r1, r5, r0
	movs r0, #1
	b _0807B11E
	.align 2, 0
_0807B0B8: .4byte 0x0300004C
_0807B0BC: .4byte 0x085766E4
_0807B0C0: .4byte 0x08576066
_0807B0C4: .4byte 0x0000020E
_0807B0C8: .4byte 0x00000212
_0807B0CC: .4byte 0x0000020F
_0807B0D0:
	cmp r1, #0
	bne _0807B0F4
	ldr r2, _0807B0EC @ =0x08576218
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r2, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _0807B0F0 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B0EC: .4byte 0x08576218
_0807B0F0: .4byte 0x0000020F
_0807B0F4:
	ldr r0, _0807B110 @ =0x08576226
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, #1
	adds r1, r1, r0
	ldrb r2, [r1]
	cmp r4, #0
	bne _0807B118
	ldr r0, _0807B114 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B110: .4byte 0x08576226
_0807B114: .4byte 0x0000020F
_0807B118:
	ldr r0, _0807B14C @ =0x0000020F
	adds r1, r5, r0
	movs r0, #3
_0807B11E:
	strb r0, [r1]
	subs r1, r3, #1
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	subs r1, r2, #1
	ldr r2, _0807B150 @ =0x0000020D
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, #0
	ldr r0, _0807B154 @ =gPreviousNavigationConversation
	adds r3, #0x14
	adds r1, r5, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807B144
	movs r4, #1
_0807B144:
	adds r0, r4, #0
_0807B146:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807B14C: .4byte 0x0000020F
_0807B150: .4byte 0x0000020D
_0807B154: .4byte gPreviousNavigationConversation

	thumb_func_start NavigationConversionScrollToTarget
NavigationConversionScrollToTarget: @ 0x0807B158
	push {r4, r5, r6, r7, lr}
	ldr r1, _0807B178 @ =gNonGameplayRam
	ldrb r0, [r1, #8]
	adds r0, #1
	strb r0, [r1, #8]
	ldrb r0, [r1, #9]
	adds r7, r1, #0
	cmp r0, #0xd
	bls _0807B16C
	b _0807B4BC
_0807B16C:
	lsls r0, r0, #2
	ldr r1, _0807B17C @ =_0807B180
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B178: .4byte gNonGameplayRam
_0807B17C: .4byte _0807B180
_0807B180: @ jump table
	.4byte _0807B4BC @ case 0
	.4byte _0807B1B8 @ case 1
	.4byte _0807B226 @ case 2
	.4byte _0807B236 @ case 3
	.4byte _0807B46C @ case 4
	.4byte _0807B23E @ case 5
	.4byte _0807B300 @ case 6
	.4byte _0807B30A @ case 7
	.4byte _0807B32A @ case 8
	.4byte _0807B400 @ case 9
	.4byte _0807B420 @ case 10
	.4byte _0807B46C @ case 11
	.4byte _0807B488 @ case 12
	.4byte _0807B4BC @ case 13
_0807B1B8:
	movs r2, #0
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	ldr r3, _0807B204 @ =0x0000020D
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r1, _0807B208 @ =0x085767EC
	ldrb r0, [r0]
	ldrb r3, [r1]
	cmp r0, r3
	beq _0807B200
	ldrb r4, [r1, #1]
	cmp r0, r4
	beq _0807B200
	ldrb r3, [r1, #2]
	cmp r0, r3
	beq _0807B200
	ldrb r1, [r1, #3]
	cmp r0, r1
	beq _0807B200
	cmp r0, #0xe
	beq _0807B200
	cmp r0, #0xf
	bne _0807B1FC
	movs r2, #1
_0807B1FC:
	cmp r2, #0
	beq _0807B20C
_0807B200:
	movs r0, #0xc
	b _0807B4BA
	.align 2, 0
_0807B204: .4byte 0x0000020D
_0807B208: .4byte 0x085767EC
_0807B20C:
	movs r0, #2
	strb r0, [r7, #9]
	ldrh r1, [r7, #4]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #4]
	b _0807B4BC
_0807B226:
	ldrh r1, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807B234
	b _0807B4BC
_0807B234:
	b _0807B4B2
_0807B236:
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #4
	b _0807B4BA
_0807B23E:
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r4, _0807B270 @ =0x0000020D
	adds r1, r7, r4
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807B256
	b _0807B4BC
_0807B256:
	ldr r1, _0807B274 @ =0x0000020F
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B280
	ldr r1, _0807B278 @ =0x085767EC
	ldr r2, _0807B27C @ =0x00000213
	adds r0, r7, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	b _0807B28E
	.align 2, 0
_0807B270: .4byte 0x0000020D
_0807B274: .4byte 0x0000020F
_0807B278: .4byte 0x085767EC
_0807B27C: .4byte 0x00000213
_0807B280:
	ldr r3, _0807B2B8 @ =0x00000212
	adds r0, r7, r3
	ldrb r0, [r0]
	movs r2, #0xe
	cmp r0, #0
	bne _0807B28E
	movs r2, #0xf
_0807B28E:
	ldr r5, _0807B2BC @ =gNonGameplayRam
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r5, r4
	movs r1, #0
	strb r2, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _0807B2C0 @ =0x000001A9
	adds r0, r5, r3
	strb r1, [r0]
	strb r1, [r5, #8]
	adds r4, #0x65
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B2C4
	movs r0, #0xc
	b _0807B2C6
	.align 2, 0
_0807B2B8: .4byte 0x00000212
_0807B2BC: .4byte gNonGameplayRam
_0807B2C0: .4byte 0x000001A9
_0807B2C4:
	movs r0, #6
_0807B2C6:
	strb r0, [r5, #9]
	ldr r0, _0807B2F0 @ =0x00000119
	bl SoundStop
	ldr r1, _0807B2F4 @ =gNonGameplayRam
	movs r2, #0x83
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r1, r3
	strb r2, [r0]
	ldr r4, _0807B2F8 @ =0x0000020D
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0807B2FC @ =0x00000259
	adds r1, r1, r2
	strb r0, [r1]
	b _0807B4BC
	.align 2, 0
_0807B2F0: .4byte 0x00000119
_0807B2F4: .4byte gNonGameplayRam
_0807B2F8: .4byte 0x0000020D
_0807B2FC: .4byte 0x00000259
_0807B300:
	ldrb r0, [r7, #8]
	cmp r0, #0x3c
	bhi _0807B308
	b _0807B4BC
_0807B308:
	b _0807B4B2
_0807B30A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
_0807B32A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B33C
	b _0807B4BC
_0807B33C:
	ldr r4, _0807B36C @ =0x0000020F
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807B34E
	ldr r0, _0807B370 @ =0x0000020E
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_0807B34E:
	ldr r1, _0807B370 @ =0x0000020E
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _0807B37C
	ldr r2, _0807B374 @ =0x08576218
	ldr r4, _0807B378 @ =0x00000212
	adds r3, r7, r4
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	subs r4, #2
	b _0807B38C
	.align 2, 0
_0807B36C: .4byte 0x0000020F
_0807B370: .4byte 0x0000020E
_0807B374: .4byte 0x08576218
_0807B378: .4byte 0x00000212
_0807B37C:
	ldr r2, _0807B3E0 @ =0x08576226
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	movs r4, #0x84
	lsls r4, r4, #2
_0807B38C:
	adds r1, r7, r4
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	ldr r2, _0807B3E4 @ =0x00000211
	adds r1, r7, r2
	strb r0, [r1]
	ldr r3, _0807B3E8 @ =0x0000020E
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r1, _0807B3EC @ =0x00000212
	adds r4, r7, r1
	movs r6, #0
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r5, _0807B3F0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807B3F4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807B3F8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807B3FC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl unk_75988
	movs r0, #0
	bl NavigationConversationUpdateTarget
	strb r6, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B3E0: .4byte 0x08576226
_0807B3E4: .4byte 0x00000211
_0807B3E8: .4byte 0x0000020E
_0807B3EC: .4byte 0x00000212
_0807B3F0: .4byte 0x02034000
_0807B3F4: .4byte 0x040000D4
_0807B3F8: .4byte 0x0600E000
_0807B3FC: .4byte 0x80000400
_0807B400:
	ldrb r0, [r7, #8]
	cmp r0, #8
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807B4BC
_0807B420:
	movs r4, #0x94
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B4BC
	ldr r1, _0807B460 @ =0x0000020E
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B442
	ldr r2, _0807B464 @ =0x00000212
	adds r0, r7, r2
	ldrb r0, [r0]
	movs r2, #0xf
	cmp r0, #0
	bne _0807B444
_0807B442:
	movs r2, #0xe
_0807B444:
	movs r3, #0xdb
	lsls r3, r3, #1
	adds r0, r7, r3
	movs r1, #0
	strb r2, [r0]
	movs r4, #0xda
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	ldr r2, _0807B468 @ =0x000001B5
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B460: .4byte 0x0000020E
_0807B464: .4byte 0x00000212
_0807B468: .4byte 0x000001B5
_0807B46C:
	ldrb r0, [r7, #8]
	cmp r0, #0x1e
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #5
	strb r0, [r7, #9]
	ldr r0, _0807B484 @ =0x00000119
	bl SoundPlay
	b _0807B4BC
	.align 2, 0
_0807B484: .4byte 0x00000119
_0807B488:
	adds r2, r7, #0
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B49E
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B49E:
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B4B2
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B4B2:
	movs r0, #0
	strb r0, [r7, #8]
_0807B4B6:
	ldrb r0, [r7, #9]
	adds r0, #1
_0807B4BA:
	strb r0, [r7, #9]
_0807B4BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationScrollMapToDestination
NavigationConversationScrollMapToDestination: @ 0x0807B4C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	mov ip, r2
	movs r2, #0xf
	subs r2, r2, r0
	lsls r2, r2, #3
	movs r3, #0x80
	lsls r3, r3, #2
	subs r5, r3, r2
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r6, r3, r0
	ldr r1, _0807B520 @ =gBackgroundPositions
	ldrh r4, [r1, #0xc]
	subs r2, r4, r5
	ldrh r0, [r1, #0xe]
	subs r3, r0, r6
	cmp r2, #0
	bge _0807B4F6
	rsbs r2, r2, #0
_0807B4F6:
	cmp r3, #0
	bge _0807B4FC
	rsbs r3, r3, #0
_0807B4FC:
	asrs r0, r2, #4
	adds r7, r0, #1
	asrs r0, r3, #4
	adds r3, r0, #1
	subs r2, r4, r5
	cmp r2, #0
	beq _0807B534
	movs r0, #0
	mov ip, r0
	cmp r2, #0
	ble _0807B524
	subs r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	bge _0807B534
	b _0807B532
	.align 2, 0
_0807B520: .4byte gBackgroundPositions
_0807B524:
	cmp r2, #0
	bge _0807B534
	adds r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	ble _0807B534
_0807B532:
	strh r5, [r1, #0xc]
_0807B534:
	adds r4, r1, #0
	ldrh r0, [r4, #0xe]
	subs r2, r0, r6
	cmp r2, #0
	beq _0807B564
	movs r5, #0
	mov ip, r5
	cmp r2, #0
	ble _0807B554
	subs r0, r0, r3
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xe]
	cmp r0, r6
	bge _0807B564
	strh r6, [r4, #0xe]
	b _0807B564
_0807B554:
	cmp r2, #0
	bge _0807B564
	adds r0, r0, r3
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xe]
	cmp r0, r6
	ble _0807B564
	strh r6, [r1, #0xe]
_0807B564:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_7b56c
unk_7b56c: @ 0x0807B56C
	push {r4, r5, lr}
	ldr r1, _0807B588 @ =gNonGameplayRam
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	adds r5, r1, #0
	cmp r0, #9
	bhi _0807B668
	lsls r0, r0, #2
	ldr r1, _0807B58C @ =_0807B590
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B588: .4byte gNonGameplayRam
_0807B58C: .4byte _0807B590
_0807B590: @ jump table
	.4byte _0807B668 @ case 0
	.4byte _0807B5B8 @ case 1
	.4byte _0807B5BE @ case 2
	.4byte _0807B5CE @ case 3
	.4byte _0807B5EE @ case 4
	.4byte _0807B612 @ case 5
	.4byte _0807B624 @ case 6
	.4byte _0807B650 @ case 7
	.4byte _0807B668 @ case 8
	.4byte _0807B668 @ case 9
_0807B5B8:
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5BE:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807B668
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5CE:
	adds r1, r5, #0
	adds r1, #0xea
	movs r4, #0
	movs r0, #0x41
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl SoundPlay
	strb r4, [r5, #0xa]
	b _0807B662
_0807B5EE:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r5, #0xa]
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
	ldrh r1, [r5, #4]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r5, #4]
	b _0807B668
_0807B612:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0807B668
	strb r0, [r5, #0xa]
	b _0807B662
_0807B624:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r4, #0
	movs r0, #3
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xea
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807B64C @ =0x0000011D
	bl SoundPlay
	strb r4, [r5, #0xa]
	b _0807B662
	.align 2, 0
_0807B64C: .4byte 0x0000011D
_0807B650:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	ldrh r1, [r5, #4]
	ldr r0, _0807B670 @ =0x0000FF7F
	ands r0, r1
	movs r1, #0
	strh r0, [r5, #4]
	strb r1, [r5, #0xa]
_0807B662:
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
_0807B668:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B670: .4byte 0x0000FF7F

	thumb_func_start unk_7b674
unk_7b674: @ 0x0807B674
	push {r4, r5, lr}
	ldr r2, _0807B6AC @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807B68C
	b _0807B8C4
_0807B68C:
	ldr r2, _0807B6B0 @ =0x00000252
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0807B6B4 @ =0x00000251
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _0807B6A2
	b _0807B8C4
_0807B6A2:
	lsls r0, r0, #2
	ldr r1, _0807B6B8 @ =_0807B6BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B6AC: .4byte gNonGameplayRam
_0807B6B0: .4byte 0x00000252
_0807B6B4: .4byte 0x00000251
_0807B6B8: .4byte _0807B6BC
_0807B6BC: @ jump table
	.4byte _0807B6E0 @ case 0
	.4byte _0807B72C @ case 1
	.4byte _0807B82C @ case 2
	.4byte _0807B780 @ case 3
	.4byte _0807B7BC @ case 4
	.4byte _0807B7D4 @ case 5
	.4byte _0807B82C @ case 6
	.4byte _0807B858 @ case 7
	.4byte _0807B8B0 @ case 8
_0807B6E0:
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B700
	ldr r1, _0807B6FC @ =0x00000251
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B710
	.align 2, 0
_0807B6FC: .4byte 0x00000251
_0807B700:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807B710
	ldr r2, _0807B720 @ =0x00000251
	adds r1, r4, r2
	movs r0, #4
	strb r0, [r1]
_0807B710:
	ldr r1, _0807B724 @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B728 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	b _0807B8C4
	.align 2, 0
_0807B720: .4byte 0x00000251
_0807B724: .4byte gPreviousArea
_0807B728: .4byte 0x00000252
_0807B72C:
	ldr r1, _0807B770 @ =0x00000252
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B73C
	b _0807B8C4
_0807B73C:
	ldr r0, _0807B774 @ =gWrittenToMosaic_L
	ldrh r1, [r0]
	adds r1, #0x11
	strh r1, [r0]
	ldr r0, _0807B778 @ =0x08576802
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r0]
	cmp r1, r0
	beq _0807B752
	b _0807B8C4
_0807B752:
	movs r0, #0
	strb r0, [r2]
	ldr r2, _0807B77C @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	b _0807B8C4
	.align 2, 0
_0807B770: .4byte 0x00000252
_0807B774: .4byte gWrittenToMosaic_L
_0807B778: .4byte 0x08576802
_0807B77C: .4byte 0x00000251
_0807B780:
	ldr r0, _0807B7B0 @ =0x00000252
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B790
	b _0807B8C4
_0807B790:
	ldr r1, _0807B7B4 @ =gWrittenToMosaic_L
	ldrh r0, [r1]
	subs r0, #0x11
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0807B7A2
	b _0807B8C4
_0807B7A2:
	ldr r0, _0807B7B8 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	strb r3, [r2]
	b _0807B8C4
	.align 2, 0
_0807B7B0: .4byte 0x00000252
_0807B7B4: .4byte gWrittenToMosaic_L
_0807B7B8: .4byte 0x00000251
_0807B7BC:
	ldr r1, _0807B7CC @ =0x00000253
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0807B7D0 @ =0x00000251
	adds r1, r4, r0
	movs r0, #5
	b _0807B846
	.align 2, 0
_0807B7CC: .4byte 0x00000253
_0807B7D0: .4byte 0x00000251
_0807B7D4:
	ldr r2, _0807B81C @ =0x00000253
	adds r5, r4, r2
	ldrb r1, [r5]
	movs r2, #0x50
	subs r0, r2, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B7E6
	movs r0, #4
_0807B7E6:
	adds r0, r1, r0
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x50
	bls _0807B814
	strb r2, [r5]
	ldr r0, _0807B820 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0807B824 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0807B814:
	ldr r3, _0807B828 @ =0x04000046
	ldrb r2, [r5]
	b _0807B89A
	.align 2, 0
_0807B81C: .4byte 0x00000253
_0807B820: .4byte 0x00000252
_0807B824: .4byte 0x00000251
_0807B828: .4byte 0x04000046
_0807B82C:
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807B8C4
	ldr r2, _0807B850 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
_0807B846:
	strb r0, [r1]
	ldr r1, _0807B854 @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B8C4
	.align 2, 0
_0807B850: .4byte 0x00000251
_0807B854: .4byte 0x00000252
_0807B858:
	ldr r2, _0807B884 @ =0x00000253
	adds r3, r4, r2
	ldrb r1, [r3]
	movs r0, #0x50
	subs r0, r0, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B86A
	movs r0, #4
_0807B86A:
	subs r0, r1, r0
	cmp r0, #0
	bge _0807B890
	movs r2, #0
	strb r2, [r3]
	ldr r0, _0807B888 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0807B88C @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B892
	.align 2, 0
_0807B884: .4byte 0x00000253
_0807B888: .4byte 0x00000251
_0807B88C: .4byte 0x00000252
_0807B890:
	strb r0, [r3]
_0807B892:
	ldr r3, _0807B8A8 @ =0x04000046
	ldr r2, _0807B8AC @ =0x00000253
	adds r0, r4, r2
	ldrb r2, [r0]
_0807B89A:
	lsls r1, r2, #8
	movs r0, #0xa0
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3]
	b _0807B8C4
	.align 2, 0
_0807B8A8: .4byte 0x04000046
_0807B8AC: .4byte 0x00000253
_0807B8B0:
	ldr r1, _0807B8CC @ =0x00000252
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0807B8D0 @ =0x00000251
	adds r0, r4, r2
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
_0807B8C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8CC: .4byte 0x00000252
_0807B8D0: .4byte 0x00000251

	thumb_func_start ProcessPauseScreenText
ProcessPauseScreenText: @ 0x0807B8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, _0807B93C @ =0x0200C000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	movs r6, #0
	ldr r2, _0807B940 @ =0x0879C10C
	ldr r0, _0807B944 @ =0x03000011
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _0807B948 @ =gEventCounter
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	beq _0807B9D8
	movs r5, #0x80
	lsls r5, r5, #8
	mov sl, r5
	movs r1, #0xfe
	lsls r1, r1, #8
	mov sb, r1
_0807B926:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	cmp r1, sl
	bne _0807B94C
	movs r5, #0xff
	mov r8, r5
	mov r0, r8
	ands r0, r2
	mov r8, r0
	b _0807B9C2
	.align 2, 0
_0807B93C: .4byte 0x0200C000
_0807B940: .4byte 0x0879C10C
_0807B944: .4byte 0x03000011
_0807B948: .4byte gEventCounter
_0807B94C:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807B95E
	movs r1, #0
	mov r8, r1
	movs r6, #0xff
	ands r6, r2
	b _0807B9C2
_0807B95E:
	cmp r2, sb
	bne _0807B96E
	movs r2, #0
	mov r8, r2
	cmp r6, #0xe0
	bgt _0807B9D8
	movs r6, #0xe0
	movs r5, #0
_0807B96E:
	cmp r5, #0
	beq _0807B9C2
	ldrh r0, [r7]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r6, r0
	cmp r5, #0xe0
	ble _0807B988
	cmp r6, #0xdf
	bgt _0807B988
	movs r6, #0xe0
	b _0807B990
_0807B988:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807B9D8
_0807B990:
	cmp r6, #0xdf
	ble _0807B99E
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r6, #0
	subs r4, #0xe0
	b _0807B9A2
_0807B99E:
	movs r5, #0
	adds r4, r6, #0
_0807B9A2:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r7]
	ldr r2, _0807B9E8 @ =0x0200C000
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807B9C2:
	adds r7, #2
	add r6, r8
	ldr r0, _0807B9EC @ =0x000001BF
	cmp r6, r0
	bgt _0807B9D8
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	bne _0807B926
_0807B9D8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9E8: .4byte 0x0200C000
_0807B9EC: .4byte 0x000001BF

	thumb_func_start ProcessEasySleepText
ProcessEasySleepText: @ 0x0807B9F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _0807BA80 @ =0x0200D000
	movs r5, #0x80
	lsls r5, r5, #5
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA84 @ =0x0200E000
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA88 @ =0x0200F000
	movs r3, #0x80
	lsls r3, r3, #4
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	movs r3, #0
_0807BA30:
	ldr r0, _0807BA84 @ =0x0200E000
	mov sl, r0
	cmp r3, #0
	bne _0807BA3C
	ldr r1, _0807BA80 @ =0x0200D000
	mov sl, r1
_0807BA3C:
	ldr r1, _0807BA8C @ =0x0879CDF4
	ldr r0, _0807BA90 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	adds r0, #0xb4
	ldr r6, [r0]
	movs r7, #0
	ldrh r2, [r6]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	adds r3, #1
	mov sb, r3
	cmp r2, r4
	beq _0807BB24
_0807BA66:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BA94
	movs r1, #0xff
	mov r8, r1
	mov r4, r8
	ands r4, r2
	mov r8, r4
	b _0807BB0E
	.align 2, 0
_0807BA80: .4byte 0x0200D000
_0807BA84: .4byte 0x0200E000
_0807BA88: .4byte 0x0200F000
_0807BA8C: .4byte 0x0879CDF4
_0807BA90: .4byte 0x03000011
_0807BA94:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BAA6
	movs r5, #0
	mov r8, r5
	movs r7, #0xff
	ands r7, r2
	b _0807BB0E
_0807BAA6:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _0807BABA
	movs r1, #0
	mov r8, r1
	cmp r7, #0xe0
	bgt _0807BB24
	movs r7, #0xe0
	movs r5, #0
_0807BABA:
	cmp r5, #0
	beq _0807BB0E
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	cmp r5, #0xe0
	ble _0807BAD4
	cmp r7, #0xdf
	bgt _0807BAD4
	movs r7, #0xe0
	b _0807BADC
_0807BAD4:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BB24
_0807BADC:
	cmp r7, #0xdf
	ble _0807BAEA
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r7, #0
	subs r4, #0xe0
	b _0807BAEE
_0807BAEA:
	movs r5, #0
	adds r4, r7, #0
_0807BAEE:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807BB0E:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BB60 @ =0x000001BF
	cmp r7, r0
	bgt _0807BB24
	ldrh r2, [r6]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r1
	bne _0807BA66
_0807BB24:
	mov r3, sb
	cmp r3, #1
	ble _0807BA30
	ldr r2, _0807BB64 @ =0x0200F000
	mov sl, r2
	ldr r1, _0807BB68 @ =0x0879CDF4
	ldr r0, _0807BB6C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0xbc
	ldr r6, [r0]
	movs r7, #0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r4, #0
	mov r8, r4
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BB60: .4byte 0x000001BF
_0807BB64: .4byte 0x0200F000
_0807BB68: .4byte 0x0879CDF4
_0807BB6C: .4byte 0x03000011
_0807BB70:
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807BB80
	movs r5, #0
	mov r8, r5
_0807BB80:
	cmp r5, #0
	beq _0807BBB2
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BBE0
	asrs r0, r7, #3
	lsls r5, r0, #5
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r7
	movs r4, #0
	str r4, [sp]
	bl DrawCharacter
_0807BBB2:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BBDC @ =0x000001BF
	cmp r7, r0
	bgt _0807BBE0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r5, #0
	mov r8, r5
	cmp r7, #0x70
	bgt _0807BBE0
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BBDC: .4byte 0x000001BF
_0807BBE0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetFlashingSectorNumber
GetFlashingSectorNumber: @ 0x0807BBF0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0807BC80 @ =0x0300004D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _0807BC84 @ =gEventCounter
	ldrb r2, [r1]
	adds r6, r0, #0
	ldr r1, _0807BC88 @ =0x08575A60
	ldr r7, _0807BC8C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807BC2A
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #2
	adds r0, r3, r1
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807BC2A
	adds r3, r3, r1
_0807BC1A:
	subs r3, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807BC2A
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0807BC1A
_0807BC2A:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #6
	ldrsb r3, [r0, r3]
	ldrb r4, [r7]
	cmp r4, r3
	bne _0807BC76
	movs r3, #0
	movs r2, #0
	ldr r0, _0807BC90 @ =0x085766E4
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r4, r1
	beq _0807BC68
_0807BC4C:
	adds r2, #1
	cmp r2, #0x20
	bhi _0807BC64
	ldrb r0, [r7]
	lsls r1, r2, #3
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0807BC4C
	movs r3, #1
_0807BC64:
	cmp r3, #0
	beq _0807BC76
_0807BC68:
	lsls r0, r2, #3
	adds r0, r0, r5
	ldrb r2, [r0, #1]
	ldr r0, _0807BC94 @ =0x08576066
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r6]
_0807BC76:
	ldrb r0, [r6]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807BC80: .4byte 0x0300004D
_0807BC84: .4byte gEventCounter
_0807BC88: .4byte 0x08575A60
_0807BC8C: .4byte gPreviousNavigationConversation
_0807BC90: .4byte 0x085766E4
_0807BC94: .4byte 0x08576066

	thumb_func_start NavigationConversationLoadPopUpGraphics
NavigationConversationLoadPopUpGraphics: @ 0x0807BC98
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r4, #3
	ldr r0, _0807BD68 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0807BD6C @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r2, r1
	beq _0807BCC8
	adds r1, r3, #0
	adds r1, #8
_0807BCB8:
	subs r1, #4
	subs r4, #1
	cmp r4, #0
	ble _0807BCC8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _0807BCB8
_0807BCC8:
	cmp r4, #0
	beq _0807BD5E
	subs r4, #1
	lsls r0, r4, #2
	adds r4, r0, r3
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0807BCF0
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
_0807BCF0:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0807BD0C
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD74 @ =0x02004000
	bl LZ77UncompVram
_0807BD0C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0807BD28
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD78 @ =0x02008000
	bl LZ77UncompVram
_0807BD28:
	movs r4, #5
	ldr r5, _0807BD7C @ =0x06015700
	movs r6, #0x20
_0807BD2E:
	str r6, [sp]
	movs r0, #3
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl BitFill
	ldr r0, _0807BD80 @ =0xFFFFFC00
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _0807BD2E
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _0807BD84 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0807BD88 @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _0807BD8C @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0807BD5E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD68: .4byte gNonGameplayRam
_0807BD6C: .4byte 0x0857BCC8
_0807BD70: .4byte 0x0857BC50
_0807BD74: .4byte 0x02004000
_0807BD78: .4byte 0x02008000
_0807BD7C: .4byte 0x06015700
_0807BD80: .4byte 0xFFFFFC00
_0807BD84: .4byte 0x040000D4
_0807BD88: .4byte 0x050003E0
_0807BD8C: .4byte 0x85000008

	thumb_func_start NavigationConversationUpdatePopUp
NavigationConversationUpdatePopUp: @ 0x0807BD90
	push {r4, lr}
	ldr r4, _0807BDD0 @ =gNonGameplayRam
	movs r0, #0x86
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807BDC8
	ldr r0, _0807BDD4 @ =0x0000021B
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BDD8 @ =0x0879C170
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807BDDC @ =0x0000021D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807BDC8
	bl NavigationConversationFadeInPopUpPalette
_0807BDC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDD0: .4byte gNonGameplayRam
_0807BDD4: .4byte 0x0000021B
_0807BDD8: .4byte 0x0879C170
_0807BDDC: .4byte 0x0000021D

	thumb_func_start unk_7bde0
unk_7bde0: @ 0x0807BDE0
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807BE2C @ =gNonGameplayRam
	ldr r0, _0807BE30 @ =0x0000021A
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #3
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r4, [r0]
	ldr r0, _0807BE34 @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r4, r1
	beq _0807BE18
	adds r1, r2, #0
	adds r1, #8
_0807BE08:
	subs r1, #4
	subs r3, #1
	cmp r3, #0
	ble _0807BE18
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	bne _0807BE08
_0807BE18:
	subs r3, #1
	cmp r3, #0xff
	bne _0807BE38
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	b _0807BFAE
	.align 2, 0
_0807BE2C: .4byte gNonGameplayRam
_0807BE30: .4byte 0x0000021A
_0807BE34: .4byte 0x0857BCC8
_0807BE38:
	ldr r1, _0807BE4C @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BE50
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #2]
	b _0807BE62
	.align 2, 0
_0807BE4C: .4byte 0x00000219
_0807BE50:
	cmp r0, #2
	bne _0807BE5C
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #3]
	b _0807BE62
_0807BE5C:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
_0807BE62:
	ldr r2, _0807BE7C @ =0x0000021A
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BE7C @ =0x0000021A
	adds r0, r6, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0807BE80
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r3, [r0]
	b _0807BFAE
	.align 2, 0
_0807BE7C: .4byte 0x0000021A
_0807BE80:
	ldr r1, _0807BEA4 @ =0x00000229
	adds r0, r6, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BEA8 @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BEB0
	subs r2, #0x14
	adds r1, r6, r2
	ldr r0, _0807BEAC @ =0x02004000
	b _0807BECE
	.align 2, 0
_0807BEA4: .4byte 0x00000229
_0807BEA8: .4byte 0x00000219
_0807BEAC: .4byte 0x02004000
_0807BEB0:
	cmp r0, #2
	bne _0807BEC4
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0807BEC0 @ =0x02008000
	b _0807BECE
	.align 2, 0
_0807BEC0: .4byte 0x02008000
_0807BEC4:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807BECE:
	str r0, [r1]
	ldr r2, _0807BF28 @ =0x0857BC50
	ldr r1, _0807BF2C @ =0x0000021A
	adds r0, r6, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	bne _0807BF40
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BF30 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	ldr r0, _0807BF34 @ =0xFFFFFC00
	mov ip, r0
	lsls r7, r2, #0x18
_0807BF08:
	add r4, ip
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BF38 @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r5, #4]
	ldr r0, _0807BF3C @ =0x80000080
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF08
	b _0807BF82
	.align 2, 0
_0807BF28: .4byte 0x0857BC50
_0807BF2C: .4byte 0x0000021A
_0807BF30: .4byte 0x040000D4
_0807BF34: .4byte 0xFFFFFC00
_0807BF38: .4byte 0x06014300
_0807BF3C: .4byte 0x80000080
_0807BF40:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807BF82
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BFB4 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	lsls r7, r2, #0x18
_0807BF60:
	ldr r2, _0807BFB8 @ =0xFFFFFC00
	adds r4, r4, r2
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BFBC @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, #0x40
	str r2, [r5, #4]
	ldr r0, _0807BFC0 @ =0x80000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF60
_0807BF82:
	ldr r1, _0807BFC4 @ =0x0000021A
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807BF92
	ldr r0, _0807BFC8 @ =0x00000125
	bl SoundPlay
_0807BF92:
	ldr r2, _0807BFCC @ =0x0000021D
	adds r1, r6, r2
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BFD0 @ =0x0000021B
	adds r0, r6, r1
	strb r2, [r0]
_0807BFAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFB4: .4byte 0x040000D4
_0807BFB8: .4byte 0xFFFFFC00
_0807BFBC: .4byte 0x06014300
_0807BFC0: .4byte 0x80000040
_0807BFC4: .4byte 0x0000021A
_0807BFC8: .4byte 0x00000125
_0807BFCC: .4byte 0x0000021D
_0807BFD0: .4byte 0x0000021B

	thumb_func_start NavigationConversationFadeInPopUpPalette
NavigationConversationFadeInPopUpPalette: @ 0x0807BFD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0807C068 @ =0x0857BC50
	ldr r3, _0807C06C @ =gNonGameplayRam
	ldr r1, _0807C070 @ =0x0000021A
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #8
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r6, _0807C074 @ =0x050003E0
	movs r0, #0
	mov ip, r0
	mov sb, sp
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	add r5, sp, #4
_0807C006:
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	mov r1, sb
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov r1, sb
	strb r0, [r1, #1]
	ldrh r1, [r2]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	mov r1, sb
	strb r0, [r1, #2]
	ldrb r1, [r6]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r5]
	ldrh r1, [r6]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	strb r0, [r5, #1]
	ldrh r1, [r6]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	strb r0, [r5, #2]
	movs r4, #0
	movs r0, #1
	add ip, r0
	adds r7, r2, #2
	adds r1, r6, #2
	mov r8, r1
	adds r3, r5, #0
_0807C056:
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r3]
	ldrb r1, [r0]
	adds r0, r2, #0
	cmp r1, r0
	bls _0807C078
	adds r0, r2, #1
	b _0807C07E
	.align 2, 0
_0807C068: .4byte 0x0857BC50
_0807C06C: .4byte gNonGameplayRam
_0807C070: .4byte 0x0000021A
_0807C074: .4byte 0x050003E0
_0807C078:
	cmp r1, r0
	bhs _0807C080
	subs r0, r2, #1
_0807C07E:
	strb r0, [r3]
_0807C080:
	adds r3, #1
	adds r4, #1
	cmp r4, #2
	ble _0807C056
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	lsls r1, r1, #5
	orrs r0, r1
	ldrb r1, [r5, #2]
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r6]
	adds r2, r7, #0
	mov r6, r8
	mov r0, ip
	cmp r0, #0xf
	ble _0807C006
	ldr r1, _0807C0B4 @ =gNonGameplayRam
	ldr r0, _0807C0B8 @ =0x0000021D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x20
	bls _0807C0BC
	movs r0, #0
	b _0807C0BE
	.align 2, 0
_0807C0B4: .4byte gNonGameplayRam
_0807C0B8: .4byte 0x0000021D
_0807C0BC:
	adds r0, #1
_0807C0BE:
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NavigationConversationUpdateXParasitePopUp
NavigationConversationUpdateXParasitePopUp: @ 0x0807C0D0
	push {r4, r5, r6, r7, lr}
	bl unk_7c3b4
	ldr r0, _0807C148 @ =0x0857BC50
	mov ip, r0
	ldr r3, _0807C14C @ =gNonGameplayRam
	ldr r1, _0807C150 @ =0x0000021A
	adds r6, r3, r1
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	beq _0807C0F8
	b _0807C20C
_0807C0F8:
	ldr r7, [r1]
	ldr r0, _0807C154 @ =0x0000021B
	adds r2, r3, r0
	movs r1, #0x87
	lsls r1, r1, #2
	adds r4, r3, r1
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	bhs _0807C114
	b _0807C2F4
_0807C114:
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C134
	strb r5, [r4]
_0807C134:
	ldr r2, _0807C158 @ =0x00000219
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C160
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C15C @ =0x02004000
	b _0807C17E
	.align 2, 0
_0807C148: .4byte 0x0857BC50
_0807C14C: .4byte gNonGameplayRam
_0807C150: .4byte 0x0000021A
_0807C154: .4byte 0x0000021B
_0807C158: .4byte 0x00000219
_0807C15C: .4byte 0x02004000
_0807C160:
	cmp r0, #2
	bne _0807C174
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C170 @ =0x02008000
	b _0807C17E
	.align 2, 0
_0807C170: .4byte 0x02008000
_0807C174:
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807C17E:
	str r0, [r1]
	ldr r3, _0807C1F0 @ =0x0857BC50
	ldr r2, _0807C1F4 @ =gNonGameplayRam
	ldr r1, _0807C1F8 @ =0x0000021A
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	lsls r3, r0, #0x1c
	lsrs r6, r0, #4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r4, r0, #8
	lsrs r1, r1, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xb
	adds r4, r4, r0
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	adds r5, r0, r4
	str r5, [r2]
	lsrs r4, r3, #0x1c
	cmp r4, #0
	bgt _0807C1CA
	b _0807C2F4
_0807C1CA:
	ldr r3, _0807C1FC @ =0x040000D4
	lsls r2, r4, #0xa
	ldr r0, _0807C200 @ =0x06014300
	adds r1, r2, r0
	lsls r0, r6, #0xa
	adds r1, r1, r0
	adds r2, r2, r5
	ldr r5, _0807C204 @ =0xFFFFFC00
	ldr r6, _0807C208 @ =0x80000080
_0807C1DC:
	adds r1, r1, r5
	adds r2, r2, r5
	subs r4, #1
	str r2, [r3]
	str r1, [r3, #4]
	str r6, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bgt _0807C1DC
	b _0807C2F4
	.align 2, 0
_0807C1F0: .4byte 0x0857BC50
_0807C1F4: .4byte gNonGameplayRam
_0807C1F8: .4byte 0x0000021A
_0807C1FC: .4byte 0x040000D4
_0807C200: .4byte 0x06014300
_0807C204: .4byte 0xFFFFFC00
_0807C208: .4byte 0x80000080
_0807C20C:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807C2F4
	ldr r7, [r1]
	ldr r1, _0807C260 @ =0x0000021B
	adds r2, r3, r1
	movs r0, #0x87
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	blo _0807C2F4
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C24C
	strb r5, [r4]
_0807C24C:
	ldr r1, _0807C264 @ =0x00000219
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C26C
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C268 @ =0x02004000
	b _0807C28A
	.align 2, 0
_0807C260: .4byte 0x0000021B
_0807C264: .4byte 0x00000219
_0807C268: .4byte 0x02004000
_0807C26C:
	cmp r0, #2
	bne _0807C280
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C27C @ =0x02008000
	b _0807C28A
	.align 2, 0
_0807C27C: .4byte 0x02008000
_0807C280:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807C28A:
	str r0, [r1]
	ldr r3, _0807C2FC @ =0x0857BC50
	ldr r2, _0807C300 @ =gNonGameplayRam
	ldr r1, _0807C304 @ =0x0000021A
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	lsls r3, r0, #0x1c
	lsrs r6, r0, #4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r4, r0, #7
	lsrs r1, r1, #3
	lsls r1, r1, #0xc
	adds r4, r4, r1
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	adds r5, r0, r4
	str r5, [r2]
	lsrs r4, r3, #0x1c
	cmp r4, #0
	ble _0807C2F4
	ldr r3, _0807C308 @ =0x040000D4
	lsls r2, r4, #0xa
	ldr r0, _0807C30C @ =0x06014340
	adds r1, r2, r0
	lsls r0, r6, #0xa
	adds r1, r1, r0
	adds r2, r2, r5
	ldr r5, _0807C310 @ =0xFFFFFC00
	ldr r6, _0807C314 @ =0x80000040
_0807C2E2:
	adds r1, r1, r5
	adds r2, r2, r5
	subs r4, #1
	str r2, [r3]
	str r1, [r3, #4]
	str r6, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bgt _0807C2E2
_0807C2F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C2FC: .4byte 0x0857BC50
_0807C300: .4byte gNonGameplayRam
_0807C304: .4byte 0x0000021A
_0807C308: .4byte 0x040000D4
_0807C30C: .4byte 0x06014340
_0807C310: .4byte 0xFFFFFC00
_0807C314: .4byte 0x80000040

	thumb_func_start NavigationConversationClearPopUpGraphics
NavigationConversationClearPopUpGraphics: @ 0x0807C318
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r5, #5
	ldr r4, _0807C390 @ =0x06015700
	movs r6, #0x20
_0807C322:
	str r6, [sp]
	movs r0, #3
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r4, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl BitFill
	ldr r0, _0807C394 @ =0xFFFFFC00
	adds r4, r4, r0
	subs r5, #1
	cmp r5, #0
	bge _0807C322
	movs r5, #0
	str r5, [sp, #4]
	ldr r1, _0807C398 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0807C39C @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _0807C3A0 @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _0807C3A4 @ =gNonGameplayRam
	ldr r1, _0807C3A8 @ =0x0000021A
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807C364
	ldr r0, _0807C3AC @ =0x00000125
	bl SoundStop
_0807C364:
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, #4
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, _0807C3B0 @ =0x00000219
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C390: .4byte 0x06015700
_0807C394: .4byte 0xFFFFFC00
_0807C398: .4byte 0x040000D4
_0807C39C: .4byte 0x050003E0
_0807C3A0: .4byte 0x85000008
_0807C3A4: .4byte gNonGameplayRam
_0807C3A8: .4byte 0x0000021A
_0807C3AC: .4byte 0x00000125
_0807C3B0: .4byte 0x00000219

	thumb_func_start unk_7c3b4
unk_7c3b4: @ 0x0807C3B4
	push {r4, r5, r6, lr}
	ldr r4, _0807C42C @ =0x0857BC50
	ldr r5, _0807C430 @ =gNonGameplayRam
	ldr r0, _0807C434 @ =0x0000021A
	adds r2, r5, r0
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _0807C424
	ldr r1, _0807C438 @ =0x00000229
	adds r3, r5, r1
	ldrb r1, [r3]
	adds r1, #1
	movs r6, #0
	strb r1, [r3]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r2, r0, #3
	adds r0, r2, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	blo _0807C424
	strb r6, [r3]
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r2, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r4, r5, r1
	ldrb r1, [r4]
	lsls r1, r1, #1
	ldr r3, [r0]
	adds r2, r3, r1
	ldrh r0, [r2]
	cmp r0, #0
	bne _0807C40E
	strb r6, [r4]
	adds r2, r3, #0
_0807C40E:
	ldr r1, _0807C43C @ =0x050003FE
	ldrh r0, [r2]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0807C424
	strb r6, [r4]
_0807C424:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C42C: .4byte 0x0857BC50
_0807C430: .4byte gNonGameplayRam
_0807C434: .4byte 0x0000021A
_0807C438: .4byte 0x00000229
_0807C43C: .4byte 0x050003FE

	thumb_func_start unk_7c440
unk_7c440: @ 0x0807C440
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807C518 @ =gNonGameplayRam
	ldr r0, _0807C51C @ =0x00000225
	adds r5, r2, r0
	ldrb r0, [r5]
	adds r0, #1
	movs r7, #0
	strb r0, [r5]
	ldr r3, _0807C520 @ =0x0857BEB4
	movs r1, #0x89
	lsls r1, r1, #2
	adds r4, r2, r1
	ldrb r1, [r4]
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r2, #0
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C4B0
	strb r7, [r5]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807C47A
	strb r7, [r4]
_0807C47A:
	movs r3, #0xa0
	lsls r3, r3, #0x13
	ldr r1, _0807C524 @ =0x0857BCD4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x24]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	adds r1, r3, #0
	adds r1, #0x44
	ldr r2, _0807C528 @ =0x0857BCF4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
_0807C4B0:
	adds r1, r6, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807C59C
	cmp r0, #1
	bne _0807C53C
	ldr r6, _0807C52C @ =0x0000022D
	adds r3, r1, r6
	ldrb r0, [r3]
	adds r0, #1
	movs r5, #0
	strb r0, [r3]
	ldr r2, _0807C530 @ =0x0857BEB8
	subs r6, #1
	adds r4, r1, r6
	ldrb r1, [r4]
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C59C
	strb r5, [r3]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807C4EE
	strb r5, [r4]
_0807C4EE:
	ldr r3, _0807C534 @ =0x05000138
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, #0xc
	adds r2, r0, #0
	movs r1, #0
	ldr r4, _0807C538 @ =0x0857BD34
_0807C4FC:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r3]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, #2
	cmp r1, #3
	bls _0807C4FC
	b _0807C59C
	.align 2, 0
_0807C518: .4byte gNonGameplayRam
_0807C51C: .4byte 0x00000225
_0807C520: .4byte 0x0857BEB4
_0807C524: .4byte 0x0857BCD4
_0807C528: .4byte 0x0857BCF4
_0807C52C: .4byte 0x0000022D
_0807C530: .4byte 0x0857BEB8
_0807C534: .4byte 0x05000138
_0807C538: .4byte 0x0857BD34
_0807C53C:
	cmp r0, #2
	bne _0807C59C
	ldr r0, _0807C5A4 @ =0x0000022D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r0, #1
	movs r5, #0
	strb r0, [r3]
	ldr r2, _0807C5A8 @ =0x0857BEBC
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r4, r6, r1
	ldrb r1, [r4]
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C59C
	strb r5, [r3]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807C574
	strb r5, [r4]
_0807C574:
	ldr r3, _0807C5AC @ =0x05000194
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, #0xa
	adds r2, r0, #0
	movs r1, #0
	ldr r4, _0807C5B0 @ =0x0857BDB4
_0807C582:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r3]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, #2
	cmp r1, #5
	bls _0807C582
_0807C59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C5A4: .4byte 0x0000022D
_0807C5A8: .4byte 0x0857BEBC
_0807C5AC: .4byte 0x05000194
_0807C5B0: .4byte 0x0857BDB4

	thumb_func_start NavigationConversationLoadSpecialGraphics
NavigationConversationLoadSpecialGraphics: @ 0x0807C5B4
	push {lr}
	ldr r0, _0807C5F0 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x35
	bne _0807C618
	ldr r0, _0807C5F4 @ =0x0857C0C4
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
	ldr r0, _0807C5F8 @ =0x0857FCA0
	ldr r1, _0807C5FC @ =0x02006000
	bl LZ77UncompVram
	ldr r0, _0807C600 @ =0x08580238
	ldr r1, _0807C604 @ =0x02006800
	bl LZ77UncompVram
	ldr r0, _0807C608 @ =0x085807D0
	ldr r1, _0807C60C @ =0x02007000
	bl LZ77UncompVram
	ldr r0, _0807C610 @ =0x08580D68
	ldr r1, _0807C614 @ =0x02007800
	bl LZ77UncompVram
	b _0807C626
	.align 2, 0
_0807C5F0: .4byte gNonGameplayRam
_0807C5F4: .4byte 0x0857C0C4
_0807C5F8: .4byte 0x0857FCA0
_0807C5FC: .4byte 0x02006000
_0807C600: .4byte 0x08580238
_0807C604: .4byte 0x02006800
_0807C608: .4byte 0x085807D0
_0807C60C: .4byte 0x02007000
_0807C610: .4byte 0x08580D68
_0807C614: .4byte 0x02007800
_0807C618:
	cmp r0, #0xe
	bne _0807C626
	ldr r0, _0807C62C @ =0x0872F2E0
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
_0807C626:
	pop {r0}
	bx r0
	.align 2, 0
_0807C62C: .4byte 0x0872F2E0

	thumb_func_start unk_7c630
unk_7c630: @ 0x0807C630
	push {r4, lr}
	sub sp, #4
	ldr r1, _0807C650 @ =gNonGameplayRam
	ldr r2, _0807C654 @ =0x00000265
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0x25
	bls _0807C646
	bl _0807CE56
_0807C646:
	lsls r0, r0, #2
	ldr r1, _0807C658 @ =_0807C65C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C650: .4byte gNonGameplayRam
_0807C654: .4byte 0x00000265
_0807C658: .4byte _0807C65C
_0807C65C: @ jump table
	.4byte _0807C6F4 @ case 0
	.4byte _0807C770 @ case 1
	.4byte _0807C79C @ case 2
	.4byte _0807C7B8 @ case 3
	.4byte _0807C7E4 @ case 4
	.4byte _0807C810 @ case 5
	.4byte _0807C82C @ case 6
	.4byte _0807C858 @ case 7
	.4byte _0807C884 @ case 8
	.4byte _0807C8A0 @ case 9
	.4byte _0807C8CC @ case 10
	.4byte _0807C924 @ case 11
	.4byte _0807C940 @ case 12
	.4byte _0807C970 @ case 13
	.4byte _0807C99C @ case 14
	.4byte _0807C9C8 @ case 15
	.4byte _0807C9F0 @ case 16
	.4byte _0807CA10 @ case 17
	.4byte _0807CA50 @ case 18
	.4byte _0807CA90 @ case 19
	.4byte _0807CAD0 @ case 20
	.4byte _0807CAFC @ case 21
	.4byte _0807CB20 @ case 22
	.4byte _0807CB58 @ case 23
	.4byte _0807CBB0 @ case 24
	.4byte _0807CBE0 @ case 25
	.4byte _0807CC18 @ case 26
	.4byte _0807CC4C @ case 27
	.4byte _0807CC70 @ case 28
	.4byte _0807CC9C @ case 29
	.4byte _0807CCC8 @ case 30
	.4byte _0807CCE4 @ case 31
	.4byte _0807CD30 @ case 32
	.4byte _0807CD5C @ case 33
	.4byte _0807CD78 @ case 34
	.4byte _0807CDA4 @ case 35
	.4byte _0807CDD0 @ case 36
	.4byte _0807CE10 @ case 37
_0807C6F4:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r3, _0807C74C @ =0x0000026A
	adds r0, r4, r3
	movs r2, #0
	strh r1, [r0]
	ldr r0, _0807C750 @ =0x0400000E
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C754 @ =0x0400000C
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C758 @ =0x04000050
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C75C @ =0x04000052
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	movs r1, #0x9a
	lsls r1, r1, #2
	adds r0, r4, r1
	strh r2, [r0]
	ldr r1, _0807C760 @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _0807C764 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0807C768 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0807C76C @ =0x00000265
	adds r1, r4, r2
	b _0807CDEE
	.align 2, 0
_0807C74C: .4byte 0x0000026A
_0807C750: .4byte 0x0400000E
_0807C754: .4byte 0x0400000C
_0807C758: .4byte 0x04000050
_0807C75C: .4byte 0x04000052
_0807C760: .4byte 0x040000D4
_0807C764: .4byte 0x02035000
_0807C768: .4byte 0x80000100
_0807C76C: .4byte 0x00000265
_0807C770:
	ldr r1, _0807C78C @ =0x06004000
	ldr r2, _0807C790 @ =0x02008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C794 @ =gNonGameplayRam
	ldr r3, _0807C798 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C78C: .4byte 0x06004000
_0807C790: .4byte 0x02008000
_0807C794: .4byte gNonGameplayRam
_0807C798: .4byte 0x00000265
_0807C79C:
	ldr r1, _0807C7B0 @ =0x06005000
	ldr r2, _0807C7B4 @ =0x02009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C7B0: .4byte 0x06005000
_0807C7B4: .4byte 0x02009000
_0807C7B8:
	ldr r1, _0807C7D4 @ =0x06006000
	ldr r2, _0807C7D8 @ =0x0200A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C7DC @ =gNonGameplayRam
	ldr r2, _0807C7E0 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C7D4: .4byte 0x06006000
_0807C7D8: .4byte 0x0200A000
_0807C7DC: .4byte gNonGameplayRam
_0807C7E0: .4byte 0x00000265
_0807C7E4:
	ldr r1, _0807C800 @ =0x06007000
	ldr r2, _0807C804 @ =0x0200B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C808 @ =gNonGameplayRam
	ldr r3, _0807C80C @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C800: .4byte 0x06007000
_0807C804: .4byte 0x0200B000
_0807C808: .4byte gNonGameplayRam
_0807C80C: .4byte 0x00000265
_0807C810:
	movs r1, #0x80
	lsls r1, r1, #0x12
	ldr r2, _0807C828 @ =0x06004000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C828: .4byte 0x06004000
_0807C82C:
	ldr r1, _0807C848 @ =0x02001000
	ldr r2, _0807C84C @ =0x06005000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C850 @ =gNonGameplayRam
	ldr r2, _0807C854 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C848: .4byte 0x02001000
_0807C84C: .4byte 0x06005000
_0807C850: .4byte gNonGameplayRam
_0807C854: .4byte 0x00000265
_0807C858:
	ldr r1, _0807C874 @ =0x02002000
	ldr r2, _0807C878 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C87C @ =gNonGameplayRam
	ldr r3, _0807C880 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C874: .4byte 0x02002000
_0807C878: .4byte 0x06006000
_0807C87C: .4byte gNonGameplayRam
_0807C880: .4byte 0x00000265
_0807C884:
	ldr r1, _0807C898 @ =0x02003000
	ldr r2, _0807C89C @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C898: .4byte 0x02003000
_0807C89C: .4byte 0x06007000
_0807C8A0:
	ldr r1, _0807C8BC @ =0x02004000
	ldr r2, _0807C8C0 @ =0x06008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C8C4 @ =gNonGameplayRam
	ldr r2, _0807C8C8 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C8BC: .4byte 0x02004000
_0807C8C0: .4byte 0x06008000
_0807C8C4: .4byte gNonGameplayRam
_0807C8C8: .4byte 0x00000265
_0807C8CC:
	ldr r1, _0807C8F8 @ =0x02005000
	ldr r2, _0807C8FC @ =0x06009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r2, _0807C900 @ =gNonGameplayRam
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x35
	bne _0807C908
	ldr r0, _0807C904 @ =0x00000265
	adds r1, r2, r0
	movs r0, #0xd
	strb r0, [r1]
	b _0807CE56
	.align 2, 0
_0807C8F8: .4byte 0x02005000
_0807C8FC: .4byte 0x06009000
_0807C900: .4byte gNonGameplayRam
_0807C904: .4byte 0x00000265
_0807C908:
	ldr r1, _0807C918 @ =gWrittenToBldalpha_Evb
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807C91C @ =gWrittenToBldalpha_Eva
	strh r4, [r0]
	ldr r3, _0807C920 @ =0x00000265
	adds r1, r2, r3
	b _0807CDEE
	.align 2, 0
_0807C918: .4byte gWrittenToBldalpha_Evb
_0807C91C: .4byte gWrittenToBldalpha_Eva
_0807C920: .4byte 0x00000265
_0807C924:
	ldr r1, _0807C938 @ =0x02006000
	ldr r2, _0807C93C @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C938: .4byte 0x02006000
_0807C93C: .4byte 0x0600A000
_0807C940:
	ldr r1, _0807C960 @ =0x02007000
	ldr r2, _0807C964 @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _0807C968 @ =gNonGameplayRam
	ldr r1, _0807C96C @ =0x00000265
	adds r0, r0, r1
	movs r1, #0x15
	strb r1, [r0]
	b _0807CE56
	.align 2, 0
_0807C960: .4byte 0x02007000
_0807C964: .4byte 0x0600B000
_0807C968: .4byte gNonGameplayRam
_0807C96C: .4byte 0x00000265
_0807C970:
	ldr r1, _0807C98C @ =0x02006000
	ldr r2, _0807C990 @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C994 @ =gNonGameplayRam
	ldr r2, _0807C998 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C98C: .4byte 0x02006000
_0807C990: .4byte 0x0600A000
_0807C994: .4byte gNonGameplayRam
_0807C998: .4byte 0x00000265
_0807C99C:
	ldr r1, _0807C9B8 @ =0x02007000
	ldr r2, _0807C9BC @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C9C0 @ =gNonGameplayRam
	ldr r3, _0807C9C4 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C9B8: .4byte 0x02007000
_0807C9BC: .4byte 0x0600B000
_0807C9C0: .4byte gNonGameplayRam
_0807C9C4: .4byte 0x00000265
_0807C9C8:
	ldr r1, _0807C9E0 @ =0x040000D4
	ldr r0, _0807C9E4 @ =0x0857BEC4
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807C9E8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807C9EC @ =PauseScreenVBLank_Unused
	b _0807CDE4
	.align 2, 0
_0807C9E0: .4byte 0x040000D4
_0807C9E4: .4byte 0x0857BEC4
_0807C9E8: .4byte 0x80000100
_0807C9EC: .4byte PauseScreenVBLank_Unused
_0807C9F0:
	ldr r1, _0807CA08 @ =0x0300000A
	ldr r2, _0807CA0C @ =0x00001407
	adds r0, r2, #0
	strh r0, [r1]
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r4, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #4
	b _0807CB7C
	.align 2, 0
_0807CA08: .4byte 0x0300000A
_0807CA0C: .4byte 0x00001407
_0807CA10:
	ldr r3, _0807CA3C @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CA40 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0807CA28
	b _0807CE56
_0807CA28:
	ldr r1, _0807CA44 @ =0x0300000A
	ldr r3, _0807CA48 @ =0x00001507
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CA4C @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CA3C: .4byte 0x00000266
_0807CA40: .4byte 0x0879C17C
_0807CA44: .4byte 0x0300000A
_0807CA48: .4byte 0x00001507
_0807CA4C: .4byte 0x00000265
_0807CA50:
	ldr r1, _0807CA7C @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CA80 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0807CA68
	b _0807CE56
_0807CA68:
	ldr r1, _0807CA84 @ =0x0300000A
	ldr r3, _0807CA88 @ =0x00001607
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CA8C @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CA7C: .4byte 0x00000266
_0807CA80: .4byte 0x0879C17C
_0807CA84: .4byte 0x0300000A
_0807CA88: .4byte 0x00001607
_0807CA8C: .4byte 0x00000265
_0807CA90:
	ldr r1, _0807CABC @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CAC0 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #2]
	cmp r0, r1
	bhi _0807CAA8
	b _0807CE56
_0807CAA8:
	ldr r1, _0807CAC4 @ =0x0300000A
	ldr r3, _0807CAC8 @ =0x00001707
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CACC @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CABC: .4byte 0x00000266
_0807CAC0: .4byte 0x0879C17C
_0807CAC4: .4byte 0x0300000A
_0807CAC8: .4byte 0x00001707
_0807CACC: .4byte 0x00000265
_0807CAD0:
	ldr r1, _0807CAF0 @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CAF4 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	cmp r0, r1
	bhi _0807CAE8
	b _0807CE56
_0807CAE8:
	ldr r3, _0807CAF8 @ =0x00000265
	adds r0, r4, r3
	b _0807CC34
	.align 2, 0
_0807CAF0: .4byte 0x00000266
_0807CAF4: .4byte 0x0879C17C
_0807CAF8: .4byte 0x00000265
_0807CAFC:
	ldr r0, _0807CB10 @ =0x087338C0
	ldr r1, _0807CB14 @ =0x06007800
	bl LZ77UncompVram
	ldr r0, _0807CB18 @ =0x08733D58
	ldr r1, _0807CB1C @ =0x0600B800
	bl LZ77UncompVram
	b _0807CDE8
	.align 2, 0
_0807CB10: .4byte 0x087338C0
_0807CB14: .4byte 0x06007800
_0807CB18: .4byte 0x08733D58
_0807CB1C: .4byte 0x0600B800
_0807CB20:
	ldr r1, _0807CB40 @ =0x040000D4
	ldr r0, _0807CB44 @ =0x0872F0E0
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807CB48 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807CB4C @ =PauseScreenVBLank_Unused
	bl CallbackSetVBlank
	ldr r1, _0807CB50 @ =gNonGameplayRam
	ldr r2, _0807CB54 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CB40: .4byte 0x040000D4
_0807CB44: .4byte 0x0872F0E0
_0807CB48: .4byte 0x80000100
_0807CB4C: .4byte PauseScreenVBLank_Unused
_0807CB50: .4byte gNonGameplayRam
_0807CB54: .4byte 0x00000265
_0807CB58:
	ldr r1, _0807CB98 @ =0x0400000C
	ldr r3, _0807CB9C @ =0x00000F06
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0807CBA0 @ =0x00001707
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	ldr r3, _0807CBA4 @ =0x00000844
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	movs r3, #0xc0
	lsls r3, r3, #4
_0807CB7C:
	adds r0, r3, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0807CBA8 @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807CBAC @ =0x00000266
	adds r0, r4, r1
	strb r3, [r0]
	b _0807CE56
	.align 2, 0
_0807CB98: .4byte 0x0400000C
_0807CB9C: .4byte 0x00000F06
_0807CBA0: .4byte 0x00001707
_0807CBA4: .4byte 0x00000844
_0807CBA8: .4byte 0x00000265
_0807CBAC: .4byte 0x00000266
_0807CBB0:
	ldr r3, _0807CBD4 @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CBD8 @ =0x0873421C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0807CBC8
	b _0807CE56
_0807CBC8:
	ldr r1, _0807CBDC @ =0x00000265
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r1, #1
	b _0807CC36
	.align 2, 0
_0807CBD4: .4byte 0x00000266
_0807CBD8: .4byte 0x0873421C
_0807CBDC: .4byte 0x00000265
_0807CBE0:
	ldr r1, _0807CBF8 @ =gWrittenToBldalpha_Eva
	ldrh r0, [r1]
	adds r2, r0, #0
	cmp r2, #0
	bne _0807CC04
	ldr r3, _0807CBFC @ =0x00000265
	adds r0, r4, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0807CC00 @ =0x00000266
	b _0807CE52
	.align 2, 0
_0807CBF8: .4byte gWrittenToBldalpha_Eva
_0807CBFC: .4byte 0x00000265
_0807CC00: .4byte 0x00000266
_0807CC04:
	subs r0, #1
	strh r0, [r1]
	ldr r2, _0807CC14 @ =gWrittenToBldalpha_Evb
	movs r1, #0x10
	subs r1, r1, r0
	strh r1, [r2]
	b _0807CE56
	.align 2, 0
_0807CC14: .4byte gWrittenToBldalpha_Evb
_0807CC18:
	ldr r3, _0807CC40 @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CC44 @ =0x0873421C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0807CC30
	b _0807CE56
_0807CC30:
	ldr r1, _0807CC48 @ =0x00000265
	adds r0, r4, r1
_0807CC34:
	movs r1, #0x1b
_0807CC36:
	strb r1, [r0]
_0807CC38:
	movs r0, #0
	strb r0, [r2]
	b _0807CE56
	.align 2, 0
_0807CC40: .4byte 0x00000266
_0807CC44: .4byte 0x0873421C
_0807CC48: .4byte 0x00000265
_0807CC4C:
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r3, _0807CC68 @ =0x00000265
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807CC6C @ =0x00000266
	b _0807CE52
	.align 2, 0
_0807CC68: .4byte 0x00000265
_0807CC6C: .4byte 0x00000266
_0807CC70:
	ldr r1, _0807CC8C @ =0x08561FA8
	ldr r2, _0807CC90 @ =0x06008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CC94 @ =gNonGameplayRam
	ldr r2, _0807CC98 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CC8C: .4byte 0x08561FA8
_0807CC90: .4byte 0x06008000
_0807CC94: .4byte gNonGameplayRam
_0807CC98: .4byte 0x00000265
_0807CC9C:
	ldr r1, _0807CCB8 @ =0x08562FA8
	ldr r2, _0807CCBC @ =0x06009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CCC0 @ =gNonGameplayRam
	ldr r3, _0807CCC4 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CCB8: .4byte 0x08562FA8
_0807CCBC: .4byte 0x06009000
_0807CCC0: .4byte gNonGameplayRam
_0807CCC4: .4byte 0x00000265
_0807CCC8:
	ldr r1, _0807CCDC @ =0x08563FA8
	ldr r2, _0807CCE0 @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807CCDC: .4byte 0x08563FA8
_0807CCE0: .4byte 0x0600A000
_0807CCE4:
	ldr r1, _0807CD10 @ =0x08564FA8
	ldr r2, _0807CD14 @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD18 @ =0x040000D4
	ldr r0, _0807CD1C @ =0x06009800
	str r0, [r1]
	ldr r0, _0807CD20 @ =0x06009400
	str r0, [r1, #4]
	ldr r0, _0807CD24 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0807CD28 @ =gNonGameplayRam
	ldr r2, _0807CD2C @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CD10: .4byte 0x08564FA8
_0807CD14: .4byte 0x0600B000
_0807CD18: .4byte 0x040000D4
_0807CD1C: .4byte 0x06009800
_0807CD20: .4byte 0x06009400
_0807CD24: .4byte 0x80000200
_0807CD28: .4byte gNonGameplayRam
_0807CD2C: .4byte 0x00000265
_0807CD30:
	ldr r1, _0807CD4C @ =0x02008000
	ldr r2, _0807CD50 @ =0x06004000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD54 @ =gNonGameplayRam
	ldr r3, _0807CD58 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CD4C: .4byte 0x02008000
_0807CD50: .4byte 0x06004000
_0807CD54: .4byte gNonGameplayRam
_0807CD58: .4byte 0x00000265
_0807CD5C:
	ldr r1, _0807CD70 @ =0x02009000
	ldr r2, _0807CD74 @ =0x06005000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807CD70: .4byte 0x02009000
_0807CD74: .4byte 0x06005000
_0807CD78:
	ldr r1, _0807CD94 @ =0x0200A000
	ldr r2, _0807CD98 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD9C @ =gNonGameplayRam
	ldr r2, _0807CDA0 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CD94: .4byte 0x0200A000
_0807CD98: .4byte 0x06006000
_0807CD9C: .4byte gNonGameplayRam
_0807CDA0: .4byte 0x00000265
_0807CDA4:
	ldr r1, _0807CDC0 @ =0x0200B000
	ldr r2, _0807CDC4 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CDC8 @ =gNonGameplayRam
	ldr r3, _0807CDCC @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CDC0: .4byte 0x0200B000
_0807CDC4: .4byte 0x06007000
_0807CDC8: .4byte gNonGameplayRam
_0807CDCC: .4byte 0x00000265
_0807CDD0:
	ldr r1, _0807CDF8 @ =0x040000D4
	ldr r0, _0807CDFC @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807CE00 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807CE04 @ =PauseScreenVBLank
_0807CDE4:
	bl CallbackSetVBlank
_0807CDE8:
	ldr r1, _0807CE08 @ =gNonGameplayRam
	ldr r0, _0807CE0C @ =0x00000265
	adds r1, r1, r0
_0807CDEE:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CE56
	.align 2, 0
_0807CDF8: .4byte 0x040000D4
_0807CDFC: .4byte 0x02035000
_0807CE00: .4byte 0x80000100
_0807CE04: .4byte PauseScreenVBLank
_0807CE08: .4byte gNonGameplayRam
_0807CE0C: .4byte 0x00000265
_0807CE10:
	ldr r1, _0807CE60 @ =0x0400000E
	movs r2, #0x9b
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	ldr r3, _0807CE64 @ =0x0000026E
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x44
	adds r2, #4
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #4
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807CE68 @ =0x0000026A
	adds r0, r4, r1
	ldrh r1, [r0]
	subs r2, #8
	adds r0, r4, r2
	movs r2, #0
	strh r1, [r0]
	subs r3, #0xd
	adds r0, r4, r3
	strb r2, [r0]
	movs r1, #0x99
	lsls r1, r1, #2
_0807CE52:
	adds r0, r4, r1
	strb r2, [r0]
_0807CE56:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE60: .4byte 0x0400000E
_0807CE64: .4byte 0x0000026E
_0807CE68: .4byte 0x0000026A

	thumb_func_start unk_7ce6c
unk_7ce6c: @ 0x0807CE6C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _0807CEBC @ =gCurrentArea
	ldrb r0, [r3]
	cmp r0, #6
	bls _0807CE7A
	b _0807CF8A
_0807CE7A:
	ldr r2, _0807CEC0 @ =gNonGameplayRam
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0807CEC4 @ =0x08581500
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r2]
	adds r6, r2, #0
	cmp r0, #0
	beq _0807CF8A
	ldr r0, _0807CEC8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _0807CF8A
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807CED4
	ldr r2, _0807CECC @ =0x0857607D
	ldr r1, _0807CED0 @ =0x08576073
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r6, r2
	b _0807CEDE
	.align 2, 0
_0807CEBC: .4byte gCurrentArea
_0807CEC0: .4byte gNonGameplayRam
_0807CEC4: .4byte 0x08581500
_0807CEC8: .4byte gPauseScreenFlag
_0807CECC: .4byte 0x0857607D
_0807CED0: .4byte 0x08576073
_0807CED4:
	ldr r0, _0807CF48 @ =0x0857607D
	ldrb r1, [r0, #7]
	movs r4, #0x91
	lsls r4, r4, #2
	adds r0, r6, r4
_0807CEDE:
	strb r1, [r0]
	ldr r1, _0807CF4C @ =0x0879C180
	movs r5, #0x91
	lsls r5, r5, #2
	adds r0, r6, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r6, #0
	adds r1, #0xc6
	strb r0, [r1]
	subs r1, #8
	movs r0, #0x1c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x32
	strh r0, [r1]
	adds r2, r6, #0
	adds r2, #0xc7
	ldrb r1, [r2]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0xa
	movs r1, #0
	bl UpdateMenuOamDataId
	adds r1, r6, #0
	adds r1, #0xaf
	ldrb r0, [r1]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1]
	ldr r2, _0807CF50 @ =gCurrentArea
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807CF5C
	ldr r1, _0807CF54 @ =0x08576073
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _0807CF58 @ =0x00000249
	adds r0, r6, r2
	b _0807CF6C
	.align 2, 0
_0807CF48: .4byte 0x0857607D
_0807CF4C: .4byte 0x0879C180
_0807CF50: .4byte gCurrentArea
_0807CF54: .4byte 0x08576073
_0807CF58: .4byte 0x00000249
_0807CF5C:
	ldr r1, _0807CF94 @ =0x085760E8
	ldr r0, _0807CF98 @ =gCurrentRoom
	ldrb r0, [r0]
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r4, _0807CF9C @ =0x00000249
	adds r0, r6, r4
_0807CF6C:
	strb r1, [r0]
	bl unk_7d27c
	mov r1, sp
	ldr r5, _0807CFA0 @ =0x00007A73
	adds r0, r5, #0
	strh r0, [r1]
	ldr r1, _0807CFA4 @ =0x040000D4
	mov r6, sp
	str r6, [r1]
	ldr r0, _0807CFA8 @ =0x05000342
	str r0, [r1, #4]
	ldr r0, _0807CFAC @ =0x8100000C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0807CF8A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF94: .4byte 0x085760E8
_0807CF98: .4byte gCurrentRoom
_0807CF9C: .4byte 0x00000249
_0807CFA0: .4byte 0x00007A73
_0807CFA4: .4byte 0x040000D4
_0807CFA8: .4byte 0x05000342
_0807CFAC: .4byte 0x8100000C

	thumb_func_start unk_7cfb0
unk_7cfb0: @ 0x0807CFB0
	push {r4, lr}
	ldr r1, _0807D034 @ =gNonGameplayRam
	ldrb r0, [r1]
	mov ip, r1
	cmp r0, #0
	bne _0807CFBE
	b _0807D270
_0807CFBE:
	ldr r0, _0807D038 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0807CFCC
	b _0807D270
_0807CFCC:
	movs r1, #0x92
	lsls r1, r1, #2
	add r1, ip
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807D014
	strb r2, [r1]
	ldr r3, _0807D03C @ =0x00000247
	add r3, ip
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0807CFF8
	strb r2, [r3]
_0807CFF8:
	ldr r0, _0807D040 @ =0x00000249
	add r0, ip
	ldrb r4, [r0]
	lsls r1, r4, #1
	ldr r0, _0807D044 @ =0x05000340
	adds r1, r1, r0
	ldr r2, _0807D048 @ =0x08581300
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
_0807D014:
	ldr r1, _0807D04C @ =0x0000024A
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #2
	bne _0807D050
	movs r0, #3
	strb r0, [r1]
	mov r1, ip
	adds r1, #0xa6
	movs r0, #0x1c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x32
	strh r0, [r1]
	b _0807D0DA
	.align 2, 0
_0807D034: .4byte gNonGameplayRam
_0807D038: .4byte gPauseScreenFlag
_0807D03C: .4byte 0x00000247
_0807D040: .4byte 0x00000249
_0807D044: .4byte 0x05000340
_0807D048: .4byte 0x08581300
_0807D04C: .4byte 0x0000024A
_0807D050:
	cmp r0, #3
	bne _0807D0DA
	ldr r0, _0807D090 @ =0x0857608A
	ldr r1, _0807D094 @ =0x0300004C
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	blt _0807D09C
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	cmp r4, #0x23
	ble _0807D078
	subs r4, #0x24
_0807D078:
	mov r1, ip
	adds r1, #0xbe
	ldr r3, _0807D098 @ =0x0879C1A4
	lsls r2, r4, #1
	adds r2, r2, r4
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0807D0B2
	.align 2, 0
_0807D090: .4byte 0x0857608A
_0807D094: .4byte 0x0300004C
_0807D098: .4byte 0x0879C1A4
_0807D09C:
	mov r4, ip
	adds r4, #0xbe
	ldr r3, _0807D108 @ =0x0879C210
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r4, [r4]
	adds r0, r0, r4
_0807D0B2:
	mov r1, ip
	adds r1, #0xa6
	strh r0, [r1]
	adds r1, #0x16
	adds r0, r3, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0xa4
	strh r0, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #0x16
	adds r1, #0xa
	strb r0, [r1]
_0807D0DA:
	movs r2, #0x90
	lsls r2, r2, #2
	add r2, ip
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807D0E8
	b _0807D270
_0807D0E8:
	ldr r0, _0807D10C @ =0x00000242
	add r0, ip
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	subs r0, #1
	cmp r0, #5
	bls _0807D0FC
	b _0807D270
_0807D0FC:
	lsls r0, r0, #2
	ldr r1, _0807D110 @ =_0807D114
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807D108: .4byte 0x0879C210
_0807D10C: .4byte 0x00000242
_0807D110: .4byte _0807D114
_0807D114: @ jump table
	.4byte _0807D12C @ case 0
	.4byte _0807D142 @ case 1
	.4byte _0807D164 @ case 2
	.4byte _0807D19C @ case 3
	.4byte _0807D1C4 @ case 4
	.4byte _0807D1EC @ case 5
_0807D12C:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807D13C
	b _0807D270
_0807D13C:
	movs r1, #0x90
	lsls r1, r1, #2
	b _0807D1DE
_0807D142:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0807D152
	b _0807D270
_0807D152:
	ldr r1, _0807D160 @ =0x0000024A
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #2
	b _0807D1B6
	.align 2, 0
_0807D160: .4byte 0x0000024A
_0807D164:
	ldr r1, _0807D194 @ =0x00000242
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #8
	bhi _0807D170
	b _0807D270
_0807D170:
	movs r3, #0
	strb r3, [r1]
	movs r2, #0x91
	lsls r2, r2, #2
	add r2, ip
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x23
	ble _0807D18A
	strb r3, [r2]
_0807D18A:
	ldr r1, _0807D198 @ =0x0879C180
	movs r0, #0
	ldrsb r0, [r2, r0]
	b _0807D266
	.align 2, 0
_0807D194: .4byte 0x00000242
_0807D198: .4byte 0x0879C180
_0807D19C:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0807D270
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0807D1C0 @ =0x00000241
_0807D1B6:
	add r1, ip
	movs r0, #1
	strb r0, [r1]
	b _0807D270
	.align 2, 0
_0807D1C0: .4byte 0x00000241
_0807D1C4:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807D270
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r0, #6
	strb r0, [r1]
	ldr r1, _0807D1E8 @ =0x0000024A
_0807D1DE:
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	b _0807D270
	.align 2, 0
_0807D1E8: .4byte 0x0000024A
_0807D1EC:
	movs r2, #0x91
	lsls r2, r2, #2
	add r2, ip
	ldr r0, _0807D21C @ =0x00000245
	add r0, ip
	ldrb r4, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0807D224
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r2, #0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0807D220 @ =0x00000241
	add r0, ip
	strb r2, [r0]
	b _0807D270
	.align 2, 0
_0807D21C: .4byte 0x00000245
_0807D220: .4byte 0x00000241
_0807D224:
	ldr r1, _0807D248 @ =0x00000242
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #8
	bls _0807D270
	movs r3, #0
	strb r3, [r1]
	ldr r0, _0807D24C @ =0x00000246
	add r0, ip
	ldrb r0, [r0]
	adds r0, r4, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x23
	ble _0807D250
	strb r3, [r2]
	b _0807D258
	.align 2, 0
_0807D248: .4byte 0x00000242
_0807D24C: .4byte 0x00000246
_0807D250:
	cmp r0, #0
	bge _0807D258
	movs r0, #0x23
	strb r0, [r2]
_0807D258:
	ldr r1, _0807D278 @ =0x0879C180
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0807D266:
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0xc6
	strb r1, [r0]
_0807D270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D278: .4byte 0x0879C180

	thumb_func_start unk_7d27c
unk_7d27c: @ 0x0807D27C
	push {r4, r5, lr}
	ldr r0, _0807D294 @ =0x0300004C
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807D29C
	ldr r0, _0807D298 @ =gNonGameplayRam
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	b _0807D33E
	.align 2, 0
_0807D294: .4byte 0x0300004C
_0807D298: .4byte gNonGameplayRam
_0807D29C:
	ldr r0, _0807D2C4 @ =gNonGameplayRam
	movs r2, #0x90
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r4, #1
	strb r4, [r1]
	subs r2, #0x20
	adds r1, r0, r2
	ldr r2, _0807D2C8 @ =gPreviousNavigationConversation
	ldrb r1, [r1]
	adds r3, r0, #0
	ldrb r2, [r2]
	cmp r1, r2
	bne _0807D2D0
	ldr r0, _0807D2CC @ =0x0000024A
	adds r1, r3, r0
	movs r0, #2
	strb r0, [r1]
	b _0807D2D6
	.align 2, 0
_0807D2C4: .4byte gNonGameplayRam
_0807D2C8: .4byte gPreviousNavigationConversation
_0807D2CC: .4byte 0x0000024A
_0807D2D0:
	ldr r1, _0807D324 @ =0x0000024A
	adds r0, r3, r1
	strb r4, [r0]
_0807D2D6:
	ldr r1, _0807D328 @ =0x0857607D
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	blt _0807D340
	ldr r0, _0807D32C @ =0x00000245
	adds r5, r3, r0
	strb r1, [r5]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r4, r3, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r2, r0
	beq _0807D340
	movs r2, #0x90
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #4
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	movs r0, #1
	cmp r1, #0
	bge _0807D316
	subs r0, #2
_0807D316:
	muls r1, r0, r1
	cmp r1, #0x12
	ble _0807D330
	movs r1, #1
	rsbs r1, r1, #0
	b _0807D338
	.align 2, 0
_0807D324: .4byte 0x0000024A
_0807D328: .4byte 0x0857607D
_0807D32C: .4byte 0x00000245
_0807D330:
	cmp r1, #0x12
	bne _0807D336
	movs r0, #1
_0807D336:
	movs r1, #1
_0807D338:
	muls r1, r0, r1
	ldr r2, _0807D348 @ =0x00000246
	adds r0, r3, r2
_0807D33E:
	strb r1, [r0]
_0807D340:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D348: .4byte 0x00000246
