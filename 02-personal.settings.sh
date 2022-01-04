#! /usr/bin/zsh

echo '########## <configure git alias> ##########'
git config --global alias.co "!git checkout"
git config --global alias.lg "!git log --pretty=format:'%C(blue)%h%C(red)%d %C(white) %s %C(cyan)[%cn] %C(green)%cr'"
git config --global alias.ac "!git add . && git commit"
git config --global alias.st "!git status -sb"
git config --global alias.tags "!git tag -l"
git config --global alias.branches "!git branch -a"
git config --global alias.ignore "!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi"
git config --global alias.amend = !git add . && git commit --amend --no-edit

echo '########## <installing themes> ##########'
sudo apt install fonts-firacode -y
sudo apt-get install fonts-hack-ttf -y