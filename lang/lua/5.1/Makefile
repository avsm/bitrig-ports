# $OpenBSD: Makefile,v 1.2 2012/11/09 08:36:44 dcoppa Exp $

VERSION=	5.1.5
PKGSPEC=	lua->=5.1,<5.2
REVISION=	2

SHARED_LIBS=	lua5.1 ${VERSION:R}

LIB_DEPENDS=	devel/readline

WANTLIB=	c m edit curses readline

MAKE_FLAGS+=	LIBlua5.1_VERSION="${LIBlua5.1_VERSION}"

CFLAGS+= 	-I${LOCALBASE}/include

pre-configure:
	${SUBST_CMD} ${WRKSRC}/etc/lua.pc

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/etc/lua.pc ${PREFIX}/lib/pkgconfig/lua51.pc

.include <bsd.port.mk>
