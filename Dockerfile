FROM oraclelinux:8.8

RUN yum -y update && \
  yum -y install vsftpd && \
  yum clean all

COPY ./conf/vsftpd.conf /etc/vsftpd/

RUN useradd -m -s /bin/bash ftpuser
RUN echo 'ftpuser:Energia+1' | chpasswd
RUN bash -c 'echo ftpuser >> /etc/vsftpd/user_list'
# Workdir /var/ftp
RUN chown nobody:nobody /var/ftp
RUN chmod a-w /var/ftp
RUN chown ftpuser:ftpuser /var/ftp
RUN chmod 0700 /var/ftp

VOLUME /etc/vsftpd
VOLUME /var/ftp
VOLUME /var/log/vsftpd

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf", "-opasv_enable=YES", "-obackground=NO"]