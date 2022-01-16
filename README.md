# Container Image - Arch Linux Ansible Test

Arch Linux container image for testing Ansible roles, playbooks and collections.

The main idea is to use it in combination with
[Molecule](https://github.com/ansible-community/molecule).

[![Publish](https://github.com/karras/container-archlinux-ansible-test/actions/workflows/publish.yml/badge.svg)](https://github.com/karras/container-archlinux-ansible-test/actions/workflows/publish.yml)

## Customizations

The following customizations are added on top of the Arch Linux base image:

* Setup systemd, its volumes and execute it at start
* Setup python for Ansible

## Usage

Run the container as follows:

```sh
podman run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  ghcr.io/karras/archlinux-ansible-test
```

## License

See [LICENSE](./LICENSE)
