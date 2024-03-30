#!/bin/bash
echo ip6_udp_tunnel > /etc/modules-load.d/
echo ip_set_hash_ip > /etc/modules-load.d/"$module".conf
echo ip_set_hash_net > /etc/modules-load.d/"$module".conf
echo udp_tunnel > /etc/modules-load.d/"$module".conf
echo veth > /etc/modules-load.d/"$module".conf
echo vxlan > /etc/modules-load.d/"$module".conf
echo x_tables > /etc/modules-load.d/"$module".conf
echo xt_comment > /etc/modules-load.d/"$module".conf
echo xt_mark > /etc/modules-load.d/"$module".conf
echo xt_multiport > /etc/modules-load.d/"$module".conf
echo xt_nat > /etc/modules-load.d/"$module".conf
echo xt_recent > /etc/modules-load.d/"$module".conf
echo xt_set > /etc/modules-load.d/"$module".conf
echo xt_statistic > /etc/modules-load.d/"$module".conf
