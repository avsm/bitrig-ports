# $OpenBSD: Makefile,v 1.15 2013/08/12 04:11:20 robert Exp $

COMMENT=	graphical network traffic map

DISTNAME=	php-weathermap-0.97c
EXTRACT_SUFX=	.zip
REVISION=	0

CATEGORIES=	net www

HOMEPAGE=	http://www.network-weathermap.com/

MAINTAINER=	Stuart Henderson <sthen@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${HOMEPAGE}files/

MODULES=	lang/php

RUN_DEPENDS=	www/pear \
		lang/php/${MODPHP_VERSION},-gd

NO_TEST=	Yes

PKG_ARCH=	*
WRKDIST=	${WRKDIR}/weathermap

PREFIX=		${VARBASE}/www
INSTDIR=	${PREFIX}/weathermap
SUBST_VARS=	INSTDIR

do-configure:
	perl -pi -e 's,^#!/usr/bin/php,#!${MODPHP_BIN},;' \
	    -e 's,/usr/bin/rrdtool,${LOCALBASE}/bin/rrdtool,;' \
	    ${WRKSRC}/weathermap

do-build:
.for i in weathermap.conf configs/simple.conf
	mv ${WRKSRC}/$i ${WRKSRC}/$i-dist
.endfor

do-install:
	${INSTALL_DATA_DIR} ${INSTDIR}
	cd ${WRKSRC}; pax -rw * ${INSTDIR}
	${INSTALL_DATA} ${FILESDIR}/editor-config.php-dist ${INSTDIR}
	chown -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}
	chmod -R u=rwX,og=rX ${INSTDIR}
	find ${INSTDIR} -name '*.orig' -print0 | xargs -0r rm

.include <bsd.port.mk>
