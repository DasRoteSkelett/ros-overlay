# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Unit-testing package for ROS. This is a lower-level library for rostest and[...]"
HOMEPAGE="http://ros.org/wiki/rosunit"
SRC_URI="https://github.com/ros-gbp/ros-release/archive/release/lunar/${PN}/1.14.4-0.tar.gz -> ${PN}-lunar-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-lunar/roslib
	dev-python/rospkg
"
DEPEND="${RDEPEND}
	ros-lunar/catkin
"

SLOT="0"
ROS_DISTRO="lunar"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"