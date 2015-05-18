FROM debian:stable
MAINTAINER Maxim Fedorenko, varlllog@gmail.com

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y samba

RUN apt-get clean -y && apt-get autoclean -y

RUN useradd -g nogroup -d /share -r guest
RUN smbpasswd -a -n guest
RUN smbpasswd -e -n guest

ADD share.smb.conf /tmp/share.smb.conf
ADD init.sh /tmp/init.sh

CMD ["/tmp/init.sh"]

