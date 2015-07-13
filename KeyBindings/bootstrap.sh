#!/usr/bin/env bash
dir=$HOME/Library;
cur=$(pwd);
cd $dir;
mkdir -p "KeyBindings";
cd $cur;

ln -s $cur/DefaultKeyBinding.dict $dir/KeyBindings/DefaultKeyBinding.dict;
