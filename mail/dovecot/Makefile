# $OpenBSD: Makefile,v 1.219 2014/03/16 09:42:12 brad Exp $

SHARED_ONLY=	Yes

COMMENT-server=	compact IMAP/POP3 server
COMMENT-ldap=	LDAP authentication support for Dovecot
COMMENT-mysql=	MySQL authentication / dictionary support for Dovecot
COMMENT-postgresql= PostgreSQL authentication / dictionary support for Dovecot

# Bump dovecot-pigeonhole every time you update to a new Dovecot version.
V_MAJOR=	2.2
V_DOVECOT=	2.2.10

DISTNAME=	dovecot-${V_DOVECOT}
PKGNAME=	dovecot-${V_DOVECOT}
PKGNAME-server=	dovecot-${V_DOVECOT}
PKGNAME-ldap=	dovecot-ldap-${V_DOVECOT}
PKGNAME-mysql=	dovecot-mysql-${V_DOVECOT}
PKGNAME-postgresql= dovecot-postgresql-${V_DOVECOT}
CATEGORIES=	mail
MASTER_SITES=	${HOMEPAGE}releases/${V_MAJOR}/

REVISION-server= 0

SHARED_LIBS=	dovecot-compression 0.0 \
		dovecot-lda	2.0 \
		dovecot-login	2.0 \
		dovecot-sql	2.0 \
		dovecot-storage	2.0 \
		dovecot		2.0

HOMEPAGE=	http://www.dovecot.org/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# LGPLv2.1 and MIT
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB-server=	asn1 bz2 c com_err crypto gssapi heimbase krb5 lzma roken \
		sqlite3 ssl wind z ${MODLIBICONV_WANTLIB}
WANTLIB-ldap=	asn1 com_err crypto gssapi heimbase krb5 lber-2.4 ldap-2.4 \
		roken sasl2 ssl wind
WANTLIB-mysql=	crypto m lib/mysql/mysqlclient>=10 ssl z
WANTLIB-postgresql= asn1 com_err crypto heimbase krb5 pq>=4 roken ssl wind

MODULES=	converters/libiconv
LIB_DEPENDS+=	archivers/bzip2 \
		archivers/xz
LIB_DEPENDS-ldap= databases/openldap
RUN_DEPENDS-ldap= ${BASE_PKGPATH}=${V_DOVECOT}
LIB_DEPENDS-mysql= databases/mysql
RUN_DEPENDS-mysql= ${BASE_PKGPATH}=${V_DOVECOT}
LIB_DEPENDS-postgresql= databases/postgresql
RUN_DEPENDS-postgresql= ${BASE_PKGPATH}=${V_DOVECOT}

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-gssapi \
		--with-rundir=/var/dovecot \
		--with-sql=plugin \
		--with-sqlite \
		--with-statedir=/var/dovecot \
		--without-pam \
		--without-shadow \
		--without-stemmer \
		--without-vpopmail
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PSEUDO_FLAVORS=	no_db no_ldap no_mysql no_postgresql
FLAVOR?=
.if ${FLAVOR:Mno_db}
FLAVOR+=	no_ldap no_mysql no_postgresql
.endif

MULTI_PACKAGES= -server -ldap -mysql -postgresql
SUBPACKAGE?=	-server

.include <bsd.port.arch.mk>

.if ${BUILD_PACKAGES:M-ldap}
CONFIGURE_ARGS+=--with-ldap=plugin
.endif

.if ${BUILD_PACKAGES:M-mysql}
CONFIGURE_ARGS+=--with-mysql
.endif

.if ${BUILD_PACKAGES:M-postgresql}
CONFIGURE_ARGS+=--with-pgsql
.endif

pre-build:
	@${SUBST_CMD} ${WRKSRC}/doc/example-config/conf.d/10-mail.conf

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/dovecot-openssl.cnf \
		${PREFIX}/share/examples/dovecot
	${INSTALL_SCRIPT} ${WRKSRC}/doc/mkcert.sh \
		${PREFIX}/sbin/dovecot-mkcert.sh
	@rm ${PREFIX}/share/doc/dovecot/{dovecot-openssl.cnf,mkcert.sh}
	@find ${PREFIX}/lib/dovecot -name '*.a' -print | xargs rm
	@find ${PREFIX}/lib/dovecot -name '*.la' -print | xargs rm

.include <bsd.port.mk>
