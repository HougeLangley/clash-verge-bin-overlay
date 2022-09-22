# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION="A Clash GUI based on tauri"
HOMEPAGE="https://github.com/zzzgydi/clash-verge"

KEYWORDS="~amd64"

SRC_URI="https://github.com/HougeLangley/clash-verge-pkg/releases/download/gentoo/${P}.deb"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="
	dev-libs/libappindicator
	net-libs/webkit-gtk
	dev-libs/gobject-introspection-common
	sys-apps/yarn
	dev-lang/rust
"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${P}.deb
}

src_prepare() {
	default
}

src_install() {
	dobin usr/bin/{clash,clash-meta,clash-verge}

	insinto /usr/lib
	doins usr/lib/clash-verge/resources/Country.mmdb

	domenu usr/share/applications/clash-verge.desktop

	doicon usr/share/icons/hicolor/128x128/apps/clash-verge.png
	doicon usr/share/icons/hicolor/256x256@2/apps/clash-verge.png
	doicon usr/share/icons/hicolor/32x32/apps/clash-verge.png

}

pkg_postinst() {
	udev_reload
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	udev_reload
	xdg_desktop_database_update
	xdg_icon_cache_update
}
