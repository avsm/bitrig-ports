# $OpenBSD: Makefile,v 1.30 2014/04/02 14:34:47 ajacoutot Exp $

COMMENT=	service interface for assistive technologies

GNOME_PROJECT=	at-spi2-core
GNOME_VERSION=	2.12.0

SHARED_LIBS +=  atspi                     0.1 # 0.1

HOMEPAGE=	https://wiki.linuxfoundation.org/en/AT-SPI_on_D-Bus

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xext Xi Xtst c dbus-1 ffi gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 pcre pthread xcb z

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	x11/dbus \
		devel/glib2>=2.40.0

MODGNOME_TOOLS += gobject-introspection

# connects to DBus
TEST_IS_INTERACTIVE=	x11

MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/config

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/at-spi2-core

.include <bsd.port.mk>
