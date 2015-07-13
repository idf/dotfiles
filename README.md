dotfiles
========

shared dot files settings 

# To install
under current directory  
```bash
bash bootstrap.sh
```

install OS X defaults (need to log out and log in again)
```bash
sudo bash ~/.osx
```

# Git Subtree
* [tmux-config](https://github.com/idf/tmux-config) (public branch)

# References
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)

# Miscellaneous
* https://github.com/chrisallenlane/cheat
* https://github.com/joelthelion/autojump
* https://github.com/huyng/bashmarks

# Karabiner
To enable system-wide emacs mode, `cd Karabiner` and run the `bootstrap.sh` to install `private.xml` into Karabiner. Enable the private settings under the Karabiner preference panel.  
Download [Karabiner](https://pqrs.org/osx/karabiner/)

# Keylayouts
Keylayouts are in `./keylayout`  (edited by [Ukelele](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ukelele))  
To enable your new layout you must save it into your '~/Library/Keyboard Layouts', and then enable it from System Preferences -> Keyboard -> Input Sources.  
This only words in Cocoa apps; therefore, Karabiner in the above sections are preferred.

# Key Bindings
KeyBindings are in `./KeyBindings`  
DefaultKeyBinding.dict doesn't work in some applications like Xcode or Firefox. Key combinations that enter dead key states (like opt+U in the U.S. keyboard layout) can't be reassigned.  
This only words in Cocoa apps; therefore, Karabiner in the above sections are preferred. 

[default keybindings](https://www.hcs.harvard.edu/~jrus/site/system-bindings.html)  
[emacs keybindings](http://www.hcs.harvard.edu/~jrus/site/KeyBindings/Emacs%20Esc%20Bindings.dict)

# Bashmarks
[cheatsheet](https://github.com/huyng/bashmarks)

# Tmux
## Basics
[tmux_cheatsheet](https://gist.github.com/henrik/1967800)  

To update config:
```
tmux source-file ~/.tmux.conf
```

## Tmux-Session Save & Restore
First need to check the permission:
```
sudo chmod 755 ./bin/tmux-session 
```

To save current session (saved to `~/.tmux-session`):
```
tmux-session save
```

To restore previously saved session:
```
tmux-session restore
```

Using [tmuxp](https://github.com/tony/tmuxp):  
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

# Troubleshooting
If encounter "Failed to connect server", you need to start tmux.
