#
# ENVIRONMENT
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Oracle environment variables
export SQLPATH="/opt/oracle/instantclient_11_2"
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup default Go environment
if hash go 2>/dev/null; then
    export GOROOT=`go env GOROOT`
    mkdir -p $HOME/go
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

# Setup cocos2d-x development
export COCOS_CONSOLE_ROOT=/Users/michael/Dev/cocos2d-x/tools/cocos2d-console/bin
export COCOS_TEMPLATES_ROOT=/Users/michael/Dev/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$COCOS_CONSOLE_ROOT:$PATH

# Chruby
source /usr/local/share/chruby/chruby.sh
chruby ruby 2.2.0 # Set default ruby

# enable auto switching. set after default ruby
source /usr/local/share/chruby/auto.sh


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

    # Mono
    export MONO_GAC_PREFIX="/usr/local"
fi


#
# LINUX ONLY
#

#if [ $OSTYPE == linux-gnu ] && [ ! -n "$SSH_CLIENT" ] && [ ! -n "$SSH_TTY" ]; then
#fi


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
