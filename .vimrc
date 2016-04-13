if filereadable(expand('$HOME/vimfiles/vimrc'))
  set runtimepath^=$HOME/vimfiles
  source $HOME/vimfiles/vimrc
else
  echoerr '$HOME/vimfiles/vimrc is unreadable. You probably need to run "git clone git@github.com:michaelgruber/vimfiles.git $HOME/vimfiles"'
endif
