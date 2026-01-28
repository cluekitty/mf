	.include "asm/macros.inc"

	.syntax unified

	thumb_func_start InitializeAudio
InitializeAudio: @ 0x08002298
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r5, _08002468 @ =gMusicInfo
	ldrb r4, [r5, #1]
	cmp r4, #0
	beq _080022AA
	b _0800245A
_080022AA:
	movs r0, #1
	strb r0, [r5, #1]
	ldr r2, _0800246C @ =0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08002470 @ =0x04000084
	movs r3, #0x80
	strb r3, [r0]
	ldr r1, _08002474 @ =0x04000082
	ldr r2, _08002478 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0800247C @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08002480 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #2
	strb r3, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r0, #0xc
	strb r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0xd
	strb r4, [r0]
	ldr r1, _08002484 @ =0x04000080
	movs r0, #0x77
	strb r0, [r1]
	ldr r0, _08002488 @ =0x03003654
	ldr r1, _0800248C @ =0x03003659
	str r1, [r0]
	adds r2, #0x4b
	ldr r0, _08002490 @ =CallSoundCodeA
	str r0, [r2]
	subs r1, #1
	str r1, [r2, #4]
	ldr r0, _08002494 @ =0x8000032C
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002498 @ =0x03003CB0
	ldr r0, _0800249C @ =0x03003CB5
	str r0, [r1]
	ldr r1, _080024A0 @ =CallSoundCodeB
	str r1, [r2]
	subs r0, #1
	str r0, [r2, #4]
	ldr r0, _080024A4 @ =0x80000052
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _080024A8 @ =0x03003D58
	ldr r0, _080024AC @ =0x03003D5D
	str r0, [r1]
	ldr r1, _080024B0 @ =CallSoundCodeC
	str r1, [r2]
	subs r0, #1
	str r0, [r2, #4]
	ldr r0, _080024B4 @ =0x80000058
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r5, [r2, #4]
	ldr r0, _080024B8 @ =0x8100000E
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _080024BC @ =0x00000064
	strb r0, [r5, #9]
	movs r3, #0
	ldr r5, _080024C0 @ =0x00000008
	mov ip, r5
	ldr r0, _080024C4 @ =0x0193F600
	mov r8, r0
	mov r1, sp
	movs r6, #0
	ldr r5, _080024C8 @ =0x03003464
	ldr r4, _080024CC @ =0x81000014
_0800235E:
	strh r6, [r1]
	mov r0, sp
	str r0, [r2]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r5
	str r0, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800235E
	movs r3, #0
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _080023B4
	mov r4, sp
	ldr r1, _080024D0 @ =0x040000D4
	ldr r7, _080024D4 @ =0x080A8CDC
	adds r2, r0, #0
	movs r6, #0
	ldr r5, _080024D8 @ =0x81000016
_08002394:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _08002394
_080023B4:
	movs r3, #0
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _080023EA
	ldr r4, _080024D4 @ =0x080A8CDC
	adds r6, r4, #4
	adds r5, r0, #0
_080023C6:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
	ldr r1, [r2]
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r1, #0x18]
	ldrh r0, [r2, #8]
	strb r0, [r1, #5]
	ldr r1, [r2]
	ldrh r0, [r2, #0xa]
	strb r0, [r1, #0x1d]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	blo _080023C6
_080023EA:
	mov r0, r8
	bl unk_24ec
	movs r3, #0
	ldr r2, _08002468 @ =gMusicInfo
	ldrb r0, [r2, #5]
	cmp r3, r0
	bhs _0800242A
	mov r4, sp
	movs r5, #0
	mov ip, r5
	ldr r1, _080024D0 @ =0x040000D4
	ldr r5, _080024DC @ =0x00001824
	adds r7, r2, r5
	adds r2, r0, #0
	movs r6, #0x34
	ldr r5, _080024E0 @ =0x8100001A
_0800240C:
	mov r0, ip
	strh r0, [r4]
	mov r0, sp
	str r0, [r1]
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r0, r7
	str r0, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0800240C
_0800242A:
	movs r3, #0
	ldr r7, _08002468 @ =gMusicInfo
	mov r2, sp
	movs r6, #0
	ldr r1, _080024D0 @ =0x040000D4
	ldr r5, _080024E4 @ =0x03003504
	ldr r4, _080024E8 @ =0x8100001C
_08002438:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r5
	str r0, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08002438
	movs r0, #0
	strb r0, [r7, #1]
_0800245A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002468: .4byte gMusicInfo
_0800246C: .4byte 0x04000200
_08002470: .4byte 0x04000084
_08002474: .4byte 0x04000082
_08002478: .4byte 0x0000A90E
_0800247C: .4byte 0x04000089
_08002480: .4byte 0x04000063
_08002484: .4byte 0x04000080
_08002488: .4byte 0x03003654
_0800248C: .4byte 0x03003659
_08002490: .4byte CallSoundCodeA
_08002494: .4byte 0x8000032C
_08002498: .4byte 0x03003CB0
_0800249C: .4byte 0x03003CB5
_080024A0: .4byte CallSoundCodeB
_080024A4: .4byte 0x80000052
_080024A8: .4byte 0x03003D58
_080024AC: .4byte 0x03003D5D
_080024B0: .4byte CallSoundCodeC
_080024B4: .4byte 0x80000058
_080024B8: .4byte 0x8100000E
_080024BC: .4byte 0x00000064
_080024C0: .4byte 0x00000008
_080024C4: .4byte 0x0193F600
_080024C8: .4byte 0x03003464
_080024CC: .4byte 0x81000014
_080024D0: .4byte 0x040000D4
_080024D4: .4byte 0x080A8CDC
_080024D8: .4byte 0x81000016
_080024DC: .4byte 0x00001824
_080024E0: .4byte 0x8100001A
_080024E4: .4byte 0x03003504
_080024E8: .4byte 0x8100001C

	thumb_func_start unk_24ec
unk_24ec: @ 0x080024EC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0800259C @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080025D2
	movs r0, #1
	strb r0, [r2, #1]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0800250C
	adds r0, r4, #0
	adds r0, #0x80
	strb r0, [r2, #4]
_0800250C:
	movs r0, #0xf0
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0800253C
	lsrs r0, r0, #8
	strb r0, [r2, #5]
	movs r0, #0xb
	adds r7, r2, #0
	movs r6, #0x34
	ldr r5, _080025A0 @ =0x00001824
	movs r3, #0
_08002524:
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r7
	adds r0, r0, r5
	strb r3, [r0]
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r1, #0
	bge _08002524
_0800253C:
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0800254A
	lsrs r0, r0, #0xc
	strb r0, [r2, #6]
_0800254A:
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _08002562
	ldr r1, _0800259C @ =gMusicInfo
	lsrs r0, r0, #0x10
	strb r0, [r1, #7]
	cmp r0, #0
	beq _08002562
	bl SetupSoundTransfer
_08002562:
	movs r3, #0xf0
	lsls r3, r3, #0x10
	ands r3, r4
	cmp r3, #0
	beq _0800257A
	ldr r2, _080025A4 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	lsrs r1, r3, #0xe
	orrs r0, r1
	strb r0, [r2]
_0800257A:
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r4
	cmp r1, #0
	beq _080025CC
	movs r0, #0x80
	lsls r0, r0, #0x12
	cmp r1, r0
	bne _080025B0
	ldr r2, _080025A8 @ =0x04000082
	ldrh r1, [r2]
	ldr r0, _080025AC @ =0x0000E10D
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #1
	b _080025C8
	.align 2, 0
_0800259C: .4byte gMusicInfo
_080025A0: .4byte 0x00001824
_080025A4: .4byte 0x04000089
_080025A8: .4byte 0x04000082
_080025AC: .4byte 0x0000E10D
_080025B0:
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _080025CC
	ldr r2, _080025D8 @ =0x04000082
	ldrh r1, [r2]
	ldr r0, _080025DC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _080025E0 @ =0x00003302
	adds r1, r3, #0
_080025C8:
	orrs r0, r1
	strh r0, [r2]
_080025CC:
	ldr r1, _080025E4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080025D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080025D8: .4byte 0x04000082
_080025DC: .4byte 0x0000FFFE
_080025E0: .4byte 0x00003302
_080025E4: .4byte gMusicInfo

	thumb_func_start SetupSoundTransfer
SetupSoundTransfer: @ 0x080025E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080026CC @ =0x040000C4
	ldr r1, _080026D0 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	ldr r7, _080026D4 @ =0x040000C6
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	strh r0, [r7]
	ldr r1, _080026D8 @ =0x040000D2
	mov sb, r1
	strh r0, [r1]
	movs r0, #0
	mov sl, r0
	str r0, [sp]
	ldr r6, _080026DC @ =0x030025F4
	ldr r2, _080026E0 @ =0x01000300
	mov r0, sp
	adds r1, r6, #0
	bl CpuFastSet
	ldr r1, _080026E4 @ =0xFFFFF3DC
	adds r4, r6, r1
	ldr r1, _080026E8 @ =0x080A5408
	ldrb r0, [r4, #7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x12]
	ldr r1, _080026EC @ =0x080A543C
	ldrb r0, [r4, #7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x18]
	ldr r1, _080026F0 @ =0x080A5470
	ldrb r0, [r4, #7]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	str r0, [r4, #0x14]
	lsrs r5, r0, #4
	strb r5, [r4, #0xc]
	ldrb r1, [r4, #0xc]
	movs r0, #0x60
	bl __divsi3
	strb r0, [r4, #0xd]
	muls r0, r5, r0
	strb r0, [r4, #0xe]
	subs r0, #1
	strb r0, [r4, #0x10]
	lsls r5, r5, #1
	strb r5, [r4, #0x11]
	ldr r0, _080026F4 @ =0x040000BC
	str r6, [r0]
	adds r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r6, r6, r1
	str r6, [r0]
	ldr r1, _080026F8 @ =0x040000C0
	subs r0, #0x28
	str r0, [r1]
	adds r1, #0xc
	adds r0, #4
	str r0, [r1]
	movs r1, #0xb6
	lsls r1, r1, #8
	adds r0, r1, #0
	strh r0, [r7]
	movs r1, #0xf6
	lsls r1, r1, #8
	adds r0, r1, #0
	mov r1, sb
	strh r0, [r1]
	ldr r0, _080026FC @ =0x04000102
	mov r1, sl
	strh r1, [r0]
	ldr r4, _08002700 @ =0x04000100
	ldr r0, _08002704 @ =0x00044940
	mov r1, r8
	bl __udivsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	ldr r1, _08002708 @ =0x04000006
_080026A6:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080026A6
	ldr r1, _08002708 @ =0x04000006
_080026AE:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080026AE
	ldr r1, _080026FC @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080026CC: .4byte 0x040000C4
_080026D0: .4byte 0x84400004
_080026D4: .4byte 0x040000C6
_080026D8: .4byte 0x040000D2
_080026DC: .4byte 0x030025F4
_080026E0: .4byte 0x01000300
_080026E4: .4byte 0xFFFFF3DC
_080026E8: .4byte 0x080A5408
_080026EC: .4byte 0x080A543C
_080026F0: .4byte 0x080A5470
_080026F4: .4byte 0x040000BC
_080026F8: .4byte 0x040000C0
_080026FC: .4byte 0x04000102
_08002700: .4byte 0x04000100
_08002704: .4byte 0x00044940
_08002708: .4byte 0x04000006

	thumb_func_start SoundPlay
SoundPlay: @ 0x0800270C
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _08002730 @ =0x080A8CDC
	ldr r1, _08002734 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl unk_45a8
	pop {r0}
	bx r0
	.align 2, 0
_08002730: .4byte 0x080A8CDC
_08002734: .4byte 0x080A8D3C

	thumb_func_start SoundStop
SoundStop: @ 0x08002738
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0800276C @ =0x080A8CDC
	ldr r1, _08002770 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r3, r0, r1
	ldrh r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08002768
	ldr r1, [r3]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	bne _08002768
	adds r0, r2, #0
	bl StopMusic
_08002768:
	pop {r0}
	bx r0
	.align 2, 0
_0800276C: .4byte 0x080A8CDC
_08002770: .4byte 0x080A8D3C

	thumb_func_start StopAllMusicsAndSounds
StopAllMusicsAndSounds: @ 0x08002774
	push {r4, r5, lr}
	ldr r0, _080027A0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _0800279A
	ldr r1, _080027A4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_0800278C:
	ldr r0, [r5]
	bl StopMusic
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0800278C
_0800279A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080027A0: .4byte 0x00000008
_080027A4: .4byte 0x080A8CDC

	thumb_func_start unk_27a8
unk_27a8: @ 0x080027A8
	push {r4, r5, lr}
	ldr r0, _080027E0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _080027DA
	ldr r1, _080027E4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_080027C0:
	ldr r2, [r5]
	ldrb r1, [r2, #0x1e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080027D2
	adds r0, r2, #0
	bl StopMusic
_080027D2:
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080027C0
_080027DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080027E0: .4byte 0x00000008
_080027E4: .4byte 0x080A8CDC

	thumb_func_start unk_27e8
unk_27e8: @ 0x080027E8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002804 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800280C
	ldr r0, _08002808 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	b _08002816
	.align 2, 0
_08002804: .4byte gMusicInfo
_08002808: .4byte 0x080A8CDC
_0800280C:
	ldr r0, _08002850 @ =0x080A8CDC
	ldr r0, [r0]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
_08002816:
	ldr r4, _08002850 @ =0x080A8CDC
	ldr r0, [r4, #0x18]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x24]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x30]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x3c]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x48]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002850: .4byte 0x080A8CDC

	thumb_func_start SoundPlayNotAlreadyPlaying
SoundPlayNotAlreadyPlaying: @ 0x08002854
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _0800288C @ =0x080A8CDC
	ldr r1, _08002890 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	ldr r3, [r0]
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800287E
	ldr r0, [r2, #0x10]
	cmp r3, r0
	beq _08002886
_0800287E:
	adds r0, r2, #0
	adds r1, r3, #0
	bl unk_45a8
_08002886:
	pop {r0}
	bx r0
	.align 2, 0
_0800288C: .4byte 0x080A8CDC
_08002890: .4byte 0x080A8D3C

	thumb_func_start SoundPlay_2894
SoundPlay_2894: @ 0x08002894
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _080028D0 @ =0x080A8CDC
	ldr r1, _080028D4 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldr r3, [r0]
	ldrb r2, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080028D8
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080028E8
	ldr r0, [r1, #0x10]
	cmp r3, r0
	bne _080028DE
	adds r0, r1, #0
	bl unk_2938
	b _080028F6
	.align 2, 0
_080028D0: .4byte 0x080A8CDC
_080028D4: .4byte 0x080A8D3C
_080028D8:
	ldr r0, [r1, #0x10]
	cmp r3, r0
	beq _080028F6
_080028DE:
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_45a8
	b _080028F6
_080028E8:
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _080028F6
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_45a8
_080028F6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_28fc
unk_28fc: @ 0x080028FC
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08002930 @ =0x080A8CDC
	ldr r1, _08002934 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r3, r0, r1
	ldrh r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800292C
	ldr r1, [r3]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	bne _0800292C
	adds r0, r2, #0
	bl unk_2938
_0800292C:
	pop {r0}
	bx r0
	.align 2, 0
_08002930: .4byte 0x080A8CDC
_08002934: .4byte 0x080A8D3C

	thumb_func_start unk_2938
unk_2938: @ 0x08002938
	push {r4, lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1c]
	cmp r0, #0
	bne _0800296E
	movs r0, #1
	strb r0, [r2, #0x1c]
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0800296A
	movs r0, #2
	strb r0, [r2]
	movs r1, #0
	ldr r0, [r2, #0x18]
	ldrb r3, [r2, #1]
	cmp r1, r3
	bge _0800296A
	movs r3, #0x40
_0800295E:
	strb r3, [r0, #5]
	adds r1, #1
	adds r0, #0x50
	ldrb r4, [r2, #1]
	cmp r1, r4
	blt _0800295E
_0800296A:
	movs r0, #0
	strb r0, [r2, #0x1c]
_0800296E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_2974
unk_2974: @ 0x08002974
	push {r4, r5, lr}
	ldr r0, _080029A0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _0800299A
	ldr r1, _080029A4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_0800298C:
	ldr r0, [r5]
	bl unk_2938
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0800298C
_0800299A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080029A0: .4byte 0x00000008
_080029A4: .4byte 0x080A8CDC

	thumb_func_start ApplyMusicSoundFading
ApplyMusicSoundFading: @ 0x080029A8
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _080029BA
	bl StopMusic
	b _080029F2
_080029BA:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _080029F2
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r2, [r4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080029EE
	movs r0, #0xf8
	ands r0, r2
	cmp r0, #0
	beq _080029DE
	adds r0, r4, #0
	bl ResetTrack
	b _080029EE
_080029DE:
	movs r0, #8
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _080029F8 @ =0x0000FFFF
	strh r0, [r4, #6]
	bl __divsi3
	strh r0, [r4, #8]
_080029EE:
	movs r0, #0
	strb r0, [r4, #0x1c]
_080029F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080029F8: .4byte 0x0000FFFF

	thumb_func_start ApplyRawMusicSoundFading
ApplyRawMusicSoundFading: @ 0x080029FC
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002A34
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r2, [r4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08002A30
	movs r0, #0xf8
	ands r0, r2
	cmp r0, #0
	bne _08002A30
	movs r0, #0x10
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _08002A3C @ =0x0000FFFF
	strh r0, [r4, #6]
	bl __divsi3
	strh r0, [r4, #8]
_08002A30:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002A34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002A3C: .4byte 0x0000FFFF

	thumb_func_start unk_2a40
unk_2a40: @ 0x08002A40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x18]
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #8]
	subs r1, r1, r0
	cmp r1, #0
	blt _08002AA8
	strh r1, [r4, #6]
	ldrb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08002A86
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	cmp r0, #0
	beq _08002A7E
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r1, [r4, #0x24]
	ldr r0, _08002AA4 @ =0x00000FFF
	ands r0, r1
	strh r0, [r4, #0x24]
_08002A7E:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0
	strb r0, [r1]
_08002A86:
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002ACE
	movs r3, #4
_08002A8E:
	ldrh r0, [r4, #6]
	lsrs r0, r0, #0xa
	strb r0, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002A8E
	b _08002ACE
	.align 2, 0
_08002AA4: .4byte 0x00000FFF
_08002AA8:
	adds r0, r4, #0
	bl ResetTrack
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08002ABC
	movs r0, #0
	strb r0, [r4]
_08002ABC:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _08002ACE
	adds r2, r4, #0
	adds r2, #0x28
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
_08002ACE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_2ad4
unk_2ad4: @ 0x08002AD4
	push {r4, lr}
	adds r2, r1, #0
	lsls r0, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _08002B00 @ =0x080A8CDC
	ldr r1, _08002B04 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r3, [r1]
	ldr r1, [r0]
	adds r0, r3, #0
	bl unk_2b08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002B00: .4byte 0x080A8CDC
_08002B04: .4byte 0x080A8D3C

	thumb_func_start unk_2b08
unk_2b08: @ 0x08002B08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _08002B20
	adds r0, r5, #0
	bl StopMusic
	b _08002B62
_08002B20:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08002B38
	ldrb r0, [r5, #3]
	ldrb r1, [r4, #2]
	cmp r0, r1
	bhi _08002B62
	adds r0, r5, #0
	bl StopMusic
_08002B38:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_45a8
	cmp r6, #0
	beq _08002B62
	ldrb r1, [r5, #0x1c]
	cmp r1, #0
	bne _08002B62
	movs r0, #1
	strb r0, [r5, #0x1c]
	movs r0, #0x22
	strb r0, [r5]
	movs r4, #0
	strh r1, [r5, #6]
	ldr r0, _08002B68 @ =0x0000FFFF
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #8]
	strb r4, [r5, #0x1c]
_08002B62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002B68: .4byte 0x0000FFFF

	thumb_func_start unk_2b6c
unk_2b6c: @ 0x08002B6C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r5, [r4, #0x1c]
	cmp r5, #0
	bne _08002B98
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _08002B96
	movs r0, #0x22
	strb r0, [r4]
	strh r5, [r4, #6]
	ldr r0, _08002BA0 @ =0x0000FFFF
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r4, #8]
_08002B96:
	strb r5, [r4, #0x1c]
_08002B98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002BA0: .4byte 0x0000FFFF

	thumb_func_start unk_2ba4
unk_2ba4: @ 0x08002BA4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x18]
	ldrh r0, [r3, #6]
	ldrh r1, [r3, #8]
	adds r1, r0, r1
	ldr r0, _08002C0C @ =0x0000FFFF
	cmp r1, r0
	bgt _08002C14
	strh r1, [r3, #6]
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08002BEC
	ldrh r0, [r3, #0x26]
	ldrh r1, [r3, #0x24]
	adds r0, r0, r1
	strh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	cmp r0, #0
	beq _08002BE4
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r3, #0x24]
	ldr r0, _08002C10 @ =0x00000FFF
	ands r0, r1
	strh r0, [r3, #0x24]
_08002BE4:
	adds r1, r3, #0
	adds r1, #0x23
	movs r0, #0
	strb r0, [r1]
_08002BEC:
	ldrb r1, [r3, #1]
	cmp r1, #0
	ble _08002C32
	movs r4, #4
_08002BF4:
	ldrh r0, [r3, #6]
	lsrs r0, r0, #0xa
	strb r0, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002BF4
	b _08002C32
	.align 2, 0
_08002C0C: .4byte 0x0000FFFF
_08002C10: .4byte 0x00000FFF
_08002C14:
	ldrb r1, [r3, #1]
	cmp r1, #0
	ble _08002C2E
	movs r5, #0x40
	movs r4, #4
_08002C1E:
	strb r5, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002C1E
_08002C2E:
	movs r0, #2
	strb r0, [r3]
_08002C32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_2c38
unk_2c38: @ 0x08002C38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _08002CC0 @ =gMusicInfo
	ldrb r1, [r0, #1]
	mov sl, r0
	cmp r1, #0
	bne _08002D48
	movs r4, #1
	strb r4, [r0, #1]
	ldr r3, _08002CC4 @ =0x080A8CDC
	ldr r2, _08002CC8 @ =0x080A8D3C
	lsls r0, r5, #3
	adds r0, r0, r2
	mov ip, r0
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r6, [r0]
	lsls r0, r7, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r5, [r0]
	ldrb r0, [r6, #0x1c]
	cmp r0, #0
	bne _08002D42
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	bne _08002D42
	strb r4, [r6, #0x1c]
	strb r4, [r5, #0x1c]
	ldrb r1, [r5]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08002D38
	movs r0, #0xf8
	mov r8, r0
	ands r0, r1
	mov r8, r0
	cmp r0, #0
	bne _08002D38
	mov r1, ip
	ldr r7, [r1]
	ldrb r0, [r7]
	cmp r0, #0
	bne _08002CCC
	adds r0, r6, #0
	bl ResetTrack
	b _08002D38
	.align 2, 0
_08002CC0: .4byte gMusicInfo
_08002CC4: .4byte 0x080A8CDC
_08002CC8: .4byte 0x080A8D3C
_08002CCC:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08002CE4
	ldrb r0, [r6, #3]
	ldrb r1, [r7, #2]
	cmp r0, r1
	bhi _08002D38
	adds r0, r6, #0
	bl ResetTrack
_08002CE4:
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _08002D58 @ =0x0000FFFF
	strh r0, [r5, #6]
	mov r1, sb
	bl __divsi3
	movs r4, #0
	strh r0, [r5, #8]
	mov r1, sl
	ldrb r0, [r1, #5]
	lsls r0, r0, #0xc
	mov r1, sb
	bl __divsi3
	strh r0, [r5, #0x26]
	mov r0, r8
	strh r0, [r5, #0x24]
	mov r1, sl
	ldrb r0, [r1, #5]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	bl unk_45a8
	movs r0, #0x42
	strb r0, [r6]
	mov r0, r8
	strh r0, [r6, #6]
	ldrh r0, [r5, #8]
	strh r0, [r6, #8]
	ldrh r0, [r5, #0x26]
	strh r0, [r6, #0x26]
	mov r1, r8
	strh r1, [r6, #0x24]
	adds r0, r6, #0
	adds r0, #0x22
	strb r4, [r0]
_08002D38:
	movs r0, #0
	strb r0, [r6, #0x1c]
	strb r0, [r5, #0x1c]
	ldr r0, _08002D5C @ =gMusicInfo
	mov sl, r0
_08002D42:
	movs r0, #0
	mov r1, sl
	strb r0, [r1, #1]
_08002D48:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002D58: .4byte 0x0000FFFF
_08002D5C: .4byte gMusicInfo

	thumb_func_start unk_2d60
unk_2d60: @ 0x08002D60
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002D8A
	movs r0, #1
	strb r0, [r4, #0x1c]
	lsrs r1, r1, #0x18
	ldrh r0, [r4, #0xa]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #8
	movs r1, #0x96
	bl __divsi3
	movs r1, #0
	strh r0, [r4, #0xc]
	strb r1, [r4, #0x1c]
_08002D8A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_2d90
unk_2d90: @ 0x08002D90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002DE4
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #0
	bne _08002DE0
	ldr r3, [r4, #0x18]
	movs r0, #0xff
	lsls r0, r0, #2
	ands r0, r2
	lsrs r2, r0, #2
	ldrb r0, [r4, #1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08002DE0
	movs r6, #1
	movs r5, #4
_08002DC6:
	adds r0, r7, #0
	asrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _08002DD8
	strb r2, [r3, #5]
	ldrb r0, [r3]
	orrs r0, r5
	strb r0, [r3]
_08002DD8:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bge _08002DC6
_08002DE0:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002DE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2dec
unk_2dec: @ 0x08002DEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002E3C
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r3, [r4, #0x18]
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002E38
	mov ip, r0
	lsls r0, r2, #0x10
	asrs r5, r0, #0x18
	movs r6, #8
_08002E1A:
	mov r0, sb
	asrs r0, r1
	mov r7, ip
	ands r0, r7
	cmp r0, #0
	beq _08002E30
	strb r5, [r3, #0x1d]
	strb r2, [r3, #0x1f]
	ldrb r0, [r3]
	orrs r0, r6
	strb r0, [r3]
_08002E30:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bgt _08002E1A
_08002E38:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002E3C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_2e48
unk_2e48: @ 0x08002E48
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002E8C
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r3, [r4, #0x18]
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002E88
	movs r7, #1
	lsls r0, r2, #0x18
	asrs r2, r0, #0x19
	movs r5, #4
_08002E6E:
	adds r0, r6, #0
	asrs r0, r1
	ands r0, r7
	cmp r0, #0
	beq _08002E80
	strb r2, [r3, #7]
	ldrb r0, [r3]
	orrs r0, r5
	strb r0, [r3]
_08002E80:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bgt _08002E6E
_08002E88:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002E8C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2e94
unk_2e94: @ 0x08002E94
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002ED0
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	movs r0, #0x7f
	ands r2, r0
	ldrb r3, [r4, #1]
	cmp r3, #0
	ble _08002ECC
	movs r5, #1
_08002EB8:
	adds r0, r6, #0
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _08002EC4
	strb r2, [r1, #0x11]
_08002EC4:
	subs r3, #1
	adds r1, #0x50
	cmp r3, #0
	bgt _08002EB8
_08002ECC:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002ED0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2ed8
unk_2ed8: @ 0x08002ED8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002F14
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	movs r0, #0x7f
	ands r2, r0
	ldrb r3, [r4, #1]
	cmp r3, #0
	ble _08002F10
	movs r5, #1
_08002EFC:
	adds r0, r6, #0
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _08002F08
	strb r2, [r1, #0x10]
_08002F08:
	subs r3, #1
	adds r1, #0x50
	cmp r3, #0
	bgt _08002EFC
_08002F10:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002F14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DmaTransfer
DmaTransfer: @ 0x08002F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r7, _08002F4C @ =0x040000B0
	adds r2, r0, r7
	cmp r1, #0x20
	bne _08002F50
	movs r0, #0x80
	lsls r0, r0, #0x13
	b _08002F52
	.align 2, 0
_08002F4C: .4byte 0x040000B0
_08002F50:
	movs r0, #0
_08002F52:
	str r0, [sp]
	lsls r0, r4, #1
	movs r7, #0x80
	lsls r7, r7, #4
	mov ip, r7
	lsrs r1, r1, #4
	mov sl, r1
	asrs r7, r1
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov r8, r1
	orrs r7, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	mov sb, r0
_08002F70:
	cmp r3, ip
	bls _08002FAC
	str r5, [r2]
	str r6, [r2, #4]
	ldr r0, [sp]
	orrs r0, r7
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002FA4 @ =0x040000B0
	add r1, sb
	ldr r0, [r1, #8]
	mov r4, r8
	ands r0, r4
	cmp r0, #0
	beq _08002F9A
	movs r4, #0x80
	lsls r4, r4, #0x18
_08002F92:
	ldr r0, [r1, #8]
	ands r0, r4
	cmp r0, #0
	bne _08002F92
_08002F9A:
	ldr r0, _08002FA8 @ =0xFFFFF800
	adds r3, r3, r0
	add r5, ip
	add r6, ip
	b _08002F70
	.align 2, 0
_08002FA4: .4byte 0x040000B0
_08002FA8: .4byte 0xFFFFF800
_08002FAC:
	str r5, [r2]
	str r6, [r2, #4]
	mov r1, sl
	lsrs r3, r1
	mov r4, r8
	orrs r3, r4
	ldr r0, [sp]
	orrs r0, r3
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002FE8 @ =0x040000B0
	add r1, sb
	ldr r0, [r1, #8]
	ands r0, r4
	cmp r0, #0
	beq _08002FD8
	movs r2, #0x80
	lsls r2, r2, #0x18
_08002FD0:
	ldr r0, [r1, #8]
	ands r0, r2
	cmp r0, #0
	bne _08002FD0
_08002FD8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FE8: .4byte 0x040000B0

	thumb_func_start BitFill
BitFill: @ 0x08002FEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp, #4]
	adds r6, r2, #0
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r5, _0800301C @ =0x040000B0
	adds r2, r0, r5
	cmp r1, #0x20
	bne _08003020
	movs r0, #0x80
	lsls r0, r0, #0x13
	b _08003022
	.align 2, 0
_0800301C: .4byte 0x040000B0
_08003020:
	movs r0, #0
_08003022:
	str r0, [sp]
	lsls r0, r4, #1
	movs r5, #0x80
	lsls r5, r5, #4
	mov sb, r5
	add r7, sp, #4
	lsrs r1, r1, #4
	mov r8, r1
	asrs r5, r1
	movs r1, #0x81
	lsls r1, r1, #0x18
	orrs r5, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	mov ip, r0
	ldr r4, _08003060 @ =0x040000B0
	mov sl, r4
_08003044:
	cmp r3, sb
	bls _08003078
	str r7, [r2]
	str r6, [r2, #4]
	ldr r0, [sp]
	orrs r0, r5
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	add r1, sl
	ldr r0, [r1, #8]
	movs r4, #0x80
	lsls r4, r4, #0x18
	b _08003066
	.align 2, 0
_08003060: .4byte 0x040000B0
_08003064:
	ldr r0, [r1, #8]
_08003066:
	ands r0, r4
	cmp r0, #0
	bne _08003064
	ldr r0, _08003074 @ =0xFFFFF800
	adds r3, r3, r0
	add r6, sb
	b _08003044
	.align 2, 0
_08003074: .4byte 0xFFFFF800
_08003078:
	str r7, [r2]
	str r6, [r2, #4]
	mov r1, r8
	lsrs r3, r1
	movs r4, #0x81
	lsls r4, r4, #0x18
	orrs r3, r4
	ldr r0, [sp]
	orrs r0, r3
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	add r1, sl
	ldr r0, [r1, #8]
	movs r5, #0x80
	lsls r5, r5, #0x18
	ands r0, r5
	cmp r0, #0
	beq _080030A8
	adds r2, r5, #0
_080030A0:
	ldr r0, [r1, #8]
	ands r0, r2
	cmp r0, #0
	bne _080030A0
_080030A8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DMA2InterruptCode
DMA2InterruptCode: @ 0x080030B8
	push {r4, lr}
	ldr r3, _08003100 @ =gMusicInfo
	ldrb r0, [r3, #0x10]
	adds r0, #1
	strb r0, [r3, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r3, #0xe]
	cmp r0, r1
	bne _080030F8
	ldr r0, _08003104 @ =0x040000C4
	ldr r1, _08003108 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	ldr r2, _0800310C @ =0x040000C6
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	strh r0, [r2]
	ldr r1, _08003110 @ =0x040000D2
	strh r0, [r1]
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r0, r4, #0
	strh r0, [r2]
	movs r2, #0xf6
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	strb r0, [r3, #0x10]
_080030F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003100: .4byte gMusicInfo
_08003104: .4byte 0x040000C4
_08003108: .4byte 0x84400004
_0800310C: .4byte 0x040000C6
_08003110: .4byte 0x040000D2

	thumb_func_start unk_3114
unk_3114: @ 0x08003114
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08003178 @ =gMusicInfo
	ldrb r4, [r5, #1]
	cmp r4, #0
	bne _08003170
	movs r0, #1
	strb r0, [r5, #1]
	ldr r0, _0800317C @ =0x04000064
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #5
	movs r2, #8
	strb r2, [r0]
	adds r0, #3
	strh r1, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r0, #9
	strb r2, [r0]
	adds r0, #3
	strh r1, [r0]
	adds r0, #0x48
	ldr r1, _08003180 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	subs r0, #0xa
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	str r4, [sp]
	ldr r0, _08003184 @ =0x00000C24
	adds r1, r5, r0
	ldr r2, _08003188 @ =0x05000300
	mov r0, sp
	bl CpuSet
	ldr r0, _0800318C @ =0x04000084
	strb r4, [r0]
	strb r4, [r5, #1]
_08003170:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003178: .4byte gMusicInfo
_0800317C: .4byte 0x04000064
_08003180: .4byte 0x84400004
_08003184: .4byte 0x00000C24
_08003188: .4byte 0x05000300
_0800318C: .4byte 0x04000084

	thumb_func_start unk_3190
unk_3190: @ 0x08003190
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, sp
	adds r1, #3
	movs r0, #0
	strb r0, [r1]
	cmp r2, #0
	bne _080031B2
	add r0, sp, #4
	strb r2, [r0]
	b _080031BA
_080031B2:
	add r1, sp, #4
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
_080031BA:
	mov r3, sp
	adds r3, #1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r2, [r3]
	ldr r1, _080031F8 @ =0x00000008
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r2, r0
	bls _080031D2
	b _0800331C
_080031D2:
	ldrb r0, [r3]
	movs r1, #0x4d
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080031E2
	b _08003304
_080031E2:
	ldrb r0, [r3]
	cmp r0, #0
	bne _08003210
	ldr r0, _080031FC @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003204
	ldr r0, _08003200 @ =0x080A8CDC
	ldr r6, [r0, #0xc]
	b _0800321E
	.align 2, 0
_080031F8: .4byte 0x00000008
_080031FC: .4byte gMusicInfo
_08003200: .4byte 0x080A8CDC
_08003204:
	ldr r1, _0800320C @ =0x080A8CDC
	ldr r6, [r1]
	b _0800321E
	.align 2, 0
_0800320C: .4byte 0x080A8CDC
_08003210:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0800332C @ =0x080A8CDC
	adds r0, r0, r2
	ldr r6, [r0]
_0800321E:
	ldrb r0, [r6, #0x1c]
	cmp r0, #0
	bne _08003304
	ldrb r0, [r6, #0x1c]
	movs r4, #1
	strb r4, [r6, #0x1c]
	ldrb r0, [r6, #0x1e]
	adds r2, r4, #0
	ands r2, r0
	cmp r2, #0
	bne _080032FC
	ldrb r1, [r6]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080032FC
	mov r1, sp
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08003252
	ldrb r1, [r6, #0x1e]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080032FC
_08003252:
	ldrb r0, [r6, #0x1e]
	strb r4, [r6, #0x1e]
	mov r0, sp
	strb r2, [r0]
	ldr r4, [r6, #0x18]
	ldrb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r1, r0
	bhs _080032FC
	movs r2, #2
	add r2, sp
	mov sb, r2
	mov r8, sp
_0800326C:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xc0
	ands r0, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sl, r1
	cmp r0, #0
	bne _080032EA
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0800329A
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	subs r0, #1
	mov r2, sb
	strb r0, [r2]
	ldr r0, [r4, #0x4c]
	ldrb r1, [r2]
	bl ClearRegistersForPsg
_0800329A:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _080032EA
	ldr r4, [r4, #0x48]
	cmp r4, #0
	beq _080032EA
	ldr r3, _08003330 @ =0x03003504
	mov r5, sp
	adds r5, #3
	movs r7, #0
_080032AE:
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	str r4, [r0]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #4
	adds r1, r4, #0
	movs r2, #0x34
	str r3, [sp, #8]
	bl memcpy
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	strb r7, [r4]
	str r7, [r4, #0x28]
	ldr r0, [r4, #0x30]
	str r7, [r4, #0x30]
	str r7, [r4, #0x2c]
	adds r4, r0, #0
	ldr r3, [sp, #8]
	cmp r4, #0
	bne _080032AE
_080032EA:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r4, sl
	ldrb r1, [r1]
	ldrb r0, [r6, #1]
	cmp r1, r0
	blo _0800326C
_080032FC:
	ldrb r0, [r6, #0x1c]
	movs r0, #0
	strb r0, [r6, #0x1c]
	ldr r4, _08003334 @ =0x00000008
_08003304:
	mov r2, sp
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	mov r3, sp
	adds r3, #1
	ldrb r1, [r3]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _0800331C
	b _080031D2
_0800331C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800332C: .4byte 0x080A8CDC
_08003330: .4byte 0x03003504
_08003334: .4byte 0x00000008

	thumb_func_start unk_3338
unk_3338: @ 0x08003338
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, sp
	adds r1, #3
	movs r0, #0
	strb r0, [r1]
	cmp r2, #0
	bne _0800335A
	add r0, sp, #4
	strb r2, [r0]
	b _08003362
_0800335A:
	add r1, sp, #4
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
_08003362:
	mov r3, sp
	adds r3, #1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r2, [r3]
	ldr r1, _080033A4 @ =0x00000008
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r2, r0
	bls _0800337A
	b _0800347A
_0800337A:
	ldr r0, _080033A8 @ =0x080A8CDC
	mov sl, r0
_0800337E:
	ldrb r0, [r3]
	movs r1, #0x4d
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08003464
	ldrb r0, [r3]
	cmp r0, #0
	bne _080033B4
	ldr r0, _080033AC @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080033B0
	mov r1, sl
	ldr r6, [r1, #0xc]
	b _080033C0
	.align 2, 0
_080033A4: .4byte 0x00000008
_080033A8: .4byte 0x080A8CDC
_080033AC: .4byte gMusicInfo
_080033B0:
	mov r0, sl
	b _080033BE
_080033B4:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
_080033BE:
	ldr r6, [r0]
_080033C0:
	ldrb r0, [r6, #0x1c]
	adds r2, r0, #0
	cmp r2, #0
	bne _08003464
	ldrb r0, [r6, #0x1c]
	movs r3, #0
	movs r0, #1
	strb r0, [r6, #0x1c]
	ldrb r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _0800345C
	ldrb r1, [r6, #0x1e]
	movs r0, #0xfe
	ands r0, r1
	ldrb r1, [r6, #0x1e]
	strb r0, [r6, #0x1e]
	ldrb r1, [r6, #0x1e]
	movs r0, #2
	orrs r1, r0
	ldrb r0, [r6, #0x1e]
	orrs r1, r3
	strb r1, [r6, #0x1e]
	mov r0, sp
	strb r2, [r0]
	ldr r2, [r6, #0x18]
	ldrb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r1, r0
	bhs _0800345C
	mov r7, sp
_080033FE:
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	movs r1, #0x50
	adds r1, r1, r2
	mov r8, r1
	cmp r0, #0
	bne _0800344C
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _0800344C
	ldr r4, [r2, #0x48]
	cmp r4, #0
	beq _0800344C
	ldr r0, _0800348C @ =0x03003504
	mov sb, r0
	mov r5, sp
	adds r5, #3
_08003426:
	adds r0, r4, #0
	bl unk_1e14
	ldrb r0, [r5]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	add r1, sb
	adds r1, #4
	adds r0, r4, #0
	movs r2, #0x34
	bl memcpy
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r4, [r4, #0x30]
	cmp r4, #0
	bne _08003426
_0800344C:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	mov r2, r8
	ldrb r1, [r7]
	ldrb r0, [r6, #1]
	cmp r1, r0
	blo _080033FE
_0800345C:
	ldrb r0, [r6, #0x1c]
	movs r0, #0
	strb r0, [r6, #0x1c]
	ldr r4, _08003490 @ =0x00000008
_08003464:
	mov r1, sp
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	mov r3, sp
	adds r3, #1
	ldrb r1, [r3]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bls _0800337E
_0800347A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800348C: .4byte 0x03003504
_08003490: .4byte 0x00000008

	thumb_func_start Music_Empty2
Music_Empty2: @ 0x08003494
	bx lr
	.align 2, 0

	thumb_func_start CheckSetNewMusicTrack
CheckSetNewMusicTrack: @ 0x08003498
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, _080034E4 @ =gMusicInfo
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _080034DC
	cmp r4, #0xc
	beq _080034DC
	ldrb r6, [r5, #1]
	cmp r6, #0
	bne _080034DC
	movs r0, #1
	strb r0, [r5, #1]
	ldr r0, _080034E8 @ =0x080A8CDC
	ldr r2, [r0]
	cmp r4, #0
	bne _080034C2
	ldr r4, _080034EC @ =0x000001F7
_080034C2:
	ldr r1, _080034F0 @ =0x080A8D3C
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	beq _080034DA
	adds r0, r2, #0
	movs r1, #0x1e
	bl ApplyMusicSoundFading
	strh r4, [r5, #0x22]
_080034DA:
	strb r6, [r5, #1]
_080034DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080034E4: .4byte gMusicInfo
_080034E8: .4byte 0x080A8CDC
_080034EC: .4byte 0x000001F7
_080034F0: .4byte 0x080A8D3C

	thumb_func_start CheckPlayNewMusicTrack
CheckPlayNewMusicTrack: @ 0x080034F4
	push {r4, r5, lr}
	ldr r4, _0800352C @ =gMusicInfo
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	cmp r5, #0
	bne _08003526
	ldrh r0, [r4, #0x22]
	cmp r0, #0
	beq _08003526
	ldr r0, _08003530 @ =0x080A8CDC
	ldr r0, [r0]
	ldr r2, _08003534 @ =0x080A8D3C
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	bl unk_45a8
	adds r0, r4, #0
	adds r0, #0x20
	strb r5, [r0]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x1c]
	strh r5, [r4, #0x22]
_08003526:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800352C: .4byte gMusicInfo
_08003530: .4byte 0x080A8CDC
_08003534: .4byte 0x080A8D3C

	thumb_func_start PlayMusic
PlayMusic: @ 0x08003538
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _08003594 @ =gMusicInfo
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _0800354C
	b _080036B0
_0800354C:
	movs r0, #1
	strb r0, [r2, #1]
	adds r0, r2, #0
	adds r0, #0x21
	strb r3, [r0]
	ldr r0, _08003598 @ =0x080A8D3C
	lsls r1, r5, #3
	adds r0, r1, r0
	ldr r6, [r0]
	adds r7, r1, #0
	cmp r3, #0
	beq _08003630
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080035A0
	ldr r3, _0800359C @ =0x080A8CDC
	ldrh r2, [r2, #0x1c]
	cmp r5, r2
	bne _08003584
	ldr r0, [r3]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08003584
	b _080036AA
_08003584:
	ldr r0, [r3, #0xc]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _080035C4
	b _080035C8
	.align 2, 0
_08003594: .4byte gMusicInfo
_08003598: .4byte 0x080A8D3C
_0800359C: .4byte 0x080A8CDC
_080035A0:
	ldr r3, _080035EC @ =0x080A8CDC
	ldrh r2, [r2, #0x1e]
	cmp r5, r2
	bne _080035B4
	ldr r0, [r3, #0xc]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080036AA
_080035B4:
	ldr r0, [r3]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
_080035C4:
	cmp r1, #0
	bne _080035F4
_080035C8:
	ldr r4, [r3]
	ldr r3, [r3, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _080035DC
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_080035DC:
	ldr r2, _080035F0 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
	b _08003614
	.align 2, 0
_080035EC: .4byte 0x080A8CDC
_080035F0: .4byte gMusicInfo
_080035F4:
	ldr r4, [r3, #0xc]
	ldr r3, [r3]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003608
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_08003608:
	ldr r2, _0800362C @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	strh r5, [r2, #0x1e]
_08003614:
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800369C
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800369C
	adds r0, r3, #0
	bl StopMusic
	b _0800369C
	.align 2, 0
_0800362C: .4byte gMusicInfo
_08003630:
	ldrh r2, [r2, #0x1c]
	cmp r5, r2
	bne _0800365E
	ldr r0, _08003650 @ =0x080A8CDC
	ldr r2, [r0]
	ldrb r1, [r2, #0x1e]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08003654
	adds r0, r2, #0
	bl StopMusic
	b _0800365E
	.align 2, 0
_08003650: .4byte 0x080A8CDC
_08003654:
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080036AA
_0800365E:
	ldr r0, _080036B8 @ =0x080A8CDC
	ldr r4, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003674
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_08003674:
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800368A
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800368A
	adds r0, r3, #0
	bl StopMusic
_0800368A:
	ldr r0, _080036BC @ =0x080A8D3C
	adds r0, r7, r0
	ldr r6, [r0]
	ldr r2, _080036C0 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
_0800369C:
	ldr r1, _080036C0 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl unk_45a8
_080036AA:
	ldr r1, _080036C0 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080036B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036B8: .4byte 0x080A8CDC
_080036BC: .4byte 0x080A8D3C
_080036C0: .4byte gMusicInfo

	thumb_func_start unk_36c4
unk_36c4: @ 0x080036C4
	push {lr}
	ldr r0, _080036D8 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080036E0
	ldr r0, _080036DC @ =0x080A8CDC
	ldr r0, [r0]
	b _080036E4
	.align 2, 0
_080036D8: .4byte gMusicInfo
_080036DC: .4byte 0x080A8CDC
_080036E0:
	ldr r0, _080036EC @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_080036E4:
	bl StopMusic
	pop {r0}
	bx r0
	.align 2, 0
_080036EC: .4byte 0x080A8CDC

	thumb_func_start FadeMusic
FadeMusic: @ 0x080036F0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08003708 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003710
	ldr r0, _0800370C @ =0x080A8CDC
	ldr r0, [r0]
	b _08003714
	.align 2, 0
_08003708: .4byte gMusicInfo
_0800370C: .4byte 0x080A8CDC
_08003710:
	ldr r0, _08003720 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003714:
	cmp r1, #0
	beq _08003724
	bl ApplyMusicSoundFading
	b _08003728
	.align 2, 0
_08003720: .4byte 0x080A8CDC
_08003724:
	bl StopMusic
_08003728:
	pop {r0}
	bx r0

	thumb_func_start unk_372c
unk_372c: @ 0x0800372C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r3, #0
	bne _08003748
	adds r0, r1, #0
	adds r1, r2, #0
	bl PlayMusic
	b _0800376E
_08003748:
	ldr r0, _08003758 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003760
	ldr r0, _0800375C @ =0x080A8CDC
	ldr r0, [r0]
	b _08003764
	.align 2, 0
_08003758: .4byte gMusicInfo
_0800375C: .4byte 0x080A8CDC
_08003760:
	ldr r0, _08003774 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003764:
	strh r1, [r0, #0x20]
	strb r2, [r0, #0x1f]
	adds r1, r3, #0
	bl ApplyMusicSoundFading
_0800376E:
	pop {r0}
	bx r0
	.align 2, 0
_08003774: .4byte 0x080A8CDC

	thumb_func_start unk_3778
unk_3778: @ 0x08003778
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _080037D4 @ =gMusicInfo
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08003790
	b _0800389C
_08003790:
	movs r0, #1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x21
	strb r2, [r0]
	ldr r1, _080037D8 @ =0x080A8D3C
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r6, [r0]
	cmp r2, #0
	beq _0800380C
	adds r0, r3, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080037E0
	ldr r2, _080037DC @ =0x080A8CDC
	ldrh r3, [r3, #0x1c]
	cmp r5, r3
	bne _080037C4
	ldr r0, [r2]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_080037C4:
	ldr r0, [r2, #0xc]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _08003822
	b _08003826
	.align 2, 0
_080037D4: .4byte gMusicInfo
_080037D8: .4byte 0x080A8D3C
_080037DC: .4byte 0x080A8CDC
_080037E0:
	ldr r2, _08003808 @ =0x080A8CDC
	ldrh r3, [r3, #0x1e]
	cmp r5, r3
	bne _080037F4
	ldr r0, [r2, #0xc]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_080037F4:
	ldr r0, [r2]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
	b _08003822
	.align 2, 0
_08003808: .4byte 0x080A8CDC
_0800380C:
	ldr r2, _08003848 @ =0x080A8CDC
	ldrh r3, [r3, #0x1c]
	cmp r5, r3
	bne _08003820
	ldr r0, [r2]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_08003820:
	movs r1, #0
_08003822:
	cmp r1, #0
	bne _08003850
_08003826:
	ldr r4, [r2]
	ldr r3, [r2, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _0800383A
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _08003896
_0800383A:
	ldr r2, _0800384C @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
	b _08003870
	.align 2, 0
_08003848: .4byte 0x080A8CDC
_0800384C: .4byte gMusicInfo
_08003850:
	ldr r4, [r2, #0xc]
	ldr r3, [r2]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003864
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _08003896
_08003864:
	ldr r2, _080038A4 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	strh r5, [r2, #0x1e]
_08003870:
	ldrb r0, [r3]
	cmp r0, #1
	bls _08003886
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003886
	adds r0, r3, #0
	bl StopMusic
_08003886:
	ldr r1, _080038A4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl unk_2b08
_08003896:
	ldr r1, _080038A4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_0800389C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080038A4: .4byte gMusicInfo

	thumb_func_start unk_38a8
unk_38a8: @ 0x080038A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	str r6, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r5, _08003908 @ =gMusicInfo
	ldrb r7, [r5, #1]
	cmp r7, #0
	bne _080039B2
	movs r0, #1
	mov sb, r0
	mov r1, sb
	strb r1, [r5, #1]
	ldr r1, _0800390C @ =0x080A8D3C
	lsls r0, r6, #3
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	bne _080038EA
	movs r0, #1
	bl unk_3190
	bl unk_27a8
_080038EA:
	mov r1, r8
	cmp r1, #2
	bne _08003928
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003914
	ldr r0, _08003910 @ =0x080A8CDC
	ldr r4, [r0]
	adds r3, r4, #0
	strb r7, [r1]
	strh r6, [r5, #0x1c]
	b _0800398C
	.align 2, 0
_08003908: .4byte gMusicInfo
_0800390C: .4byte 0x080A8D3C
_08003910: .4byte 0x080A8CDC
_08003914:
	ldr r0, _08003924 @ =0x080A8CDC
	ldr r4, [r0, #0xc]
	adds r3, r4, #0
	mov r0, sb
	strb r0, [r1]
	strh r6, [r5, #0x1e]
	b _0800398C
	.align 2, 0
_08003924: .4byte 0x080A8CDC
_08003928:
	adds r2, r5, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0
	bne _0800395C
	ldr r0, _08003958 @ =0x080A8CDC
	ldr r4, [r0, #0xc]
	ldr r3, [r0]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003948
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _080039AC
_08003948:
	mov r1, sb
	strb r1, [r2]
	mov r0, r8
	cmp r0, #0
	beq _08003980
	strh r6, [r5, #0x1e]
	b _08003980
	.align 2, 0
_08003958: .4byte 0x080A8CDC
_0800395C:
	ldr r0, _080039C4 @ =0x080A8CDC
	ldr r4, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003972
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _080039AC
_08003972:
	strb r7, [r2]
	mov r1, r8
	cmp r1, #0
	beq _08003980
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
_08003980:
	adds r2, r4, #0
	adds r2, #0x28
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_0800398C:
	mov r1, r8
	cmp r1, #0
	beq _0800399E
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800399E
	adds r0, r3, #0
	bl StopMusic
_0800399E:
	ldr r1, _080039C8 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	mov r1, sl
	bl unk_45a8
_080039AC:
	ldr r1, _080039C8 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080039B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039C4: .4byte 0x080A8CDC
_080039C8: .4byte gMusicInfo

	thumb_func_start unk_39cc
unk_39cc: @ 0x080039CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _080039FC @ =gMusicInfo
	ldrb r5, [r4, #1]
	cmp r5, #0
	bne _08003A6C
	movs r6, #1
	strb r6, [r4, #1]
	movs r0, #1
	bl unk_3338
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0
	bne _08003A04
	ldr r0, _08003A00 @ =0x080A8CDC
	ldr r7, [r0, #0xc]
	ldr r1, [r0]
	strb r6, [r2]
	ldrh r4, [r4, #0x1e]
	b _08003A0E
	.align 2, 0
_080039FC: .4byte gMusicInfo
_08003A00: .4byte 0x080A8CDC
_08003A04:
	ldr r0, _08003A78 @ =0x080A8CDC
	ldr r7, [r0]
	ldr r1, [r0, #0xc]
	strb r5, [r2]
	ldrh r4, [r4, #0x1c]
_08003A0E:
	ldrb r0, [r1]
	cmp r0, #1
	bls _08003A1A
	adds r0, r1, #0
	bl StopMusic
_08003A1A:
	ldr r1, _08003A7C @ =0x080A8D3C
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r6, _08003A80 @ =gMusicInfo
	movs r0, #0
	mov r8, r0
	mov r0, r8
	strb r0, [r6, #1]
	adds r0, r7, #0
	bl unk_45a8
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _08003A3C
	bl SoundPlay
_08003A3C:
	ldrb r1, [r6, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08003A68
	ldr r4, _08003A78 @ =0x080A8CDC
	ldr r0, [r4]
	ldr r5, _08003A84 @ =0x0000FFFF
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
_08003A68:
	mov r0, r8
	strb r0, [r6, #1]
_08003A6C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A78: .4byte 0x080A8CDC
_08003A7C: .4byte 0x080A8D3C
_08003A80: .4byte gMusicInfo
_08003A84: .4byte 0x0000FFFF

	thumb_func_start unk_3a88
unk_3a88: @ 0x08003A88
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08003AA0 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003AA8
	ldr r0, _08003AA4 @ =0x080A8CDC
	ldr r0, [r0]
	b _08003AAC
	.align 2, 0
_08003AA0: .4byte gMusicInfo
_08003AA4: .4byte 0x080A8CDC
_08003AA8:
	ldr r0, _08003AB8 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003AAC:
	cmp r1, #0
	beq _08003ABC
	bl ApplyMusicSoundFading
	b _08003AC0
	.align 2, 0
_08003AB8: .4byte 0x080A8CDC
_08003ABC:
	bl StopMusic
_08003AC0:
	pop {r0}
	bx r0

	thumb_func_start unk_3ac4
unk_3ac4: @ 0x08003AC4
	push {r4, r5, lr}
	ldr r0, _08003AE8 @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08003B0C
	movs r4, #1
	strb r4, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x20
	ldrb r1, [r2]
	cmp r1, #0
	bne _08003AF0
	ldr r0, _08003AEC @ =0x080A8CDC
	ldr r3, [r0]
	strb r1, [r2]
	ldrh r0, [r5, #0x1c]
	b _08003AF8
	.align 2, 0
_08003AE8: .4byte gMusicInfo
_08003AEC: .4byte 0x080A8CDC
_08003AF0:
	ldr r0, _08003B14 @ =0x080A8CDC
	ldr r3, [r0, #0xc]
	strb r4, [r2]
	ldrh r0, [r5, #0x1e]
_08003AF8:
	ldr r1, _08003B18 @ =0x080A8D3C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r5, #1]
	adds r0, r3, #0
	bl unk_45a8
	strb r4, [r5, #1]
_08003B0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003B14: .4byte 0x080A8CDC
_08003B18: .4byte 0x080A8D3C

	thumb_func_start SoundPlay_3b1c
SoundPlay_3b1c: @ 0x08003B1C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _08003B40 @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r6, r0, #0
	cmp r1, #0
	bne _08003B68
	movs r0, #1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003B48
	ldr r0, _08003B44 @ =0x080A8CDC
	ldr r5, [r0, #0xc]
	b _08003B4C
	.align 2, 0
_08003B40: .4byte gMusicInfo
_08003B44: .4byte 0x080A8CDC
_08003B48:
	ldr r0, _08003B70 @ =0x080A8CDC
	ldr r5, [r0]
_08003B4C:
	ldr r1, _08003B74 @ =0x080A8D3C
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r6, #1]
	adds r0, r5, #0
	bl unk_45a8
	ldrb r1, [r5, #0x1e]
	movs r0, #2
	orrs r0, r1
	strb r0, [r5, #0x1e]
	strb r4, [r6, #1]
_08003B68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003B70: .4byte 0x080A8CDC
_08003B74: .4byte 0x080A8D3C

	thumb_func_start unk_3b78
unk_3b78: @ 0x08003B78
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08003B9C @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08003BC6
	movs r0, #1
	strb r0, [r5, #1]
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003BA4
	ldr r0, _08003BA0 @ =0x080A8CDC
	ldr r2, [r0, #0xc]
	b _08003BA8
	.align 2, 0
_08003B9C: .4byte gMusicInfo
_08003BA0: .4byte 0x080A8CDC
_08003BA4:
	ldr r0, _08003BCC @ =0x080A8CDC
	ldr r2, [r0]
_08003BA8:
	adds r1, r0, #0
	ldrb r0, [r2]
	cmp r0, #2
	bne _08003BB2
	ldr r2, [r1, #0x3c]
_08003BB2:
	ldr r1, _08003BD0 @ =0x080A8D3C
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r5, #1]
	adds r0, r2, #0
	bl unk_45a8
	strb r4, [r5, #1]
_08003BC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003BCC: .4byte 0x080A8CDC
_08003BD0: .4byte 0x080A8D3C

	thumb_func_start unk_3bd4
unk_3bd4: @ 0x08003BD4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r2, #0x63
	bhi _08003BF2
	cmp r1, #0
	bne _08003C10
	adds r0, r2, #0
	movs r1, #1
	bl PlayMusic
	b _08003C10
_08003BF2:
	cmp r1, #0
	bne _08003C10
	adds r0, r2, #0
	subs r0, #0xaa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #9
	bhi _08003C0A
	adds r0, r2, #0
	bl SoundPlay_3b1c
	b _08003C10
_08003C0A:
	adds r0, r3, #0
	bl SoundPlay
_08003C10:
	pop {r0}
	bx r0

	thumb_func_start unk_3c14
unk_3c14: @ 0x08003C14
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #0x63
	bhi _08003C2C
	cmp r1, #0
	bne _08003C30
	bl unk_36c4
	b _08003C30
_08003C2C:
	bl SoundStop
_08003C30:
	pop {r0}
	bx r0

	thumb_func_start DecreaseMusicVolume
DecreaseMusicVolume: @ 0x08003C34
	push {r4, r5, r6, lr}
	movs r0, #0
	bl unk_3190
	ldr r2, _08003C74 @ =gMusicInfo
	ldrb r1, [r2, #0xb]
	movs r0, #0x81
	orrs r0, r1
	strb r0, [r2, #0xb]
	ldr r5, _08003C78 @ =0x080A8CDC
	ldr r0, [r5]
	ldr r6, _08003C7C @ =0x0000FFFF
	ldr r4, _08003C80 @ =0x00000050
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	ldr r0, [r5, #0x54]
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003C74: .4byte gMusicInfo
_08003C78: .4byte 0x080A8CDC
_08003C7C: .4byte 0x0000FFFF
_08003C80: .4byte 0x00000050

	thumb_func_start ResetMusicVolume
ResetMusicVolume: @ 0x08003C84
	push {r4, r5, r6, lr}
	ldr r4, _08003CC8 @ =0x080A8CDC
	ldr r0, [r4]
	ldr r5, _08003CCC @ =0x0000FFFF
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r2, _08003CD0 @ =gMusicInfo
	ldrb r1, [r2, #0xb]
	movs r0, #0x7f
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xb]
	movs r0, #0
	bl unk_3338
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003CC8: .4byte 0x080A8CDC
_08003CCC: .4byte 0x0000FFFF
_08003CD0: .4byte gMusicInfo

	thumb_func_start unk_3cd4
unk_3cd4: @ 0x08003CD4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r5, _08003CF8 @ =gMusicInfo
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _08003CF2
	movs r0, #1
	strb r0, [r5, #1]
	movs r4, #0
	strh r1, [r5, #2]
	adds r0, r1, #0
	bl SoundPlay
	strb r4, [r5, #1]
_08003CF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003CF8: .4byte gMusicInfo

	thumb_func_start unk_3cfc
unk_3cfc: @ 0x08003CFC
	push {r4, r5, lr}
	ldr r5, _08003D20 @ =gMusicInfo
	ldrb r1, [r5, #1]
	cmp r1, #0
	bne _08003D1A
	movs r0, #1
	strb r0, [r5, #1]
	movs r4, #0
	strh r1, [r5, #2]
	ldr r0, _08003D24 @ =0x080A8CDC
	ldr r0, [r0, #0x54]
	movs r1, #0x1e
	bl ApplyMusicSoundFading
	strb r4, [r5, #1]
_08003D1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003D20: .4byte gMusicInfo
_08003D24: .4byte 0x080A8CDC

	thumb_func_start PlayCharacterAppearingSound
PlayCharacterAppearingSound: @ 0x08003D28
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0x21
	beq _08003D50
	cmp r1, #0x21
	bgt _08003D3E
	cmp r1, #1
	beq _08003D44
	b _08003D60
_08003D3E:
	cmp r0, #0x41
	beq _08003D5A
	b _08003D60
_08003D44:
	ldr r0, _08003D4C @ =0x000001F5
	bl SoundPlayNotAlreadyPlaying
	b _08003D60
	.align 2, 0
_08003D4C: .4byte 0x000001F5
_08003D50:
	movs r0, #0xfb
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _08003D60
_08003D5A:
	ldr r0, _08003D64 @ =0x000001F7
	bl SoundPlayNotAlreadyPlaying
_08003D60:
	pop {r0}
	bx r0
	.align 2, 0
_08003D64: .4byte 0x000001F7

	thumb_func_start CallSoundCodeB
CallSoundCodeB: @ 0x08003D68
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7, lr}
	add r4, pc, #0x0 @ =SoundCodeB
	bx r4

	arm_func_start SoundCodeB
SoundCodeB: @ 0x08003D78
	ldr r4, _08003E08 @ =gMusicInfo
	ldrb ip, [r4, #4]
	mov lr, #0x600
	b _08003D90
_08003D88:
	subs r3, r3, #1
	beq _08003DF8
_08003D90:
	ldrsb r6, [r0, lr]
	ldrsb r7, [r1, lr]
	ldrsb r4, [r0], #1
	ldrsb r5, [r1], #1
	ldrsb sl, [r0, lr]
	ldrsb fp, [r1, lr]
	ldrsb r8, [r0], #1
	ldrsb sb, [r1], #1
	add r6, r6, r4
	add r6, r6, r5
	add r6, r6, r7
	add r8, r8, sb
	add r8, r8, sl
	add r8, r8, fp
	mul r6, ip, r6
	mul r8, ip, r8
	asrs r6, r6, #9
	addmi r6, r6, #1
	asrs r8, r8, #9
	addmi r8, r8, #1
	lsl r6, r6, #7
	lsl r8, r8, #7
	mov r7, r6
	mov sb, r8
	stm r2!, {r6, r7, r8, sb}
	b _08003D88
_08003DF8:
	mov r0, r2
	pop {r8, sb, sl, fp, lr}
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08003E08: .4byte gMusicInfo

	thumb_func_start CallSoundCodeC
CallSoundCodeC: @ 0x08003E0C
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7, lr}
	add r4, pc, #0x0 @ =SoundCodeC
	bx r4

	arm_func_start SoundCodeC
SoundCodeC: @ 0x08003E1C
	mov r3, #0x600
	add r3, r0, r3
	mov ip, #0
	sub ip, ip, #1
	lsr ip, ip, #0x17
	ldr lr, _08003EB8 @ =0x080A548A
	b _08003E40
_08003E38:
	subs r2, r2, #1
	beq _08003EA8
_08003E40:
	ldm r1!, {r4, r5, r6, r7, r8, sb, sl, fp}
	and r4, ip, r4, lsr #7
	and r5, ip, r5, lsr #7
	and r6, ip, r6, lsr #7
	and r7, ip, r7, lsr #7
	and r8, ip, r8, lsr #7
	and sb, ip, sb, lsr #7
	and sl, ip, sl, lsr #7
	and fp, ip, fp, lsr #7
	ldrb r4, [lr, r4]
	ldrb r5, [lr, r5]
	ldrb r6, [lr, r6]
	ldrb r7, [lr, r7]
	ldrb r8, [lr, r8]
	ldrb sb, [lr, sb]
	ldrb sl, [lr, sl]
	ldrb fp, [lr, fp]
	orr r4, r4, r6, lsl #8
	orr r4, r4, r8, lsl #16
	orr r4, r4, sl, lsl #24
	str r4, [r0], #4
	orr r5, r5, r7, lsl #8
	orr r5, r5, sb, lsl #16
	orr r5, r5, fp, lsl #24
	str r5, [r3], #4
	b _08003E38
_08003EA8:
	mov r0, r1
	pop {r8, sb, sl, fp, lr}
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08003EB8: .4byte 0x080A548A

	thumb_func_start CallSoundCodeA
CallSoundCodeA: @ 0x08003EBC
	push {r4, r5, r6, r7}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	push {r3, r4, r5, r6, lr}
	add r4, pc, #0x0 @ =SoundCodeA
	bx r4

	arm_func_start SoundCodeA
SoundCodeA: @ 0x08003ECC
	ldr r12, [r0, #0x18]
	ldrb r11, [r0, #0x11]
	ldrb r10, [r0, #0x12]
	ldr r9, [r0, #0x24]
	ldr r3, [r0, #0x20]
	ldr r8, [r3, #0xc]
	ldrb r4, [r0, #1]
	cmp r4, #0x20
	beq _08004318
	cmp r4, #8
	beq _080041EC
	mov r7, #0
	sub r7, r7, #1
	lsr r7, r7, #0x12
	ldr r6, [r0, #0x1c]
	stmdb sp!, {r0}
	ldrh r0, [r3, #2]
	ldr lr, [r3, #8]
	sub lr, lr, r8
	b _08003F24
_08003F1C:
	subs r2, r2, #1
	beq _08004500
_08003F24:
	add r4, r12, r6, lsl #2
	subs r4, r8, r4, lsr #0xe
	bgt _08004128
	mov r5, r12, lsr #0xe
	ands r0, r0, r0
	bne _08004010
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	bge _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	bge _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	bge _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	b _080044F0
_08004010:
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	blt _08004058
	and r3, r12, r7
	add r5, r5, lr
	add r12, r3, r5, lsl #0xe
	b _08004158
_08004058:
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	blt _080040A0
	and r3, r12, r7
	add r5, r5, lr
	add r12, r3, r5, lsl #0xe
	b _08004188
_080040A0:
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, r8
	blt _080040E8
	and r3, r12, r7
	add r5, r5, lr
	add r12, r3, r5, lsl #0xe
	b _080041B8
_080040E8:
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	and r3, r12, r7
	add r5, r5, lr
	add r12, r3, r5, lsl #0xe
	b _08003F1C
_08004128:
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
_08004158:
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
_08004188:
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
_080041B8:
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	b _08003F1C
_080041EC:
	stmdb sp!, {r0}
	ldrh r7, [r3, #2]
	ldr r6, [r3, #8]
	b _08004204
_080041FC:
	subs r2, r2, #1
	beq _08004500
_08004204:
	add r4, r12, #4
	cmp r4, r8
	blt _080042C4
	ldsb r3, [r9, r12]
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, #1
	cmp r12, r8
	bne _0800423C
	ands r7, r7, r7
	beq _080044F0
	mov r12, r6
_0800423C:
	ldsb r3, [r9, r12]
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, #1
	cmp r12, r8
	bne _08004268
	ands r7, r7, r7
	beq _080044F0
	mov r12, r6
_08004268:
	ldsb r3, [r9, r12]
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, #1
	cmp r12, r8
	bne _08004294
	ands r7, r7, r7
	beq _080044F0
	mov r12, r6
_08004294:
	ldsb r3, [r9, r12]
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, #1
	cmp r12, r8
	bne _080041FC
	ands r7, r7, r7
	beq _080044F0
	mov r12, r6
	b _080041FC
_080042C4:
	ldmia r1, {r3, r4, r5, lr}
	ldsb r0, [r9, r12]
	mla r3, r0, r11, r3
	mla r4, r0, r10, r4
	add r12, r12, #1
	ldsb r0, [r9, r12]
	mla r5, r0, r11, r5
	mla lr, r0, r10, lr
	add r12, r12, #1
	stmia r1!, {r3, r4, r5, lr}
	ldmia r1, {r3, r4, r5, lr}
	ldsb r0, [r9, r12]
	mla r3, r0, r11, r3
	mla r4, r0, r10, r4
	add r12, r12, #1
	ldsb r0, [r9, r12]
	mla r5, r0, r11, r5
	mla lr, r0, r10, lr
	add r12, r12, #1
	stmia r1!, {r3, r4, r5, lr}
	b _080041FC
_08004318:
	mov r7, #0
	sub r7, r7, #1
	mov r4, r7
	mov r7, r7, lsr #0x12
	ldr r6, [r0, #0x1c]
	eor r6, r6, r4
	add r6, r6, #1
	stmdb sp!, {r0}
	ldrh r0, [r3, #2]
	b _08004348
_08004340:
	subs r2, r2, #1
	beq _08004500
_08004348:
	add r4, r12, r6, lsl #2
	movs r4, r4, asr #0xe
	bgt _0800442C
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, #0
	ble _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, #0
	ble _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	cmp r5, #0
	ble _080044F0
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	b _080044F0
_0800442C:
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	mov r5, r12, lsr #0xe
	ldsb r3, [r5, r9]!
	ldsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, r12, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #0xe
	ldmia r1, {r4, r5}
	mla r4, r3, r11, r4
	mla r5, r3, r10, r5
	stmia r1!, {r4, r5}
	add r12, r12, r6
	b _08004340
_080044F0:
	ldmia sp!, {r0}
	mov r4, #0
	strb r4, [r0, #0]
	b _08004508
_08004500:
	ldmia sp!, {r0}
	str r12, [r0, #0x18]
_08004508:
	pop {r8-r11, lr}
	pop {r4-r7}
	bx lr

	thumb_func_start CallGetNoteFrequency
CallGetNoteFrequency: @ 0x08004514
	add r2, pc, #0x0
	bx r2

	thumb_func_start GetNoteFrequency
GetNoteFrequency: @ 0x08004518
	movs r1, #0x90
	b _08004624
_0800451C:
	.byte 0x22, 0x29, 0xA0, 0xE1
	.byte 0x03, 0x37, 0xA0, 0xE1, 0x02, 0x30, 0x83, 0xE0, 0x00, 0x00, 0x83, 0xE2, 0x1E, 0xFF, 0x2F, 0xE1

	thumb_func_start unk_4530
unk_4530: @ 0x08004530
	add r0, pc, #0x0
	bx r0

	arm_func_start unk_4534
unk_4534: @ 0x08004534
	ldr r0, =gMusicInfo
	ldrb r1, [r0, #0x10]
	add r1, r1, #1
	ldrb r3, [r0, #0xe]
	cmp r1, r3
	bne lbl_08004594
	ldr r3, =0x80a568c
	ldr r3, [r3]
	ldr r12, =0x80a5690
	ldr r12, [r12]
	str r12, [r3]
	str r12, [r3, #0xc]
	nop
	mov r12, #0x50
	lsl r12, r12, #0x4
	strh r12, [r3, #0x2]
	strh r12, [r3, #0xe]
	mov r12, #0xb6
	lsl r12, r12, #0x8
	strh r12, [r3, #0x2]
	mov r12, #0xf6
	lsl r12, r12, #0x8
	strh r12, [r3, #0xe]
	mov r1, #0x0
lbl_08004594:
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0
	.pool

	thumb_func_start unk_45a8
unk_45a8: @ 0x080045A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r6, [r4, #0x1c]
	cmp r6, #0
	bne _0800465C
	movs r6, #1
	strb r6, [r4, #0x1c]
	ldrb r6, [r4, #0x1e]
	movs r7, #1
	ands r6, r7
	bne _08004658
	ldr r6, [r5]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	bne _080045D4
	bl ResetTrack
	movs r2, #0
	strb r2, [r4]
	b _08004658
_080045D4:
	ldr r7, [r4]
	movs r3, #2
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	ands r3, r2
	beq _080045FA
	movs r3, #0x1d
	ldrb r3, [r4, r3]
	cmp r3, #0
	beq _080045F4
	lsls r1, r6, #8
	lsrs r1, r1, #0x18
	lsrs r2, r7, #0x18
	cmp r2, r1
	ble _080045F4
	b _08004658
_080045F4:
	adds r0, r4, #0
	bl ResetTrack
_080045FA:
	movs r3, #2
	lsls r2, r6, #8
	orrs r2, r3
	ldr r0, [r5, #4]
	str r2, [r4]
	str r0, [r4, #0x14]
	str r5, [r4, #0x10]
	lsls r3, r3, #7
	strh r3, [r4, #0xc]
	lsrs r2, r6, #0x1f
	beq _08004616
	lsrs r0, r6, #0x18
	bl unk_24ec
_08004616:
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r7, [r4, #0x18]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
_08004624:
	adds r2, r7, #0
	movs r3, #0x50
	muls r3, r6, r3
	bl BitFill
	movs r0, #1
	movs r2, #0x40
	lsls r1, r2, #0x10
	lsls r2, r2, #8
	orrs r1, r2
_08004638:
	movs r3, #0xc
	lsls r3, r3, #8
	movs r2, #2
	orrs r2, r3
	adds r5, #8
	b _0800464C
_08004644:
	subs r6, #1
	beq _08004658
	adds r7, #0x50
	adds r5, #4
_0800464C:
	ldr r3, [r5]
	strb r0, [r7]
	strh r2, [r7, #0x1a]
	str r1, [r7, #4]
	str r3, [r7, #0x24]
	b _08004644
_08004658:
	movs r6, #0
	strb r6, [r4, #0x1c]
_0800465C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StopMusic
StopMusic: @ 0x08004664
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r6, [r7, #0x1c]
	cmp r6, #0
	bne _080046E0
	movs r6, #1
	strb r6, [r7, #0x1c]
	ldrb r6, [r7, #0x1e]
	movs r5, #1
	ands r5, r6
	bne _080046DC
	ldrb r4, [r7]
	movs r5, #2
	ands r4, r5
	beq _080046DC
	movs r4, #1
	strb r4, [r7]
	movs r4, #0
	strb r4, [r7, #2]
	movs r4, #2
	ands r4, r6
	beq _08004696
	movs r4, #0xfd
	ands r4, r6
	strb r4, [r7, #0x1e]
_08004696:
	ldrb r6, [r7, #1]
	ldr r5, [r7, #0x18]
	b _080046A2
_0800469C:
	subs r6, #1
	beq _080046DC
	adds r5, #0x50
_080046A2:
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	beq _080046BE
	movs r3, #7
	movs r2, #0x34
	ldrb r1, [r5, r2]
	ands r1, r3
	subs r1, #1
	adds r0, r4, #0
	bl ClearRegistersForPsg
	movs r3, #0
	strb r3, [r4]
	str r3, [r4, #0x24]
_080046BE:
	ldr r0, [r5, #0x48]
	movs r1, #0
_080046C2:
	cmp r0, #0
	beq _080046D4
	ldr r2, [r0, #0x30]
	strb r1, [r0]
	str r1, [r0, #0x28]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	adds r0, r2, #0
	b _080046C2
_080046D4:
	movs r0, #0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x48]
	b _0800469C
_080046DC:
	movs r6, #0
	strb r6, [r7, #0x1c]
_080046E0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ResetTrack
ResetTrack: @ 0x080046E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r6, [r7, #0x1e]
	movs r5, #1
	ands r5, r6
	bne _08004756
	ldrb r4, [r7]
	movs r5, #2
	ands r4, r5
	beq _08004756
	movs r4, #1
	strb r4, [r7]
	movs r4, #0
	strb r4, [r7, #2]
	movs r4, #2
	ands r4, r6
	beq _08004710
	movs r4, #0xfd
	ands r4, r6
	strb r4, [r7, #0x1e]
_08004710:
	ldrb r6, [r7, #1]
	ldr r5, [r7, #0x18]
	b _0800471C
_08004716:
	subs r6, #1
	beq _08004756
	adds r5, #0x50
_0800471C:
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	beq _08004738
	movs r3, #7
	movs r2, #0x34
	ldrb r1, [r5, r2]
	ands r1, r3
	subs r1, #1
	adds r0, r4, #0
	bl ClearRegistersForPsg
	movs r3, #0
	strb r3, [r4]
	str r3, [r4, #0x24]
_08004738:
	ldr r0, [r5, #0x48]
	movs r1, #0
_0800473C:
	cmp r0, #0
	beq _0800474E
	ldr r2, [r0, #0x30]
	strb r1, [r0]
	str r1, [r0, #0x28]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	adds r0, r2, #0
	b _0800473C
_0800474E:
	movs r0, #0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x48]
	b _08004716
_08004756:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_475c
unk_475c: @ 0x0800475C
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	lsls r1, r0, #0x10
	adds r1, r0, r1
	lsrs r1, r1, #0x10
	movs r2, #0xff
	lsls r0, r2, #8
	ands r0, r1
	beq _08004774
	lsrs r0, r1, #8
	ands r1, r2
	b _08004776
_08004774:
	movs r0, #0
_08004776:
	strh r1, [r3, #0xe]
	bx lr
	.align 2, 0

	thumb_func_start unk_477c
unk_477c: @ 0x0800477C
	ldr r2, [r1, #0x24]
	ldrb r3, [r2, #1]
	adds r2, #2
	str r2, [r1, #0x24]
	lsls r2, r3, #1
	strh r2, [r0, #0xa]
	cmp r2, #0x96
	beq _0800479C
	movs r1, #0x1b
	movs r3, #0x4e
	lsls r1, r1, #8
	orrs r1, r3
	lsls r2, r2, #8
	muls r1, r2, r1
	lsrs r1, r1, #0x14
	b _080047A0
_0800479C:
	movs r1, #1
	lsls r1, r1, #8
_080047A0:
	movs r3, #0
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	bx lr

	thumb_func_start UpdateAudio
UpdateAudio: @ 0x080047A8
	push {r4, r5, r6, lr}
	ldr r4, _08004810 @ =0x080A8CDC
	ldr r6, _08004814 @ =gMusicInfo
	movs r0, #0x21
	ldrb r0, [r6, r0]
	movs r1, #0x11
	cmp r0, r1
	beq _080047D8
	ldr r5, _08004818 @ =0x00000008
	b _080047C4
_080047BC:
	subs r5, #1
	cmp r5, #0
	beq _080047F4
	adds r4, #0xc
_080047C4:
	ldr r0, [r4]
	cmp r0, #0
	beq _080047BC
	ldrb r3, [r0]
	movs r1, #2
	ands r3, r1
	beq _080047BC
	bl UpdateTrack
	b _080047BC
_080047D8:
	movs r0, #0x20
	ldrb r0, [r6, r0]
	movs r1, #0
	cmp r0, r1
	beq _080047E4
	movs r1, #0xc
_080047E4:
	adds r4, r4, r1
	ldr r0, [r4]
	ldrb r3, [r0]
	movs r1, #2
	ands r3, r1
	beq _080047F4
	bl UpdateTrack
_080047F4:
	ldrb r5, [r6, #1]
	cmp r5, #0
	bne _08004806
	movs r5, #1
	strb r5, [r6, #1]
	bl UpdatePsgSounds
	bl UpdateMusic
_08004806:
	movs r0, #0
	strb r0, [r6, #1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004810: .4byte 0x080A8CDC
_08004814: .4byte gMusicInfo
_08004818: .4byte 0x00000008

	thumb_func_start unk_481c
unk_481c: @ 0x0800481C
	push {r4, r5, lr}
	ldr r1, [r0, #0x40]
	ldrb r2, [r0, #1]
	ldrb r3, [r0]
	movs r4, #0xf0
	ands r3, r4
	cmp r3, #0x80
	bne _0800484C
	movs r3, #0xc
	muls r2, r3, r2
	adds r1, r1, r2
	ldrb r2, [r1, #1]
	movs r3, #0x35
	strb r2, [r0, r3]
	ldrb r2, [r1, #3]
	cmp r2, #0
	bne _08004844
	movs r2, #0x40
	strb r2, [r0, #6]
	b _08004858
_08004844:
	subs r2, #0x80
	bmi _08004858
	strb r2, [r0, #6]
	b _08004858
_0800484C:
	ldr r3, [r0, #0x44]
	adds r3, r3, r2
	ldrb r3, [r3]
	movs r4, #0xc
	muls r3, r4, r3
	adds r1, r1, r3
_08004858:
	ldr r2, [r1]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0x34
	strb r3, [r0, r4]
	lsls r4, r2, #8
	lsrs r4, r4, #0x18
	movs r5, #0x36
	strb r4, [r0, r5]
	movs r4, #7
	ands r3, r4
	bne _08004876
	ldr r3, [r1, #4]
	str r3, [r0, #0x38]
	b _080048B6
_08004876:
	cmp r3, #2
	bgt _08004894
	lsrs r3, r2, #0x18
	movs r4, #0x80
	ands r4, r3
	bne _0800488A
	movs r4, #0x70
	ands r4, r3
	beq _0800488A
	b _0800488C
_0800488A:
	movs r3, #8
_0800488C:
	movs r4, #0x37
	strb r3, [r0, r4]
	movs r4, #6
	b _080048AE
_08004894:
	cmp r3, #3
	bne _080048A8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r5, #4]
	bl UploadSampleToWaveRam
	adds r0, r4, #0
	adds r1, r5, #0
	b _080048B6
_080048A8:
	cmp r3, #4
	bne _080048B6
	movs r4, #3
_080048AE:
	ldr r3, [r1, #4]
	lsls r3, r4
	movs r4, #0x38
	strb r3, [r0, r4]
_080048B6:
	ldr r2, [r1, #8]
	str r2, [r0, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_48c0
unk_48c0: @ 0x080048C0
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _080048CA
	adds r1, #1
_080048CA:
	ldr r2, [r0, #0x1c]
	ldrb r3, [r0, #0x1a]
	muls r1, r3, r1
	lsls r1, r1, #2
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r3, r3, #8
	adds r1, r1, r3
	lsls r3, r2, #0x10
	asrs r3, r3, #0x18
	lsls r3, r3, #8
	adds r1, r1, r3
	lsls r3, r2, #8
	asrs r3, r3, #0x16
	lsls r3, r3, #2
	adds r1, r1, r3
	lsrs r2, r2, #0x18
	adds r1, r1, r2
	movs r3, #0x10
	ldr r2, [r0, r3]
	movs r3, #0xff
	ands r3, r2
	beq _08004912
	movs r3, #0xff
	lsls r3, r3, #8
	ands r3, r2
	beq _08004912
	lsls r3, r2, #8
	lsrs r3, r3, #0x18
	cmp r3, #0
	bne _08004912
	asrs r2, r2, #0x18
	lsls r2, r2, #2
	movs r3, #0xc
	muls r2, r3, r2
	adds r1, r1, r2
_08004912:
	asrs r2, r1, #8
	strb r2, [r0, #0x17]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0

	thumb_func_start unk_491c
unk_491c: @ 0x0800491C
	push {r4}
	ldr r1, [r0, #4]
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r1, #0x10
	lsrs r3, r3, #0x18
	muls r2, r3, r2
	lsrs r2, r2, #5
	ldrh r3, [r0, #0x12]
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #1
	bne _08004946
	lsls r4, r3, #0x10
	asrs r4, r4, #0x18
	adds r4, #0x41
	muls r2, r4, r2
	asrs r2, r2, #6
	cmp r2, #0xff
	blt _08004946
	movs r2, #0xff
_08004946:
	lsls r4, r1, #8
	lsrs r4, r4, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r4
	subs r1, #0x40
	cmp r1, #0x3f
	blt _08004958
	movs r1, #0x3f
	b _08004962
_08004958:
	movs r4, #0x40
	rsbs r4, r4, #0
	cmp r1, r4
	bpl _08004962
	rsbs r1, r4, #0
_08004962:
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bne _08004980
	lsls r4, r3, #0x10
	asrs r4, r4, #0x18
	adds r1, r1, r4
	cmp r1, #0x3f
	blt _08004978
	movs r1, #0x3f
	b _08004980
_08004978:
	movs r4, #0x40
	adds r3, r1, r4
	bpl _08004980
	rsbs r1, r4, #0
_08004980:
	movs r4, #0x40
	adds r3, r1, r4
	muls r3, r2, r3
	lsrs r3, r3, #7
	subs r4, r4, r1
	muls r4, r2, r4
	lsrs r4, r4, #7
	lsls r4, r4, #8
	orrs r3, r4
	strh r3, [r0, #8]
	pop {r4}
	bx lr

	thumb_func_start unk_4998
unk_4998: @ 0x08004998
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldrb r1, [r4, #0x13]
	movs r2, #2
	orrs r1, r2
	strb r1, [r4, #0x13]
	bl unk_1e14
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _080049B4
	str r4, [r0, #0x2c]
_080049B4:
	str r0, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x2c]
	str r5, [r4, #0x28]
	str r4, [r5, #0x48]
	movs r1, #0x34
	ldrb r0, [r5, r1]
	ldrb r1, [r5, #6]
	lsls r0, r0, #8
	lsls r6, r6, #0x10
	lsls r1, r1, #0x18
	movs r2, #1
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	str r0, [r4]
	ldr r0, [r5, #0x3c]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	movs r1, #0x10
	movs r2, #0xc
	ldr r0, [r5, #0x38]
	adds r1, r1, r0
	adds r2, r2, r0
	str r0, [r4, #0x20]
	str r1, [r4, #0x24]
	str r2, [r4, #0x14]
	ldrh r1, [r5]
	lsrs r2, r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strb r2, [r4, #6]
	movs r3, #0xf0
	ands r1, r3
	cmp r1, #0x80
	bne _08004A02
	movs r3, #0x35
	ldrb r2, [r5, r3]
_08004A02:
	strb r2, [r4, #7]
	movs r3, #0x17
	ldrsb r1, [r5, r3]
	adds r1, r1, r2
	bmi _08004A14
	cmp r1, #0x7f
	ble _08004A16
	movs r1, #0x7f
	b _08004A16
_08004A14:
	movs r1, #0
_08004A16:
	ldrb r2, [r5, #0x18]
	bl MidiKey2Freq
	ldr r1, _08004A38 @ =gMusicInfo
	ldrh r2, [r1, #0x12]
	cmp r0, r2
	bne _08004A2A
	movs r0, #0x40
	lsls r0, r0, #8
	b _08004A30
_08004A2A:
	ldr r1, [r1, #0x18]
	bl CallGetNoteFrequency
_08004A30:
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004A38: .4byte gMusicInfo

	thumb_func_start unk_4a3c
unk_4a3c: @ 0x08004A3C
	ldr r1, [r0, #0x24]
	adds r1, #1
	movs r2, #3
	ands r2, r1
	bne _08004A4A
	ldr r2, [r1]
	b _08004A76
_08004A4A:
	movs r2, #1
	ands r2, r1
	bne _08004A5C
	ldrh r2, [r1]
	adds r1, #2
	ldrh r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	b _08004A76
_08004A5C:
	ldrb r2, [r1]
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #8
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x18
	orrs r2, r3
_08004A76:
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0

	thumb_func_start unk_4a7c
unk_4a7c: @ 0x08004A7C
	ldr r1, [r0, #0x24]
	adds r1, #1
	movs r2, #3
	ands r2, r1
	bne _08004A8C
	ldr r2, [r1]
	adds r1, #4
	b _08004ABC
_08004A8C:
	movs r2, #1
	ands r2, r1
	bne _08004AA0
	ldrh r2, [r1]
	adds r1, #2
	ldrh r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #2
	b _08004ABC
_08004AA0:
	ldrb r2, [r1]
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #8
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x18
	orrs r2, r3
	adds r1, #1
_08004ABC:
	str r2, [r0, #0x24]
	adds r0, #0x28
	ldr r2, [r0]
	cmp r2, #0
	beq _08004AD6
	adds r0, #4
	ldr r2, [r0]
	cmp r2, #0
	beq _08004AD6
	adds r0, #4
	ldr r2, [r0]
	cmp r2, #0
	bne _08004AD8
_08004AD6:
	str r1, [r0]
_08004AD8:
	bx lr
	.align 2, 0

	thumb_func_start UploadSampleToWaveRam
UploadSampleToWaveRam: @ 0x08004ADC
	ldr r3, _08004B08 @ =0x04000070
	movs r2, #0x40
	strb r2, [r3]
	ldr r1, _08004B0C @ =0x04000090
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	movs r2, #0
	strb r2, [r3]
	bx lr
	.align 2, 0
_08004B08: .4byte 0x04000070
_08004B0C: .4byte 0x04000090

	thumb_func_start unk_4b10
unk_4b10: @ 0x08004B10
	push {r4, r5}
	ldr r4, [r0, #0x10]
	ldrh r5, [r0, #0x14]
	ldr r1, [r0, #0x24]
	movs r2, #0x34
	ldrb r1, [r1, r2]
	cmp r1, #8
	ble _08004B4A
	movs r2, #4
	movs r3, #0x89
	lsls r2, r2, #0x18
	orrs r2, r3
	ldrb r2, [r2]
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r3, #0x40
	cmp r2, r3
	bge _08004B38
	adds r5, #2
	b _08004B40
_08004B38:
	movs r3, #0x80
	cmp r2, r3
	bge _08004B4A
	adds r5, #1
_08004B40:
	movs r2, #0xc7
	movs r3, #0xfe
	lsls r2, r2, #8
	orrs r2, r3
	ands r5, r2
_08004B4A:
	movs r2, #4
	movs r3, #0x60
	lsls r2, r2, #0x18
	orrs r2, r3
	movs r3, #7
	ands r1, r3
	lsls r3, r4, #8
	lsrs r3, r3, #0x10
	cmp r1, #1
	beq _08004B6C
	cmp r1, #2
	beq _08004B7E
	cmp r1, #3
	beq _08004B84
	cmp r1, #4
	beq _08004B8C
	b _08004B90
_08004B6C:
	strb r4, [r2]
	strh r3, [r2, #2]
	strh r5, [r2, #4]
	mov r8, r8
	mov r8, r8
	mov r8, r8
	mov r8, r8
	strh r5, [r2, #4]
	b _08004B90
_08004B7E:
	strh r3, [r2, #8]
	strh r5, [r2, #0xc]
	b _08004B90
_08004B84:
	strb r4, [r2, #0x10]
	strh r3, [r2, #0x12]
	strh r5, [r2, #0x14]
	b _08004B90
_08004B8C:
	strh r3, [r2, #0x18]
	strh r5, [r2, #0x1c]
_08004B90:
	lsls r5, r5, #0x11
	lsrs r5, r5, #0x11
	strh r5, [r0, #0x14]
	pop {r4, r5}
	bx lr
	.align 2, 0
