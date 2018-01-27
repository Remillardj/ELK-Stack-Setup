#!/bin/bash

# This is assuming we are running on sudo
# But because people won't read often, let's check for them
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# update yum
yum update

# Verify cwd
cd ~/

# Make a directory for JDK
mkdir jdk
cd ./jdk/

