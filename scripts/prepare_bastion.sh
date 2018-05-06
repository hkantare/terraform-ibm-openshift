#!/bin/bash
# Install the prerequisite required by the bastion machine

yum install -y atomic-openshift-utils

yum install -y atomic-openshift-excluder atomic-openshift-docker-excluder

systemctl enable NetworkManager

systemctl start NetworkManager