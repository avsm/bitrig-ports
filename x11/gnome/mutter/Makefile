# $OpenBSD: Makefile,v 1.37 2014/04/02 09:36:13 jasper Exp $

COMMENT=		window and compositing manager

GNOME_PROJECT=		mutter
GNOME_VERSION=		3.12.0
REVISION=		1

SHARED_LIBS +=  mutter                    0.1 # 0.0

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 X11-xcb Xcomposite Xcursor Xdamage Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 atk-bridge-2.0
WANTLIB += atspi c cairo cairo-gobject canberra canberra-gtk3
WANTLIB += clutter-1.0 cogl cogl-pango dbus-1 expat ffi fontconfig
WANTLIB += freetype gdk-3 gdk_pixbuf-2.0 gio-2.0 girepository-1.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 graphite2 gthread-2.0
WANTLIB += gtk-3 harfbuzz json-glib-1.0 ltdl
WANTLIB += m ogg pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png pthread pthread-stubs startup-notification-1 vorbis
WANTLIB += vorbisfile xcb xcb-aux xcb-render xcb-shm z
WANTLIB += gnome-desktop-3 upower-glib cogl-path

MODULES=		devel/dconf \
			devel/gettext \
			x11/gnome

MODGNOME_TOOLS += desktop-file-utils gobject-introspection

LIB_DEPENDS=		audio/libcanberra,-gtk3 \
			devel/startup-notification \
			graphics/clutter/core>=1.16.0 \
			devel/gobject-introspection \
			x11/gnome/desktop \
			sysutils/upower

BUILD_DEPENDS=		devel/gsettings-desktop-schemas \
			x11/gnome/zenity

RUN_DEPENDS=		devel/gsettings-desktop-schemas \
			x11/gnome/themes-standard \
			x11/gnome/zenity

# disable -Werror which breaks at least hppa/mips64/sparc64
CONFIGURE_ARGS +=	--enable-compile-warnings=yes

.include <bsd.port.mk>
