# $OpenBSD: Makefile,v 1.6 2013/12/08 19:13:29 zhuk Exp $

COMMENT =	KDE mobipocket plugins for Strigi, Okular and thumbnails
DISTNAME =	kdegraphics-mobipocket-${MODKDE4_VERSION}

WANTLIB =  m pthread stdc++
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtNetwork lib/qt4/QtSvg
WANTLIB += lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/kio ${KDE4LIB}/okularcore
WANTLIB += streamanalyzer streams

RUN_DEPENDS =	devel/desktop-file-utils

LIB_DEPENDS =	databases/strigi \
		${MODKDE4_DEP_DIR}/okular>=${MODKDE4_DEP_VERSION}

.include <bsd.port.mk>
