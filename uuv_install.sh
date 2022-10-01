# This is a bash script used to install the ROS Medolic and UUV Sim enviroment
# Script asumes that you are on Ubuntu 18.04 LTS and do not have an install of ROS on the system 

# Created By Matthew Cockburn

# setup ROS source list 
echo "Setting up ROS source list for apt"
mkdir ~/dat_install_logs
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' >> ~/dat_install_logs/setup_log.txt

# set up your key
sudo apt install curl -y 

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - >> ~/dat_install_logs/key_log.txt 

# Installation 

sudo apt update -y

sudo apt install ros-melodic-desktop-full -y

sudo apt search ros-melodic

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y

sudo apt install python-rosdep -y

sudo rosdep init

rosdep update

sudo apt-get install python3-catkin-tools

sudo apt install ros-melodic-uuv-uuv_simulator -y

cd ~

mkdir -p ~/catkin_ws/src

cd ~/catkin_ws

catkin init

cd ~/catkin_ws/src

git clone https://github.com/uuvsimulator/uuv_simulator.git

source /usr/share/gazebo-9/setup.sh
source /opt/ros/melodic/setup.bash
source $HOME/catkin_ws/devel/setup.bash

source ~/.bashrc

cd ~/catkin_ws 

catkin build

