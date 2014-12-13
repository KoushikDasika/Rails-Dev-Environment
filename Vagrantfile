# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box       = 'precise64'
  config.vm.box_url   = 'http://files.vagrantup.com/precise64.box'

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.synced_folder "../Candi", "/Candi"

  config.vm.provision :shell do |shell|
	  shell.inline = "mkdir -p /etc/puppet/modules;
	                  puppet module install puppetlabs-postgresql;
	                  puppet module install puppetlabs-mysql;"
	end

  config.vm.provision :puppet,
    :module_path    => 'puppet/modules',
    :manifests_path => 'puppet/manifests'
end
