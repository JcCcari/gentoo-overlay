# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/deluge/deluge-9999.ebuild,v 1.24 2010/03/24 20:00:42 armin76 Exp $

EAPI="2"

inherit eutils distutils git flag-o-matic

EGIT_REPO_URI="git://deluge-torrent.org/deluge.git"

DESCRIPTION="BitTorrent client with a client/server model."
HOMEPAGE="http://deluge-torrent.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="gtk libnotify webinterface"

DEPEND=">=virtual/python-2.5
	>=net-libs/rb_libtorrent-0.14.9[python]
	dev-python/setuptools"
RDEPEND="${DEPEND}
	dev-python/chardet
	dev-python/pyopenssl
	dev-python/pyxdg
	|| ( >=virtual/python-2.6 dev-python/simplejson )
	>=dev-python/twisted-8.1
	>=dev-python/twisted-web-8.1
	gtk? (
		dev-python/pygame
		dev-python/pygobject
		>=dev-python/pygtk-2.12
		gnome-base/librsvg
		libnotify? ( dev-python/notify-python )
	)
	webinterface? ( dev-python/mako )"

pkg_setup() {
	append-ldflags $(no-as-needed)
}

src_install() {
	distutils_src_install
	newinitd "${FILESDIR}"/deluged.init deluged
	newconfd "${FILESDIR}"/deluged.conf deluged
}

pkg_postinst() {
	elog
	elog "If after upgrading it doesn't work, please remove the"
	elog "'~/.config/deluge' directory and try again, but make a backup"
	elog "first!"
	elog
	elog "To start the daemon either run 'deluged' as user"
	elog "or modify /etc/conf.d/deluged and run"
	elog "/etc/init.d/deluged start as root"
	elog "You can still use deluge the old way"
	elog
	elog "For more information look at http://dev.deluge-torrent.org/wiki/Faq"
	elog
}
