FROM archlinux:base-20210214.0.15477

RUN pacman -Syu --noconfirm clang automake autoconf gtest autoconf-archive boost gcc make flex bison && pacman -Scc --noconfirm

RUN mkdir /project

WORKDIR /project
CMD ./command.sh
