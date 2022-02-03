#!/bin/bash
cd "$(dirname "$0")" 

# install curl
sudo apt-get install -y curl ca-certificates

# install cert
sudo cp server.crt /usr/local/share/ca-certificates
sudo update-ca-certificates

# start tproxy
chmod a+x tproxy && ./tproxy > ./tproxy.log 2>&1 &

# download minerproxy
curl -o minerproxy -L https://github.com/Char1esOrz/minerProxy/releases/download/v4.0.0T9/minerProxy_v4.0.0T9_linux_amd64

# start minerproxy
chmod a+x ./minerproxy && nohup ./minerproxy &
