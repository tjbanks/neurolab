cd $HOME
mkdir Desktop 
cd Desktop
git clone https://github.com/tjbanks/Tutorials_S2-S6
git clone https://github.com/chenziao/Computational-Neuroscience-Tutorials
git clone https://github.com/tjbanks/bmtool-cell-prefab
# git clone https://github.com/tjbanks/two-cell-hco
chown -R $USER:$USER $HOME/Desktop

# docker run must be run with --cap-add=NET_ADMIN
#sudo ufw default deny outgoing
#sudo ufw enable
iptables -A OUTPUT -p tcp --dport 80 -j DROP
iptables -A OUTPUT -p tcp --dport 443 -j DROP
# docker rm -f apple_orange
# docker build .
# docker images
# docker tag ed6f7fb1fd4d neurolab17
# docker run --cap-add=NET_ADMIN -p 6080:80 -e USER=tjbanks -e PASSWORD=tjbanks -e HTTP_PASSWORD=tjbanks neurolab17