complete -F _optcomplete explorer
source /env.sh


#######################################
# Functions 
#######################################
NC='\e[0m'
bold='\e[1m'
cd() {
    builtin cd "$@" && echo -e "${NC}$(pwd)${NC}" && ls; 
}
#######################################
# Applications 
#######################################
alias emacs='emacs -nw' # make emacs no window by default 
