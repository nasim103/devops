#!/bin/bash
echo $environment
case $environment in
    stable)
    vsphere="com-opsconsole.css.cgipdc.cginet"
    ;;
    develop)
    vsphere="com-opsconsole.css.cgipdc.cginet"
    ;;
    feature)
    vsphere="com-opsconsole.css.cgipdc.cginet"
    ;;
    west)
    vsphere="com-opsconsole.css.cgipdc.cginet"
    ;;
    east)
    vsphere="com-opsconsole.css.cgipdc.cginet"
    ;;
esac

echo $vsphere
echo "pre"

host -t srv _ldap._tcp.css.cgipdc.cginet | grep "has SRV record"||     {
    echo -n "FATAL: Unable to locate ldap servers, probably you are not on intranet or your DNS servers are broken."
    exit 2
}

host -t a $vsphere | grep "has address" ||     {
    echo -n "FATAL: Unable to locate vCenter, probably you are not on intranet or your DNS servers are broken."
    exit 2
}


vcenter_status=$(curl -k -o /dev/null --silent --head --write-out '%{http_code}\n' "https://$vsphere")
if [ $vcenter_status==200 ]
    then
        echo -n "vCenter is responding on 443"
    else
        echo -n "vCenter is NOT responding on 443"
    exit 2
fi

host -t a $1 | grep "has address" ||     {
    echo -n "FATAL: Unable to service A record, probably you are not on intranet or your DNS servers are broken."
    exit 2
}

wget -e use_proxy=yes -e https_proxy=10.0.3.68:443 --no-check-certificate --server-response https://phx-mgt-lpsat1.intmgmt.com/pub/katello-ca-consumer-latest.noarch.rpm 2>&1 | awk '/^  HTTP/{print $2}' | grep "200" || {
        echo "Unable to connect to Satellite"
        exit 2
}

echo "post"