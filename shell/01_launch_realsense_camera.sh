#!/bin/bash

# RealSense Camera Launch Script
# This script launches the RealSense camera node with depth and color streams

# Source ROS2 environment
source /opt/ros/jazzy/setup.bash

# Source workspace
source /workspaces/isaac_ros-dev/install/setup.bash

# Launch RealSense camera
echo "Launching RealSense camera..."
echo "Depth and color streams will be published"
echo "Press Ctrl+C to stop"
echo ""

ros2 launch realsense_launcher camera.launch.py
