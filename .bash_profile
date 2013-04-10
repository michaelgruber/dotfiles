# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# rbenv added to `$PATH` and initialized
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# add PHP bin from homebrew to `$PATH` (Mac only)
export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
