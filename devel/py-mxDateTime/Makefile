# $OpenBSD: Makefile,v 1.41 2014/01/23 23:55:57 espie Exp $

SHARED_ONLY =	Yes

COMMENT =	date and time types for Python
REVISION =	0

MODPY_EGG_VERSION = 3.2.6
DISTNAME =	egenix-mx-base-${MODPY_EGG_VERSION}
PKGNAME =	py-mxDateTime-${MODPY_EGG_VERSION}
CATEGORIES =	devel

HOMEPAGE =	http://www.egenix.com/products/python/mxBase/

# eGenix.com Public License Agreement
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =	http://downloads.egenix.com/python/

WANTLIB += m ${MODPY_WANTLIB} pthread

MODULES =	lang/python

NO_TEST =	Yes

# Avoid collisions with libc' bm_free
post-configure:
	@perl -pi -e 's|bm_free|mxbm_free|g' \
	  ${WRKSRC}/mx/TextTools/mxTextTools/mxbmse.[ch] \
	  ${WRKSRC}/mx/TextTools/mxTextTools/mxTextTools.c

post-install:
	chmod a+r ${PREFIX}/lib/python${MODPY_VERSION}/site-packages/mx/URL/Doc/mxURL.pdf
	chmod a+r ${PREFIX}/lib/python${MODPY_VERSION}/site-packages/mx/DateTime/Doc/mxDateTime.pdf
	
.include <bsd.port.mk>
