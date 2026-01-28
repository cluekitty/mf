	.include "asm/macros.inc"

	.syntax unified

	thumb_func_start EraseSram_Unused
EraseSram_Unused: @ 0x08000C28
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08000C54 @ =0x0000FFFF
	ldr r4, _08000C58 @ =0x02038100
	movs r5, #0xfe
	lsls r5, r5, #7
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	adds r3, r5, #0
	bl BitFill
	ldr r1, _08000C5C @ =0x0E000100
	adds r0, r4, #0
	adds r2, r5, #0
	bl SramWrite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000C54: .4byte 0x0000FFFF
_08000C58: .4byte 0x02038100
_08000C5C: .4byte 0x0E000100

	thumb_func_start EraseSram
EraseSram: @ 0x08000C60
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08000C90 @ =0x0000FFFF
	ldr r4, _08000C94 @ =0x02038000
	movs r5, #0x80
	lsls r5, r5, #8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	adds r3, r5, #0
	bl BitFill
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r4, #0
	adds r2, r5, #0
	bl SramWrite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000C90: .4byte 0x0000FFFF
_08000C94: .4byte 0x02038000

	thumb_func_start unk_c98
unk_c98: @ 0x08000C98
	push {r4, lr}
	ldr r4, _08000CC4 @ =0x02038000
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r4, #0
	movs r2, #0x80
	bl SramWriteChecked
	ldr r2, _08000CC8 @ =0x040000D4
	str r4, [r2]
	ldr r0, _08000CCC @ =0x0203F100
	str r0, [r2, #4]
	ldr r1, _08000CD0 @ =0x80000040
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _08000CD4 @ =0x0E007100
	movs r2, #0x80
	bl SramWriteChecked
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000CC4: .4byte 0x02038000
_08000CC8: .4byte 0x040000D4
_08000CCC: .4byte 0x0203F100
_08000CD0: .4byte 0x80000040
_08000CD4: .4byte 0x0E007100

	thumb_func_start unk_cd8
unk_cd8: @ 0x08000CD8
	push {lr}
	ldr r0, _08000CE8 @ =0x02038080
	ldr r1, _08000CEC @ =0x0E000080
	movs r2, #0x80
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000CE8: .4byte 0x02038080
_08000CEC: .4byte 0x0E000080

	thumb_func_start unk_cf0
unk_cf0: @ 0x08000CF0
	push {lr}
	ldr r0, _08000D00 @ =0x0203F100
	ldr r1, _08000D04 @ =0x0E007100
	movs r2, #0x80
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D00: .4byte 0x0203F100
_08000D04: .4byte 0x0E007100

	thumb_func_start WriteMostRecentFileToGamePak
WriteMostRecentFileToGamePak: @ 0x08000D08
	push {lr}
	ldr r2, _08000D28 @ =0x0858225C
	ldr r0, _08000D2C @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000D30 @ =0x080A5258
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWrite
	pop {r0}
	bx r0
	.align 2, 0
_08000D28: .4byte 0x0858225C
_08000D2C: .4byte 0x03000B8D
_08000D30: .4byte 0x080A5258

	thumb_func_start unk_d34
unk_d34: @ 0x08000D34
	push {lr}
	ldr r2, _08000D54 @ =0x08582268
	ldr r0, _08000D58 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000D5C @ =0x080A5264
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWrite
	pop {r0}
	bx r0
	.align 2, 0
_08000D54: .4byte 0x08582268
_08000D58: .4byte 0x03000B8D
_08000D5C: .4byte 0x080A5264

	thumb_func_start ReadAllGamePakSRAM
ReadAllGamePakSRAM: @ 0x08000D60
	push {lr}
	ldr r0, _08000D74 @ =0x0E000200
	ldr r1, _08000D78 @ =0x02038200
	movs r2, #0xfc
	lsls r2, r2, #7
	bl SramWriteUnchecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D74: .4byte 0x0E000200
_08000D78: .4byte 0x02038200

	thumb_func_start ReadMostRecentFileFromGamePak
ReadMostRecentFileFromGamePak: @ 0x08000D7C
	push {lr}
	ldr r2, _08000D9C @ =0x080A5258
	ldr r0, _08000DA0 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000DA4 @ =0x0858225C
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWriteUnchecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D9C: .4byte 0x080A5258
_08000DA0: .4byte 0x03000B8D
_08000DA4: .4byte 0x0858225C

	thumb_func_start unk_da8
unk_da8: @ 0x08000DA8
	push {lr}
	movs r0, #0xe0
	lsls r0, r0, #0x14
	ldr r1, _08000DC8 @ =0x02038000
	movs r2, #0x80
	lsls r2, r2, #1
	bl SramWriteUnchecked
	ldr r0, _08000DCC @ =0x0E007100
	ldr r1, _08000DD0 @ =0x0203F100
	movs r2, #0x80
	bl SramWriteUnchecked
	pop {r0}
	bx r0
	.align 2, 0
_08000DC8: .4byte 0x02038000
_08000DCC: .4byte 0x0E007100
_08000DD0: .4byte 0x0203F100

	thumb_func_start unk_dd4
unk_dd4: @ 0x08000DD4
	push {lr}
	ldr r0, _08000DE4 @ =0x0203F000
	ldr r1, _08000DE8 @ =0x0E007000
	movs r2, #0x40
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000DE4: .4byte 0x0203F000
_08000DE8: .4byte 0x0E007000

	thumb_func_start unk_dec
unk_dec: @ 0x08000DEC
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _08000E0C @ =0x08582280
	lsrs r0, r0, #0x16
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r1, _08000E10 @ =0x080A5270
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #0x40
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E0C: .4byte 0x08582280
_08000E10: .4byte 0x080A5270

	thumb_func_start unk_e14
unk_e14: @ 0x08000E14
	push {lr}
	ldr r0, _08000E24 @ =0x0203FFF0
	ldr r1, _08000E28 @ =0x0E007FF0
	movs r2, #0x10
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E24: .4byte 0x0203FFF0
_08000E28: .4byte 0x0E007FF0

	thumb_func_start unk_e2c
unk_e2c: @ 0x08000E2C
	push {lr}
	ldr r0, _08000E40 @ =0x0203F800
	ldr r1, _08000E44 @ =0x0E007800
	movs r2, #0x80
	lsls r2, r2, #3
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E40: .4byte 0x0203F800
_08000E44: .4byte 0x0E007800
