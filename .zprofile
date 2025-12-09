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