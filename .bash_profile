#
# GENERAL
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"

# Git info for bash prompt
source ~/.git-prompt.sh

# Setup bash prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
PROMPT_COMMAND='__git_ps1 "\[\033[1m\]\w\[\033[0m\]" ": "'

# Chruby
source /usr/local/share/chruby/chruby.sh # enable chruby
source /usr/local/share/chruby/auto.sh   # enable auto-switching
chruby ruby-2.0

# Git Annex
export PATH="/Applications/git-annex.app/Contents/MacOS:$PATH"

# Aliases
source .aliases


# Aliases
source .aliases


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
