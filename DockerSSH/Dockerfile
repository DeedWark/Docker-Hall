#ARG: --build-arg distribution=
ARG distribution=debian:latest 
FROM $distribution

LABEL maintainer="kenji.duriez@vadesecure.com"

RUN apt-get update -y &&\
    apt-get install -y ssh

RUN echo 'root:dockerSSH' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN /etc/init.dssh start &&\
    systemctl enable ssh

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
EXPOSE 22
