# $OpenBSD: Makefile,v 1.18 2013/04/25 05:58:08 ajacoutot Exp $

COMMENT=	C++ binding for the ATK library

GNOME_PROJECT=	atkmm
GNOME_VERSION=	2.22.7

PKGNAME=	atk2mm-${GNOME_VERSION}

CATEGORIES=	devel

SHARED_LIBS +=		atkmm-1.6	10.0 # .2.0

HOMEPAGE=	http://www.gtkmm.org/

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += atk-1.0 ffi glib-2.0 glibmm-2.4 gmodule-2.0 gobject-2.0
WANTLIB += m pcre pthread sigc-2.0 stdc++

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	devel/glib2mm \
		devel/atk

USE_GMAKE=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--enable-static \
		--disable-dependency-tracking
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build

.include <bsd.port.mk>
