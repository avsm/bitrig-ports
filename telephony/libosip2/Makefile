# $OpenBSD: Makefile,v 1.16 2013/11/09 23:19:03 naddy Exp $

COMMENT=	GNU oSIP library

DISTNAME=	libosip2-3.5.0
REVISION=	3

SHARED_LIBS +=	osipparser2          4.0      # 8.0
SHARED_LIBS +=	osip2                4.0      # 8.0

CATEGORIES=	telephony devel

HOMEPAGE=	https://www.gnu.org/software/osip/

MAINTAINER=	Lawrence Teo <lteo@openbsd.org>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c

MASTER_SITES=	${MASTER_SITE_GNU:=osip/}


CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--disable-debug \
		--enable-test
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/scripts

.include <bsd.port.mk>
