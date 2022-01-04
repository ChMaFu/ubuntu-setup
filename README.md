# Chris's Ubuntu Setup

My basic Ubuntu development setup for dekstop and Raspberry Pi (arm64) Ubuntu

## Install

```sh
git clone git@github.com:chmafu/ubuntu-setup.git
cd ubuntu-setup
```

## Programs to install

- Create script "upgrade-all.sh"
- Install curl
- Generate a SSH Key
- [Install git](https://git-scm.com/)
- [Install vscode](https://code.visualstudio.com/)
- [Install docker](https://docs.docker.com/get-docker/)
- [Install docker-compose ](https://docs.docker.com/compose/install/)
- [ctop](https://github.com/bcicen/ctop)
- [Install vlc](https://www.videolan.org/)
- [Install tree](https://snapcraft.io/install/tree/ubuntu)
- [Install zsh](https://www.zsh.org/)
- [Install jq](https://stedolan.github.io/jq/)
- [Install Golang](https://golang.org/)
- [Install Rust](https://www.rust-lang.org/)

## Run scripts
```sh
chmod +x *.sh
 ./01-install.all.sh
 ./02-personal.settings.sh
```

## Author

**Chris Fussell** (Forked from Jefferson Follmann's [repo](https://github.com/jfollmann/ubuntu-setup))