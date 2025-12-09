#!/usr/bin/env bash

flag="-nfs"
cur=$(pwd)
cd $cur


echo "Setting files in $HOME"

# dotfiles
for dotfile in .{path,exports,aliases,functions,gitfunctions,extra,zprofile,p10k.zsh}; do
case $dotfile in
    *.elc)
	continue;;
    ..)
	continue;;
    .git)
	continue;;
    .DS_Store)
	continue;;
    *)
	ln $flag "$cur/${dotfile}" $HOME
	;;
esac
done