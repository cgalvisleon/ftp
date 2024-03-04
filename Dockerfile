FROM oraclelinux:8.8
RUN yum install vsftpd
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./run.sh /run.sh

EXPOSE 20 21

CMD ["/run.sh"]