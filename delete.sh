#! bin/bash

sudo systemctl stop jenkins
sudo systemctl disable jenkins
sudo rm -Rf /etc/systemd/system/jenkins.service
cd ../jenkins
sudo rm jenkins.war
cd ..
