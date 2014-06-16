# $OpenBSD$

COMMENT =	Source-based OCaml package manager
CATEGORIES =	devel 

V =		1.1.2-rc3
MAINTAINER = 	Anil Madhavapeddy <avsm@openbsd.org>

NAME =		opam
DISTNAME =	opam-full-$V
PKGNAME =	${NAME}-$V
WRKDIST =	${WRKDIR}/opam-full-$V
MASTER_SITES =  https://github.com/ocaml/opam/releases/download/${V}/

HOMEPAGE =	http://opam.ocaml.org

# LGPL
PERMIT_PACKAGE_CDROM =		Yes

USE_GMAKE =     Yes
MODULES =	lang/ocaml
WANTLIB =	c m

CONFIGURE_STYLE = gnu
ALL_TARGET =    lib-ext all
FAKE_FLAGS =    prefix=${PREFIX}

.include <bsd.port.mk>
