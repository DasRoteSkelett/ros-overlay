# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Trep: Mechanical Simulation and Optimal Control Software"
HOMEPAGE="http://nxr.northwestern.edu/trep"
SRC_URI="https://github.com/MurpheyLab/trep-release/archive/release/indigo/python_trep/1.0.2-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv3"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/rospy
    ros-indigo/sensor_msgs
    ros-indigo/tf
    media-libs/freeglut
    dev-lang/python
    dev-python/pillow
    dev-python/matplotlib
    dev-python/numpy
    dev-python/pyopengl
    dev-python/pyside
    dev-python/PyQt4
    dev-libs/scipy
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
