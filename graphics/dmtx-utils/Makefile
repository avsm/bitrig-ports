# $OpenBSD: Makefile,v 1.7 2013/05/16 09:16:43 sthen Exp $

COMMENT =		tools for handling data matrix barcodes

DISTNAME =		dmtx-utils-0.7.4
REVISION =		3
CATEGORIES =		graphics

HOMEPAGE =		http://www.libdmtx.org/
MAINTAINER =		Sebastian Reitenbach <sebastia@openbsd.org>
MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=libdmtx/}

# LGPLv2
PERMIT_PACKAGE_CDROM =		Yes

WANTLIB += ICE MagickCore MagickWand SM X11 Xext Xt bz2 c djvulibre
WANTLIB += dmtx expat fftw3 fontconfig freetype jasper jbig jpeg
WANTLIB += lcms2 ltdl lzma png pthread tiff wmf wmflite xcb xml2
WANTLIB += m z

MODULES =		converters/libiconv
LIB_DEPENDS +=		graphics/ImageMagick>=6.6.6.10p7 \
			graphics/libdmtx

SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ENV +=	CPPFLAGS="-I${LOCALBASE}/include"

.include <bsd.port.mk>
