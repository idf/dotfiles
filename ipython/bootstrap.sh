#!/bin/bash

cur=$(pwd)
flag="-nfs"
ln $flag "$cur/ipython_config.py" "$HOME/.ipython/profile_default/"
ln $flag "$cur/ipython_kernel_config.py" "$HOME/.ipython/profile_default/"
