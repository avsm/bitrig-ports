# $OpenBSD: Makefile,v 1.3 2013/03/11 11:23:56 espie Exp $

COMMENT=	Bible reading, browsing, and searching tool

DISTNAME=	bible-kjv_4.26
PKGNAME=	${DISTNAME:S/_/-/}
CATEGORIES=	misc

REVISION=	0

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	c curses readline
LIB_DEPENDS=	devel/readline

MASTER_SITES=	${MASTER_SITE_DEBIAN:=main/b/bible-kjv/}

WRKDIST=	${WRKDIR}/bible-kjv

MAKE_FLAGS=	DEST=${PREFIX} \
		CPPFLAGS='-I${LOCALBASE}/include' \
		CFLAGS='${CFLAGS} -DDESTLIB=\"${PREFIX}/lib\"' \
		LDFLAGS='-L${LOCALBASE}/lib -lreadline -lcurses'

post-build:
	perl -i.bak -pe 's:/usr/lib:${PREFIX}/lib:g' ${WRKSRC}/bible.1
	cd ${WRKBUILD}; \
	    ${CC} ${CFLAGS} -o randverse ${WRKSRC}/debian/randverse.c

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/bible ${PREFIX}/bin
	${INSTALL_DATA} ${WRKBUILD}/bible.data ${PREFIX}/lib
	${INSTALL_DATA} ${WRKBUILD}/bible.data.conc ${PREFIX}/lib
	${INSTALL_MAN} ${WRKSRC}/bible.1 ${PREFIX}/man/man1
	${INSTALL_PROGRAM} ${WRKBUILD}/randverse ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/debian/randverse.1 ${PREFIX}/man/man1

NO_TEST=	Yes

.include <bsd.port.mk>
