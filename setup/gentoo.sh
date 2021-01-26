#!/bin/bash

# AOSP Env for gentoo users "ItsVixano"

echo "installing git"
sudo emerge -u \
     dev-vcs/git

mkdir gitsetup && cd gitsetup
git init

echo "Put your git name"
read gitname
echo "Put your git email"
read gitemail

git config --global user.name "$gitname"
git config --global user.email "$gitemail"

echo "installing necessary tools for running an aosp build"
sudo emerge -u \
     app-arch/lz4 \
     app-arch/lzop \
     media-gfx/imagemagick \
     media-gfx/pngcrush \
     app-crypt/gnupg \
     app-arch/zip[-natspec] \
     app-arch/unzip \
     ">=dev-java/icedtea-bin-3.4.0:8" \
     dev-libs/libxslt \
     dev-libs/libxml2 \
     dev-util/android-tools \
     dev-util/ccache dev-util/gperf \
     media-libs/libsdl \
     media-libs/mesa \
     net-misc/curl \
     net-misc/rsync \
     sys-devel/bc \
     sys-devel/bison \
     sys-devel/flex \
     sys-devel/gcc[cxx] \
     sys-libs/ncurses \
     sys-libs/readline \
     sys-libs/zlib \
     sys-process/schedtool \
     sys-fs/squashfs-tools \
     x11-base/xorg-proto \
     x11-libs/libX11 \
     x11-libs/wxGTK:3.0 \
     ncurses-compat \
     protobuf-python \
     =dev-lang/python-2*

echo "Installing repo"
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
sudo chmod a+x ~/bin/repo

sudo emerge -u \
     dev-vcs/repo

echo "Reboot and enjoy building roms on gentoo :)"
