# $OpenBSD$

COMMENT =	Answer set solver for logic programs
CATEGORIES =	math 

V =		3.0.3
MAINTAINER = 	Anil Madhavapeddy <avsm@openbsd.org>

NAME =		clasp
DISTNAME =	clasp-${V}-source
PKGNAME =	${NAME}-$V
WRKDIST =	${WRKDIR}/${NAME}-${V}
MASTER_SITES =  http://sourceforge.net/projects/potassco/files/clasp/${V}/

HOMEPAGE =	http://potassco.sourceforge.net/

PERMIT_PACKAGE_CDROM =		Yes

USE_GMAKE =     Yes
CONFIGURE_STYLE = simple
CONFIGURE_SCRIPT= configure.sh
CONFIGURE_ARGS =	--prefix=${PREFIX} --config=release

WANTLIB =	 c m stdc++

do-build:
	cd ${WRKDIST}/build/release && ${GMAKE}

do-install:
	cd ${WRKDIST}/build/release && \
	  ${GMAKE} install INSTALL_DIR=${PREFIX}/bin

.include <bsd.port.mk>
