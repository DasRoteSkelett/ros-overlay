# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Provides a driver node for KVH GEO FOG 3D INS sensors, messages, and rviz p[...]"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/MITRE/${PN}-release/archive/release/melodic/${PN}/1.3.3-1.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/kvh_geo_fog_3d_driver
	ros-melodic/kvh_geo_fog_3d_msgs
	ros-melodic/kvh_geo_fog_3d_rviz
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
