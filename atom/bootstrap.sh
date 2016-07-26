#!/usr/bin/env bash

cur=$(pwd)
flag="-nfs"
ln $flag "$cur/keymap.cson" "$HOME/.atom/keymap.cson"
