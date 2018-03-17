/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Common heap and stack allocations
 */

#include <linux/linkage.h>
#include <asm/realmode.h>
#include <asm/export.h>

	.data
GLOBAL(HEAP)
	.long	rm_heap
GLOBAL(heap_end)
	.long	rm_stack

	.align 4096
__friend_loader_buf_start:
	/* for Friend-Loader */
	.long  0
	.long  FRIEND_LOADER_TRAMPOLINE_SIGNATURE
	.space 4088 + 3 * 4096, 0
__friend_loader_buf_end:

	.bss
	.balign	16
GLOBAL(rm_heap)
	.space	2048
GLOBAL(rm_stack)
	.space	2048
GLOBAL(rm_stack_end)
