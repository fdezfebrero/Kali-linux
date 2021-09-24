
# Kali Linux latest with useful tools
# Author Javier Feŕnández Febrero
FROM kalilinux/kali-rolling:latest

ARG DEBIAN_FRONTEND=noninteractive
# Update
COPY config/sources.list /etc/apt/sources.list
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

# Install ZSH shell with custom settings and set it as default shell
RUN apt-get -y install git && apt-get -y install zsh
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
COPY config/.zshrc /root/.zshrc


RUN mkdir /opt/scripts
COPY scripts /opt/scripts

# Install Kali Linux "Top 10" metapackage and a few useful tools
RUN apt-get -y install vim kali-tools-top10 net-tools whois\
      exploitdb man-db dirb nikto wpscan uniscan nodejs\
      npm python3-pip tor proxychains\
      metasploit-framework \
      dmitry lbd \
      sslyze whatweb \
      wordlists theharvester

# Install some useful hardware packages
RUN apt-get -y install pciutils usbutils 

RUN apt-get -y update 
RUN apt-get -y install neofetch

