### remove old postfix config  ###
echo '> remove old postfix config  ...'

rm -rf /etc/postfix/main.cf

### copy postfix config over  ###
echo '> copy postfix config over ...'

sudo mv /tmp/main.cf /etc/postfix/

### Enable Postfix Service to start on Boot  ###
echo '> Enable Postfix Service to start on Boot  ...'

systemctl enable postfix

### Restart Postfix Service  ###
echo '> Restart Postfix Service  ...'

service postfix restart


