# $OpenBSD: Makefile,v 1.6 2013/12/08 19:13:30 zhuk Exp $

COMMENT =	KDE geometric constructions explorer
DISTNAME =	kig-${MODKDE4_VERSION}

WANTLIB =  c m pthread stdc++
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtNetwork
WANTLIB += lib/qt4/QtSvg lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kcmutils ${KDE4LIB}/kdeui ${KDE4LIB}/kemoticons
WANTLIB += ${KDE4LIB}/kidletime ${KDE4LIB}/kio ${KDE4LIB}/kparts
WANTLIB += ${KDE4LIB}/kprintutils ${KDE4LIB}/ktexteditor ${KDE4LIB}/kutils
WANTLIB += ${KDE4LIB}/nepomuk ${KDE4LIB}/nepomukutils
WANTLIB += soprano

MODULES =	lang/python

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+2,-guic

BUILD_DEPENDS =	devel/boost
RUN_DEPENDS =	devel/boost \
		devel/desktop-file-utils \
		x11/gtk+2,-guic

post-patch:
	${SUBST_CMD} ${WRKSRC}/pykig/pykig.py

.include <bsd.port.mk>
