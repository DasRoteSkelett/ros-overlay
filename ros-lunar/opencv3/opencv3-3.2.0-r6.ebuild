# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="OpenCV 3.x"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/opencv3-release/archive/release/lunar/opencv3/3.2.0-6.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
	ros-lunar/catkin
	virtual/ffmpeg
	virtual/jpeg
	media-libs/libpng
	sci-libs/vtk
	media-libs/libwebp
	dev-libs/protobuf
	dev-lang/python
	dev-python/numpy
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	dev-util/cmake
	media-libs/tiff
	media-libs/libv4l
	dev-libs/protobuf
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

src_unpack() {
	default
	mv *${P}* ${P}
}

src_configure() {
	export DEST_SETUP_DIR="/${ROS_PREFIX}"
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=${D}${ROS_PREFIX}
		-DCMAKE_PREFIX_PATH=/${ROS_PREFIX}
		-DPYTHON_INSTALL_DIR=lib64/python3.5/site-packages
		-DPYTHON_EXECUTABLE=/usr/bin/ros-python-lunar
		-DUSE_HOST_CFLAGS=FALSE
		-DUSE_UPSTREAM_CFLAGS=OFF
		-DCATKIN_BUILD_BINARY_PACKAGE=1
		-DUSE_EXTERNAL_TINYXML2=TRUE
		-DCMAKE_CXX_FLAGS="-O2 -pipe"
		-DCMAKE_C_FLAGS="-O2 -pipe"
	 )
	cmake-utils_src_configure
}

src_install() {
	cd ${WORKDIR}/${P}_build
	make install || die
}
