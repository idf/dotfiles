complete -F _optcomplete explorer
source /env.sh


#######################################
# Functions 
#######################################
cd() {
    builtin cd "$@" && pwd && ls;
}

#######################################
# Applications 
#######################################
alias emacs='emacs -nw' # make emacs no window by default 