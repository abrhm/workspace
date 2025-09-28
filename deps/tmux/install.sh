#! /bin/bash

pacman -S --noconfirm tmux

# Set up the tmux configuration
cp /deps/tmux/config/tmux.conf /etc/tmux.conf