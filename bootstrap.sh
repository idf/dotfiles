#!/usr/bin/env bash
flag="-nfs";
cur=$(pwd);
cd $cur;

function doIt() {
    home=$1;
    echo "Setting files in $home";
    if [ "$(uname)" == "Darwin" ]; then
	ln $flag "$cur/init" $home;
    fi
    for dotfile in .?*; do
	case $dotfile in
	    *.elc)
		continue;;
	    ..)
		continue;;
	    .git)
		continue;;
	    *)
		ln $flag "$cur/${dotfile}" $home;
		;;
	esac
    done

    ln $flag "$cur/tmux-config/.tmux.conf" $home;
    source ~/.bashrc;
    tmux source-file ~/.tmux.conf;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt $HOME;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if  [[ $REPLY=='Y' || $REPLY=='y' ]]; then
	read -p "Home directory (default: $HOME): " home;
	if  [[ $home = '' ]]; then
	    doIt $HOME;
	else
	    doIt $home;
	fi;
    fi;
fi;
unset doIt;
