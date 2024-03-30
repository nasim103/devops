#!/bin/bash

 source /usr/local/bin/mipc/exportproxies.sh

echo "Checking whether wget uses the proxy to get to the interwebs.  A vm cloned from this image should not need to source the file below."
#source /etc/profile.d/http_proxy.sh
cd /tmp
wget https://github.com/rancher/rancher/releases/download/v2.4.13/sha256sum.txt --tries=1 || true
WGETFILE=/tmp/sha256sum.txt
if test -f "$WGETFILE"; then
    echo "$WGETFILE exists."
else
    echo "$WGETFILE does not exist.   PROXY SETTINGS ARE SUSPECT ************************************************************************************"
fi

#https://rancher.com/docs/rke/latest/en/os/#red-hat-enterprise-linux-rhel--oracle-linux-ol--centos

UNAME=$(uname -r)
echo "uname is: $UNAME"
SEARCHPATH="/lib/modules/$UNAME/kernel/"
echo "Will search for modules in this path:  $SEARCHPATH"
for module in br_netfilter ip6_udp_tunnel ip_set ip_set_hash_ip ip_set_hash_net iptable_filter iptable_nat iptable_mangle iptable_raw nf_conntrack_netlink nf_conntrack nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat nf_nat_ipv4 nf_nat_masquerade_ipv4 nfnetlink udp_tunnel veth vxlan x_tables xt_addrtype xt_conntrack xt_comment xt_mark xt_multiport xt_nat xt_recent xt_set xt_statistic xt_tcpudp;
	do
    	if ! lsmod | grep -q $module; then
			SEARCHBUILTIN=$(grep $module /lib/modules/$(uname -r)/modules.builtin) || true
			if [ "$SEARCHBUILTIN" != "" ]; then
				echo "Found module $module in builtins"
			else
				RESULT=$(find "$SEARCHPATH" -name "$module".ko*) || true
				if [ "$RESULT" != "" ]; then
					echo "Found module $module on filesystem: $RESULT"
				else
					echo "**********************  Module $module not found on file system, builtins or lsmod  *******************************" 
				fi
			fi
       fi
    done

echo "Running sysctl -a to show loaded kernel parameters"	
sudo sysctl -a

#echo "Test that we can run a docker container:"
# sudo docker run hello-world || true


if [ -f /usr/local/bin/mipc/regionalsettingslog.txt ]; then
	cat /usr/local/bin/mipc/regionalsettingslog.txt
fi	