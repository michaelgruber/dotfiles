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

# Aliases
source .aliases

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


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

    # Git Annex
    export PATH="$PATH:/Applications/git-annex.app/Contents/MacOS"
fi


#
# LINUX ONLY
#
if [[ $OSTYPE == linux-gnu ]]; then
    alias vim='gvim'
fi


#
# Oracle
#
export DYLD_LIBRARY_PATH="/opt/oracle/instantclient_11_2"
export SQLPATH="/opt/oracle/instantclient_11_2"
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=$PATH:$DYLD_LIBRARY_PATH
