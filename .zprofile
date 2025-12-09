eval "$(/opt/homebrew/bin/brew shellenv)"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export ALTERNATE_EDITOR="";  # to make emacs --daemon auto start

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,gitfunctions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

if hash hh 2>/dev/null; then  # hstr instead of hh
    source $HOME/.hh
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
