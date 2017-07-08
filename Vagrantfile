# -*- mode: ruby -*-
# vi: set ft=ruby :

$provision = <<SCRIPT

cd /vagrant # This is where the host folder/repo is mounted

# Add repo for NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -

sudo yum update
sudo yum remove ruby mariadb-libs
sudo yum -y install \
  epel-release \
  git \
  bind-utils \
  jwhois \
  telnet \
  ntpdate \
  ntp \
  imake \
  make \
  unzip \
  bzip2 \
  tree \
  tcpdump \
  traceroute \
  nc \
  dstat \
  sysstat \
  mlocate \
  gcc \
  gcc-c++ \
  zlib-devel \
  openssl \
  openssl-devel \
  patch \
  readline-devel \
  libyaml-devel \
  libxml2 \
  libxml2-devel \
  libxslt \
  libxslt-devel \
  libcurl-devel \
  mailx \
  wget \
  qtwebkit-devel \
  yum-utils \
  qt-devel \
  nodejs \
  mysql-devel \
  strace \
  ltrace \
  lsof

read RUBY_VERSION < .ruby-version
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install $RUBY_VERSION

# qmake
echo 'PATH=/usr/lib64/qt4/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

# mysql 5.6
sudo yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql56-community
sudo yum install -y mysql mysql-devel mysql-server mysql-utilities

sudo sh -c "cat <<CONF >> /etc/my.cnf
[mysqld]
innodb_file_format = Barracuda
innodb_file_per_table = 1
innodb_large_prefix
max_allowed_packet=16MB
character-set-server=utf8mb4

[client]
default-character-set=utf8mb4
CONF"

sudo systemctl start mysqld
sudo systemctl enable mysqld.service

# Install gems and node modules
gem install bundler
bundle install
# cp .env.development.sample .env.development
bundle exec rake db:create
bundle exec rake db:migrate

SCRIPT

$start = <<SCRIPT

echo 'To start server'
echo '  $ vagrant ssh -c "cd /vagrant && bundle exec rails s -b 0.0.0.0"'

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "okashi"
    vb.customize ["modifyvm", :id, "--memory", "2048"]

    # Disable VirtualBox DNS proxy to skip long-delay IPv6 resolutions.
    # https://github.com/mitchellh/vagrant/issues/1172
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]

    # Use "virtio" network interfaces for better performance.
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  if config.vm.networks.any? { |type, options| type == :private_network }
    config.vm.synced_folder ".", "/vagrant", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp']
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3002, host: 3002

  # Full provisioning script, only runs on first 'vagrant up' or with 'vagrant provision'
  config.vm.provision :shell, inline: $provision, privileged: false

  # Start up script, runs on every 'vagrant up'
  config.vm.provision :shell, inline: $start, run: 'always', privileged: false
end
