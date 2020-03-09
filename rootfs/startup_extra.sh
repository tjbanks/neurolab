cd $HOME
mkdir Desktop 
cd Desktop
git clone https://github.com/tjbanks/Tutorials_S2-S6
git clone https://github.com/chenziao/Computational-Neuroscience-Tutorials
git clone https://github.com/tjbanks/bmtool-cell-prefab
# git clone https://github.com/tjbanks/two-cell-hco
chown -R $USER:$USER $HOME/Desktop

## docker run must be run with --cap-add=NET_ADMIN
#iptables -A OUTPUT -p tcp --dport 80 -j DROP
#iptables -A OUTPUT -p tcp --dport 443 -j DROP
## docker rm -f apple_orange
## docker build .
## docker images
## docker tag ed6f7fb1fd4d neurolab17
## docker run --cap-add=NET_ADMIN -p 6080:80 -e USER=tjbanks -e PASSWORD=tjbanks -e HTTP_PASSWORD=tjbanks neurolab17


## New stuff here
# wget https://github.com/tjbanks/neurolab/raw/0.1.1/online/run.sh -O online_run.sh
# chmod +x online_run.sh

# iptables -I INPUT 1 -i lo -j ACCEPT
# iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# ./online_run.sh

# iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# iptables -P INPUT DROP
# iptables -P OUTPUT DROP

# rm ./online_run.sh
