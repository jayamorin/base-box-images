#!/bin/bash -eux

DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

mount -o loop,ro /home/vagrant/VBoxGuestAdditions_`cat /home/vagrant/.vbox_version`.iso /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run
umount -l /media/cdrom
rm -f /home/vagrant/VBoxGuestAdditions_`cat /home/vagrant/.vbox_version`.iso
