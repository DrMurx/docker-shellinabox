FROM ubuntu:latest

RUN apt-get update &&\
    apt-get install -y openssl openssh-client shellinabox &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    /usr/sbin/groupadd -g 1000 user &&\
    /usr/sbin/useradd -u 1000 -g 1000 -s /bin/bash -d /home/user -m user

# RUN \
#     mv '/etc/shellinabox/options-enabled/00+Black on White.css' '/etc/shellinabox/options-enabled/00-bright.css' &&\
#     mv '/etc/shellinabox/options-enabled/00_White On Black.css' '/etc/shellinabox/options-enabled/00-dark.css' &&\
#     mv '/etc/shellinabox/options-enabled/01+Color Terminal.css' '/etc/shellinabox/options-enabled/01-color.css' &&\
#     mv '/etc/shellinabox/options-enabled/01_Monochrome.css' '/etc/shellinabox/options-enabled/01-monochrome.css'

COPY launch.sh /usr/local/sbin/launch.sh

EXPOSE 4200

CMD /usr/local/sbin/launch.sh
