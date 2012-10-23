// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include "runtime.h"
#include "defs_GOOS_GOARCH.h"
#include "signals_GOOS.h"
#include "os_GOOS.h"

typedef struct sigaction {
	union {
		void    (*__sa_handler)(int32);
		void    (*__sa_sigaction)(int32, Siginfo*, void *);
	} __sigaction_u;		/* signal handler */
	uint32	sa_mask;		/* signal mask to apply */
	int32	sa_flags;		/* see signal options below */
} Sigaction;

void
runtime·dumpregs(Sigcontext *r)
{
	runtime·printf("onstack %x\n", r->sc_onstack);
	runtime·printf("mask    %x\n", r->sc_mask);
	runtime·printf("spsr    %x\n", r->sc_spsr);
	runtime·printf("r0      %x\n", r->sc_r0);
	runtime·printf("r1      %x\n", r->sc_r1);
	runtime·printf("r2      %x\n", r->sc_r2);
	runtime·printf("r3      %x\n", r->sc_r3);
	runtime·printf("r4      %x\n", r->sc_r4);
	runtime·printf("r5      %x\n", r->sc_r5);
	runtime·printf("r6      %x\n", r->sc_r6);
	runtime·printf("r7      %x\n", r->sc_r7);
	runtime·printf("r8      %x\n", r->sc_r8);
	runtime·printf("r9      %x\n", r->sc_r9);
	runtime·printf("r10     %x\n", r->sc_r10);
	runtime·printf("r11     %x\n", r->sc_r11);
	runtime·printf("r12     %x\n", r->sc_r12);
	runtime·printf("usr_sp  %x\n", r->sc_usr_sp);
	runtime·printf("usr_lr  %x\n", r->sc_usr_lr);
	runtime·printf("svc_lr  %x\n", r->sc_svc_lr);
	runtime·printf("pc      %x\n", r->sc_pc);
}

/*
 * This assembler routine takes the args from registers, puts them on the stack,
 * and calls sighandler().
 */
extern void runtime·sigtramp(void);
extern void runtime·sigreturn(void);	// calls runtime·sigreturn

void
runtime·sighandler(int32 sig, Siginfo *info, void *context, G *gp)
{
	Sigcontext *r = context;
	SigTab *t;

	if(sig == SIGPROF) {
		runtime·sigprof((uint8*)r->sc_pc, (uint8*)r->sc_usr_sp, nil, gp);
		return;
	}

	t = &runtime·sigtab[sig];
	if(info->si_code != SI_USER && (t->flags & SigPanic)) {
		if(gp == nil)
			goto Throw;
		// Make it look like a call to the signal func.
		// Have to pass arguments out of band since
		// augmenting the stack frame would break
		// the unwinding code.
		gp->sig = sig;
		gp->sigcode0 = info->si_code;
		gp->sigcode1 = *(uintptr*)((byte*)info + 12); /* si_addr */
		gp->sigpc = r->sc_pc;

		// Only push runtime·sigpanic if r->sc_pc != 0.
		// If r->sc_pc == 0, probably panicked because of a
		// call to a nil func.  Not pushing that onto sp will
		// make the trace look like a call to runtime·sigpanic instead.
		// (Otherwise the trace will end at runtime·sigpanic and we
/*
// WTF??
		// won't get to see who faulted.)
		if(r->sc_pc != 0) {
			sp = (uintptr*)r->sc_esp;
			*--sp = r->sc_pc;
			r->sc_esp = (uintptr)sp;
		}
*/
		r->sc_pc = (uintptr)runtime·sigpanic;
		return;
	}

	if(info->si_code == SI_USER || (t->flags & SigNotify))
		if(runtime·sigsend(sig))
			return;
	if(t->flags & SigKill)
		runtime·exit(2);
	if(!(t->flags & SigThrow))
		return;

Throw:
	runtime·startpanic();

	if(sig < 0 || sig >= NSIG)
		runtime·printf("Signal %d\n", sig);
	else
		runtime·printf("%s\n", runtime·sigtab[sig].name);

	runtime·printf("PC=%X\n", r->sc_pc);
	runtime·printf("\n");

	if(runtime·gotraceback()){
		runtime·traceback((void*)r->sc_pc, (void*)r->sc_usr_sp, 0, gp);
		runtime·tracebackothers(gp);
		runtime·dumpregs(r);
	}

	runtime·exit(2);
}

void
runtime·signalstack(byte *p, int32 n)
{
	Sigaltstack st;

	st.ss_sp = p;
	st.ss_size = n;
	st.ss_flags = 0;
	runtime·sigaltstack(&st, nil);
}

void
runtime·setsig(int32 i, void (*fn)(int32, Siginfo*, void*, G*), bool restart)
{
	Sigaction sa;

	runtime·memclr((byte*)&sa, sizeof sa);
	sa.sa_flags = SA_SIGINFO|SA_ONSTACK;
	if(restart)
		sa.sa_flags |= SA_RESTART;
	sa.sa_mask = ~0ULL;
	if (fn == runtime·sighandler)
		fn = (void*)runtime·sigtramp;
	sa.__sigaction_u.__sa_sigaction = (void*)fn;
	runtime·sigaction(i, &sa, nil);
}

#define AT_NULL		0
#define AT_PLATFORM	15 // introduced in at least 2.6.11
#define AT_HWCAP	16 // introduced in at least 2.6.11
#define AT_RANDOM	25 // introduced in 2.6.29
#define HWCAP_VFP	(1 << 6)
static uint32 runtime·randomNumber;
uint8  runtime·armArch = 6;	// we default to ARMv6
uint32 runtime·hwcap;	// set by setup_auxv
uint8  runtime·goarm;	// set by 5l

void
runtime·checkgoarm(void)
{
	if(runtime·goarm > 5 && !(runtime·hwcap & HWCAP_VFP)) {
		runtime·printf("runtime: this CPU has no floating point hardware, so it cannot run\n");
		runtime·printf("this GOARM=%d binary. Recompile using GOARM=5.\n", runtime·goarm);
		runtime·exit(1);
	}
}

#pragma textflag 7
void
runtime·setup_auxv(int32 argc, void *argv_list)
{
	byte **argv = &argv_list;
	byte **envp;
	uint32 *auxv;
	uint32 t;

	// skip envp to get to ELF auxiliary vector.
	for(envp = &argv[argc+1]; *envp != nil; envp++)
		;
	envp++;
	
	for(auxv=(uint32*)envp; auxv[0] != AT_NULL; auxv += 2) {
		switch(auxv[0]) {
		case AT_RANDOM: // kernel provided 16-byte worth of random data
			if(auxv[1])
				runtime·randomNumber = *(uint32*)(auxv[1] + 4);
			break;
		case AT_PLATFORM: // v5l, v6l, v7l
			if(auxv[1]) {
				t = *(uint8*)(auxv[1]+1);
				if(t >= '5' && t <= '7')
					runtime·armArch = t - '0';
			}
			break;
		case AT_HWCAP: // CPU capability bit flags
			runtime·hwcap = auxv[1];
			break;
		}
	}
}
