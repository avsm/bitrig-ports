# $OpenBSD: Makefile,v 1.4 2013/03/11 11:41:29 espie Exp $

COMMENT =		top-like monitor for Apache

DISTNAME =		apachetop-0.12.6
CATEGORIES =		sysutils

REVISION=		0

MAINTAINER =		Gonzalo L. R. <gonzalo@x61.com.ar>

HOMEPAGE =		http://freshmeat.net/projects/apachetop/

# BSD
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES =		http://www.webta.org/apachetop/

CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.59
USE_GROFF =		Yes

CONFIGURE_ARGS =	--disable-fam \
			--with-logfile=/var/www/logs/access_log
CONFIGURE_ENV =		CPPFLAGS='-I${LOCALBASE}/include' \
			LDFLAGS='-L${LOCALBASE}/lib'

WANTLIB +=		c m ncurses readline stdc++
LIB_DEPENDS=		devel/readline

.include <bsd.port.mk>
