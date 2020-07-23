# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEBLOB_AVAILABLE=1
K_DEFCONFIG="tf300_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION="-${PN}/-*"
inherit kernel-2
detect_version
detect_arch

inherit git-r3 eapi7-ver
EGIT_REPO_URI="https://github.com/grate-driver/linux.git -> transformers-linux.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/linux-${PV/_/-}-transformers"
EGIT_CLONE_TYPE="shallow"

DESCRIPTION="Asus Transformers pad kernel sources"
HOMEPAGE="https://github.com/grate-driver/linux.git"

KEYWORDS=""
IUSE="deblob"
src_unpack() {
	git-r3_src_unpack
	unpack_set_extraversion
}
