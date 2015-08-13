# $OpenBSD: Makefile,v 1.23 2014/08/22 22:21:53 kili Exp $

COMMENT=	Objective Caml bindings for PostgreSQL
CATEGORIES=	databases

V=		3.2.1
REVISION=	1
NAME =		ocaml-postgresql
DISTNAME=	postgresql-ocaml-${V}
PKGNAME=	${NAME}-${V}
MASTER_SITES=	https://github.com/mmottl/postgresql-ocaml/releases/download/v${V}/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	https://bitbucket.org/mmottl/postgresql-ocaml/

# LGPL
PERMIT_PACKAGE_CDROM=	Yes

MODULES=	lang/ocaml

WANTLIB =	pq
BUILD_DEPENDS =	sysutils/findlib
LIB_DEPENDS=	databases/postgresql

CONFIGURE_STYLE =	oasis

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/${NAME}
	${INSTALL_DATA} \
		${FILESDIR}/README ${WRKDIST}/examples/* \
		${PREFIX}/share/examples/${NAME}/

.include <bsd.port.mk>
