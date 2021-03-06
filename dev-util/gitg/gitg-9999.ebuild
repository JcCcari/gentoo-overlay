# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/gitg/gitg-0.0.3.ebuild,v 1.1 2009/04/29 10:06:50 ikelos Exp $

inherit git eutils

DESCRIPTION="git repository viewer for GNOME"
HOMEPAGE="http://trac.novowork.com/gitg/"
EGIT_REPO_URI="git://github.com/jessevdk/gitg.git"
EGIT_PROJECT="gitg"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.16
	>=x11-libs/gtk+-2.12
	>=x11-libs/gtksourceview-2.2
	>=gnome-base/gconf-2.10
	dev-util/git"

DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/pkgconfig-0.15
	>=dev-util/intltool-0.35"

DOCS="AUTHORS ChangeLog NEWS README"

pkg_setup() {
	G2CONF="${G2CONF} --disable-bundle"
}

src_compile() {
	./autogen.sh --prefix=/usr
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	emake install DESTDIR="${D}"
}
