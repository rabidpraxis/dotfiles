" Source global vim settings
if filereadable(expand("~/.vim/vimrc"))
  source ~/.vim/vimrc
endif

" Source graphical vim settings
if has("gui_running") && filereadable(expand("~/.vim/gvimrc"))
    source ~/.vim/gvimrc
endif

" Source local vim settings
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
