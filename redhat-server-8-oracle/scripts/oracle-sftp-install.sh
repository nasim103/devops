#!/bin/bash
 
dnf -y install vsftpd
sudo systemctl start vsftpd
sudo systemctl enable vsftpd --now