# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Qt5 library to write cross-platform clients for Matrix"
HOMEPAGE="https://github.com/qmatrixclient/libqmatrixclient"

inherit cmake

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/quotient-im/"${PN}".git"
else
	SRC_URI="https://github.com/quotient-im/libQuotient/archive/"${PV}".tar.gz -> "${P}".tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-qt/qtcore
	dev-qt/qtmultimedia
	!!dev-libs/libqmatrixclient
"

S=""${WORKDIR}"/"${PN}"-"${PV}""

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
	)
	cmake_src_configure
}