FROM archlinux:latest

COPY . /snapshot
RUN echo $(date +%Y%m%d-%H%M%S) > /snapshot/version.txt

ARG PACMAN_DEPS="base-devel git sudo python"
ENV MODULES="zsh lazygit nvim tmux node keepass"

# Generate the list of pacman dependencies
RUN echo "$PACMAN_DEPS" | tr ' ' '\n' > /snapshot/pkglist.txt && \
    for module in $MODULES; do \
        if [ -f "/snapshot/modules/$module/pkglist.txt" ]; then \
            echo "" >> /snapshot/pkglist.txt && \
            cat "/snapshot/modules/$module/pkglist.txt" >> /snapshot/pkglist.txt; \
        fi; \
    done

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm $(cat /snapshot/pkglist.txt | xargs)

# Run the install scripts for each module to set them up
RUN for module in $MODULES; do \
    if [ -f "/snapshot/modules/$module/install.sh" ]; then \
        bash /snapshot/modules/$module/install.sh; \
    fi; \
done

RUN useradd -m -s /bin/zsh user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# TODO: use passwd file to set a password for the user

USER user
WORKDIR /home/user/work

# Set zsh as the default shell
ENTRYPOINT [ "/bin/zsh" ]

# TODO: Start tmux automatically
# ENTRYPOINT [ "tmux" ]
