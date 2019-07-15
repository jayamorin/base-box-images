#!/bin/bash -eux

# Create vagrant ssh directory.
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
# Download github ssh pubkey from args -var 'GITHUB_SSH_PUBKEY_URL=https://github.com/username.keys'
wget --no-check-certificate "$GITHUB_SSH_PUBKEY_URL" -O ->> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 644 /home/vagrant/.ssh/authorized_keys
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

useradd -m ubuntu
usermod -G sudo ubuntu
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
chown ubuntu:ubuntu /home/ubuntu/.ssh
echo "ubuntu        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic
