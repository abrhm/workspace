#! /bin/bash

pacman -S --noconfirm zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set the config to all users
touch /home/user/.zshrc

# TODO: Fix that zsh-newuser-install is running on every start.