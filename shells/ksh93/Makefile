# $OpenBSD: Makefile,v 1.5 2013/10/01 09:07:17 ajacoutot Exp $

BROKEN-mips64 =		libast is not built

COMMENT =		AT&T Korn Shell

V =			2012-08-01
DISTNAME =		ast-ksh.${V}
PKGNAME =		ksh93-${V:S/-//g}

CATEGORIES =		shells

HOMEPAGE =		http://www.kornshell.com/

MAINTAINER =		Pascal Stumpf <Pascal.Stumpf@cubes.de>

# EPL
PERMIT_PACKAGE_CDROM =	commercial distribution defend and indemnify clauses
PERMIT_PACKAGE_FTP =	Yes

WANTLIB += c m util

MASTER_SITES =		https://distfiles.bsdfrog.org/
DISTFILES =		${DISTNAME}${EXTRACT_SUFX} INIT.${V}${EXTRACT_SUFX}
EXTRACT_SUFX =		.tgz
DIST_SUBDIR =		ksh93

MAKE_ENV =		CC="${CC}" CCFLAGS="${CFLAGS}" SHELL=/bin/sh \
			TMPDIR="${WRKDIR}"

USE_GROFF =		Yes

WRKDIST =		${WRKDIR}
AST_ARCH =		${WRKSRC}/arch/bitrig.${MACHINE_ARCH}
AST_INC =		${AST_ARCH}/include/ast

do-build:
	cd ${WRKSRC} && env -i ${MAKE_ENV} /bin/sh bin/package make

do-install:
	${INSTALL_PROGRAM} ${AST_ARCH}/bin/ksh ${PREFIX}/bin/ksh93
	cd ${PREFIX}/bin && ln ksh93 rksh93
	${INSTALL_DATA} ${AST_ARCH}/lib/lib{ast,cmd,shell}.a ${PREFIX}/lib
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/ksh93		
	${INSTALL_DATA} ${AST_ARCH}/fun/* ${PREFIX}/share/examples/ksh93
	${INSTALL_MAN} ${AST_ARCH}/man/man1/sh.1 ${PREFIX}/man/man1/ksh93.1
	cd ${PREFIX}/man/man1 && ln ksh93.1 rksh93.1
	${INSTALL_MAN} ${AST_ARCH}/man/man3/shell.3 ${PREFIX}/man/man3
	${INSTALL_DATA_DIR} ${PREFIX}/include/ast
	${INSTALL_DATA} ${AST_INC}/ast* ${PREFIX}/include/ast
	${INSTALL_DATA} ${AST_INC}/{sfio,sfio_s,shell,cdt,nval,option}.h \
		${PREFIX}/include/ast
	${INSTALL_DATA} ${AST_INC}/prototyped.h ${PREFIX}/include/ast
	
do-test:
	cd ${WRKSRC}/src/cmd/ksh93/tests && env -i \
		SHELL=${AST_ARCH}/bin/ksh \
		TMPDIR=${WRKDIR} \
		${AST_ARCH}/bin/ksh shtests

.include <bsd.port.mk>
