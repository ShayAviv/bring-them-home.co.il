#!/bin/bash
#
# Install hugo && npm dependencies

# check if hugo/npm is installed
dependencies=("hugo" "npm")

# Get package manager
declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get
osInfo[/etc/alpine-release]=apk
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        PackageManager="${osInfo[$f]}"
    fi
done

$PackageManager update

for d in ${dependencies[@]}
do
    if [ ! `which $d` ]; then
        echo "Dependency \"$d\" missing, installing now."

        # install dependency
        $PackageManager install $d
    fi
done

# install npm dependencies
npm install

# start hugo server
hugo server