# $OpenBSD: Makefile,v 1.16 2013/10/11 23:51:55 naddy Exp $

COMMENT=	GTK+2 front-end for command line archiving tools

V=		0.2.8-6
DISTNAME=	xarchive-$V
PKGNAME=	xarchive-${V:S/-/./}
REVISION=	3
CATEGORIES=	x11

HOMEPAGE=	http://xarchive.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xarchive/}

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += z pthread-stubs xcb gdk_pixbuf-2.0 gdk-x11-2.0
WANTLIB += gtk-x11-2.0

MODULES=	devel/gettext
LIB_DEPENDS=	x11/gtk+2
RUN_DEPENDS=	devel/desktop-file-utils


CONFIGURE_STYLE=gnu
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/config
CONFIGURE_ENV=	BASH_PROG=/bin/sh

pre-configure:
	@perl -pi -e 's,AWK_PROGS="mawk gawk awk",AWK_PROGS="awk gawk mawk",g' \
		${WRKSRC}/wrappers/*.src
	${SUBST_CMD} ${WRKSRC}/doc/xarchive.1 \
		${WRKSRC}/doc/xarchive.1.txt.src

.include <bsd.port.mk>
