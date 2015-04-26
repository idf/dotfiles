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

# Keylayouts
Keylayouts are in ./keylayout  (edited by [Ukelele](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ukelele))  
To enable your new layout you must save it into your '~/Library/Keyboard Layouts', and then enable it from System Preferences -> Keyboard -> Input Sources.

# Key Bindings
KeyBindings are in ./KeyBindings
DefaultKeyBinding.dict doesn't work in some applications like Xcode or Firefox. Key combinations that enter dead key states (like opt+U in the U.S. keyboard layout) can't be reassigned.  
[default keybindings](https://www.hcs.harvard.edu/~jrus/site/system-bindings.html)  
[emacs keybindings](http://www.hcs.harvard.edu/~jrus/site/KeyBindings/Emacs%20Esc%20Bindings.dict)  