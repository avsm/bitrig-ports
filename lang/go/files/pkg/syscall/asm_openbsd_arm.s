// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//
// System call support for arm, OpenBSD
//

#define SYS_syscall 0

// func Syscall(trap int32, a1, a2, a3 int32) (r1, r2, err int32);
// func Syscall6(trap int32, a1, a2, a3, a4, a5, a6 int32) (r1, r2, err int32);
// Trap # in R12, args in register, or on stack above caller SP.

TEXT	·Syscall(SB),7,$0
	BL	runtime·entersyscall(SB)
	MOVW	$SYS_syscall, R12	// syscall entry
	MOVW	4(SP), R0
	MOVW	8(SP), R1
	MOVW	12(SP), R2
	MOVW	16(SP), R3
	SWI	$SYS_syscall
	BCC	ok
	MOVW	$-1, R1
	MOVW	R1, 20(SP)
	MOVW	R1, 24(SP)
	MOVW	R0, 28(SP)
	BL	runtime·exitsyscall(SB)
	RET
ok:
	MOVW	R0, 20(SP)	// r1
	MOVW	R1, 24(SP)	// r2
	MOVW	$0, R2 
	MOVW	R2, 28(SP)	// errno
	BL	runtime·exitsyscall(SB)
	RET

TEXT	·Syscall6(SB),7,$0
	BL	runtime·entersyscall(SB)
	MOVW	$SYS_syscall, R12	// syscall entry

	// fix up syscall args here 
	MOVW	$0xf01, R1
	MOVW	R1, (R1)

	SWI	$SYS_syscall
	BCC	ok6
	MOVW	$-1, R1
	MOVW	R1, 20(SP)
	MOVW	R1, 24(SP)
	MOVW	R0, 28(SP)
	BL	runtime·exitsyscall(SB)
	RET
ok6:
	MOVW	R0, 20(SP)	// r1
	MOVW	R1, 24(SP)	// r2
	MOVW	$0, R2 
	MOVW	R2, 28(SP)	// errno
	BL	runtime·exitsyscall(SB)
	RET

TEXT	·Syscall9(SB),7,$0
	BL	runtime·entersyscall(SB)

	// fix up syscall args here 
	MOVW	$0xf01, R1
	MOVW	R1, (R1)

	SWI	$SYS_syscall
	BCC	ok9
	MOVW	$-1, R1
	MOVW	R1, 20(SP)
	MOVW	R1, 24(SP)
	MOVW	R0, 28(SP)
	BL	runtime·exitsyscall(SB)
	RET
ok9:
	MOVW	R0, 20(SP)	// r1
	MOVW	R1, 24(SP)	// r2
	MOVW	$0, R2 
	MOVW	R2, 28(SP)	// errno
	BL	runtime·exitsyscall(SB)
	RET

TEXT	·RawSyscall6(SB),7,$0

	// fix up syscall args here 
	MOVW	$0xf01, R1
	MOVW	$0xf01, (R1)

	SWI	$SYS_syscall
	BCC	ok2
	MOVW	$-1, R1
	MOVW	R1, 20(SP)
	MOVW	R1, 24(SP)
	MOVW	R0, 28(SP)
	RET
ok2:
	MOVW	R0, 20(SP)	// r1
	MOVW	R1, 24(SP)	// r2
	MOVW	$0, R2 
	MOVW	R2, 28(SP)	// errno
	RET

// func RawSyscall(trap uintptr, a1, a2, a3 uintptr) (r1, r2, err uintptr);
TEXT ·RawSyscall(SB),7,$0
	MOVW	4(SP), R12	// syscall entry
	MOVW	8(SP), R0
	MOVW	12(SP), R1
	MOVW	16(SP), R2
	SWI		$0
	BCC		ok1	// syscall sets CC[C] = 1 on error
	MOVW	R0, 28(SP)	// errno
	MOVW	$0, R0
	MOVW	R0, 20(SP)	// r1
	MOVW	R0, 24(SP)	// r2
	RET
ok1:
	MOVW	R0, 20(SP)	// r1
	MOVW	R1, 24(SP)	// r2
	MOVW	$0, R0
	MOVW	R0, 28(SP)	// errno
	RET
