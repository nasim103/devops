export GIT_SSL_NO_VERIFY=true
cd /opt/
git clone --depth 1 -b Develop 
mv harden_audit_rhel9 RHEL9-CIS-Audit
chmod +x /opt/RHEL9-CIS-Audit/run_audit.sh
