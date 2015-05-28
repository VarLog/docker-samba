FROM debian:stable
MAINTAINER Maxim Fedorenko, varlllog@gmail.com

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y samba

RUN apt-get clean -y && apt-get autoclean -y

RUN groupadd -g 1010 ci
RUN useradd -g nogroup -d /share -r guest
RUN useradd -g ci -d /share -r jenkins
RUN smbpasswd -a -n guest
RUN smbpasswd -e -n guest
RUN smbpasswd -a -n jenkins
RUN smbpasswd -e -n jenkins

RUN echo "\n\n" |smbpasswd -s guest
RUN echo "jenkins\njenkins\n" |smbpasswd -s jenkins

ADD smb.conf /tmp/share.smb.conf
ADD init.sh /tmp/init.sh

CMD ["/tmp/init.sh"]

