# This script will be downloaded and run (at build time) for easy access to allow/disallow ip addresses through the firewall.

## Allow github (python3) - List may need updated
## This script will allow updating to be done easily

#import urllib.request, json 
#with urllib.request.urlopen("https://api.github.com/meta") as url:
#    data = json.loads(url.read().decode())
#    valid_keys = ["hooks","web","api","git","pages","importer"]
#    for key,value in data.items():
#        if key in valid_keys:
#            for i in value:
#                it = i.split("/32")[0] # Cleanup
#                print("iptables -A OUTPUT -p tcp -d " + it + " --dport 80 -j ACCEPT")
#                print("iptables -A OUTPUT -p tcp -d " + it + " --dport 443 -j ACCEPT")

#https://unix.stackexchange.com/questions/478735/blocking-all-traffic-except-whitelisted-ip-adresses


iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.114.40.48 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.114.40.48 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.229.188.59 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.229.188.59 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.176.102 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.176.102 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.210.38 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.210.38 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.229.21 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.229.21 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.237.44.5 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.237.44.5 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.177.223 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.177.223 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 15.164.81.167 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 15.164.81.167 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.104.89 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.104.89 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.85.27 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.85.27 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.52.138 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.52.138 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.67.229 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.67.229 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.231.5.6 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.231.5.6 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 35.159.8.160 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 35.159.8.160 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.192.72.89 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.192.72.89 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.64.108.95 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.64.108.95 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.186.44 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.186.44 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.74.223.119 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.74.223.119 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.78.231.108 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.78.231.108 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.209.163.61 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.209.163.61 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.230.158.120 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.230.158.120 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.233.76.15 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.233.76.15 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.168.60 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.168.60 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.14.80 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.14.80 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.238.54.232 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.238.54.232 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.168.23 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.168.23 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.94.254 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.94.254 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.179.245.253 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.179.245.253 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.201.191 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.201.191 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.135.122 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.135.122 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.229.119.202 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.229.119.202 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.229.199.252 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.229.199.252 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.58.203.252 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.58.203.252 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.63.231.178 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.63.231.178 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.239.207 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.239.207 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.169.195.247 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.169.195.247 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.180.75.25 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.180.75.25 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.207.47.76 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 54.207.47.76 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.114.40.48 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.114.40.48 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.229.188.59 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.229.188.59 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.176.102 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.176.102 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.210.38 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.234.210.38 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.229.21 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.236.229.21 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.237.44.5 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.237.44.5 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.177.223 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 13.250.177.223 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 15.164.81.167 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 15.164.81.167 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.104.89 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.194.104.89 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.85.27 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.195.85.27 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.52.138 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.52.138 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.67.229 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.228.67.229 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.231.5.6 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 18.231.5.6 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 35.159.8.160 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 35.159.8.160 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.192.72.89 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.192.72.89 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.64.108.95 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.64.108.95 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.186.44 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.69.186.44 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.74.223.119 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.74.223.119 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.78.231.108 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 52.78.231.108 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.153 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.153 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.154 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.154 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.153 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.153 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.109.153 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.109.153 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.110.153 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.110.153 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.111.153 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.111.153 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.30.252.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 185.199.108.0/22 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.112.0/20 --dport 443 -j ACCEPT

# Allen Institute API
iptables -A OUTPUT -p tcp -d 63.237.233.29 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 63.237.233.29 --dport 443 -j ACCEPT

# NSG

