# Add bins to to the `$PATH`
export PATH="$HOME/bin:$PATH:/usr/local/bin"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# add PHP bin from homebrew to `$PATH` (Mac only)
export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
