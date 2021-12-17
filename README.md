# Container Image - Arch Linux Ansible Testing

An extended Arch Linux container base image with the goal to be used together
with [Molecule](https://github.com/ansible-community/molecule) in order to test
Ansible roles, playbooks or collections.

![GitHub](https://github.com/karras/container-archlinux-ansible-testing/workflows/Publish/badge.svg?branch=main)

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
  ghcr.io/karras/archlinux-ansible-testing
```

## License

See [LICENSE](./LICENSE)
