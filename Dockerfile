# First try
FROM ubuntu:14.04
MAINTAINER Joshua Hargrove "jhargr200@gmail.com"
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y salt-minion
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN useradd mal
RUN echo 'mal:password' | chpasswd
RUN mkdir -p /home/mal
ADD sshd_config /etc/ssh/sshd_config
ADD minion /etc/salt/minion
EXPOSE 25564
EXPOSE 4506
EXPOSE 4505


CMD ["/usr/bin/salt-minion"]

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
