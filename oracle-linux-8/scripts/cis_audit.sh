export GIT_SSL_NO_VERIFY=true
cd /opt/
git clone --depth 1 -b main https://packer:glpat-RKCWeE_o9M13t6TQ4diX@gitlab.css.cgipdc.cginet/unix-iac/cis/public/harden_audit.git
mv harden_audit_rhel8 RHEL8-CIS-Audit
chmod +x /opt/RHEL8-CIS-Audit/run_audit.sh
