COMMENT=	Bitrig gcc shim for GCC 4.2

V = 4.2
FULL_VERSION = $V
FULL_PKGVERSION = $V

GCC_VERSION=4.2.4
.if ${MACHINE_ARCH} == "arm"
CLANG_TARGET=armv7
.else
CLANG_TARGET=${MACHINE_ARCH}
.endif

PKGNAME =  bitrig-gcc-${FULL_PKGVERSION}
PKGNAME-main =  bitrig-gcc-${FULL_PKGVERSION}
PKGNAME-gcclibs= bitrig-gcclibs-${FULL_PKGVERSION}

MULTI_PACKAGES = -main -gcclibs

PREFIX= 	/usr
INSTDIR=	${PREFIX}

DISTFILES=

.include <bsd.port.arch.mk>

CATEGORIES=	bitrig

PERMIT_PACKAGE_CDROM=Yes

COM=		GNU compiler collection
COMMENT=	${COM}: core C compiler
COMMENT-main=	${COMMENT}
COMMENT-gcclibs=	${COM}: C++ compiler library

CONFIG=${MACHINE_ARCH}-unknown-bitrig${OSREV}

HOMEPAGE =	http://bitrig.org
LIBSTDC_VER=13

LIB_DEPENDS+=	lang/gcc/4.2,-main
LIB_DEPENDS+=	lang/gcc/4.2,-c++
RUN_DEPENDS+=	lang/gcc/4.2,-main
RUN_DEPENDS+=	lang/gcc/4.2,-c++

NO_BUILD=	Yes

SHARED_LIBS +=  estdc++                   13.0

.if ${MACHINE_ARCH} == "arm"
PKG_ARGS += -Darm=1
.else
PKG_ARGS += -Darm=0
.endif

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/lib
	${INSTALL_DATA_DIR} ${PREFIX}/include
	${INSTALL_DATA_DIR} ${PREFIX}/include/c++
	ln -s /usr/local/include/c++/${GCC_VERSION} ${PREFIX}/include/g++
	ln -s /usr/local/bin/eg++ ${PREFIX}/bin/g++
	ln -s /usr/local/bin/ec++ ${PREFIX}/bin/c++
	ln -s /usr/local/bin/egcc ${PREFIX}/bin/cc
	ln -s /usr/local/bin/egcc ${PREFIX}/bin/gcc
	ln -s ../g++ ${PREFIX}/include/c++/stdc++
	cp /usr/local/lib/libestdc++.so.${LIBSTDC_VER}.0 ${PREFIX}/lib
	cp /usr/local/lib/gcc/arm-unknown-bitrig0.1/${GCC_VERSION}/libgcc.a ${PREFIX}/lib
.if ${MACHINE_ARCH} != ${CLANG_TARGET}
	${INSTALL_DATA_DIR} ${PREFIX}/local/include/c++/4.2.4
	ln -s /usr/local/include/c++/4.2.4/${MACHINE_ARCH}-unknown-bitrig0.1 \
	     ${PREFIX}/local/include/c++/4.2.4/${CLANG_TARGET}-unknown-bitrig0.1
.endif


.include <bsd.port.mk>

