dotfiles
========

shared dot files settings

# To install
Under current directory
```bash
bash bootstrap.sh
```

Install OS X defaults (need to log out and log in again)
```bash
sudo bash ~/.osx
```

# MacOS
* Open finder's current directory in terminal: `finder wd`
* Open terminal's current directory in finder: `open .`

# Git Subtree
* [tmux-config](https://github.com/idf/tmux-config) (public branch)

# References
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)

# Miscellaneous
* https://github.com/chrisallenlane/cheat
* https://github.com/joelthelion/autojump
* https://github.com/huyng/bashmarks

# Keylayouts
Keylayouts are in `./keylayout` 

To enable your new layout you must save it into your '~/Library/Keyboard Layouts', and then enable it from System Preferences -> Keyboard -> Input Sources.
This only words in Cocoa apps; therefore, Karabiner in the above sections are preferred.

# Key Bindings
KeyBindings are in `./KeyBindings`

DefaultKeyBinding.dict doesn't work in some applications like Xcode or Firefox. Key combinations that enter dead key states (like opt+U in the U.S. keyboard layout) can't be reassigned.

This only words in Cocoa apps; therefore, Karabiner in the above sections are preferred.

[default keybindings](https://www.hcs.harvard.edu/~jrus/site/system-bindings.html)
[emacs keybindings](http://www.hcs.harvard.edu/~jrus/site/KeyBindings/Emacs%20Esc%20Bindings.dict)

# Bashmarks
[bashmarks cheatsheet](https://github.com/huyng/bashmarks)

# Tmux
## Basics
[tmux cheatsheet](https://gist.github.com/idf/b220ec68197ae824a67a)

To update config:
```
tmux source-file ~/.tmux.conf
```

## Tmux Session Save & Restore
Using [tmuxp](https://github.com/tony/tmuxp):
```
sudo pip install tmuxp
```

save
```
tmuxp freeze [-y] <session_name>
```

reload
```
tmuxp load <filename>
```

## Multi-level Tmux
[To send prefix](http://stackoverflow.com/questions/8518815/how-to-send-commands-when-opening-a-tmux-session-inside-another-tmux-session)

# Keyboad shortcut

1. `c-r`: hh. Bash history.
1. `c-h`: qfc. Quick Command-line File Completion.
1. `c-l`: ls.

# Troubleshooting
If encounter "Failed to connect server", you need to start tmux.
