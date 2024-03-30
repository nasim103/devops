echo "Add ssh key to svc_forescout"
mkdir /home/svc_forescout/.ssh
touch /home/svc_forescout/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5dfMQTCgCQTXSJnZ3dwvJpwOqWdlQPuuqTu+ZxLN7v1EtKv4akiZ/xsl3vg26n64BkabwKdDn++0UXb5Scu1OJPRDBNAbymchnXVWBhi/32Cu6MozNL1uNNslgxYRpSpw+w9JBuwQhpVuBWWKl46l+tkuEz83iAjFjcdQ8V5G55uglHSVNT8KCOuwpuIQ3jbdDXiuVgxIxbrxzc+gMS2CQsLgECDSSG0xzQB9kQrV+HQ7C6HRGoa/aJSz3h76C5bSv5FJwR/RGcPjPGJzK8Ahwc7FaIw96UkwbPtSDulhoVgDG4WeINncdlowvip3qEBQP2wY0wiuzIxfZrgmMx7P svc_forescout@phx-fs-mgr-01-1' >> /home/svc_forescout/.ssh/authorized_keys
chown -R svc_forescout:svc_forescout  /home/svc_forescout/.ssh/authorized_keys
chown -R svc_forescout:svc_forescout  /home/svc_forescout/.ssh/
chmod 700 /home/svc_forescout/.ssh
chmod 600 /home/svc_forescout/.ssh/authorized_keys