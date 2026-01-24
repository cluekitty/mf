    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start UpdateMenuOamDataId
UpdateMenuOamDataId: @ 0x0807486C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807488C @ =gNonGameplayRam
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r3
	adds r0, r3, #0
	adds r0, #0x36
	movs r2, #0
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807488C: .4byte gNonGameplayRam
