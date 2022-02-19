FROM archlinux/archlinux:latest

LABEL org.opencontainers.image.authors="Michael Hofer <karras@0x539.ch>"
LABEL org.opencontainers.image.source="https://github.com/karras/container-archlinux-ansible-test"
LABEL org.opencontainers.image.title="Arch Linux Ansible Test"
LABEL org.opencontainers.image.description="Arch Linux container image for testing Ansible roles, playbooks and collections."
LABEL org.opencontainers.image.base.name="docker.io/archlinux/archlinux:latest"

# See also https://systemd.io/CONTAINER_INTERFACE
ENV container docker

# Update all packages
RUN pacman -Syu --noconfirm \
    && yes|pacman -Scc

# Install systemd
# Adopted from https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container
RUN pacman -S --noconfirm systemd-sysvcompat \
    && yes|pacman -Scc \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /lib/systemd/system/basic.target.wants/*           \
    && rm -f /lib/systemd/system/multi-user.target.wants/*      \
    && rm -f /lib/systemd/system/local-fs.target.wants/*        \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev*    \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /etc/systemd/system/*.wants/*

# Install python for Ansible
RUN pacman -S --noconfirm python \
    && yes|pacman -Scc

# Required by systemd
VOLUME ["/sys/fs/cgroup"]

# Execute systemd at start
CMD ["/sbin/init"]
