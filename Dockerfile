FROM haugene/transmission-openvpn:latest

# install Java for running filebot 
#   update packages, install debconf-utils so that we can install Oracle java without for reading terms and accepting it, use debconf for pre accepting the terms, then install oracle-java8-installer

RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get -y install debconf-utils && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get  install -y --no-install-recommends  oracle-java8-installer oracle-java8-set-default libchromaprint-tools libmediainfo0v5 
