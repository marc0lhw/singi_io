FROM ubuntu:16.04

MAINTAINER Euiyeon Kim
VOLUME /usr/sharedData

RUN apt-get update -y && \
apt-get install -y apt-utils && \
apt-get install dialog apt-utils -y && \
apt-get install -y xinetd && \
apt-get install -y netcat && \
apt-get install -y wget && \
apt-get install -y gdb && \
apt-get install -y openssh-server

RUN mkdir /var/run/sshd && \
sed  -i "/^[^#]*UsePAM/ s/.*/#&/" /etc/ssh/sshd_config && \
echo "UsePAM no" >> /etc/ssh/sshd_config && \
echo 'root:yeon' | chpasswd && \
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN wget -P /tmp/ https://github.com/marc0lhw/singi_io/raw/master/helloworld && \
chmod +x /tmp/helloworld && \
wget -P /etc/xinetd.d/ https://raw.githubusercontent.com/marc0lhw/singi_io/master/docker/helloworld && \
wget -O /etc/services https://raw.githubusercontent.com/marc0lhw/singi_io/master/docker/services

EXPOSE 80
EXPOSE 22
EXPOSE 9999

ADD startsc.sh /
RUN chmod +x /startsc.sh
ENTRYPOINT ./startsc.sh

