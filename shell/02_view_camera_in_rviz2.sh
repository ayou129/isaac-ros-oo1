#!/bin/bash

# RViz2 Viewer for RealSense Camera
# This script opens RViz2 to visualize camera topics

# Source ROS2 environment
source /opt/ros/jazzy/setup.bash

# Source workspace
source /workspaces/isaac_ros-dev/install/setup.bash

# Launch RViz2
echo "Opening RViz2..."
echo "To view camera topics:"
echo "  1. Click 'Add' button"
echo "  2. Add 'Image' display"
echo "  3. Set topic to /camera/color/image_raw for RGB"
echo "  4. Set topic to /camera/depth/image_rect_raw for depth"
echo ""

rviz2
