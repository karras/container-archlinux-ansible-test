FROM archlinux:latest

LABEL maintainer="Michael Hofer <karras@0x539.ch>"

RUN pacman -Sy --noconfirm python
