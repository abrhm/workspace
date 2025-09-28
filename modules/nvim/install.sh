#! /bin/bash

mkdir -p /etc/skel/.config/nvim

# TODO: neovim config should be working from /etc/xdg/nvim/init.lua as well
# TODO: use linking instead of copying
# ln -s /snapshot/modules/nvim/nvim /etc/skel/.config/nvim

ln -s /snapshot/modules/nvim/config/init.lua /etc/skel/.config/nvim/init.lua
ln -s /snapshot/modules/nvim/config/lua /etc/skel/.config/nvim/lua


# Update all lazy dependencies
nvim --headless "+Lazy! update" +qa
