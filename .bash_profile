# Add bins to to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# add PHP bin from homebrew to `$PATH` (Mac only)
export PATH="$PATH:$(brew --prefix josegonzalez/php/php54)/bin"
