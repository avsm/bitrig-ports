# $OpenBSD: Makefile,v 1.53 2014/04/09 15:59:46 gonzalo Exp $

COMMENT =	standard compliant weblog

DISTNAME =	wordpress-3.8.2
CATEGORIES =	www

HOMEPAGE =	http://wordpress.org/
MAINTAINER =	Gonzalo L. R. <gonzalo@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =	${HOMEPAGE}

MODULES =	lang/php

RUN_DEPENDS =	lang/php/${MODPHP_VERSION},-mysql

NO_BUILD =	Yes
NO_TEST =	Yes
PKG_ARCH =	*

PREFIX =	${VARBASE}/www
INSTDIR =	${PREFIX}/wordpress
WRKDIST =	${WRKDIR}/wordpress

SUBST_VARS =	INSTDIR

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/wordpress
	cd ${WRKSRC} && pax -rw * ${PREFIX}/wordpress

.include <bsd.port.mk>
