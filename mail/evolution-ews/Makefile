# $OpenBSD: Makefile,v 1.44 2014/04/01 13:21:45 ajacoutot Exp $

EVO_VERSION=		3.12
SUBST_VARS +=		EVO_VERSION

SHARED_ONLY=		Yes

COMMENT=		evolution connector for MS Exchange via EWS

GNOME_PROJECT=		evolution-ews
GNOME_VERSION=		3.12.0
REVISION=		1

CATEGORIES=		mail

SHARED_LIBS +=  eews-1.2             1.0      # unknown
SHARED_LIBS +=  ewsutils             1.0      # unknown

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
			Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += EGL GL ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender Xt asn1 atk-1.0 atk-bridge-2.0
WANTLIB += atspi cairo cairo-gobject camel-1.2 canberra canberra-gtk3
WANTLIB += com_err crypto db dbus-1 dbus-glib-1 ebackend-1.2 ebook-1.2
WANTLIB += ebook-contacts-1.2 ecal-1.2 edata-book-1.2 edata-cal-1.2
WANTLIB += edataserver-1.2 enchant expat ffi fontconfig freetype
WANTLIB += gailutil-3 gck-1 gcr-3 gcr-base-3 gcrypt gdk-3 gdk_pixbuf-2.0
WANTLIB += geoclue gio-2.0 glib-2.0 gmodule-2.0 gnome-desktop-3
WANTLIB += gobject-2.0 gpg-error graphite2 gssapi gstapp-1.0 gstaudio-1.0
WANTLIB += gstbase-1.0 gstfft-1.0 gstpbutils-1.0 gstreamer-1.0
WANTLIB += gsttag-1.0 gstvideo-1.0 gthread-2.0 gtk-3 gtkhtml-4.0
WANTLIB += gtkhtml-editor-4.0 gtkspell3-3 harfbuzz harfbuzz-icu
WANTLIB += heimbase ical icalss icalvcal icudata icui18n icuuc
WANTLIB += javascriptcoregtk-3.0 jpeg krb5 ltdl m mspack nspr4
WANTLIB += nss3 nssutil3 ogg orc-0.4 p11-kit pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre pixman-1 plc4 plds4 png pthread pthread-stubs
WANTLIB += roken secret-1 smime3 softokn3 soup-2.4 sqlite3 ssl3
WANTLIB += stdc++ vorbis vorbisfile webkitgtk-3.0 webp wind xcb
WANTLIB += xcb-render xcb-shm xml2 xslt z

MODULES=		devel/gettext \
			x11/gnome

# XXX should be a LIB_DEPENDS+WANTLIB but check-lib-depends(1) does not
# work with unversioned solibs (LOCALBASE/lib/evolution/*/*.so).
BUILD_DEPENDS +=	mail/evolution
RUN_DEPENDS +=		mail/evolution

LIB_DEPENDS=		archivers/libmspack

CONFIGURE_STYLE=	gnu

post-install:
	rm ${PREFIX}/lib/evolution-data-server/*/*.{a,la}
	rm ${PREFIX}/lib/evolution/${EVO_VERSION}/modules/*.{a,la}

.include <bsd.port.mk>
