sudo true

# Install kernel extra's to enable docker aufs support
# sudo apt-get -y install linux-image-extra-$(uname -r)

# Add Docker PPA and install latest version
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
# sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
# sudo apt-get update
# sudo apt-get install lxc-docker -y

# Alternatively you can use the official docker install script
wget -qO- https://get.docker.com/ | sh

#get latest docker compose released tag
docker_compose_version="$(git ls-remote https://github.com/docker/compose | grep "refs/tag" | grep -oP "[0-9]+\.[0-9]+\.[0-9]+" | tail -n1)"

# Install docker-compose
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$docker_compose_version/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/$docker_compose_version/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-cleanup command
cd /tmp
git clone https://gist.github.com/76b450a0c986e576e98b.git
cd 76b450a0c986e576e98b
sudo mv docker-cleanup /usr/local/bin/docker-cleanup
sudo chmod +x /usr/local/bin/docker-cleanup

docker_machine_version="$(git ls-remote https://github.com/docker/machine | grep "refs/tag" | grep -oP "[0-9]+\.[0-9]+\.[0-9]+" | tail -n1)"
sudo sh -c "curl -L https://github.com/docker/machine/releases/download/v$docker_machine_version/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine"
sudo chmod +x /usr/local/bin/docker-machine
