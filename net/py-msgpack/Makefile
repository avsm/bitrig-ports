# $OpenBSD: Makefile,v 1.1.1.1 2013/08/06 19:54:20 landry Exp $

COMMENT =	messagepack (de)serializer

MODPY_EGG_VERSION =	0.4.0
DISTNAME =	msgpack-python-${MODPY_EGG_VERSION}
PKGNAME =	py-msgpack-${MODPY_EGG_VERSION}

CATEGORIES =	net textproc

HOMEPAGE =	http://msgpack.org/

# Apache 2.0
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =	${MASTER_SITE_PYPI:=m/msgpack-python/}

MODULES =	lang/python
MODPY_SETUPTOOLS =	Yes
WANTLIB +=	${MODPY_WANTLIB} m pthread stdc++

FLAVORS =	python3
FLAVOR ?=

TEST_DEPENDS =	devel/py-test \
		devel/py-nose \
		devel/py-six

do-test:
	@cd ${WRKSRC} && nosetests test

.include <bsd.port.mk>
