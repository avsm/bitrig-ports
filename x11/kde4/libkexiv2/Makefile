# $OpenBSD: Makefile,v 1.8 2014/01/20 19:08:10 zhuk Exp $

COMMENT =	KDE exiv2 wrapper
CATEGORIES =	graphics devel
DISTNAME =	libkexiv2-${MODKDE4_VERSION}
PKGSPEC =	libkexiv2->=4,<5

SHARED_LIBS =	kexiv2			50.0	# 10.0

WANTLIB =  m pthread stdc++
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtSvg lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui
WANTLIB += exiv2

MODKDE4_USE =	libs

LIB_DEPENDS = 	graphics/exiv2>=0.22

post-extract:
	cp ${FILESDIR}/Kexiv2Config.cmake.in ${WRKDIST}/

.include <bsd.port.mk>
