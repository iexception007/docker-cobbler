FROM centos:7.7.1908

MAINTAINER james.zhou@cloudminds.com

ENV COBBLER_VERSION 2.8.4

RUN yum -y install wget epel-release && \
    wget -O /etc/yum.repos.d/cobbler28.repo http://download.opensuse.org/repositories/home:/libertas-ict:/cobbler28/CentOS_7/home:libertas-ict:cobbler28.repo && \
    yum -y install cobbler tftp-server dhcp openssl cobbler-web supervisor && \
    yum -y install wget file debmirror python2-pip && \
    yum -y update && \
    yum clean all && \
    rpm -e --nodeps python2-django && \
    pip install --upgrade pip && \
    pip install Django==1.8.17

ADD supervisord.d/conf.ini /etc/supervisord.d/conf.ini
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]