FROM centos:7.7.1908

MAINTAINER james.zhou@cloudminds.com

ENV COBBLER_VERSION 2.8.4

RUN yum -y install wget epel-release && \
    wget -O /etc/yum.repos.d/cobbler28.repo http://download.opensuse.org/repositories/home:/libertas-ict:/cobbler28/CentOS_7/home:libertas-ict:cobbler28.repo && \
    yum -y install cobbler tftp-server dhcp openssl cobbler-web supervisor && \
    yum -y install wget file debmirror && \
    yum -y update && \
    yum clean all

ADD kickstarts/ubuntu-18-x86_64.ks /var/lib/cobbler/kickstarts/ubuntu18.ks
ADD kickstarts/ubuntu-16-x86_64.ks /var/lib/cobbler/kickstarts/ubuntu16.ks
ADD supervisord.d/conf.ini /etc/supervisord.d/conf.ini
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]