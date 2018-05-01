#!/bin/bash
# AUTHOR UJJWAL BISWAS
#SCRIPT FOR INSTALLATION OF OPENCV 3 FOR PYTHON 3.6+
##################################################    MPORTANT NOTES   ##################################
####################################   RUN THIS SCRIPT FROM HOME DIRECTORY
########################################################################################################
###################################   ALWAYS  CHECK THE CODE BEFORE RUN ON TERMINAL
########################################################################################################
#UPADTING THE REPOSITORY AND UPGRADING THE SYSTEM
echo "#############################################################################################################################
                                                Welcome To Easy OpenCV Installation
                                                            By Ujjwal Biswas
                                                                V- 1.0
###############################################################################################################################"
sudo apt update
sudo apt upgrade -y
#################################################################################################
#cd ~/
echo "#############################################################################################################################
                                                 CREATING NEW DIRECTORY
##############################################################################################################################"
sudo mkdir OpenCV_3
pwd
cd OpenCV_3
echo "###############################################################################################################################
                                                  GETTING GIT
################################################################################################################################"
sudo apt install -y git
echo "Cloning OpenCV sourc from github to opencv-3.3.1"
sudo git clone https://github.com/opencv/opencv.git
echo "Cloning opencv-contrib from github to opencv-contrib"
sudo git clone https://github.com/opencv/opencv_contrib.git
##################################################################################################
########################### installing the dependency for building OpenCV from the sources
echo  "#################################################################################################################################
                              INSTALLING THE DEPENDENCY FOR BUILDING OPENCV FROM THE SOURCES
#################################################################################################################################"
sudo apt install -y build-essential cmake  libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev 
python3.6-config --includes
sudo apt-get install -y libjpeg-dev libtiff5-dev  libpng12-dev

echo "#################################################################################################################################
                                                      ADDING REPOSITORY FOR libjasper-dev
#################################################################################################################################"
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt update
sudo apt install -y libjasper1 libjasper-dev
echo "#################################################################################################################################
                                                                  INSTALLING GTK3.0
#################################################################################################################################"
sudo apt-get install -y libgtk-3-dev

echo "#################################################################################################################################
                                                       INSTALLING PYTHON3.6 DEV and NUMPY
#############################################################################################################################"
sudo apt-get install -y python3.6-dev python3.6-numpy libtbb2 libtbb-dev libdc1394-22-dev


sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

sudo apt-get install -y libxvidcore-dev libx264-dev
echo "#############################################################################################################################
                                              CHANGING DIRECTORY AND CREATING BUILD DIRECTORY
#############################################################################################################################"
cd opencv
sudo mkdir build
cd build
echo "#############################################################################################################################
                                                          CMAKE PROCESS *(HAVE A CUP OF COFFEE)
#############################################################################################################################"
sudo cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/OpenCV_3/opencv_contrib/modules ..

sudo make clean
echo "#############################################################################################################################
                                                      USING ALL AVAILABLE CORE OF THE CPU
#############################################################################################################################"
sudo make -j $(nproc --all)
echo "#############################################################################################################################
                                        INSTALLING OPENCV TO /usr/local/ (*Go Outside and See The World)
#############################################################################################################################"
sudo make install
sudo ldconfig


