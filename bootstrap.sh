#!/usr/bin/env bash
flag="-nfs";
cur=$(pwd);
cd $cur;

function doIt() {
    for dotfile in .?*; do
	case $dotfile in
	    *.elc)
		continue;;
	    ..)
		continue;;
	    .git)
		continue;;
	    *)
		ln $flag  "$cur/${dotfile}" $HOME
		;;
	esac
    done

    ln $flag "$cur/tmux-config/.tmux.conf" $HOME;
    
    source ~/.bashrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory ($HOME). Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt;
    fi;
fi;
unset doIt;
