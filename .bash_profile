#
# GENERAL
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Chruby
source /usr/local/share/chruby/chruby.sh # enable chruby
source /usr/local/share/chruby/auto.sh   # enable auto-switching


#
# ALIASES
#

# Rails
alias guard='bundle exec guard'

# Projects
alias ww='cd ~/work/rd_ww_inapp'


#
# MAC ONLY 
#
if [[ $OSTYPE == darwin* ]]; then
    # Add PHP bin from homebrew to `$PATH`
    export PATH="$PATH:$(brew --prefix josegonzalez/php/php55)/bin"

    # Git autocompletion 
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # Use MacVim default (vi for vanilla vim)
    alias vim='mvim'
fi

#
# LINUX ONLY 
#
if [[ $OSTYPE == linux-gnu ]]; then
    alias vim='gvim'
fi


