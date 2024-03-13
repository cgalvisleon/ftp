FROM oraclelinux:8.8

RUN yum -y update && \
  yum -y install vsftpd && \
  yum clean all

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN useradd -m -s /bin/bash ftpuser
RUN echo 'ftpuser:Energia+1' | chpasswd
RUN mkdir -p /var/ftp/
RUN chown -R ftpuser:ftpuser /var/ftp/
RUN chmod -R 0777 /var/ftp/

VOLUME /var/ftp
VOLUME /var/log/vsftpd

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf", "-opasv_enable=YES", "-obackground=NO"]