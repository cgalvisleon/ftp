FROM oraclelinux:8.8
RUN yum install vsftpd
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
