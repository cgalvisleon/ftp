FROM oraclelinux:8.8

RUN yum -y update && \
  yum -y install vsftpd && \
  yum clean all

RUN useradd -m -s /bin/bash ftpuser
RUN echo 'ftpuser:Energia+1' | chpasswd

VOLUME /etc/vsftpd
VOLUME /var/ftp
VOLUME /var/log/vsftpd

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf", "-opasv_enable=YES", "-obackground=NO"]