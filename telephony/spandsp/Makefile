# $OpenBSD: Makefile,v 1.14 2013/11/15 23:01:20 sthen Exp $

COMMENT=	DSP library for telephony

DISTNAME=	spandsp-0.0.6pre21
CATEGORIES=	telephony
MASTER_SITES=	${HOMEPAGE}downloads/spandsp/
EXTRACT_SUFX=	.tgz

SHARED_LIBS=	spandsp	6.0

HOMEPAGE=	http://www.soft-switch.org/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# LGPLv2/GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	c jpeg m tiff z

WRKDIST=	${WRKDIR}/spandsp-0.0.6

LIB_DEPENDS+=	graphics/tiff

CONFIGURE_STYLE= gnu
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC} ${WRKSRC}/config
CONFIGURE_ARGS+= ${CONFIGURE_SHARED}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

# Test suite included, but requires many build dependencies
# and proprietary files from standards bodies.
NO_TEST=	Yes

DOCS=		README DueDiligence

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/spandsp
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/share/doc/spandsp
.endfor

.include <bsd.port.mk>
