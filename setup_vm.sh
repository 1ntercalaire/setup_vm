### BASIC ###
apt update && apt install -y curl man net-tools openssh-server sudo python3 python3-venv python3-pip aptitude


### ZSH ###
apt install zsh curl sudo git -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i "s/robbyrussell/duellj/g" .zshrc


### DOCKER ###
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release openssh-server sudo -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


### DOCKER-COMPOSE ###
curl -L https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


### KUBECTL ###
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubeadm kubelet
systemctl disable kubelet.service
echo $(source <(kubectl completion zsh)) >> ~/.zshrc


### ANSIBLE ###
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main"
sudo apt update
sudo apt install ansible -y


### VAGRANT ###
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y vagrant
vagrant autocomplete install --bash --zsh


### POWERSHELL ###
sudo apt update  && sudo apt install -y curl gnupg apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
sudo apt update && sudo apt install -y powershell


### XFCE4 ###
apt-get install xorg xfce4 thunar-volman lightdm gnome-terminal -y --no-install-recommends
systemctl set-default multi-user.target
apt install firefox-esr -y


### VSCODE ###
sudo apt install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code -y


### FIRACODE ###
apt update
apt install fonts-firacode -y


### COCKPIT ###
sudo apt-get update
sudo apt-get install cockpit -y
sudo systemctl disable cockpit.socket


### VIRTUALBOX ###
sudo echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bullseye contrib" |
sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install virtualbox-6.1
