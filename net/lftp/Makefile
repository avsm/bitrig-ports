# $OpenBSD: Makefile,v 1.95 2013/10/22 06:03:54 benoit Exp $

COMMENT=	shell-like command line ftp and sftp client

DISTNAME=	lftp-4.4.10
CATEGORIES=	net

REVISION=	0

HOMEPAGE=	http://lftp.yar.ru/

MAINTAINER=	Kevin Lo <kevlo@openbsd.org>

# GPLv3+
PERMIT_PACKAGE_CDROM=   Yes

WANTLIB=	c crypto curses expat m readline ssl stdc++ util z

# lftp needs add_history_time()
LIB_DEPENDS=	devel/readline

MASTER_SITES=	http://lftp.yar.ru/ftp/

LIBTOOL_FLAGS=	--tag=disable-shared
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-openssl \
		--without-gnutls \
		--disable-shared
CONFIGURE_ENV=  CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MODULES=	devel/gettext

NO_TEST=	Yes

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/lftp

.include <bsd.port.mk>
