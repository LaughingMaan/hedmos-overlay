# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Razer devices configurator"
HOMEPAGE="https://github.com/z3ntu/RazerGenie"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/z3ntu/${PN}.git"
	inherit git-r3
else
	COMMIT="7e4706058d2fec5ad72e6648edd3b091620c29f6"
	SRC_URI="https://github.com/z3ntu/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS=" ~amd64 "
	S="${WORKDIR}"/${PN}-${COMMIT}
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="openrazer matrix"

DEPEND="
	dev-qt/qtdbus:5
	dev-qt/qtnetwork:5
	dev-qt/linguist-tools:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5"
RDEPEND="${DEPEND}
	app-misc/razer_test
	openrazer? ( app-misc/openrazer )
	dev-libs/libopenrazer
	"
BDEPEND="
	virtual/pkgconfig
	"

src_configure() {
	local emesonargs=(
		"$(meson_use matrix include_matrix_discovery)"
	)
	meson_src_configure
}
