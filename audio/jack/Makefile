# $OpenBSD: Makefile,v 1.27 2013/03/21 08:45:12 ajacoutot Exp $

SHARED_ONLY =		Yes

COMMENT =		low latency sound server

V =			0.121.3
DISTNAME =		jack-audio-connection-kit-${V}
PKGNAME =		jack-${V}
REVISION =		4
CATEGORIES =		audio

SHARED_LIBS +=		jack		0.0	# 0.28
SHARED_LIBS +=		jackserver	0.0	# 0.28

HOMEPAGE =		http://jackaudio.org/

# LGPLv2/GPLv2
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c celt0>=1 m pthread readline samplerate sndfile
WANTLIB += sndio termcap FLAC ogg vorbis vorbisenc

MASTER_SITES =		${HOMEPAGE}downloads/

LIB_DEPENDS =		audio/libsndfile \
			audio/libsamplerate \
			audio/celt>=0.11.0 \
			devel/readline

# uses macros from libtool.m4
BUILD_DEPENDS =		devel/libtool
USE_GROFF =		Yes
LIBTOOL_FLAGS +=	--tag=disable-static

AUTOCONF_VERSION =	2.65
AUTOMAKE_VERSION =	1.10
CONFIGURE_STYLE =	autoconf automake
MODGNU_CONFIG_GUESS_DIRS = ${WRKSRC} ${WRKSRC}/config
CONFIGURE_ARGS +=	${CONFIGURE_SHARED} \
			--with-default-tmpdir=/var/tmp \
			--disable-sun \
			--disable-portaudio \
			--disable-optimize

CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			HAVE_DOXYGEN="false"

.ifdef DEBUG
CONFIGURE_ARGS +=	--enable-debug
.endif

post-extract:
	mkdir -p ${WRKSRC}/drivers/sndio
	cp ${FILESDIR}/Makefile.am ${FILESDIR}/sndio_driver.{c,h} \
		${WRKSRC}/drivers/sndio

AUTO_ENV=	AUTOMAKE_VERSION=${AUTOMAKE_VERSION} \
		AUTOCONF_VERSION=${AUTOCONF_VERSION}

post-patch:
	cd ${WRKSRC}; ${AUTO_ENV} aclocal

pre-configure:
	cd ${WRKSRC}; ${AUTO_ENV} automake --add-missing --foreign

.include <bsd.port.mk>
