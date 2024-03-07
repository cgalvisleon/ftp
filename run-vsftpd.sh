#!/bin/bash

chown -R ftpuser:ftpuser /home/vsftpd/

&>/dev/null vsftpd /etc/vsftpd/vsftpd.conf