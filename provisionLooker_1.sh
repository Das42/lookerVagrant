#!/bin/bash

echo "provisioning second machine"
echo "installing java"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update > /dev/null
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer &> /dev/null
echo "done!"
echo "installing looker dependencies"
sudo apt-get install -y git > /dev/null
echo "done!"
echo "adding looker config options"
printf "net.ipv4.tcp_keepalive_time=200\nnet.ipv4.tcp_keepalive_intvl=200\nnet.ipv4.tcp_keepalive_probes=5\n" | sudo tee -a /etc/sysctl.conf > /dev/null
sudo groupadd looker
sudo useradd -m -g looker looker
printf "looker\tsoft\tnofile\t4096\nlooker\thard\tnofile\t4096\n" | sudo tee -a /etc/security/limits.conf > /dev/null
echo "done!"
echo "installing looker"
sudo su -c 'mkdir /home/looker/looker' looker
sudo su -c 'cp /vagrant/look* /home/looker/looker' looker
sudo su -c 'chmod 0750 /home/looker/looker/looker' looker
echo "done!"