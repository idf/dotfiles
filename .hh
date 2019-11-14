#!/bin/bash

# hstr: history suggest box
# Replacing the default reverse search C-r

# brew install hh
# https://github.com/dvorka/hstr

# see man hstr for list of options

export HSTR_CONFIG=hicolor,prompt-bottom         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r [eamcs mode]
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi
