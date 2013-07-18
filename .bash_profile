# Add bins to to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# MAC ONLY 
if [[ $OSTYPE == darwin* ]]; then
    # Add PHP bin from homebrew to `$PATH`
    export PATH="$PATH:$(brew --prefix josegonzalez/php/php54)/bin"

    # Git autocompletion 
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi
