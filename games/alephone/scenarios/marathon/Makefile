#	$OpenBSD: Makefile,v 1.10 2013/03/11 11:07:37 espie Exp $
PKG_ARCH =	*

COMMENT =	marathon one data files
V =		20120514
DISTNAME =	marathon-0.0.${V}
HOMEPAGE =	http://source.bungie.org/get/

DISTFILES =	Marathon-${V}-Data.zip:5
DISTFILES +=	Marathon_Manual.pdf:4

# http://trilogyrelease.bungie.org/faq.html
PERMIT_PACKAGE_CDROM =	not for sale
PERMIT_PACKAGE_FTP =	YES

EXTRACT_ONLY =	Marathon-${V}-Data.zip
INSTALL_LOC =	${PREFIX}/share/alephone
INSTALL_M =	${INSTALL_LOC}/Marathon


do-install:
	${INSTALL_DATA_DIR} ${INSTALL_M}
	# Marathon 1
	@cd ${WRKDIR}/"Marathon (A1)" && pax -rw . ${INSTALL_M}
	${INSTALL_SCRIPT} ${FILESDIR}/marathon.sh ${PREFIX}/bin/marathon
	${INSTALL_DATA} ${FULLDISTDIR}/Marathon_Manual.pdf ${INSTALL_M}

NO_BUILD =	Yes
NO_TEST =	Yes

.include <bsd.port.mk>
