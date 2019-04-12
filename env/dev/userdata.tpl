#!/bin/bash

### Install Jenkins
sudo yum update –y	
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y
sudo service jenkins start

### Install Ansible
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum repolist
sudo yum —enablerepo=epel install ansible
sudo yum repolist
sudo yum install ansible

