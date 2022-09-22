# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI = 8

inherit unpacker desktop xdg

DESCRIPTION="A Clash GUI based on tauri"
HOMEPAGE="https://github.com/zzzgydi/clash-verge"

KEYWORDS="~amd64"

SRC_URI="https://github.com/HougeLangley/clash-verge-pkg/releases/download/gentoo/${PVR}.deb"

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
	unpack_deb ${PVR}.deb
}

src_install() {
	default
}
