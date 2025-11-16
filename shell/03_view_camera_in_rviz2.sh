#!/bin/bash

# RViz2 Viewer for RealSense Camera
# This script opens RViz2 to visualize camera topics

# Setup logging
LOG_DIR="/workspaces/isaac_ros-dev/log"
LOG_FILE="$LOG_DIR/03_view_camera_in_rviz2.log"
mkdir -p "$LOG_DIR"

# Function to log with timestamp
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Source ROS2 environment
source /opt/ros/jazzy/setup.bash

# Source workspace
source /workspaces/isaac_ros-dev/install/setup.bash

log "========================================="
log "Starting RViz2 for RealSense camera"
log "========================================="

echo "Opening RViz2 with RealSense configuration..." | tee -a "$LOG_FILE"
echo "Configuration includes:" | tee -a "$LOG_FILE"
echo "  - Fixed Frame: camera_link" | tee -a "$LOG_FILE"
echo "  - Color image display" | tee -a "$LOG_FILE"
echo "  - Depth image display" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "If you see 'Fixed Frame [camera_link] does not exist'," | tee -a "$LOG_FILE"
echo "check that the camera is running with:" | tee -a "$LOG_FILE"
echo "  ./shell/01_launch_realsense_camera.sh" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# Get the config file path
CONFIG_FILE="/workspaces/isaac_ros-dev/install/realsense_launcher/share/realsense_launcher/config/realsense.rviz"

if [ -f "$CONFIG_FILE" ]; then
    log "Using config: $CONFIG_FILE"
    log "Launching RViz2..."
    rviz2 -d "$CONFIG_FILE" 2>&1 | tee -a "$LOG_FILE"
else
    log "WARNING: Config file not found at $CONFIG_FILE"
    log "Launching default RViz2..."
    echo "You may need to manually set Fixed Frame to 'camera_link'" | tee -a "$LOG_FILE"
    rviz2 2>&1 | tee -a "$LOG_FILE"
fi

log "========================================="
log "RViz2 session ended"
log "Log saved to: $LOG_FILE"
log "========================================="
