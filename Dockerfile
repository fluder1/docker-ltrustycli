FROM ubuntu:14.04
MAINTAINER Cameron Morris - lcseehelpdesk@mail.wvu.edu
############## Ubuntu 14.04 debs ########################
#deb http://archive.ubuntu.com/ubuntu/ trusty main restricted
#deb-src http://archive.ubuntu.com/ubuntu/ trusty main restricted

#deb http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted
#deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted

#deb http://archive.ubuntu.com/ubuntu/ trusty universe
#deb-src http://archive.ubuntu.com/ubuntu/ trusty universe
#deb http://archive.ubuntu.com/ubuntu/ trusty-updates universe
#deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates universe


#deb http://archive.ubuntu.com/ubuntu/ trusty-security main restricted
#deb-src http://archive.ubuntu.com/ubuntu/ trusty-security main restricted
#deb http://archive.ubuntu.com/ubuntu/ trusty-security universe
#deb-src http://archive.ubuntu.com/ubuntu/ trusty-security universe
RUN apt-get -y update
################ loudsources.list ###############################
RUN echo 'deb http://loud.lcsee.wvu.edu/stable/ ltrusty/' > /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://loud.lcsee.wvu.edu/stable/ ltrusty/' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb http://loud.lcsee.wvu.edu/loud/ ltrusty-test/' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://loud.lcsee.wvu.edu/loud/ ltrusty-test/' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb http://mirror.lcsee.wvu.edu/ubuntu/ trusty main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://mirror.lcsee.wvu.edu/ubuntu/ trusty main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb http://mirror.lcsee.wvu.edu/ubuntu/ trusty-security main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://mirror.lcsee.wvu.edu/ubuntu/ trusty-security main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb http://mirror.lcsee.wvu.edu/ubuntu/ trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://mirror.lcsee.wvu.edu/ubuntu/ trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb http://mirror.lcsee.wvu.edu/ubuntu/ trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list
RUN echo 'deb-src http://mirror.lcsee.wvu.edu/ubuntu/ trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list.d/loud.list

RUN gpg --keyserver pgpkeys.mit.edu --recv-key 7EB37391878471DD      
RUN gpg -a --export 7EB37391878471DD | sudo apt-key add -

RUN apt-get -y update 
RUN apt-get -y dist-upgrade 

RUN echo 'DOCKER_OPTS="$DOCKER_OPTS -e lxc"' | sudo tee -a /etc/default/docker > /dev/null

RUN apt-get update

################################################################################################# 
