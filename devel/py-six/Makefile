# $OpenBSD: Makefile,v 1.5 2014/03/22 22:21:25 bcallah Exp $

COMMENT =	Python 2 and 3 compatibility library
MODPY_EGG_VERSION =	1.6.1
DISTNAME =	six-${MODPY_EGG_VERSION}
PKGNAME =	py-six-${MODPY_EGG_VERSION}
CATEGORIES =	devel

HOMEPAGE =	http://pythonhosted.org/six/

MAINTAINER =	Brian Callahan <bcallah@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =	https://pypi.python.org/packages/source/s/six/

MODULES =	lang/python
MODPY_SETUPTOOLS =	Yes

TEST_DEPENDS =	devel/py-py \
		devel/py-test

do-test:
	${MODPY_BIN} ${WRKSRC}/test_six.py

.include <bsd.port.mk>
