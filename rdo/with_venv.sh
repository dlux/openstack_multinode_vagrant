#!/bin/bash

# Install venv
sudo pip install virtualenv

# Create .venv
virtualenv .venv_ansible

# Activate environment
python_interpreter=.venv_ansible/bin

# Install ansible on the venv
$python_interpreter/pip install ansible>=2.1.2.0

# Install passlib via pip on .venv
$python_interpreter/pip install passlib
