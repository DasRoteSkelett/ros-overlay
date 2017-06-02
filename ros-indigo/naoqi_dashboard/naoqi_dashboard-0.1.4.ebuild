# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="naoqi_dashboard is a GUI for monitoring the state of an ALdebaran robot.
    It "
HOMEPAGE="http://ros.org/wiki/naoqi_dashboard"
SRC_URI="https://github.com/ros-naoqi/naoqi_dashboard-release/archive/release/indigo/naoqi_dashboard/0.1.4-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/diagnostic_aggregator
    ros-indigo/diagnostic_common_diagnostics
    ros-indigo/diagnostic_msgs
    ros-indigo/naoqi_bridge_msgs
    ros-indigo/rqt_robot_dashboard
    ros-indigo/rqt_robot_monitor
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
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
