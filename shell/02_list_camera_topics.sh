#!/bin/bash

# List RealSense Camera Topics
# This script shows all topics published by the camera

# Setup logging
LOG_DIR="/workspaces/isaac_ros-dev/log"
LOG_FILE="$LOG_DIR/02_list_camera_topics.log"
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
log "Starting camera topics listing"
log "========================================="

echo "=== RealSense Camera Topics ===" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "Listing all active topics..." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# List all topics with their types
log "Fetching topic list with types..."
ros2 topic list -t 2>&1 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== Camera-specific Topics ===" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
log "Filtering camera-related topics..."
ros2 topic list | grep -E "(camera|realsense)" 2>&1 | tee -a "$LOG_FILE" || echo "No camera topics found (camera might not be running)" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== Useful Commands ===" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "View topic details:" | tee -a "$LOG_FILE"
echo "  ros2 topic info <topic_name>" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "View topic data (real-time):" | tee -a "$LOG_FILE"
echo "  ros2 topic echo <topic_name>" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "View image topic (requires image_view):" | tee -a "$LOG_FILE"
echo "  ros2 run image_view image_view --ros-args --remap /image:=<topic_name>" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

log "========================================="
log "Camera topics listing completed"
log "Log saved to: $LOG_FILE"
log "========================================="
