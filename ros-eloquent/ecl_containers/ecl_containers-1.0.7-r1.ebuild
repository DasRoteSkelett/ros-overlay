# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="The containers included here are intended to extend the stl containers.\
  [...]"
HOMEPAGE="http://wiki.ros.org/ecl_containers"
SRC_URI="https://github.com/yujinrobot-release/ecl_core-release/archive/release/eloquent/${PN}/1.0.7-1.tar.gz -> ${PN}-eloquent-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-eloquent/ecl_config
	ros-eloquent/ecl_converters
	ros-eloquent/ecl_errors
	ros-eloquent/ecl_exceptions
	ros-eloquent/ecl_formatters
	ros-eloquent/ecl_license
	ros-eloquent/ecl_mpl
	ros-eloquent/ecl_type_traits
	ros-eloquent/ecl_utilities
	test? ( ros-eloquent/ament_cmake_gtest )
	test? ( ros-eloquent/ament_lint_auto )
	test? ( ros-eloquent/ament_lint_common )
"
DEPEND="${RDEPEND}
	ros-eloquent/ament_cmake_ros
	ros-eloquent/ecl_build
"

SLOT="0"
ROS_DISTRO="eloquent"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
