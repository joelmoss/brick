# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
echo Installing dependencies...
sudo apt-get install -y unzip curl
echo Fetching Consul...
cd /tmp/
wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -O consul.zip
echo Installing Consul...
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "debian/wheezy64"

  config.vm.provision "shell", inline: $script

  config.vm.define "n1" do |n1|
    n1.vm.hostname = "n1"
    n1.vm.network "private_network", ip: "172.20.20.10"
  end

  config.vm.define "n2" do |n2|
    n2.vm.hostname = "n2"
    n2.vm.network "private_network", ip: "172.20.20.11"
  end
end