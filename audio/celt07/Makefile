# $OpenBSD: Makefile,v 1.2 2013/12/03 18:23:09 landry Exp $

# Warning: CELT is experimental software. Neither the API/ABI, nor
# the bit-stream are stable. Compatibility between different releases
# (even minor ones) is not preserved.

BROKEN-hppa =	celt.c:1540: internal compiler error: in delete_output_reload, at reload1.c:7926
COMMENT =	experimental ultra-low delay audio codec (0.7 API)

V =		0.7.1
DISTNAME =	celt-$V
PKGNAME =	celt07-$V
CATEGORIES =   	audio

HOMEPAGE =	http://www.celt-codec.org/

SHARED_LIBS +=  celt07 0.0	# 0.0

# BSD
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		http://downloads.xiph.org/releases/celt/

WANTLIB =		c m ogg sndio

LIB_DEPENDS =		audio/libogg


CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	${CONFIGURE_SHARED} \
			--program-suffix=07 \
			--with-ogg=${LOCALBASE}

CONFIGURE_ENV =		CPPFLAGS="-DUSE_SNDIO"

.include <bsd.port.mk>
