#!/bin/sh
iptables -F

iptables -X

iptables -t nat -F

iptables -t nat -X

iptables -t mangle -F

iptables -t mangle -X

#配置允许SSH登陆端口进入

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#允许所有的ping操作

#iptables -A INPUT -p icmp  -j ACCEPT

#允许本机lo通信

iptables -A INPUT   -i lo  -j ACCEPT

iptables -A OUTPUT  -o lo  -j ACCEPT

#允许关联的状态包通过

#iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

#iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#开放http、ftp、telnet服务，即开放他们的默认端口

#iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#iptables -A INPUT -p tcp --sport 80 -j ACCEPT

#iptables -A FORWARD -p tcp --dport 23  -j ACCEPT

#iptables -A FORWARD -p tcp --sport 23  -j ACCEPT

#iptables -A FORWARD -p tcp --dport 20:21  -j ACCEPT

#iptables -A FORWARD -p tcp --sport 20,21  -j ACCEPT

#处理ip碎片，接受所有的ip碎片，但采用limit匹配扩展对其单位时间可以通过的ip碎片数量进行限制，以防止ip碎片攻击。
  
#iptables -A FORWARD -f -m limit-limit 100/s-limit-burst 100 -j ACCEPT 

#设置icmp包过滤，ipmp包通常用于网络测试等，故允许所有的icmp包通过，但是黑客常常采用icmp进行攻击，如ping of death等，所以我们采用limit匹配扩展加以限制。
  
#iptables -A FORWARD -p icmp -m limit --limit 1/s --limit-burst 15 -j ACCEPT 

#防范 SYN-Flood 碎片攻击
#iptables -N syn-flood
#iptables -A syn-flood -m limit --limit 100/s --limit-burst 150 -j RETURN
#iptables -A syn-flood -j DROP
#iptables -I INPUT -j syn-flood 

#设置动态地址转换，使得下位机能够上网，当然也要记得开启路由转发功能

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#设置iptables允许VPN连接（或禁用防火墙）

#iptables -I INPUT -p tcp --dport 1723 -j ACCEPT

#iptables -I INPUT -p tcp --dport 47 -j ACCEPT

#iptables -I INPUT -p gre -j ACCEPT

#设置默认的访问规则

iptables -P INPUT DROP

iptables -P FORWARD DROP

iptables -P OUTPUT ACCEPT

#保存配置

#/usr/libexec/iptables/iptables.init save

