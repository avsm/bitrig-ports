# $OpenBSD: Makefile,v 1.24 2013/03/21 08:45:17 ajacoutot Exp $

COMMENT=		C++ interface for cairo

DISTNAME=		cairomm-1.10.0
REVISION=		1
SHARED_LIBS=		cairomm-1.0	5.0 # .5.0
CATEGORIES=		graphics

HOMEPAGE=		http://cairographics.org/cairomm/

# LGPL
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += GL X11 Xau Xdamage Xdmcp Xext Xfixes Xrender Xxf86vm
WANTLIB += cairo drm expat ffi fontconfig freetype glib-2.0 gobject-2.0
WANTLIB += gthread-2.0 m pcre pixman-1 png pthread-stubs sigc-2.0
WANTLIB += stdc++ xcb xcb-render xcb-shm z pthread

MASTER_SITES=		http://cairographics.org/releases/

LIB_DEPENDS=		graphics/cairo \
			devel/libsigc++-2

MODULES=		devel/gettext

SEPARATE_BUILD=		Yes
USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	${CONFIGURE_SHARED}
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build

.include <bsd.port.mk>
