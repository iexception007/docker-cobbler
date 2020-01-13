#!/usr/bin/env bash
# 导入镜像
cobbler import --path=/mnt/centos7    --name centos7 --arch=x86_64
cobbler import --path=/mnt/ubuntu1804 --name ubuntu-18.04 --arch=x86_64

# 清理hwe版本
cobbler repo    remove --name ubuntu-18.04-hwe-x86_64
cobbler profile remove --name ubuntu-18.04-hwe-x86_64
cobbler distro  remove --name ubuntu-18.04-hwe-x86_64


# 清理原版配置， 自定义配置。
cobbler profile remove --name centos7-x86_64
cobbler profile remove --name ubuntu-18.04-x86_64
cobbler profile add --name=centos7-x86_64      --distro=centos7-x86_64      --kickstart=/var/lib/cobbler/kickstarts/centos7.ks
cobbler profile add --name=ubuntu-18.04-x86_64 --distro=ubuntu-18.04-x86_64 --kickstart=/var/lib/cobbler/kickstarts/ubuntu18.ks

cobbler sync