# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Tile map provides a slippy map style interface for visualizing \
	 OpenS[...]"
HOMEPAGE="https://github.com/swri-robotics/mapviz"
SRC_URI="https://github.com/swri-robotics-gbp/mapviz-release/archive/release/eloquent/${PN}/2.0.0-1.tar.gz -> ${PN}-eloquent-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-eloquent/mapviz
	ros-eloquent/pluginlib
	ros-eloquent/rclcpp
	ros-eloquent/swri_math_util
	ros-eloquent/swri_transform_util
	ros-eloquent/tf2
	media-libs/glew
	dev-libs/jsoncpp
	dev-qt/qtcore:5
	dev-qt/qtopengl:5
	dev-cpp/yaml-cpp
"
DEPEND="${RDEPEND}
	ros-eloquent/ament_cmake
	dev-libs/jsoncpp
	dev-qt/qtopengl:5
	dev-qt/qtcore:5
"

SLOT="0"
ROS_DISTRO="eloquent"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
