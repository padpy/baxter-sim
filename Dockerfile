FROM osrf/ros:kinetic-desktop-full

RUN apt-get update


RUN mkdir -p /root/ros_ws/src

SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/kinetic/setup.bash \
    && apt-get install -y gazebo7 ros-kinetic-qt-build ros-kinetic-gazebo-ros-control ros-kinetic-gazebo-ros-pkgs ros-kinetic-ros-control ros-kinetic-control-toolbox ros-kinetic-realtime-tools ros-kinetic-ros-controllers ros-kinetic-xacro python-wstool ros-kinetic-tf-conversions ros-kinetic-kdl-parser \
    && cd /root/ros_ws \
    && catkin_make \
    && cd /root/ros_ws/src \
    && wstool init . \
    && wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter_simulator/kinetic-devel/baxter_simulator.rosinstall \
    && wstool update \
    && cd /root/ros_ws \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src --rosdistro kinetic -y \
    && catkin_make

WORKDIR /root/ros_ws

