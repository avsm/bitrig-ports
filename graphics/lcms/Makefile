# $OpenBSD: Makefile,v 1.26 2013/03/21 08:45:18 ajacoutot Exp $

COMMENT =	color management library

DISTNAME =	lcms-1.18a
SHARED_LIBS =	lcms	2.0
CATEGORIES =	graphics
MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=lcms/}

HOMEPAGE =	http://www.littlecms.com/

LIB_DEPENDS +=	graphics/jpeg \
		graphics/tiff

# MIT
PERMIT_PACKAGE_CDROM =	Yes
WANTLIB =		c m z jpeg tiff

CONFIGURE_STYLE = 	gnu
CONFIGURE_ARGS += 	${CONFIGURE_SHARED}
CONFIGURE_ENV +=	CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

WRKDIST =		${WRKDIR}/lcms-1.18

# Unconfuse update-patches
post-extract:
	rm -f ${WRKSRC}/src/cmsxform.c.orig

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/lcms
	${INSTALL_DATA} ${WRKSRC}/doc/* ${PREFIX}/share/doc/lcms

.include <bsd.port.mk>
