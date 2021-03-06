# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/gperf/gperf-3.0.4.ebuild,v 1.8 2009/11/02 18:44:24 armin76 Exp $

EAPI="2"

inherit eutils

DESCRIPTION="A perfect hash function generator"
HOMEPAGE="http://www.gnu.org/software/gperf/gperf.html"
SRC_URI="mirror://gnu/gperf/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}/gperf-add-disable-inline-options.patch"
}

src_install() {
	emake DESTDIR="${D}" htmldir=/usr/share/doc/${PF}/html install || die
	dodoc AUTHORS ChangeLog NEWS README
}
