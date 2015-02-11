# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"

  # forward port 8080 for node-inspector based debugging
  config.vm.network :forwarded_port, host: 8080, guest: 8080
end
