# $OpenBSD: Makefile,v 1.34 2013/09/28 08:51:22 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT=	C++ interface to the graphics library for GNOME

GNOME_PROJECT=	libgnomecanvasmm
GNOME_VERSION=	2.26.0
EXTRACT_SUFX=	.tar.bz2
REVISION=	10

SHARED_LIBS +=  gnomecanvasmm-2.6         1.0 # 1.6

CATEGORIES=	x11

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender art_lgpl_2 atk-1.0 atkmm-1.6 cairo cairomm-1.0
WANTLIB += expat ffi fontconfig freetype gailutil gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gdkmm-2.4 gio-2.0 giomm-2.4 glib-2.0
WANTLIB += glibmm-2.4 gmodule-2.0 gnomecanvas-2 gobject-2.0 graphite2
WANTLIB += gthread-2.0 gtk-x11-2.0 gtkmm-2.4 harfbuzz m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pangomm-1.4 pcre pixman-1
WANTLIB += png pthread pthread-stubs sigc-2.0 stdc++ xcb xcb-render
WANTLIB += xcb-shm z

MODULES=	devel/gettext \
		x11/gnome

MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/scripts

LIB_DEPENDS=	x11/gnome/libgnomecanvas \
		x11/gtk2mm>=2.24.4

.include <bsd.port.mk>
