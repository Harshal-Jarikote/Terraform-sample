#!/bin/bash

### Install Java & Jenkins
sudo yum update -y
sudo yum install epel-release
sudo yum update
sudo yum install java-1.8.0-openjdk.x86_64 -y
java -version
sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
echo $JAVA_HOME
echo $JRE_HOME
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y
sudo service jenkins start

### Install Ansible
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum install ansible -y
ansible --version
