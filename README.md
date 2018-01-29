# PC provisioning

This repo provides an easy and fast way to bootstrap a dev workstation on any fresh Ubuntu install.

## How to use?

First, install Ansible:
```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

Then, upgrade your system:
```bash
sudo true # This is necessary in order to execute some tasks as root
ansible-playbook -i hosts dist-upgrade.yml
```

Finally, provision it:
```bash
ansible-playbook -i hosts playbook.yml
```

After that, there're stil some manual steps to do by hand:
* Install uBlock Origin and Privacy Badger extensions (on Firefox and Chrome)
* Download PHPStorm and CLion from JetBrains Toolbox
* Retrieve important/secret files from another computer/backup storage
* Log-out and then re log-in, in order to be in docker group
* Install Ruby versions needed (e.g. `sudo bash -l rvm install ruby-2.4`)

## TODO

* Debug trackers more thoroughly (see https://wiki.gnome.org/Projects/Tracker/WhatIsTracker)
* Enable persistent logging for journald
* Debug systemd-coredump
* Inspect softwares automatically started at boot time
