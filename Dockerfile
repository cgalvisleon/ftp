FROM oraclelinux:8.8

RUN yum -y update && \
  yum -y install vsftpd && \
  yum clean all

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
# COPY run-vsftpd.sh /usr/sbin/
# RUN chmod +x /usr/sbin/run-vsftpd.sh

RUN useradd -m -s /bin/bash ftpuser
RUN echo 'ftpuser:Energia+1' | chpasswd
RUN mkdir -p /home/vsftpd/
RUN chown -R ftpuser:ftpuser /home/vsftpd/
# RUN chown -R ftpuser:ftpuser /var/ftp/
# RUN chown -R ftpuser:ftpuser /var/ftp/

# RUN bash -c 'echo ftpuser >> /etc/vsftpd/user_list'
# Workdir /var/ftp
# RUN chown nobody:nobody /var/ftp
# RUN chmod a-w /var/ftp
# RUN chown -R ftpuser:ftpuser /var/ftp
# RUN chmod a-w /var/ftp
# RUN chmod 0777 /var/ftp
# VOLUME /etc/vsftpd

VOLUME /home/vsftpd
VOLUME /var/log/vsftpd

EXPOSE 20 21

# CMD ["/usr/sbin/run-vsftpd.sh", "-opasv_enable=YES", "-obackground=NO"]
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf", "-opasv_enable=YES", "-obackground=NO"]