# $OpenBSD: Makefile,v 1.4 2014/02/02 10:45:51 jasper Exp $

PKG_ARCH=		*

COMMENT=		secure hosting of Git repositories

VERSION=		3.5.3.1
DISTNAME=		gitolite-${VERSION}
REVISION=		0
CATEGORIES=		sysutils devel

HOMEPAGE=		https://github.com/sitaramc/gitolite/

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=		http://distfiles.nl/

RUN_DEPENDS=		devel/git

NO_BUILD=		Yes
NO_TEST=		Yes

SUBST_VARS+=		VERSION
GL_DIR=			${PREFIX}/libexec/gitolite/

do-install:
	${SUBST_CMD} ${WRKSRC}/install
	${INSTALL_DATA_DIR} ${GL_DIR}
	perl ${WRKSRC}/install -to ${GL_DIR}
	cd ${PREFIX}/bin/ && ln -s ../libexec/gitolite/gitolite

.include <bsd.port.mk>
