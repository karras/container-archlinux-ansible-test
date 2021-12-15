FROM archlinux/archlinux:latest

LABEL org.opencontainers.image.authors="Michael Hofer <karras@0x539.ch>"
LABEL org.opencontainers.image.source="https://github.com/karras/container-archlinux-ansible-testing"
LABEL org.opencontainers.image.title="Arch Linux Ansible Testing"
LABEL org.opencontainers.image.description="Arch Linux container image for testing Ansible roles, playbooks and collections."
LABEL org.opencontainers.image.base.name="docker.io/archlinux/archlinux:latest"

# See also https://systemd.io/CONTAINER_INTERFACE/
ENV container docker

# Install Systemd
# Adopted from https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container
RUN pacman -Sy --noconfirm systemd-sysvcompat \
    && pacman -Scc --noconfirm \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /lib/systemd/system/basic.target.wants/*           \
    && rm -f /lib/systemd/system/multi-user.target.wants/*      \
    && rm -f /lib/systemd/system/local-fs.target.wants/*        \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev*    \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /etc/systemd/system/*.wants/*

# Install Python for Ansible
RUN pacman -Sy --noconfirm python \
    && pacman -Scc --noconfirm

# Required by Systemd
VOLUME [ "/sys/fs/cgroup" ]

# Execute Systemd at start
CMD ["/sbin/init"]
