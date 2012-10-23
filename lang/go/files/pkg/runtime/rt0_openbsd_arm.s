// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

TEXT _rt0_arm_openbsd(SB),7,$-4

	SUB	$4, R13 // fake a stack frame for runtime·setup_auxv
	BL	runtime·setup_auxv(SB)
	ADD	$4, R13
	B	_rt0_arm(SB)
