#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

# Disable password authentication
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Disable root login
sudo sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh

echo "Basic CIS-inspired SSH hardening applied."
