# $OpenBSD: Makefile,v 1.4 2014/04/02 09:36:13 jasper Exp $

COMMENT=		GObject library for Facebook Graph API

GNOME_PROJECT=		gfbgraph
GNOME_VERSION=		0.2.2
PKGNAME=		lib${GNOME_PROJECT}-${GNOME_VERSION}

SHARED_LIBS +=  gfbgraph-0.2              0.0 # 0.0

CATEGORIES=		net

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ffi gio-2.0 glib-2.0 gmodule-2.0 goa-1.0 gobject-2.0
WANTLIB += gthread-2.0 json-glib-1.0 m pcre pthread rest-0.7 soup-2.4
WANTLIB += soup-gnome-2.4 sqlite3 xml2 z

MODULES=		devel/gettext \
			x11/gnome

MODGNOME_TOOLS +=	gobject-introspection
LIB_DEPENDS=		x11/gnome/online-accounts

post-install:
	[ -d ${PREFIX}/doc ] && rm -rf ${PREFIX}/doc || exit 1

.include <bsd.port.mk>
