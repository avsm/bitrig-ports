# $OpenBSD: Makefile,v 1.7 2013/04/28 16:34:53 jasper Exp $

COMMENT=	Java library to assist with developing IO functionality

V=		2.4
DISTNAME=	commons-io-$V-src
PKGNAME=	${DISTNAME:S/-src//}
CATEGORIES=	devel

HOMEPAGE=	http://commons.apache.org/io/

# APLv2.0
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${MASTER_SITE_APACHE:=commons/io/source/}

MODULES=	java
MODJAVA_VER=	1.6+
MODJAVA_BUILD=	ant

NO_TEST=	Yes

do-install:
	${INSTALL_DATA_DIR} ${MODJAVA_JAR_DIR}
	${INSTALL_DATA} ${WRKSRC}/target/commons-io-$V.jar \
		${MODJAVA_JAR_DIR}/commons-io.jar

.include <bsd.port.mk>
