# $OpenBSD: Makefile,v 1.29 2013/11/07 07:09:00 ajacoutot Exp $

COMMENT=	PPTP client package for Microsoft VPN servers

DISTNAME=	pptp-1.7.2
REVISION=	4
CATEGORIES=	net
MASTER_SITES= 	${MASTER_SITE_SOURCEFORGE:=pptpclient/}

HOMEPAGE=	http://pptpclient.sf.net

MAINTAINER=	Stefan Sperling <stsp@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=   Yes

WANTLIB=		c util

NO_TEST=	Yes

MAKE_ENV+=	PPPD=/usr/sbin/ppp
CFLAGS+=	-DUSER_PPP

post-patch:
	@cd ${WRKSRC}; sed -e s,PREFIX,${PREFIX}, < \
		${FILESDIR}/pptp_8 > pptp.8

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pptp ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/pptp.8 ${PREFIX}/man/man8
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/pptp
	${INSTALL_DATA} ${WRKSRC}/PROTOCOL-SECURITY ${PREFIX}/share/doc/pptp/

.include <bsd.port.mk>
