# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-python

DESCRIPTION="The topic command for ROS 2 command line tools."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros2-gbp/ros2cli-release/archive/release/eloquent/${PN}/0.8.7-1.tar.gz -> ${PN}-eloquent-release-${PV}.tar.gz"

LICENSE="( Apache-2.0 BSD )"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-eloquent/rclpy
	ros-eloquent/ros2cli
	ros-eloquent/rosidl_runtime_py
	test? ( ros-eloquent/ament_copyright )
	test? ( ros-eloquent/ament_flake8 )
	test? ( ros-eloquent/ament_pep257 )
	test? ( ros-eloquent/ament_xmllint )
	test? ( ros-eloquent/geometry_msgs )
	test? ( ros-eloquent/ros_testing )
	test? ( ros-eloquent/std_msgs )
	test? ( ros-eloquent/test_msgs )
	dev-python/numpy
	dev-python/pyyaml
	test? ( dev-python/pytest )
"
DEPEND="${RDEPEND}
"

SLOT="0"
ROS_DISTRO="eloquent"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
