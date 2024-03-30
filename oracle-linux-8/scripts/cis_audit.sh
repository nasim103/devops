export GIT_SSL_NO_VERIFY=true
cd /opt/
git clone --depth 1 -b main 
mv harden_audit_rhel8 RHEL8-CIS-Audit
chmod +x /opt/RHEL8-CIS-Audit/run_audit.sh
