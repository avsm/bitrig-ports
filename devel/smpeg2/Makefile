# $OpenBSD: Makefile,v 1.1.1.1 2013/11/27 04:46:56 brad Exp $

COMMENT=	MPEG video player library with sound support

DISTNAME=	smpeg2-2.0.0
CATEGORIES=	devel graphics
MASTER_SITES=	http://www.libsdl.org/projects/smpeg/release/

SHARED_LIBS=	smpeg2	2.0

HOMEPAGE=	http://icculus.org/smpeg/

# GPLv2+
PERMIT_PACKAGE_CDROM=   Yes

WANTLIB=	SDL2 c m pthread sndio stdc++ usbhid

LIB_DEPENDS=	devel/sdl2

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= ${CONFIGURE_SHARED}
CONFIGURE_ENV+=  LDFLAGS="-L${X11BASE}/lib"

post-install:
	mv ${PREFIX}/bin/plaympeg ${PREFIX}/bin/plaympeg2
	mv ${PREFIX}/man/man1/plaympeg.1 ${PREFIX}/man/man1/plaympeg2.1
	perl -pi -e s#plaympeg#plaympeg2#g ${PREFIX}/man/man1/plaympeg2.1

.include <bsd.port.mk>
