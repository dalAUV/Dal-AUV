# This is a bash script used to install the ROS Medolic and UUV Sim enviroment
# Script asumes that you are on Ubuntu 18.04 LTS and do not have an install of ROS on the system 

# Created By Matthew Cockburn

# setup ROS source list 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu/ $(lsb_release -sc) main " > /etc/apt/source.list.d/ros-latest.list'

# set up your key
sudo apt install curl -y

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Installation 

sudo apt update -y
sudo apt upgrade -y
sudo apt install ros-melodic-desktop-desktop-full -y 
apt search ros-melodic -y

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages 
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y

sudo rosdep init

rosdep update

# Installing UUV Sim

sudo apt-get install ros-kinetic-gazebo9-* -y
cd ~

mkdir -p ~/catkin_ws/src

cd ~/catkin_ws

catkin init

cd ~/catkin_ws/src

git clone https://github.com/uuvsimulator/uuv_simulator.git

source /usr/share/gazebo-9/setup.sh
source /opt/ros/kinetic/setup.bash
source /$HOME/catkin_ws/devel/setup.bash

source ~/.bashrc

cd ~/catkin_ws

rosdep install --from-paths src --ignore-src --rosdistro=melodic -y --skip-keys "gazebo gazebo_msgs gazebo_plugins gazebo_ros gazebo_ros_control gazebo_ros_pkgs"

cd ~/catkin_ws
catkin_make install
catkin build

# done?


