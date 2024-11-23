# Use LTS image with fixed version
FROM ubuntu:24.04

# Set timezone info
RUN ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime

# Install apt-add-repository utility
RUN apt update && apt-get install -y software-properties-common

# Add git PPA, to always use the latest git version
RUN apt-add-repository ppa:git-core/ppa

# Install dependencies
RUN apt update && apt-get install -y \
    curl \
    git

# Install neovim
WORKDIR /deps/nvim/
ENV NEOVIM_VERSION="v0.10.2"
RUN curl -OL "https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim-linux64.tar.gz" && \
    tar xzvf nvim-linux64.tar.gz

# Add neovim to path
ENV PATH="$PATH:/deps/nvim/nvim-linux64/bin"

WORKDIR /workspace/
