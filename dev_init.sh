

# dotNet 5 SDK

sudo apt-get update;
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-5.0

# if the above fails

sudo apt-get install -y gpg
wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget https://packages.microsoft.com/config/ubuntu/20.10/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
sudo apt-get update; \
sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-5.0

# node js

sudo apt update
sudo apt install nodejs npm

# Azure CLI

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# kubectl

sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Helm

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# git config

git config pull.rebase true

# ~/.profile

export EDITOR='/usr/bin/nano'
export WD_CHROME_PATH='/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'

source ~/sf_functions.sh

export TOKEN_FISHNET=""
export KENDO_UI_LICENSE=""

export VSS_NUGET_EXTERNAL_FEED_ENDPOINTS="$(echo -n "$TOKEN_FISHNET" | base64)"

if [ $(pwd) == "/mnt/c/Users/a_bri" ] || [ $(pwd) == "/home/steve" ] ; then
    cd ~/source/repos/fnm/Merchandise-Microservices
fi

