# $OpenBSD: Makefile,v 1.21 2013/03/21 08:45:15 ajacoutot Exp $

COMMENT=		dockapp-making standard library for Window Maker

DISTNAME=		libdockapp-0.4.0
REVISION=		3
SHARED_LIBS=		dockapp              1.0      # .1.0
CATEGORIES=		devel

# BSD
PERMIT_PACKAGE_CDROM=	Yes
WANTLIB=		X11 Xau Xdmcp Xext Xpm pthread-stubs xcb

MASTER_SITES=		ftp://shadowmere.student.utwente.nl/pub/WindowMaker/

NO_TEST=		Yes
SEPARATE_BUILD=		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	${CONFIGURE_SHARED} --enable-static

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/libdockapp
	${INSTALL_DATA} ${WRKSRC}/COPYING ${PREFIX}/share/doc/libdockapp

.include <bsd.port.mk>
