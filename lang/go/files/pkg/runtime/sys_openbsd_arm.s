// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// System calls and other sys.stuff for 386, OpenBSD
// /usr/src/sys/kern/syscalls.master for syscall numbers.
//

#include "zasm_GOOS_GOARCH.h"


#define SYS_syscall (0)
#define SYS_exit (1)
#define SYS_read (3)
#define SYS_write (4)
#define SYS_open (5)
#define SYS_close (6)
#define SYS_kill (37)
#define SYS_sigaction (46)
#define SYS_setitimer (83)
#define SYS_gettimeofday (116)
//#define SYS_rt_sigreturn (173)
//#define SYS_rt_sigaction (174)
//#define SYS_rt_sigprocmask (175)
#define SYS_sigaltstack (288)
#define SYS_mmap2 (197)
//#define SYS_futex (240)
//#define SYS_exit_group (248)
#define SYS_munmap (73)
#define SYS_madvise (75)
#define SYS_mincore (78)
#define SYS_mmap (197)
#define SYS__syscall (198)
#define SYS___sysctl (202)
//#define SYS_gettid (224)
//#define SYS_tkill (238)
#define SYS_sched_yield (289)
#define SYS_select (93)
//#define SYS_ugetrlimit (191)
#define SYS___threxit (0x12e)
#define SYS_nanosleep (240)
#define SYS_getthrid (299)
#define SYS_thrsleep (300)
#define SYS_thrwakeup (301)


// Exit the entire program (like C exit)
TEXT runtime·exit(SB),7,$-4
	MOVW	$SYS_exit, R12
	SWI	$SYS_exit
	RET

TEXT runtime·exit1(SB),7,$8
	MOVW	$SYS___threxit, R12
	SWI	$SYS___threxit
	RET

TEXT runtime·write(SB),7,$-4
	MOVW	$SYS_write, R12
	SWI	$SYS_write
	RET

TEXT runtime·usleep(SB),7,$20
        MOVW    usec+0(FP), R0
        MOVW    R0, R1
        MOVW    $1000000, R2
        DIV     R2, R0
        MOD     R2, R1
        MOVW    R0, 4(SP)
        MOVW    R1, 8(SP)
        MOVW    $0, R0
        MOVW    $0, R1
        MOVW    $0, R2
        MOVW    $0, R3
        MOVW    $4(SP), R4
	MOVW	$SYS_nanosleep, R12
        SWI     $SYS_nanosleep

TEXT runtime·raisesigpipe(SB),7,$12
	MOVW	$SYS_getthrid, R12
        SWI     $SYS_getthrid
	MOVW	$13, R1		// arg 2 - signum == SIGPIPE
	MOVW	$SYS_kill, R12
        SWI     $SYS_kill
	RET

TEXT runtime·mmap(SB),7,$36

	MOVW	R2, -4(SP)		// - are these scratch or callee preserve ?
	MOVW	R3, -8(SP)		// - are these scratch or callee preserve ?
	ADD	$0, SP, R3
	MOVW	(SP), R2		// stash the value from the stack
	MOVW	R2, -12(SP)		// stash the value from the stack
	MOVW	8(FP), R2		 // arg3 - prot
	MOVW	R2, 0(R3)
	MOVW	12(FP), R2		 // arg4 - flags
	MOVW	R2, 4(R3)
	MOVW	16(FP), R2		 // arg5 - fd
	MOVW	R2, 8(R3)
	MOVW	20(FP), R2	 	 // arg6 - pad
	MOVW	R2, 12(R3)
	MOVW	24(FP), R2		 // arg7 - offset
	MOVW	R2, 16(R3)
	MOVW	28(FP), R2		 // top 64 bits of file offset
	MOVW	$0, R2
	MOVW	R2, 20(R3)

	MOVW	0(FP), R2		 // arg1 - addr
	MOVW	4(FP), R3		 // arg2 - len

	MOVW	$0, R1
	MOVW	$SYS_mmap, R0
	MOVW	$SYS__syscall, R12
	SWI	$SYS__syscall

	MOVW	-12(SP), R2		// stash the value from the stack
	MOVW	R2, (SP)		// restore the value from the stack

	MOVW	-4(SP), R2		// - are these scratch or callee preserve ?
	MOVW	-8(SP), R3		// - are these scratch or callee preserve ?

	BCC	mmap_good
	// the go code expects -ERRNO
	MOVW	$0, R1
	SUB	R1, R0, R0
	RET
mmap_good:
	// mmapped address is in R0
	RET

TEXT runtime·munmap(SB),7,$-4
	MOVW	$SYS_munmap, R12
	SWI	$SYS_munmap
	RET

TEXT runtime·setitimer(SB),7,$-4
	MOVW	$SYS_setitimer, R12
	SWI	$SYS_setitimer
	RET

// func now() (sec int64, nsec int32)
TEXT time·now(SB), 7, $32
	MOVW	$8(R13), R0  // timeval
	MOVW	$0, R1  // zone
	MOVW	$SYS_gettimeofday, R12
	SWI	$SYS_gettimeofday
	
	MOVW	8(R13), R0  // sec
	MOVW	12(R13), R2  // usec
	
	MOVW	R0, 0(FP)
	MOVW	$0, R1
	MOVW	R1, 4(FP)
	MOVW	$1000, R3
	MUL	R3, R2
	MOVW	R2, 8(FP)
	RET	

// int64 nanotime(void) so really
// void nanotime(int64 *nsec)
TEXT runtime·nanotime(SB),7,$32
	MOVW	$8(R13), R0  // timeval
	MOVW	$0, R1  // zone
	MOVW	$SYS_gettimeofday, R12
	SWI	$SYS_gettimeofday
	
	MOVW	8(R13), R0  // sec
	MOVW	12(R13), R2  // usec
	
	MOVW	$1000000000, R3
	MULLU	R0, R3, (R1, R0)
	MOVW	$1000, R3
	MOVW	$0, R4
	MUL	R3, R2
	ADD.S	R2, R0
	ADC	R4, R1
	
	MOVW	0(FP), R3
	MOVW	R0, 0(R3)
	MOVW	R1, 4(R3)
	RET

TEXT runtime·sigaction(SB),7,$-4
	MOVW	$SYS_sigaction, R12
	SWI	$SYS_sigaction
	RET

TEXT runtime·sigprocmask(SB),7,$-4
	MOVW	$SYS_sigaction, R12
	SWI	$SYS_sigaction

	MOVW	0xf1, R12
	MOVW	R12, (R12)		// crash
	RET

TEXT runtime·sigtramp(SB),7,$44
	MOVW	0xf1, R12
	MOVW	R12, (R12)		// crash
/*
	get_tls(CX)

	// check that m exists
	MOVL	m(CX), BX
	CMPL	BX, $0
	JNE	5(PC)
	MOVL	signo+0(FP), BX
	MOVL	BX, 0(SP)
	CALL	runtime·badsignal(SB)
	RET

	// save g
	MOVL	g(CX), DI
	MOVL	DI, 20(SP)
	
	// g = m->gsignal
	MOVL	m_gsignal(BX), BX
	MOVL	BX, g(CX)

	// copy arguments for call to sighandler
	MOVL	signo+0(FP), BX
	MOVL	BX, 0(SP)
	MOVL	info+4(FP), BX
	MOVL	BX, 4(SP)
	MOVL	context+8(FP), BX
	MOVL	BX, 8(SP)
	MOVL	DI, 12(SP)

	CALL	runtime·sighandler(SB)

	// restore g
	get_tls(CX)
	MOVL	20(SP), BX
	MOVL	BX, g(CX)
	
	// call sigreturn
	MOVL	context+8(FP), AX
	MOVL	$0, 0(SP)		// syscall gap
	MOVL	AX, 4(SP)		// arg 1 - sigcontext
	MOVL	$103, AX		// sys_sigreturn
	INT	$0x80
	MOVL	$0xf1, 0xf1		// crash
*/
	RET

// int32 tfork_thread(void *param, void *stack, M *m, G *g, void (*fn)(void));
TEXT runtime·tfork_thread(SB),7,$8
	MOVW	0xf1, R12
	MOVW	R12, (R12)		// crash
/*

	// Copy m, g, fn off parent stack and onto the child stack.
	MOVL	stack+8(FP), CX
	SUBL	$16, CX
	MOVL	mm+12(FP), SI
	MOVL	SI, 0(CX)
	MOVL	gg+16(FP), SI
	MOVL	SI, 4(CX)
	MOVL	fn+20(FP), SI
	MOVL	SI, 8(CX)
	MOVL	$1234, 12(CX)
	MOVL	CX, SI

	MOVL	$0, 0(SP)		// syscall gap
	MOVL	params+4(FP), AX
	MOVL	AX, 4(SP)		// arg 1 - param
	MOVL	$328, AX		// sys___tfork
	INT	$0x80

	// Return if tfork syscall failed.
	JCC	5(PC)
	NEGL	AX
	MOVL	ret+0(FP), DX
	MOVL	AX, 0(DX)
	RET

	// In parent, return.
	CMPL	AX, $0
	JEQ	4(PC)
	MOVL	ret+0(FP), DX
	MOVL	AX, 0(DX)
	RET

	// In child, switch to new stack.
	MOVL    SI, SP

	// Paranoia: check that SP is as we expect.
	MOVL	12(SP), BP
	CMPL	BP, $1234
	JEQ	2(PC)
	INT	$3

	// Reload registers.
	MOVL	0(SP), BX		// m
	MOVL	4(SP), DX		// g
	MOVL	8(SP), SI		// fn

	// Set FS to point at m->tls.
	LEAL	m_tls(BX), BP
	PUSHAL				// save registers
	PUSHL	BP
	CALL	runtime·settls(SB)
	POPL	AX
	POPAL
	
	// Now segment is established.  Initialize m, g.
	get_tls(AX)
	MOVL	DX, g(AX)
	MOVL	BX, m(AX)

	CALL	runtime·stackcheck(SB)	// smashes AX, CX
	MOVL	0(DX), DX		// paranoia; check they are not nil
	MOVL	0(BX), BX

	// More paranoia; check that stack splitting code works.
	PUSHAL
	CALL	runtime·emptyfunc(SB)
	POPAL

	// Call fn.
	CALL	SI

	CALL	runtime·exit1(SB)
	MOVL	$0x1234, 0x1005
*/
	RET

TEXT runtime·sigaltstack(SB),7,$-8
	MOVW	$SYS_sigaltstack, R12
	MOVW	new+4(SP), R0
	MOVW	old+8(SP), R1
	SWI	$SYS_sigaltstack
/*
	TST	R0, $0xfffff001
 XXX
	BEQ	1
	INT	$3
1:
*/
	RET

TEXT runtime·settls(SB),7,$16
/*
	// adjust for ELF: wants to use -8(GS) and -4(GS) for g and m
	MOVL	20(SP), CX
	ADDL	$8, CX
	MOVL	CX, 0(CX)
	MOVL	$0, 0(SP)		// syscall gap
	MOVL	$9, 4(SP)		// I386_SET_GSBASE (machine/sysarch.h)
	MOVL	CX, 8(SP)		// pointer to base
	MOVL	$165, AX		// sys_sysarch
	INT	$0x80
	JCC	2(PC)
*/
	MOVW	$0xf1, R12
	MOVW	R12, (R12)		// crash
	RET

TEXT runtime·osyield(SB),7,$-4
	MOVW	$SYS_sched_yield, R12
	SWI	$SYS_sched_yield
	RET

TEXT runtime·thrsleep(SB),7,$-4
	MOVW	$SYS_thrsleep, R12
	SWI	$SYS_thrsleep
	RET

TEXT runtime·thrwakeup(SB),7,$-4
	MOVW	$SYS_thrwakeup, R12
	SWI	$SYS_thrwakeup
	RET

TEXT runtime·sysctl(SB),7,$28
	ADD	$4, SP, R0
//	ADD	$0, FP, R7
//	MOVM	R7, { R1, R2, R3, R4, R5, R6 }
//	MOVM	{ R1, R2, R3, R4, R5, R6 }, (R0)

	MOVW	0(FP), R1
	MOVW	4(FP), R2
	MOVW	8(FP), R3
	MOVW	12(FP), R4
	MOVW	16(FP), R5
	MOVW	20(FP), R6

	MOVW	R1, 4(SP)
	MOVW	R2, 8(SP)
	MOVW	R3, 12(SP)
	MOVW	R4, 16(SP)
	MOVW	R5, 20(SP)
	MOVW	R6, 24(SP)

	MOVW	$SYS___sysctl, R12
	SWI	$SYS___sysctl
	BCC	sysctl_good
	RET
sysctl_good:
	MOVW	$0, R0
	RET

GLOBL runtime·tlsoffset(SB),$4



TEXT runtime·cas(SB),7,$0
	B	runtime·armcas(SB)

TEXT runtime·casp(SB),7,$0
// IMPLEMENT ME
	MOVW	$0xf01, R1
	MOVW	R1, (R1)
	RET

TEXT runtime·cacheflush(SB),7,$0
// IMPLEMENT ME
	MOVW	$0xf01, R1
	MOVW	R1, (R1)

	MOVW	0(FP), R0
	MOVW	4(FP), R1
	MOVW	$0, R2
//	MOVW	$SYS_ARM_cacheflush, R7
	SWI	$0
	RET
