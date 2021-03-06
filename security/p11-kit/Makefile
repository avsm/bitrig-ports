# $OpenBSD: Makefile,v 1.28 2014/01/27 17:57:32 ajacoutot Exp $

COMMENT=	library for loading and enumurating of PKCS\#11 modules
SHARED_ONLY =	Yes

DISTNAME=	p11-kit-0.20.2

CATEGORIES=	security

SHARED_LIBS +=  p11-kit              1.0      # 0.0

HOMEPAGE=	http://p11-glue.freedesktop.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# BSD-like
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c ffi pthread tasn1

MASTER_SITES=	${HOMEPAGE}releases/

MODULES=	devel/gettext

LIB_DEPENDS=	devel/libffi \
		security/libtasn1

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--with-module-path=${PREFIX}/lib/pkcs11 \
		--with-trust-paths=/etc/ssl/cert.pem

# no translation yet
CONFIGURE_ARGS += --disable-nls

FAKE_FLAGS=	exampledir=${PREFIX}/share/examples/p11-kit/pkcs11

post-install:
	rm ${PREFIX}/lib/pkcs11/*.{a,la}

.include <bsd.port.mk>
