# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box       = 'utopic64'
  config.vm.box_url   = 'https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-i386-vagrant-disk1.box'

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  config.vm.synced_folder "../lark", "/lark"

  config.vm.provision :shell do |shell|
    shell.inline = "mkdir -p /etc/puppet/modules;
                    puppet module install puppetlabs-postgresql;
                    puppet module install maestrodev/rvm;
                    puppet module install puppetlabs-mysql;"
  end

  config.vm.provision :puppet,
    #:module_path    => 'puppet/modules',
    :manifests_path => 'puppet/manifests'
end
