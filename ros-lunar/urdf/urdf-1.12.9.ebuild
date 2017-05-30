# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package contains a C++ parser for the Unified Robot Description
    Format "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/robot_model-release/archive/release/lunar/urdf/1.12.9-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/roscpp
    ros-lunar/rosconsole_bridge
    ros-lunar/urdf_parser_plugin
    ros-lunar/pluginlib
    dev-libs/urdfdom
    dev-libs/urdfdom_headers
"
DEPEND="${RDEPEND}
    ros-lunar/rostest
    ros-lunar/cmake_modules
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}