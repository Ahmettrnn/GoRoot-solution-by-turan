#!/bin/bash

# Golang'u kaldır
sudo apt-get remove golang-go -y
sudo apt-get autoremove golang-go -y
sudo rm -rvf /usr/local/go

# Eğer go1.21.3.linux-amd64.tar.gz dosyası varsa, çıkart
if [ -f "go1.21.3.linux-amd64.tar.gz" ]; then
    sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
# Eğer dosya yoksa, indir ve çıkart
else
    wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
fi

# Gerekli environment değişkenlerini ayarla
echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile.d/go.sh
echo 'export GOPATH=$HOME/go' | sudo tee -a /etc/profile.d/go.sh
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' | sudo tee -a /etc/profile.d/go.sh

# Versiyonu kontrol et
go version
