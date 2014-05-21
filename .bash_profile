#
# GENERAL
#

# Add bins to to the `$PATH`
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Check bash version
if [[ ${BASH_VERSION:0:1} != "4" ]]; then
    printf "\nWARNING:\nIt doesn't look like you have Bash 4 installed. You might see some weirdness.\n\n"
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add doctorjs to NODE_PATH for use with Tagbar/CTags
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

# Oracle environment variables
export SQLPATH="/opt/oracle/instantclient_11_2"
export TNS_ADMIN="/opt/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"


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

# Source all scripts
for FILE in ~/.bin/* ; do source $FILE ; done

# Aliases
source ~/.aliases

# Execute startup scripts
for FILE in ~/.startup/* ; do bash $FILE ; done
