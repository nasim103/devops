#!/bin/bash
 
source /usr/local/bin/mipc/exportproxies.sh

curl -o oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm

dnf -y localinstall oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm