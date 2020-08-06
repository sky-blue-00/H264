#!/bin/sh
iptables -F
iptables -P INPUT      ACCEPT
iptables -P FORWARD    ACCEPT
iptables -P OUTPUT     ACCEPT
iptables -X
iptables -Z
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z
iptables -t mangle -F
iptables -t mangle -X
iptables -t mangle -Z
iptables -t raw -F
iptables -t raw -X
iptables -t raw -Z
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/usr/libexec/iptables/iptables.init save
