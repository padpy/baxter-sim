#! /usr/bin/env bash

echo "Starting Gazbeo"
rocker --nvidia --x11 osrf/ros:kinetic-desktop-full gazebo
