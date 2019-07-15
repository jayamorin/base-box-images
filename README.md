# base-box-images

[![CircleCI](https://circleci.com/gh/jayamorin/base-images.svg?style=svg)](https://circleci.com/gh/jayamorin/base-images)

[Packer](https://www.packer.io/) templates for [Vagrant](https://www.vagrantup.com/) base boxes

Build:

```bash
packer build -var 'GITHUB_SSH_PUBKEY_URL=https://github.com/username.keys' ubuntu-18.04-amd64.json
```

Add to Vagrant:

```bash
vagrant box add output/ubuntu-18.04.2-amd64-virtualbox.box --name ubuntu-18.04-amd64
```

Publish to https://app.vagrantup.com:

```bash
vagrant cloud publish --box-version 0.0.2 --description "Ubuntu base image" --release jayamorin/ubuntu-18.04 0 virtualbox output/ubuntu-18.04.2-amd64-virtualbox.box
```

Start and provision Vagrant environments:

```bash
GITHUB_SSH_PUBKEY_URL=https://github.com/username.keys vagrant up
```
