# $OpenBSD: Makefile,v 1.18 2013/10/11 21:20:56 naddy Exp $

DISTNAME=	xscavenger-1.4.4
REVISION =	2
EXTRACT_SUFX=	.tgz
CATEGORIES=	games

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	X11 Xau Xdmcp Xext c pthread-stubs sndio xcb

COMMENT=	Lode Runner clone
HOMEPAGE=	http://www.xdr.com/dash/scavenger.html
MASTER_SITES=	http://www.xdr.com/dash/

NO_TEST=	Yes

CONFIGURE_STYLE= imake
WRKSRC=		${WRKDIST}/src

post-extract:
	@cd ${WRKSRC} && mv scavenger.6 scavenger.man

post-install:
	@${INSTALL_DATA_DIR} ${PREFIX}/share/doc/scavenger
	${INSTALL_DATA} ${WRKSRC}/../DOC ${PREFIX}/share/doc/scavenger

.include <bsd.port.mk>
