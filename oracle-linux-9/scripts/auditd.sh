rm -rf /etc/audit/auditd.conf
rm -rf /etc/audit/audit.rules
rm -rf /etc/audit/rules.d/audit.rules

cp /tmp/auditd.conf /etc/audit/
cp /tmp/audit.rules /etc/audit/
cp /tmp/auoms.conf /etc/audit/plugins.d/
cp /tmp/sedispatch.conf /etc/audit/plugins.d/
cp /tmp/audit.rules /etc/audit/rules.d/
cp /tmp/auoms.rules /etc/audit/rules.d/
cp /tmp/cis.rules /etc/audit/rules.d/


service auditd restart || true 