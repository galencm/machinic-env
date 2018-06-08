#!/bin/bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### THIS FILE IS AUTOMATICALLY GENERATED BY ENVGEN ###

# environment.sh uses bork and generated files to
# check for files needed by machine and install if
# necessary
# initially, this script checks to make sure bork
# is installed with a type for python3
# env_meta serves as the entry point for including scripts

which bork
# 0: found 1:not found
available=$?
echo "$available"
# fedora uses pip for python 2+ and pip3 for 3+
# add type for pip3, included inline

pip3_type='
### exact copy of bork projects pip.sh by Matthew Lyon     ###
### except with 'pip3' replacing 'pip', see:                ###
### https://github.com/mattly/bork/blob/master/types/pip.sh ###

# TODO --sudo flag
# TODO versions
# TODO update

action=$1
name=$2
shift 2

case $action in
  desc)
    echo "asserts presence of packages installed via pip"
    echo "> pip pygments"
    ;;
  status)
    needs_exec "pip3" || return $STATUS_FAILED_PRECONDITION
    pkgs=$(bake pip3 list)
    if ! str_matches "$pkgs" "^$name"; then
      return $STATUS_MISSING
    fi
    return 0 ;;
  install)
    bake sudo pip3 install "$name"
    ;;
esac'

#install bork if it is not found
if [[ $available == 1 ]]
    then
    echo bork not found installing
    wget -P /tmp https://github.com/mattly/bork/archive/master.zip
    #unzipping creates tmp/bork-master
    unzip /tmp/master.zip -d /tmp
    #install per bork install instructions
    sudo cp -r /tmp/bork-master/ /usr/local/src/bork/
    sudo ln -sf /usr/local/src/bork/bin/bork /usr/local/bin/bork
    sudo ln -sf /usr/local/src/bork/bin/bork-compile /usr/local/bin/bork-compile
    #add pip3 type
    echo "$pip3_type" | sudo tee /usr/local/src/bork/types/pip3.sh
fi

#if pip3 type does not exist add
if [ ! -f /usr/local/src/bork/types/pip33.sh ]; then
    echo "$pip3_type" | sudo tee /usr/local/src/bork/types/pip33.sh
fi

if [[ $available == 0 ]]
    then echo bork found...
fi

#ready to start bork scripts
$(bork satisfy env_meta.bork)
