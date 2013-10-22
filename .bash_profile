#
# GENERAL
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#
# ALIASES
#

# Rails
alias guard='bundle exec guard'

#
# MAC ONLY 
#
if [[ $OSTYPE == darwin* ]]; then

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