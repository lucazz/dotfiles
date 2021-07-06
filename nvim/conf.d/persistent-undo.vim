if has('persistent_undo')
  silent !mkdir ~/.config/nvim/.backups > /dev/null 2>&1
  set undodir=~/.config/nvim/.backups
  set undofile
endif
