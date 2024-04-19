#!/bin/bash
#
# Install hugo && npm dependencies

# check if user is running as root
if [ `id -u` -ne 0 ]; then
    echo "Please run as root!"
    exit 1
fi

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

$PackageManager update &> /dev/null

for d in ${dependencies[@]}
do
    if [ ! `which $d` ]; then
        echo "Dependency \"$d\" missing, installing now."

        # install dependency
        $PackageManager install -y $d & /dev/null || echo "Installation of \"$d\" was not successful."
    fi
done

# install npm dependencies
echo "installing npm dependencies"
npm install &> /dev/null || echo "Installation of \"npm dependencies\" was not successful."

# start hugo server
hugo server