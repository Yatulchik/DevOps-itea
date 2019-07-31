#!/bin/bash

yum update -y
yum install -y ${package_to_install}
echo ECS_CLUSTER=${cluster} >> /etc/ecs/ecs.config
service docker start
start ecs
