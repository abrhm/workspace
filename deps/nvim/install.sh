#! /bin/bash

# TODO: Move this to other folders
pacman -S --noconfirm neovim

mkdir -p /etc/skel/.config/nvim

# TODO: neovim config should be working from /etc/xdg/nvim/init.lua as well
cp -r /deps/nvim/config/* /etc/skel/.config/nvim