# $OpenBSD: Makefile,v 1.12 2013/03/11 11:23:56 espie Exp $

COMMENT=	number theory-oriented computer algebra system

DISTNAME=	pari-2.1.6
REVISION=	3
EXTRACT_SUFX=	.tgz
CATEGORIES=	math

HOMEPAGE=	http://pari.math.u-bordeaux.fr/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
WANTLIB=		X11 c m ncurses readline
LIB_DEPENDS=		devel/readline

MASTER_SITES=		${HOMEPAGE}/pub/pari/unix/

BUILD_DEPENDS=		print/texlive/base

USE_GROFF =		Yes

CONFIGURE_SCRIPT=	Configure
CONFIGURE_STYLE=	simple
CONFIGURE_ENV=		CFLAGS="${CFLAGS}"
CONFIGURE_ARGS+=	--datadir=${PREFIX}/share/pari \
			--miscdir=${PREFIX}/share/pari \
			--prefix=${PREFIX} \
			--host=${ARCH}

TEST_TARGET=		dobench

post-install:
	mv ${PREFIX}/share/pari/doc ${PREFIX}/share/doc/pari
	mv ${PREFIX}/share/pari/[A-Z]* ${PREFIX}/share/doc/pari
	mv ${PREFIX}/share/pari/examples ${PREFIX}/share/examples/pari

.include <bsd.port.mk>
