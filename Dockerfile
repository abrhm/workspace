FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    git \
    sudo

# Define the list of dependencies and their install order
# This should be defined first, so when this is changed the deps are copied again
# and the layers are invalidated, forcing a reinstall of the dependencies
ENV MODULES="zsh nvim tmux node keepass"

# Copy the dependencies from the host to the container
COPY deps /deps

# TODO: Instead of installing the dependencies in pacman collect them and run a single pacman install command

# Ensure install order by renaming folders or specifying order explicitly
RUN for module in $MODULES; do bash /deps/$module/install.sh; done

RUN useradd -m -s /bin/zsh user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# TODO: use passwd file to set a password for the user

USER user
WORKDIR /home/user/work

# Set zsh as the default shell
ENTRYPOINT [ "/bin/zsh" ]

# TODO: Start tmux automatically
# ENTRYPOINT [ "tmux" ]