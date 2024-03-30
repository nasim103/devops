#!/bin/bash

#  This file is copied to "/usr/local/bin/mipc/exportproxies.sh" on the template vm.

hostnamefirstchar=${HOSTNAME::1}
#TODO:  Add proxy settings for other environments
case $hostnamefirstchar in
    p | d | m)
    export HTTP_PROXY="http://10.160.2.6:8080"
    export http_proxy="http://10.160.2.6:8080"
    export https_proxy="http://10.160.2.6:8080"
    export HTTPS_PROXY="http://10.160.2.6:8080"
    export ftp_proxy="http://10.160.2.6:8080"
    export FTP_PROXY="http://10.160.2.6:8080"
    # Do not use the proxy for anything in the mipc.css.cgipdc.cginet domain or any of the CLASS A address starting with 10.
    export no_proxy=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
    export NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
    ;;

    r)
    export HTTP_PROXY="http://10.160.60.14:8080"
    export http_proxy="http://10.160.60.14:8080"
    export https_proxy="http://10.160.60.14:8080"
    export HTTPS_PROXY="http://10.160.60.14:8080"
    export no_proxy=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8
    export NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8
    ;;

    *)
    export HTTP_PROXY="http://10.160.2.6:8080"
    export http_proxy="http://10.160.2.6:8080"
    export https_proxy="http://10.160.2.6:8080"
    export HTTPS_PROXY="http://10.160.2.6:8080"
    export ftp_proxy="http://10.160.2.6:8080"
    export FTP_PROXY="http://10.160.2.6:8080"
    # Do not use the proxy for anything in the mipc.css.cgipdc.cginet domain or any of the CLASS A address starting with 10.
    export no_proxy=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
    export NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
    ;;
esac 
