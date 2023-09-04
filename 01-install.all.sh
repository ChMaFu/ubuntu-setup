#! /usr/bin/zsh

echo '########## <updating and upgrade> ##########'
sudo apt-get update 
sudo dpkg --configure -a
sudo apt-get upgrade -y

echo '########## <updating snap> ##########'
sudo snap refresh

sudo bash -c 'cat <<EOF > ./upgrade-all.sh
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt -y autoremove
sudo apt-get clean
EOF'
sudo chmod +x ./upgrade-all.sh

echo '########## <installing curl> ##########'
sudo apt install curl -y -f
curl -V

echo '########## <installing git> ##########'
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt install git -y -f
git --version

echo 'What name do you want to use in GIT user.name?'
read -r git_config_user_name
git config --global user.name "$git_config_user_name"

echo 'What email do you want to use in GIT user.email?'
read -r git_config_user_email
git config --global user.email "$git_config_user_email"

echo 'Generating a SSH Key'
ssh-keygen -t rsa -b 4096 -C "$git_config_user_email"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo '########## <installing vscode> ##########'
sudo snap install code

echo '########## <installing docker> ##########'
sudo apt-get remove docker docker-engine docker.io -y
sudo apt install docker.io -y -f
sudo systemctl enable --now docker
sudo usermod -aG docker ${USER}
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo chmod 777 /var/run/docker.sock

echo '########## <installing docker-compose> ##########'
DOCKER_COMPOSE_LATEST=$(curl --silent "https://api.github.com/repos/docker/compose/releases/latest" \
   | grep '"tag_name":' \
   | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_LATEST}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo '########## <installing ctop> ##########'
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
sudo apt update
sudo apt install docker-ctop

echo '########## <installing vlc player> ##########'
sudo snap install vlc

echo '########## <installing tree> ##########'
sudo apt-get install tree -y

echo '########## <installing zsh> ##########'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '########## <installing jq> ##########'
sudo apt-get install jq -y

echo '########## <installing Golang> ##########'
sudo apt-get install golang

echo '########## <install Rust> ##########'
sudo apt install -y build-essential
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustc --version

read restart_computer
if echo "$restart_computer" | grep -iq "^y" ;then
	sudo shutdown -r 0
else
	echo "Okay. Good work! :)"
fi
