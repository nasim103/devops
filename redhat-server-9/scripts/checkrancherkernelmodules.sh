#!/bin/bash
#   https://rancher.com/docs/rke/latest/en/os/
#	https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_monitoring_and_updating_the_kernel/managing-kernel-modules_managing-monitoring-and-updating-the-kernel 
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
					echo $module > /etc/modules-load.d/"$module".conf
				else
					echo "Module $module not found on file system, builtins or lsmod"
				fi
			fi
       fi
    done

#  https://rancher.zendesk.com/hc/en-us/articles/360054835111-How-to-increase-the-inotify-max-user-watches-and-inotify-max-user-instances-sysctls-on-a-Linux-host#check-current-limits-0-3
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
fs.inotify.max_user_instances=8192
fs.inotify.max_user_watches=524288
EOF
sysctl --system	

ls -lar /etc/modules-load.d/	 
