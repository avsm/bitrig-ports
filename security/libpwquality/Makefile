# $OpenBSD: Makefile,v 1.6 2013/09/24 14:57:14 ajacoutot Exp $

COMMENT =	library to generate, and check strenght of passwords

DISTNAME =	libpwquality-1.2.3
SHARED_LIBS +=  pwquality            1.0      # 1.2
CATEGORIES =	security

MAINTAINER =	Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
		Antoine Jacoutot <ajacoutot@openbsd.org>

HOMEPAGE =	https://fedorahosted.org/libpwquality/

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		https://fedorahosted.org/releases/l/i/libpwquality/
EXTRACT_SUFX =		.tar.bz2

WANTLIB =		c crack pthread z ${MODPY_WANTLIB}

MODULES =		devel/gettext \
			lang/python

LIB_DEPENDS =		security/cracklib


CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--with-python-rev=${MODPY_VERSION} \
			--with-sconfigdir=${SYSCONFDIR} \
			--disable-pam
CONFIGURE_ENV +=	LDFLAGS="-L${LOCALBASE}/lib"

FAKE_FLAGS =		secureconfdir=${PREFIX}/share/examples/libpwquality/

pre-configure:
	${SUBST_CMD} ${WRKSRC}/python/Makefile.in

.include <bsd.port.mk>
