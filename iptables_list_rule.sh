#!/bin/sh
iptables -S
iptables -t nat -S
iptables -t mangle -S
iptables -t raw -S
