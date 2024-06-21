
### Basic ###
```
apt update
apt install -y curl man openssh-server sudo python3 python3-venv python3-pip
```

### Zsh ###
```
sudo apt install zsh curl sudo git -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i "s/robbyrussell/duellj/g" ~/.zshrc
sed -i "s/plugins=(git)/plugins=(git docker docker-compose)/g" ~/.zshrc
sed -i 's|# export PATH=$HOME/bin:/usr/local/bin:$PATH|export PATH=$HOME/bin/:/usr/local/bin/:/usr/sbin/:$PATH|g' ~/.zshrc
source ~/.zshrc
```

### Docker ###
```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```
#https://github.com/docker/compose/releases

### Docker-Compose ###
```
sudo curl -L https://github.com/docker/compose/releases/download/v2.26.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
```
 
### GH Github ###
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
```

### K8s ###
```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubeadm kubelet
echo $(source <(kubectl completion zsh)) >> ~/.zshrc
```
 
### Python ###
```
PYTHON_RELEASE=3.12.1
sudo apt-get update
sudo apt-get install -y curl xz-utils gcc make build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev
curl -fsSL https://www.python.org/ftp/python/${PYTHON_RELEASE}/Python-${PYTHON_RELEASE}.tar.xz | tar -xJ -C /tmp

cd /tmp/Python-${PYTHON_RELEASE}
./configure --with-pydebug
sudo make -s -j`nproc`
sudo make install
cd -

sudo ln -sf /usr/local/bin/python`echo ${PYTHON_RELEASE} | cut -d '.' -f 1,2` /usr/local/bin/python
sudo ln -sf /usr/local/bin/pip`echo ${PYTHON_RELEASE} | cut -d '.' -f 1,2` /usr/local/bin/pip
```

### Ansible from pip ###
```
sudo apt update
sudo apt install -y openssh-client
pip install --no-warn-script-location ansible 
source ~/.profile
sudo mkdir -p /etc/ansible
sudo touch /etc/ansible/hosts
sudo mkdir -p ~/.ssh
touch ~/.ssh/known_hosts
if [ -f $HOME/.ssh/id_rsa ] | [ -f $HOME/.ssh/id_rsa.pub ]
then
 echo "ssh RSA key already exists."
else
 echo "ssh RSA key doesn't exist"
 ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

#ssh-keyscan -f ~/.ssh/known_hosts 10.0.0.0 | tee -a ~/.ssh/known_hosts
```

### Ansible from APT ###
```
UBUNTU_CODENAME=jammy
sudo apt-get update
sudo apt-get install -y wget gpg
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update
sudo apt install -y ansible
```

### Terraform ###
```
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common wget lsb-release
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo apt update
sudo apt-get install -y terraform
```

### ElasticSearch ###
```
sudo apt update
sudo apt install -y wget gpg apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update
sudo apt-get install -y elasticsearch kibana logstash filebeat

