# Put at the top of ~/.zshrc
# source path/to/cursor_zsh.sh

# --- Cursor Agent terminal: keep zsh minimal so command completion is detectable ---
# Put *only* PATH / toolchain essentials above this block if you need them (nvm, brew, etc).

if [[ "$PAGER" == "head -n 10000 | cat" || "$COMPOSER_NO_INTERACTION" == "1" ]]; then
  # optional: make the prompt super plain
  PROMPT='%n@%m:%~%# '
  RPROMPT=''
  return
fi
