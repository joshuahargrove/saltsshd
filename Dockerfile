# First try
FROM ubuntu:14.04
MAINTAINER Joshua Hargrove "jhargr200@gmail.com"
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y salt-minion
RUN mkdir -p /var/run/sshd
RUN mkdir -p /etc/salt
RUN echo 'root:P4rSl3y' | chpasswd
RUN useradd mal
RUN echo 'mal:password' | chpasswd
RUN mkdir -p /home/mal
#ADD sshd_config /etc/ssh/sshd_config
ADD minion /etc/salt/minion
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
EXPOSE 25564


ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
CMD ["/usr/bin/salt-minion"]
CMD ["bash", "start.sh"]
