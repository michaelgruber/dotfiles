#
# ENVIRONMENT
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Enable rvm completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Oracle environment variables
export SQLPATH="/opt/oracle/instantclient_11_2"
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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
    export DOCKER_HOST=tcp://192.168.59.103:2375

    # Oracle
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/opt/oracle/instantclient_11_2"
    export PATH=$PATH:$DYLD_LIBRARY_PATH

    # Mac Aliases
    alias vim='mvim' # use 'vi' to use vim in terminal

    # Mono
    export MONO_GAC_PREFIX="/usr/local"
fi

#
# LINUX ONLY
#

if [[ $OSTYPE == linux-gnu ]]; then
    alias vim='gvim'
fi

#
# SETUP
#

# Setup prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"; __git_ps1 "\[\033[1m\]\w\[\033[0m\]" ": "'

# Hook direnv into shell
eval "$(direnv hook bash)" # must be after extensions (rvm, git-prompt, etc.)

# Source scripts
source ~/.bin/grep_kill.sh

# Aliases
source ~/.aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
