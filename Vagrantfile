# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu-18.04-amd64"

  config.vm.network "public_network", bridge: "wlp58s0"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 1
  end

  $ubuntu_ssh_pubkey = <<-SCRIPT
  mkdir -p /home/ubuntu/.ssh
  chmod 700 /home/ubuntu/.ssh
  wget --no-check-certificate #{ENV['GITHUB_SSH_PUBKEY_URL']} -O ->> /home/ubuntu/.ssh/authorized_keys
  chown -R ubuntu:ubuntu /home/ubuntu/.ssh
  SCRIPT

  config.vm.provision "shell", inline: $ubuntu_ssh_pubkey

  config.vm.provision :shell, :inline => "sed -i '/^vagrant.*PASSWD.*ALL$/d' /etc/sudoers"
  
  config.ssh.insert_key = false
  config.ssh.private_key_path = ["~/.ssh/id_rsa"]

end