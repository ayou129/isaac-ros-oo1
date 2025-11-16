
## 机器设备和驱动详情
~~~sh
# lsb_release -a
ay@ubu:~$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.3 LTS
Release:	24.04
Codename:	noble

# nvidia-smi
Sun Nov 16 16:01:57 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.95.05              Driver Version: 580.95.05      CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4070 ...    Off |   00000000:01:00.0  On |                  N/A |
|  0%   27C    P8              4W /  285W |     244MiB /  16376MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A            3084      G   /usr/lib/xorg/Xorg                      109MiB |
|    0   N/A  N/A            3355      G   /usr/bin/gnome-shell                     98MiB |
+-----------------------------------------------------------------------------------------+
~~~

## 宿主机用到的相关镜像
其中: nvcr.io/nvidia/isaac/ros:noble-ros2_jazzy-realsense_b0aad936068eea75f2a520c7dd1a4f88-amd64
是我们的核心镜像

ay@ubu:~$ docker image list | grep ros
WARNING: This output is designed for human readability. For machine-readable output, please use --format.
nvcr.io/nvidia/isaac/ros:noble-ros2_jazzy-realsense_b0aad936068eea75f2a520c7dd1a4f88-amd64   6a6dccd729b9       40.6GB             0B   U
nvcr.io/nvidia/isaac/ros:noble-ros2_jazzy_d3e84470d576702a380478a513fb3fc6-amd64             a2e7915a4f1f       38.8GB             0B
nvcr.io/nvidia/isaac/ros:noble_a36082d996bc9582db03aa92fed6d54c-amd64                        5739b572b0db       37.3GB             0B
osrf/ros:jazzy-desktop                                                                       4da87c573382       4.05GB             0B   U

## 容器内的相关信息
admin@ubu:/workspaces/isaac_ros-dev$ echo $ROS_DISTRO
jazzy

admin@ubu:/workspaces/isaac_ros-dev$ ros2 pkg list | grep realsense
realsense2_camera
realsense2_camera_msgs
realsense2_description

admin@ubu:/workspaces/isaac_ros-dev$ env | grep -i isaac
PWD=/workspaces/isaac_ros-dev
ISAAC_ROS_WS=/workspaces/isaac_ros-dev

## 编写代码时的注意事项
1. 宿主机是是没有类似 ros2 和 colcon 命令的，需要 docker 去执行
2. 容器中 对于 部分 启动有关摄像头的命令 不能直接执行，因为无法在非X11 环境下预览摄像头真实影像，你可以直接 将命令输出到 可执行文件放到 ./shell 文件夹中,文件名按照 数字_15 个英文单词描述作为文件名即可，然后 我另外一台屏幕可以直接在容器里运行这个命令
    - 所有 sh(有的可能是持续输出内容不中断的) 需要记录日志  一同放进项目目录的log文件夹中, 日志累加，带时间戳即可

需要我执行 shell 下的命令可以向我说明，让我去执行.
如果遇到任何问题可以优先向我确认.