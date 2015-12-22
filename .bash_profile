#
# ENVIRONMENT
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.bin:$PATH"

# Oracle environment variables
export SQLPATH='/opt/oracle/instantclient'
export OCI_DIR=$SQLPATH
export OCI_HOME=$SQLPATH
export OCI_LIB_DIR=$OCI_HOME
export OCI_INCLUDE_DIR=$OCI_HOME/sdk/include
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"

# AWS environment variables
source ~/.aws.env 2> /dev/null

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup default Go environment
if hash go 2>/dev/null; then
    export GOROOT=`go env GOROOT`
    mkdir -p $HOME/go
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

# Chruby
source /usr/local/share/chruby/chruby.sh
chruby ruby 2.2.2 # Set default ruby

# enable auto switching. set after default ruby
source /usr/local/share/chruby/auto.sh

# Add Tmux scripts to `$PATH`
export PATH="$PATH:$HOME/.tmux"


#
# MAC ONLY
#

if [[ $OSTYPE == darwin* ]]; then
    # Git autocompletion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # Oracle
    export DYLD_LIBRARY_PATH=$OCI_LIB_DIR
    export PATH=$PATH:$DYLD_LIBRARY_PATH

    # Mono
    export MONO_GAC_PREFIX="/usr/local"

    # Boot2docker
    $(boot2docker shellinit 2>/dev/null)
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
