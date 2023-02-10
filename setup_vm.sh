### BASIC ###
sudo apt update && sudo apt install -y curl man net-tools openssh-server sudo python3 python3-venv python3-pip aptitude tmux tree
sudo sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sudo systemctl reload sshd
 

### ZSH ###
sudo apt install zsh curl sudo git -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i "s/robbyrussell/duellj/g" .zshrc
sed -i "s/plugins=(git)/plugins=(git docker docker-compose)/g" .zshrc
sed -i 's|# export PATH=$HOME/bin:/usr/local/bin:$PATH|export PATH=$HOME/bin/:/usr/local/bin/:/usr/sbin/:$PATH|g' .zshrc


### DOCKER ###
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release openssh-server sudo -y
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(sudo lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


### DOCKER-COMPOSE ###
sudo curl -L https://github.com/docker/compose/releases/download/v2.15.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#https://github.com/docker/compose/releases

### KUBECTL ###
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubeadm kubelet
echo $(source <(kubectl completion zsh)) >> ~/.zshrc


### ANSIBLE ###
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main"
sudo apt update
sudo apt install ansible -y


### VAGRANT ###
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y vagrant
vagrant autocomplete install --bash --zsh


### POWERSHELL ###
sudo apt update  && sudo apt install -y curl gnupg apt-transport-https
sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
sudo apt update && sudo apt install -y powershell


### XFCE4 ###
sudo apt-get install xorg xfce4 thunar-volman lightdm gnome-terminal xrdp -y --no-install-recommends
sudo systemctl set-default multi-user.target
sudo apt install firefox-esr chromium -y


### VSCODE ###
sudo apt install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code -y


### FIRACODE ###
sudo apt update
sudo apt install fonts-firacode -y


### COCKPIT ###
sudo apt-get update
sudo apt-get install cockpit -y
sudo systemctl disable cockpit.socket


### VIRTUALBOX ###
sudo echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bullseye contrib" |
sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install virtualbox-6.1 -y
