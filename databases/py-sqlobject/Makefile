# $OpenBSD: Makefile,v 1.14 2013/03/11 02:52:08 espie Exp $

COMMENT =		Object Relational Manager

MODPY_EGG_VERSION =	0.10.4
DISTNAME =		SQLObject-${MODPY_EGG_VERSION}
PKGNAME =		py-sqlobject-${MODPY_EGG_VERSION}
REVISION =		2

CATEGORIES =		databases

HOMEPAGE =		http://www.sqlobject.org/

MAINTAINER =		Martynas Venckus <martynas@openbsd.org>

# LGPL
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		${MASTER_SITE_PYPI:=S/SQLObject/}

MODULES =		lang/python
RUN_DEPENDS =		www/py-formencode
TEST_DEPENDS =	${RUN_DEPENDS} \
			devel/py-nose \
			devel/py-py

MODPY_SETUPTOOLS =	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-sqlobject
	${INSTALL_DATA} ${WRKSRC}/docs/*.txt ${PREFIX}/share/doc/py-sqlobject/
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/py-sqlobject
	${INSTALL_DATA} ${WRKSRC}/docs/*.py \
		${PREFIX}/share/examples/py-sqlobject/

do-test:
	cd ${WRKSRC}/sqlobject/tests && ${LOCALBASE}/bin/py.test

.include <bsd.port.mk>
