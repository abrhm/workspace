#! /bin/bash

# Copy our zsh configuration to the skeleton directory
mkdir -p /etc/skel
ln -s /snapshot/modules/zsh/.zshrc /etc/skel/.zshrc

# Install Oh My Zsh to the skeleton directory so new users get it
export KEEP_ZSHRC="yes"
export ZSH="/etc/skel/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set proper permissions
chmod -R 755 /etc/skel/.oh-my-zsh
chmod 644 /etc/skel/.zshrc
