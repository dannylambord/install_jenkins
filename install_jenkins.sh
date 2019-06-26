#! /bin/bash

sudo apt install -y wget vim openjdk-8-jdk

sudo useradd --create-home jenkins
sudo usermod --shell /bin/bash jenkins

echo >> jenkins.service
echo "[Unit]" >> jenkins.service
echo'Description=Jenkins' >> jenkins.service
echo  >> jenkins.service
echo "[Service]" >> jenkins.service
echo 'User=jenkins' >> jenkins.service
echo 'WorkingDirectory=/home/jenkins' >> jenkins.service
echo 'ExecStart=/usr/bin/java -jar /home/jenkins/jenkins.war' >> jenkins.service
echo  >> jenkins.service
echo "[Install]" >> jenkins.service
echo 'WantedBy=multi-user.target' >> jenkins.service

sudo mv jenkins.service /etc/systemd/system/jenkins.service

sudo su - jenkins -c "wget http://updates.jenkins-ci.org/latest/jenkins.war"

sudo systemctl daemon-reload

sudo systemctl start jenkins
sudo systemctl enable jenkins
