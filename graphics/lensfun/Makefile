# $OpenBSD: Makefile,v 1.12 2013/06/04 18:41:49 naddy Exp $

COMMENT=	library to adjust for photographic lens characteristics
DISTNAME=	lensfun-0.2.7
SHARED_LIBS=	lensfun 1.0

CATEGORIES=	graphics
HOMEPAGE=	http://lensfun.berlios.de/

# library LGPLv3, lens db CC-BY-SA, build infrastructure/applications GPLv3
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c glib-2.0 m png stdc++ z

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=lensfun.berlios/}
EXTRACT_SUFX=		.tar.bz2

MODULES=		lang/python devel/gettext
MODPY_RUNDEP=		No
BUILD_DEPENDS=		devel/doxygen>=1.7.2

LIB_DEPENDS=		devel/glib2 \
			graphics/png

MAKE_FLAGS=		V=1 INSTDIR_manual=${PREFIX}/share/doc/lensfun \
			LIBlensfun_VERSION=${LIBlensfun_VERSION}

USE_GMAKE=		Yes
CONFIGURE_STYLE=	simple
CONFIGURE_SCRIPT=	${MODPY_BIN} ./configure
CONFIGURE_ARGS+=	--docdir=${PREFIX}/share/doc/lensfun \
			--libdir=${PREFIX}/lib \
			--vectorization=SSE

NO_TEST =		Yes

CFLAGS+=		-I/usr/include
MAKE_FILE=		GNUmakefile

ALL_TARGET =		all

SUBST_VARS =		MAKE_PROGRAM

pre-configure:
	${SUBST_CMD} ${WRKSRC}/configure ${WRKSRC}/tibs.py

post-install:
	mv ${PREFIX}/lib/liblensfun.so \
	    ${PREFIX}/lib/liblensfun.so.${LIBlensfun_VERSION}
	cd ${WRKSRC}/out/posix*/release; \
	    ${INSTALL_PROGRAM} tmod ${PREFIX}/bin

.include <bsd.port.mk>
