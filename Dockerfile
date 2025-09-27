FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    git \
    sudo

# Copy the dependencies from the host to the container
COPY deps /deps

# Define the list of dependencies and their install order
ENV MODULES="zsh nvim tmux node"

# Ensure install order by renaming folders or specifying order explicitly
RUN for module in $MODULES; do bash /deps/$module/install.sh; done

RUN useradd -m -s /bin/zsh user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user
WORKDIR /home/user/work

# Set zsh as the default shell
ENTRYPOINT [ "/bin/zsh" ]