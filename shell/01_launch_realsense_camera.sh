#!/bin/bash

# RealSense Camera Launch Script
# This script launches the RealSense camera node with depth and color streams

# Setup logging
LOG_DIR="/workspaces/isaac_ros-dev/log"
LOG_FILE="$LOG_DIR/01_launch_realsense_camera.log"
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
log "Starting RealSense camera launch"
log "========================================="

echo "Launching RealSense camera..." | tee -a "$LOG_FILE"
echo "Depth and color streams will be published" | tee -a "$LOG_FILE"
echo "Press Ctrl+C to stop" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
log "Log file: $LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# Launch RealSense camera and capture all output (stdout + stderr)
ros2 launch realsense_launcher camera.launch.py 2>&1 | tee -a "$LOG_FILE"

log "========================================="
log "RealSense camera stopped"
log "========================================="
