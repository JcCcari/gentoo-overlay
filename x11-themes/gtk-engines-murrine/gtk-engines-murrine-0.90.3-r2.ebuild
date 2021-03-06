# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gtk-engines-murrine/gtk-engines-murrine-0.90.3-r1.ebuild,v 1.7 2010/02/14 06:23:53 nirbheek Exp $
# https://launchpad.net/ubuntu/lucid/+source/gtk2-engines-murrine/0.90.3+git20100323-0ubuntu3

EAPI="2"

inherit eutils gnome.org

MY_PN="murrine"
DESCRIPTION="Murrine GTK+2 Cairo Engine"

HOMEPAGE="http://www.cimitan.com/murrine/"
SRC_URI="gtk2-engines-murrine_0.90.3+git20100323.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE="+themes animation-rtl"

RDEPEND=">=x11-libs/gtk+-2.12"
PDEPEND="themes? ( x11-themes/murrine-themes )"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.37.1
	sys-devel/gettext
	dev-util/pkgconfig"

# S="${WORKDIR}/${MY_PN}-${PV}"
S="${WORKDIR}/gtk2-engines-murrine-0.90.3+git20100323"

src_configure() {
	epatch "${FILESDIR}/gtk2-engines-murrine_0.90.3+git20100323-0ubuntu3.diff"
	econf --enable-animation \
		--enable-rgba \
		$(use_enable animation-rtl animationrtl)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS ChangeLog TODO
}
