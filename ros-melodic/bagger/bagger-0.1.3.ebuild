# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="An application used to systematically record rosbags"
HOMEPAGE="http://www.ros.org/wiki/bagger"
SRC_URI="https://github.com/squarerobot/${PN}-release/archive/release/melodic/${PN}/0.1.3-0.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-melodic/message_runtime
	ros-melodic/rosbag
	ros-melodic/roscpp
	ros-melodic/rospy
	ros-melodic/rostest
	ros-melodic/std_msgs
	test? ( ros-melodic/geometry_msgs )
	test? ( ros-melodic/nav_msgs )
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
	ros-melodic/message_generation
	ros-melodic/roslint
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
