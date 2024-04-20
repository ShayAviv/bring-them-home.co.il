#!/bin/bash
#
# Install hugo && npm dependencies

# Highlights
Info="[\e[36mINFO\e[0m]"
Error="[\e[31mERROR\e[0m]"

# check if user is running as root
if [ `id -u` -ne 0 ]; then
    echo -e "$Error Please run as root!"
    exit 1
fi

# check if hugo/npm is installed
echo -e "$Info This might take a few minutes, be patient."
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

echo -e "$Info Updating package manager..."
$PackageManager update &> /dev/null

for d in ${dependencies[@]}
do
    if [ ! `which $d` ]; then
        echo -e "$Info Dependency \"$d\" missing, installing now."

        # install dependency
        $PackageManager install -y $d &> /dev/null || { echo -e "$Error Installation of \"$d\" was not successful."; exit 1; }
    fi
done

# Update node
if [ `node -v` != 'v20.5.0' ]; then
    echo -e "$Info Updating node..."
    curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash &> /dev/null
    export NVM_DIR="/home/noam/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install 20.5.0 &> /dev/null
    nvm use 20.5.0 &> /dev/null
fi

# install npm dependencies
echo -e "$Info Installing npm dependencies..."
npm install &> /dev/null && npm update &> /dev/null || { echo -e "$Error Installation of \"npm dependencies\" was not successful."; exit 1; }

# how to start
echo -e "$Info Run \"hugo server\" to view the website."