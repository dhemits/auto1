# auto1
#!/bin/bash
# Starting setup 

#Preparation

echo "Auto Installer By kang Dhemits"

#----------------------------------------------------------
# Installing dependent packages
#----------------------------------------------------------


echo "Mengistall Sotware/Aplikasi yang Dibutuhkan..."

echo "Pendahuluan"
sudo apt-get -y install build-essential
sudo apt-get -y install software-properties-common
sudo apt-get -y install python3-software-properties
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get -y install unzip zip git
sudo apt-get install daemontools
sudo apt-get update


echo "Install Bahasa C"
sudo apt-get -y install GCC
sudo apt-get -y install G++
sudo apt-get -y install libicu-dev
sudo apt-get update
sudo apt-get upgrade -y

echo "Install Boost library"
echo "Downloading and installing Boost"

sudo apt-get install libboost-all-dev

# Constant values definitions
FOLDER_NAME="Boost1.55"
 
# Create a new folder for storing the source code
mkdir ${FOLDER_NAME}
 
# Change directory
cd ${FOLDER_NAME}
 
# Download source code
wget http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.zip
 
# Extract archive
unzip boost_1_55_0.zip
 
# Change directory
cd boost_1_55_0
 
# Run the script which prepares Boost's build process
sudo ./bootstrap.sh --prefix=/usr/local --with-libraries=all
 
# Compile the project
sudo ./b2 install
 
# Add the Boost libraries path to the default Ubuntu library search path
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/boost.conf'
 
# Update the default Ubuntu library search paths
sudo ldconfig
 
# Return to the parent directory
cd ../../
 
# Inform user that Boost 1.55 was successfully installed
echo "Boost 1.55 was successfully installed."


#Install Cmake
echo "Install Cmake"

sudo apt-get install build-essential
wget https://cmake.org/files/v3.7/cmake-3.7.0-rc1.tar.gz
tar xf cmake-3.2.2.tar.gz
cd cmake-3.2.2
./configure
make


#Install finidhing
sudo apt-get install checkinstall
sudo checkinstall
