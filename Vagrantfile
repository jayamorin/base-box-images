# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu-18.04-amd64"

  config.vm.network "public_network", bridge: "wlp58s0"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision :shell, :inline => "wget --no-check-certificate 'https://github.com/jayamorin.keys' -O ->> /home/ubuntu/.ssh/authorized_keys"
  config.vm.provision :shell, :inline => "chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys"
  config.vm.provision :shell, :inline => "chmod 644 /home/ubuntu/.ssh/authorized_keys"
  config.vm.provision :shell, :inline => "sed -i '/^vagrant.*PASSWD.*ALL$/d' /etc/sudoers"
  
  config.ssh.insert_key = false
  config.ssh.private_key_path = ["~/.ssh/id_rsa"]

end