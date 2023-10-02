dotfiles
========

shared dot files settings

# To install
Under current directory
```bash
# install https://github.com/idf/bootstraping first
chsh -s /bin/bash
tmux
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
* **Cheat**: https://github.com/chrisallenlane/cheat
* **Autojump**: https://github.com/joelthelion/autojump
* **bashmarks**: https://github.com/huyng/bashmarks

# iTerm2 preference
Preferences -> General -> Preferences -> Load preferences from custom directory.

Set the preference folder to this `dotfiles` folder so that it can pick up the `com.googlecode.iterm2.plist`

Make sure you have run `chsh -s /bin/bash` since iTerm2 uses login shell.
Profiles -> General -> Command -> Send text at start -> `source ~/.bashrc`

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
