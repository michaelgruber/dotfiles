#
# GENERAL
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Git info for bash prompt
source ~/.git-prompt.sh

# Setup bash prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
PROMPT_COMMAND='__git_ps1 "\[\033[1m\]\w\[\033[0m\]" ": "'

# Source all scripts
for FILE in ~/.bin/* ; do source $FILE ; done

# Aliases
source ~/.aliases

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

    # MacVim
    export VISUAL='mvim -f'

    # Git Annex
    export PATH="$PATH:/Applications/git-annex.app/Contents/MacOS"

    # Boot2docker
    export DOCKER_HOST=tcp://localhost:4243

    # Oracle
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/opt/oracle/instantclient_11_2"
    export PATH=$PATH:$DYLD_LIBRARY_PATH

    # Mac Aliases
    alias vim='mvim' # use 'vi' to use vim in terminal
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
export SQLPATH="/opt/oracle/instantclient_11_2"
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
