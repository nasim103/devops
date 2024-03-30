export GIT_SSL_NO_VERIFY=true
cd /opt/
git clone --depth 1 -b Develop https://packer:glpat-cQsGE5ubWkcyHDwRNgfd@gitlab.css.cgipdc.cginet/unix-iac/cis/public/harden_audit_rhel9.git
mv harden_audit_rhel9 RHEL9-CIS-Audit
chmod +x /opt/RHEL9-CIS-Audit/run_audit.sh