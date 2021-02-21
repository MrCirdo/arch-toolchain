FROM archlinux:base-20210214.0.15477

# Thanks @MrCirdo for sharing this link
# https://stackoverflow.com/questions/66154574/archlinux-docker-ci-failed-to-initialise-alpm-library-returned-a-non-zero-cod/66163228#66163228
ARG patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst
RUN curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
bsdtar -C / -xvf "$patched_glibc"

RUN pacman -Syu --noconfirm clang automake autoconf gtest autoconf-archive boost gcc make

RUN bsdtar -C / -xvf "$patched_glibc"

RUN pacman -Scc --noconfirm
