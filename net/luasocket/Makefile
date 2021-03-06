# $OpenBSD: Makefile,v 1.26 2013/11/25 16:12:58 dcoppa Exp $

SHARED_ONLY=	Yes

COMMENT=	network support for the lua language
GH_VER=		v3.0-rc1
DISTNAME=	luasocket-${GH_VER:S/v//}
PKGNAME=	${DISTNAME:S/-rc/rc/}
CATEGORIES=	net

MASTER_SITES=	https://github.com/diegonehab/luasocket/archive/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}{${GH_VER}${EXTRACT_SUFX}}

HOMEPAGE=	http://w3.impa.br/~diego/software/luasocket/

# MIT
PERMIT_PACKAGE_CDROM=	Yes

MODULES=	lang/lua
NO_TEST=	Yes

USE_GMAKE=	Yes

MAKE_FILE=	makefile

MAKE_FLAGS=	CC_linux=${CC} \
		LD_linux=${CC} \
		CFLAGS_linux="${CFLAGS} -I${MODLUA_INCL_DIR} -fPIC \
			      -DPIC -DUNIX_HAS_SUN_LEN" \
		LDFLAGS_linux="${LDFLAGS} -shared -fPIC -o "

do-install:
	${INSTALL_DATA_DIR} ${MODLUA_DATADIR}/socket ${MODLUA_DATADIR}/mime
	${INSTALL_DATA_DIR} ${MODLUA_LIBDIR}/socket ${MODLUA_LIBDIR}/mime
	${INSTALL_DATA_DIR} ${MODLUA_DOCDIR} ${MODLUA_EXAMPLEDIR}
	${INSTALL_DATA} ${WRKSRC}/src/socket.so ${MODLUA_LIBDIR}/socket/core.so
	${INSTALL_DATA} ${WRKSRC}/src/unix.so ${MODLUA_LIBDIR}/socket/unix.so
	${INSTALL_DATA} ${WRKSRC}/src/mime.so ${MODLUA_LIBDIR}/mime/core.so
	${INSTALL_DATA} ${WRKSRC}/src/socket.lua ${MODLUA_DATADIR}
	${INSTALL_DATA} ${WRKSRC}/src/ltn12.lua ${MODLUA_DATADIR}
	${INSTALL_DATA} ${WRKSRC}/src/mime.lua ${MODLUA_DATADIR}
	${INSTALL_DATA} ${WRKSRC}/src/ftp.lua ${MODLUA_DATADIR}/socket
	${INSTALL_DATA} ${WRKSRC}/src/http.lua ${MODLUA_DATADIR}/socket
	${INSTALL_DATA} ${WRKSRC}/src/smtp.lua ${MODLUA_DATADIR}/socket
	${INSTALL_DATA} ${WRKSRC}/src/tp.lua ${MODLUA_DATADIR}/socket
	${INSTALL_DATA} ${WRKSRC}/src/url.lua ${MODLUA_DATADIR}/socket
	${INSTALL_DATA} ${WRKSRC}/doc/* ${MODLUA_DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/samples/* ${MODLUA_EXAMPLEDIR}

.include <bsd.port.mk>
