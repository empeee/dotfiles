# On Debian 9

wget -c http://download.opensuse.org/repositories/home:/ra3xdh/Debian_9.0/Release.key


# Add the following line to /etc/apt/sources.list:
deb http://download.opensuse.org/repositories/home:/ra3xdh/Debian_9.0/ ./
# Add non-free to all lines

# Import key and update repos:
sudo apt add Release.key
sudo apt update

# Install Qucs-S
sudo apt install qucs-s