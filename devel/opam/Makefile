# $OpenBSD$

COMMENT =	Source-based OCaml package manager
CATEGORIES =	devel 

V =		1.1.1
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
MAKE_FLAGS =	OCPBUILD="./ocp-build/ocp-build -no-use-ocamlfind -no-user-prefs"
FAKE_FLAGS =	OPAMROOT=${WRKDIR}/opam-home

post-patch:
	cd ${WRKDIST}/src_ext && $(GMAKE) clone

.include <bsd.port.mk>
