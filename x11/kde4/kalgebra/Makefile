# $OpenBSD: Makefile,v 1.5 2013/12/08 19:13:30 zhuk Exp $

COMMENT =	scientific calculator for KDE
DISTNAME =	kalgebra-${MODKDE4_VERSION}

WANTLIB =  c m pthread stdc++
WANTLIB += GL GLU
WANTLIB += lib/qt4/QtDeclarative
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtNetwork
WANTLIB += lib/qt4/QtOpenGL lib/qt4/QtScript lib/qt4/QtSvg
WANTLIB += lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/analitza ${KDE4LIB}/analitzagui
WANTLIB += ${KDE4LIB}/analitzaplot ${KDE4LIB}/kdeclarative
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/khtml
WANTLIB += ${KDE4LIB}/kio ${KDE4LIB}/kjs ${KDE4LIB}/kparts
WANTLIB += ${KDE4LIB}/nepomuk ${KDE4LIB}/nepomukutils
WANTLIB += ${KDE4LIB}/plasma
WANTLIB += soprano

MODULES =	multimedia/phonon

BUILD_DEPENDS =	${MODKDE4_DEP_DIR}/libkdeedu>=${MODKDE4_DEP_VERSION}

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+2,-guic	\
		${MODKDE4_DEP_DIR}/libkdeedu>=${MODKDE4_DEP_VERSION}

LIB_DEPENDS =	${MODKDE4_DEP_DIR}/analitza>=${MODKDE4_DEP_VERSION}

.include <bsd.port.mk>
