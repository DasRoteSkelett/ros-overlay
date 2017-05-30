# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package contains the components of the soem_ebox package"
HOMEPAGE="http://wiki.ros.org/soem_master"
SRC_URI="https://github.com/orocos-gbp/rtt_soem-release/archive/release/indigo/soem_ebox/0.1.1-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/message_runtime
    ros-indigo/soem_master
    ros-indigo/rtt
    ros-indigo/soem
    ros-indigo/rtt_roscomm
"
DEPEND="${RDEPEND}
    ros-indigo/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

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