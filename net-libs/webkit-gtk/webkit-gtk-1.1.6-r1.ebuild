# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/webkit-gtk/webkit-gtk-0_p40220.ebuild,v 1.3 2009/03/11 21:37:14 klausman Exp $

MY_P="webkit-${PV}"
DESCRIPTION="Open source web browser engine"
HOMEPAGE="http://www.webkitgtk.org/"
SRC_URI="http://www.webkitgtk.org/${MY_P}.tar.gz"

LICENSE="LGPL-2 LGPL-2.1 BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~sparc ~x86"
# geoclue
IUSE="coverage debug doc gnome-keyring gstreamer svg"

# use sqlite by default
RDEPEND="
	dev-libs/libxslt
	media-libs/jpeg
	media-libs/libpng
	dev-libs/libxml2
	x11-libs/cairo

	>=x11-libs/gtk+-2.10
	>=dev-libs/icu-3.8.1-r1
	>=net-libs/libsoup-2.25
	>=dev-db/sqlite-3
	>=app-text/enchant-0.22

	gnome-keyring? ( >=gnome-base/gnome-keyring-2.26.0 )
	gstreamer? ( >=media-libs/gst-plugins-base-0.10 )"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/gperf
	dev-util/pkgconfig
	doc? ( >=dev-util/gtk-doc-1.10 )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	# It doesn't compile on alpha without this LDFLAGS
	use alpha && append-ldflags "-Wl,--no-relax"

	econf \
		$(use_enable gnome-keyring gnomekeyring) \
		$(use_enable gstreamer video) \
		$(use_enable svg) \
		$(use_enable debug) \
		$(use_enable coverage)

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc WebKit/gtk/{NEWS,ChangeLog}
}
