#!/bin/bash

# List RealSense Camera Topics
# This script shows all topics published by the camera

# Source ROS2 environment
source /opt/ros/jazzy/setup.bash

# Source workspace
source /workspaces/isaac_ros-dev/install/setup.bash

echo "=== RealSense Camera Topics ==="
echo ""
echo "Listing all camera-related topics..."
echo ""

# List all topics with camera in the name
ros2 topic list | grep -i camera

echo ""
echo "=== Topic Information ==="
echo ""
echo "To see more info about a topic, run:"
echo "  ros2 topic info <topic_name>"
echo "  ros2 topic echo <topic_name>"
echo ""
