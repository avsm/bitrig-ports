# $OpenBSD: Makefile,v 1.8 2013/12/08 19:13:29 zhuk Exp $

COMMENT =	KDE Activity rooms management
DISTNAME =	kactivities-${MODKDE4_VERSION}

SHARED_LIBS =	kactivities		50.0 # 6.0
SHARED_LIBS +=	kactivities-models	50.0

WANTLIB =  m pthread
WANTLIB += lib/qt4/QtDBus lib/qt4/QtDeclarative lib/qt4/QtGui lib/qt4/QtNetwork
WANTLIB += lib/qt4/QtScript lib/qt4/QtSvg lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/kio ${KDE4LIB}/nepomukcore
WANTLIB += soprano

# Force usage of GCC 4.2, to make sure daemon crap remains disabled
MODULES =		gcc4
MODKDE4_USE =		libs
MODGCC4_ARCHS =		*
MODGCC4_VERSION =	4.2
MODGCC4_LANGS =		c c++

BUILD_DEPENDS =		misc/shared-desktop-ontologies

LIB_DEPENDS =		${MODKDE4_DEP_DIR}/nepomuk-core>=${MODKDE4_DEP_VERSION}

CONFIGURE_ARGS =	-DBUILD_activityranking=No

.include <bsd.port.mk>
