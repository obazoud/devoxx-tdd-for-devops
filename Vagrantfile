# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode_ubuntu-13.04_devoxx-0.4.0"

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "chef_solo" do |chef|
    chef.log_level = :auto
    chef.add_recipe "stack::default"
  end

end
