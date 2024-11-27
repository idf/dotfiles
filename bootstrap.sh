#!/usr/bin/env bash

flag="-nfs"
cur=$(pwd)
cd $cur

function doIt() {
    home=$1
    echo "Setting files in $home"
    if [ "$(uname)" == "Darwin" ]; then
	ln $flag "$cur/init" $home
    fi

    # usr bin files
    ln $flag "$cur/bin" $home

    # dotfiles
    for dotfile in .?*; do
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
		ln $flag "$cur/${dotfile}" $home
		;;
	esac
    done

    # config percol
    # ln $flag "$cur/tmux-config/.tmux.conf" $home
    mkdir -p "$home/.percol.d/"
    ln $flag "$cur/rc.py" "$home/.percol.d/"

    # config sshrc
    mkdir -p "$home/.sshrc.d"
    for file in $cur/.{bash_prompt,aliases,functions,gitfunctions,inputrc}; do
        [ -r "$file" ] && [ -f "$file" ] && ln $flag "$file" "$home/.sshrc.d";
    done

    source ~/.bashrc
    # tmux source-file ~/.tmux.conf  # TODO handle tmux not started
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt $HOME;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo "";
    if  [[ $REPLY=='Y' || $REPLY=='y' ]]; then
	read -p "Home directory (default: $HOME): " home
	if  [[ $home = '' ]]; then
	    doIt $HOME
	else
	    doIt $home
	fi;
    fi;
fi;
unset doIt
