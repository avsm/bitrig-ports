# $OpenBSD: Makefile,v 1.15 2014/02/09 11:45:52 zhuk Exp $

COMMENT-main =		KDE core run-time components
COMMENT-locale =	KDE locale data files
DISTNAME =		kde-runtime-${MODKDE4_VERSION}
PKGNAME-main =		${DISTNAME}
PKGNAME-locale =	kde4-locale-${MODKDE4_VERSION}
PKG_ARCH-locale =	*
REVISION-main =		1

DPB_PROPERTIES =	parallel

SHARED_LIBS =	kwalletbackend 		50.0
SHARED_LIBS +=	molletnetwork 		50.0
#SHARED_LIBS +=	nepomukdatamanagement	0.0
SHARED_LIBS +=	kdeinit4_kcmshell4	51.0
SHARED_LIBS +=	kdeinit4_kglobalaccel	51.0
SHARED_LIBS +=	kdeinit4_khelpcenter	51.0
SHARED_LIBS +=	kdeinit4_kuiserver 	51.0
SHARED_LIBS +=	kdeinit4_kwalletd 	51.0

WANTLIB-main =  ${WANTLIB} c m pthread stdc++ util
WANTLIB-main += Half ICE Iex IlmImf IlmThread Imath SM X11 Xcursor Xext
WANTLIB-main += lib/qt4/QtDBus lib/qt4/QtDeclarative lib/qt4/QtGui
WANTLIB-main += lib/qt4/QtNetwork lib/qt4/QtScript lib/qt4/QtSvg
WANTLIB-main += lib/qt4/QtWebKit lib/qt4/QtXml
WANTLIB-main += ${KDE4LIB}/kactivities ${KDE4LIB}/kcmutils
WANTLIB-main += ${KDE4LIB}/kdeclarative
WANTLIB-main += ${KDE4LIB}/kdesu ${KDE4LIB}/kdeui ${KDE4LIB}/kdewebkit
WANTLIB-main += ${KDE4LIB}/kdnssd ${KDE4LIB}/kemoticons ${KDE4LIB}/kfile
WANTLIB-main += ${KDE4LIB}/khtml ${KDE4LIB}/kio ${KDE4LIB}/kjs
WANTLIB-main += ${KDE4LIB}/kmediaplayer ${KDE4LIB}/knewstuff3
WANTLIB-main += ${KDE4LIB}/knotifyconfig ${KDE4LIB}/kparts ${KDE4LIB}/kpty
WANTLIB-main += ${KDE4LIB}/kxmlrpcclient ${KDE4LIB}/nepomuk
WANTLIB-main += ${KDE4LIB}/nepomukcore ${KDE4LIB}/nepomukutils
WANTLIB-main += ${KDE4LIB}/plasma ${KDE4LIB}/solid
WANTLIB-main += attica canberra exiv2 glib-2.0 jpeg pulse
WANTLIB-main += pulse-mainloop-glib smbclient ssh soprano webp
WANTLIB-locale =

MULTI_PACKAGES =	-main -locale

MODULES =	multimedia/phonon
MODKDE4_USE =	pim libs

BUILD_DEPENDS =		archivers/bzip2 \
			archivers/xz \
			devel/doxygen

RUN_DEPENDS-locale =
RUN_DEPENDS-main =	${RUN_DEPENDS} \
			archivers/bzip2 \
			archivers/xz \
			devel/desktop-file-utils \
			misc/shared-mime-info \
			x11/kde-shared-data>=${MODKDE4_DEP_VERSION} \
			${BUILD_PKGPATH},-locale>=${MODKDE4_DEP_VERSION}

# QCA2 is useless without this
RUN_DEPENDS-main +=	security/qca-ossl

LIB_DEPENDS-locale =
LIB_DEPENDS-main =	${LIB_DEPENDS} \
			audio/libcanberra \
			audio/pulseaudio \
			databases/soprano \
			graphics/libwebp \
			graphics/openexr \
			graphics/exiv2 \
			net/samba \
			productivity/attica \
			security/libssh \
			${MODKDE4_DEP_DIR}/kactivities>=${MODKDE4_DEP_VERSION} \
			${MODKDE4_DEP_DIR}/nepomuk-core>=${MODKDE4_DEP_VERSION}

# QNtrack depends on libnl, Linux-specific library.
CONFIGURE_ARGS =	-DWITH_ALSA:Bool=FALSE \
			-DCMAKE_DISABLE_FIND_PACKAGE_SLP:Bool=TRUE \
			-DCMAKE_DISABLE_FIND_PACKAGE_QNtrack:Bool=TRUE

MODKDE4_SYSCONF_FILES =	dbus-1	share/examples \
			xdg	share/examples

post-extract:
	cp ${FILESDIR}/*.cmake ${WRKSRC}/cmake/modules/

post-install:
	rm -R ${PREFIX}/share/desktop-directories
	find ${PREFIX}/share/icons -name 'knetattach*' | xargs rm

.include <bsd.port.mk>
