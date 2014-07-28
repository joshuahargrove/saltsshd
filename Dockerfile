# First try
FROM ubuntu:14.04
MAINTAINER Joshua Hargrove "jhargr200@gmail.com"
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN useradd mal
RUN echo 'mal:password' | chpasswd
RUN mkdir -p /home/mal
ADD sshd_config /etc/ssh/sshd_config
EXPOSE 25564

#CMD ["/usr/sbin/sshd", "-D"]

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
