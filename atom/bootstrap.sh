#!/usr/bin/env bash

cur=$(pwd)
flag="-nfs"
ln $flag "$cur/keymap.cson" "$HOME/.atom/keymap.cson"
ln $flag "$cur/styles.less" "$HOME/.atom/styles.less"

bash $cur/pkgs.sh
echo "Change font family to Fira Code"
