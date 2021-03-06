# $OpenBSD: Makefile,v 1.39 2013/10/31 21:12:13 sthen Exp $

COMMENT=	multi-threaded routing daemon

DISTNAME=	quagga-0.99.22.4
REVISION=	0
CATEGORIES=	net
MASTER_SITES=	http://download.savannah.gnu.org/releases/quagga/
EXTRACT_SUFX=	.tar.xz

REVISION=	0

SHARED_LIBS=	ospf		0.0 \
		ospfapiclient	0.0 \
		zebra		0.0

HOMEPAGE=	http://www.quagga.net/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	c curses m readline termcap
LIB_DEPENDS=	devel/readline

LOCALSTATEDIR=	${BASELOCALSTATEDIR}/quagga
SUBST_VARS=	LOCALSTATEDIR

BUILD_DEPENDS=	lang/gawk
USE_GMAKE=	Yes
SYSCONFDIR=	${BASESYSCONFDIR}/quagga
SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= autoconf
AUTOCONF_VERSION= 2.69
CONFIGURE_ARGS+= --includedir=${LOCALBASE}/include/quagga \
		--enable-user=_quagga \
		--enable-group=_quagga \
		--enable-vty-group=_quagga \
		--enable-vtysh
.if ${MACHINE_ARCH:Marm}
CONFIGURE_ARGS+= --disable-pie
.endif
CONFIGURE_ENV=	LIBS=-lcurses

MAKE_FLAGS=	MAKEINFO="makeinfo --no-split"
FAKE_FLAGS=	exampledir='${PREFIX}/share/examples/quagga' \
		${MAKE_FLAGS}

FLAVORS=	snmp
FLAVOR?=

.if ${FLAVOR:Msnmp}
LIB_DEPENDS+=	net/net-snmp
WANTLIB+=	crypto netsnmp
CONFIGURE_ARGS+= --enable-snmp=agentx
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
.else
CONFIGURE_ARGS+= --disable-snmp
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/quagga
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/quagga
	${INSTALL_DATA} ${WRKSRC}/SERVICES ${PREFIX}/share/doc/quagga
	${INSTALL_DATA} ${WRKSRC}/doc/quagga.info* ${PREFIX}/info
	perl -pi -e 's,^(! *)?log file (/.*/)?,$$1log file /var/log/quagga/,' \
	    ${PREFIX}/share/examples/quagga/*conf*

.include <bsd.port.mk>
