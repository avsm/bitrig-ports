# $OpenBSD: Makefile,v 1.70 2013/12/16 20:34:46 brad Exp $

# XXX: Remember to bump MODCLANG_VERSION in lang/clang/clang.port.mk when
# updating this port.

ONLY_FOR_ARCHS = ${LLVM_ARCHS}
DPB_PROPERTIES = parallel

COMMENT =	modular, fast C/C++/ObjC compiler, static analyzer and tools

LLVM_V =	3.3
REVISION =	4
DISTNAME =	llvm-${LLVM_V}.src
PKGNAME =	llvm-${LLVM_V}
CATEGORIES =	devel
MASTER_SITES =	http://llvm.org/releases/${LLVM_V}/

DISTFILES =	${DISTNAME}${EXTRACT_SUFX} cfe-${LLVM_V}.src${EXTRACT_SUFX}

SHARED_LIBS =	clang		0.0 # 3.2

# packager notes in http://llvm.org/docs/Packaging.html
HOMEPAGE =	http://www.llvm.org/

# BSD
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =	c m pthread stdc++ z

WRKDIST =	${WRKDIR}/llvm-${LLVM_V}.src

MODULES =	devel/cmake \
		lang/python

TEST_DEPENDS =	devel/dejagnu \
		shells/bash
BUILD_DEPENDS +=	textproc/py-sphinx

SEPARATE_BUILD =	Yes
CONFIGURE_ARGS =	-DLLVM_ENABLE_FFI:Bool=False \
			-DLLVM_REQUIRES_RTTI:Bool=True \
			-DCMAKE_BUILD_TYPE:String=Release \
			-DCMAKE_DISABLE_FIND_PACKAGE_LibXml2:Bool=True \
			-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD:String=R600

# Workaround relocation overflow
.if ${MACHINE_ARCH} == "powerpc"
CONFIGURE_ARGS +=	-DCMAKE_EXE_LINKER_FLAGS=-Wl,--relax
.endif

TEST_TARGET =		check

CLANG_INCLUDE_PATH =	lib/clang/${LLVM_V}/include
SUBST_VARS +=		CLANG_INCLUDE_PATH LLVM_V

post-extract:
	@mv ${WRKDIR}/cfe-${LLVM_V}.src ${WRKDIST}/tools/clang

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/tools/clang/tools/scan-build/scan-build
	-@ln -s ${MODPY_BIN} ${WRKDIR}/bin/python

post-build:
	cd ${WRKSRC}/docs && make -f Makefile.sphinx man
	pod2man --release=CVS --center="LLVM" \
	    ${WRKSRC}/tools/clang/docs/tools/clang.pod \
	    ${WRKSRC}/docs/_build/man/clang.1

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/clang/tools/scan-build/ccc-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/c++-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/scan-build ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/tools/clang/tools/scan-build/sorttable.js \
	    ${WRKSRC}/tools/clang/tools/scan-build/scanview.css \
	    ${PREFIX}/share/llvm
	${INSTALL_DATA} ${WRKSRC}/docs/_build/man/* \
	    ${PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/tools/clang/tools/scan-build/scan-build.1 \
	    ${PREFIX}/man/man1

.include <bsd.port.mk>
