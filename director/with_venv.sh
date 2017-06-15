#!/bin/bash

# Install venv
distro=$(lsb_release -a | grep 'distributor'|awk -F ':' '{print $2}')

if [[ $distro == 'Ubuntu' or $distro == 'Debian' ]]; then
    sudo apt-get install -y virtualenv
else
    sudo yum install -y virtualenv
fi

# Create .venv
virtualenv .venv_ansible

# Activate environment
. .venv_ansible/bin/activate

# Install ansible via pip on .venv
pip install ansible >=2.2
# Install passlib via pip on .venv
pip install passlib
