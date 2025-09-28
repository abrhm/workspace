#! /bin/bash

mkdir -p /etc/skel/.config/

# TODO: neovim config should be working from /etc/xdg/nvim/init.lua as well
# TODO: use linking instead of copying
ln -s /snapshot/modules/nvim/nvim /etc/skel/.config/nvim