# $OpenBSD: Makefile,v 1.4 2013/12/08 19:13:31 zhuk Exp $

COMMENT =	mini-golf simulator game for KDE
DISTNAME =	kolf-${MODKDE4_VERSION}

SHARED_LIBS =	kolfprivate		50.0  # 4.10

WANTLIB =  c m pthread stdc++
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtNetwork lib/qt4/QtSvg
WANTLIB += lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/kio

MODULES =	multimedia/phonon
MODKDE4_USE =	games

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+2,-guic

.include <bsd.port.mk>
