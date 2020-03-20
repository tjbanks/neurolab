## docker run must be run with --cap-add=NET_ADMIN

#iptables -A OUTPUT -p tcp --dport 80 -j DROP
#iptables -A OUTPUT -p tcp --dport 443 -j DROP
## docker rm -f apple_orange
## docker build .
## docker images
## docker tag ed6f7fb1fd4d neurolab17
## docker run --cap-add=NET_ADMIN -p 6080:80 -e USER=tjbanks -e PASSWORD=tjbanks -e HTTP_PASSWORD=tjbanks neurolab17


## New stuff here
chmod 1777 /dev/shm # Without this VSCode will not launch in user mode

wget https://github.com/tjbanks/neurolab/raw/ml/online/firewall_allow.sh -O firewall_allow.sh
wget https://github.com/tjbanks/neurolab/raw/ml/online/run.sh -O run.sh
chmod +x run.sh
chmod +x firewall_allow.sh

./run.sh

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 443 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT

./firewall_allow.sh

rm ./run.sh
rm ./firewall_allow.sh
