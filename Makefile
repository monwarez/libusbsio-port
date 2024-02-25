PORTNAME=	libusbsio
PORTVERSION=	2.1.11
DISTVERSIONSUFFIX=	-src
CATEGORIES=	devel
MASTER_SITES=	https://www.nxp.com/downloads/en/libraries/

MAINTAINER=	monwarez@mailoo.org
COMMENT=	nxp libusbsio library

LICENCE=	MIT
LICENSE_FILE=	${WKRSRC}/LICENSE.txt

LIB_DEPENDS=	libhidapi.so:comms/hidapi

USES=		zip gmake python

.include <bsd.port.pre.mk>

post-patch:
	${CP} ${WRKSRC}/makefile ${WRKSRC}/Makefile

do-install:
	${MKDIR} -p ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio/bin/freebsd_amd64
	${INSTALL} ${WRKSRC}/python/libusbsio/__init__.py ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio
	${INSTALL} ${WRKSRC}/python/libusbsio/__main__.py ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio
	${INSTALL} ${WRKSRC}/python/libusbsio/libusbsio.py ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio
	${INSTALL} ${WRKSRC}/bin/freebsd_amd64/libusbsio.a ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio/bin/freebsd_amd64
	${INSTALL} ${WRKSRC}/bin/freebsd_amd64/libusbsio.so ${STAGEDIR}${PREFIX}/${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/libusbsio/bin/freebsd_amd64

.include <bsd.port.post.mk>

