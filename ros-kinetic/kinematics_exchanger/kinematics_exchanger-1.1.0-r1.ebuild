# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="A package that exchanges kinematic properties such as velocity or position [...]"
HOMEPAGE="http://wiki.ros.org/kinematics_exchanger"
SRC_URI="https://github.com/cpswarm/swarm_functions-release/archive/release/kinetic/${PN}/1.1.0-1.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/cpswarm_msgs
	ros-kinetic/geometry_msgs
	ros-kinetic/roscpp
	ros-kinetic/tf2
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
