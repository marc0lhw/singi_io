FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y xinetd
RUN apt-get install -y netcat
RUN apt-get install -y wget

RUN wget -P /tmp/ https://github.com/marc0lhw/singi_io/raw/master/helloworld
RUN chmod +x /tmp/helloworld
RUN wget -P /etc/xinetd.d/ https://raw.githubusercontent.com/marc0lhw/singi_io/master/docker/helloworld
RUN wget -O /etc/services https://raw.githubusercontent.com/marc0lhw/singi_io/master/docker/services
RUN service xinetd start

EXPOSE 80
EXPOSE 443
EXPOSE 9999

RUN service xinetd restart
