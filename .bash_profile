# Add bins to to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add PHP bin from homebrew to `$PATH` (Mac only)
export PATH="$PATH:$(brew --prefix josegonzalez/php/php54)/bin"

# Git autocompletion (Mac only) 
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
