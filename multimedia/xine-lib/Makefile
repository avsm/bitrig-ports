# $OpenBSD: Makefile,v 1.108 2014/01/08 00:17:53 brad Exp $

SHARED_ONLY=	Yes

COMMENT=	multimedia decoding library

DISTNAME=	xine-lib-1.2.4
REVISION=	0
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xine/}
EXTRACT_SUFX=	.tar.xz

SHARED_LIBS=	xine	30.2

HOMEPAGE=	http://www.xine-project.org/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# GPLv2
PERMIT_PACKAGE_CDROM=	patents
PERMIT_PACKAGE_FTP=	Yes

WANTLIB=	FLAC GL GLU ICE SDL SM X11 Xext Xinerama Xv XvMCW a52 avcodec \
		avutil bluray c cdio dca dvdnav dvdread expat faad fontconfig \
		freetype iso9660 jpeg m mad modplug mpcdec mng ogg postproc \
		pthread pthread-stubs sndio speex theora usbhid vcdinfo vorbis \
		wavpack xcb-shape xcb-shm xcb-xv xcb xdg-basedir xml2 z

XINEAPI_REV=	2.3
SUBST_VARS+=	XINEAPI_REV

MODULES=	devel/gettext
LIB_DEPENDS=	audio/faad \
		audio/flac \
		audio/liba52 \
		audio/libcdio \
		audio/libdca \
		audio/libmad \
		audio/libmodplug \
		audio/libogg \
		audio/libvorbis \
		audio/musepack \
		audio/speex \
		audio/wavpack \
		devel/sdl \
		graphics/ffmpeg>=20111126 \
		graphics/jpeg \
		graphics/libmng \
		graphics/vcdimager \
		multimedia/libbluray \
		multimedia/libdvdnav \
		multimedia/libtheora \
		x11/libxdg-basedir

# Add back fast math flag since we override CFLAGS
CFLAGS+=	-ffast-math

MAKE_ENV=	V=1

USE_GMAKE=	Yes
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/
# Uses GNU libtool -weak feature
USE_LIBTOOL=	gnu
USE_GROFF=	Yes
CONFIGURE_STYLE= autoconf
AUTOCONF_VERSION= 2.69
CONFIGURE_ARGS+=--disable-aalib \
		--disable-gdkpixbuf \
		--disable-gnomevfs \
		--disable-optimizations \
		--disable-real-codecs \
		--disable-samba \
		--disable-w32dll \
		--with-external-dvdnav \
		--with-fontconfig \
		--with-freetype \
		--with-wavpack \
		--without-caca \
		--without-esound \
		--without-imagemagick
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include" \
		LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib" \
		CC="gcc"

NO_TEST=	Yes

post-install:
	@find ${PREFIX}/lib/xine/plugins -name '*.a' -print | xargs rm

.include <bsd.port.mk>
