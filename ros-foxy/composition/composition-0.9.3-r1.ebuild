# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Examples for composing multiple nodes in a single process."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros2-gbp/demos-release/archive/release/foxy/${PN}/0.9.3-1.tar.gz -> ${PN}-foxy-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-foxy/example_interfaces
	ros-foxy/launch_ros
	ros-foxy/rclcpp
	ros-foxy/rclcpp_components
	ros-foxy/rcutils
	ros-foxy/std_msgs
	test? ( ros-foxy/ament_cmake_pytest )
	test? ( ros-foxy/ament_lint_auto )
	test? ( ros-foxy/ament_lint_common )
	test? ( ros-foxy/launch )
	test? ( ros-foxy/launch_testing )
	test? ( ros-foxy/launch_testing_ament_cmake )
	test? ( ros-foxy/launch_testing_ros )
	test? ( ros-foxy/rmw_implementation_cmake )
"
DEPEND="${RDEPEND}
	ros-foxy/ament_cmake
"

SLOT="0"
ROS_DISTRO="foxy"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
