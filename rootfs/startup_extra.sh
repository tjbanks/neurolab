## docker run must be run with --cap-add=NET_ADMIN

#iptables -A OUTPUT -p tcp --dport 80 -j DROP
#iptables -A OUTPUT -p tcp --dport 443 -j DROP
## docker rm -f apple_orange
## docker build .
## docker images
## docker tag ed6f7fb1fd4d neurolab17
## docker run --cap-add=NET_ADMIN -p 6080:80 -e USER=tjbanks -e PASSWORD=tjbanks -e HTTP_PASSWORD=tjbanks neurolab17


## New stuff here
wget https://github.com/tjbanks/neurolab/raw/basic/online/firewall_allow.sh -O firewall_allow.sh
wget https://github.com/tjbanks/neurolab/raw/basic/online/run.sh -O run.sh
chmod +x run.sh
chmod +x firewall_allow.sh

./run.sh

iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

./firewall_allow.sh

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP

rm ./run.sh
rm ./firewall_allow.sh
