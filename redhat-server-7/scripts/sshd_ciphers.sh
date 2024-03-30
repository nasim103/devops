#!/bin/bash

echo "Add Rapid 7 reccommended cipher suites to sshd config file"

sed -i '$a\# As per Rapid7 recoommendation.' /etc/ssh/sshd_config
sed -i '$a\HostKey /etc/ssh/ssh_host_rsa_key' /etc/ssh/sshd_config
sed -i '$a\HostKey /etc/ssh/ssh_host_ecdsa_key' /etc/ssh/sshd_config
sed -i '$a\KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256' /etc/ssh/sshd_config
sed -i '$a\Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr' /etc/ssh/sshd_config
sed -i '$a\MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com' /etc/ssh/sshd_config









