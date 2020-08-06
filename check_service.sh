#!/bin/sh
iptables -S
iptables -t nat -S
iptables -t mangle -S
iptables -t raw -S
ip a
ip r
systemctl status iptables 
systemctl status mysql
systemctl status rsyslog
systemctl status iptables
systemctl status nmb
systemctl status smb
#systemctl status 
#systemctl status
