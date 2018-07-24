# Add bins to to the `$PATH
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/scripts:$(getconf PATH)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# AWS environment variables
source ~/.aws.env 2> /dev/null

# macOS
if [[ $OSTYPE == darwin* ]]; then
  source ~/.macos
fi

# Linux
if [ $OSTYPE == linux-gnu ] && [ ! -n "$SSH_CLIENT" ] && [ ! -n "$SSH_TTY" ]; then
  source ~/.linux
fi

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Chruby
if [[ -d /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  chruby ruby 2.4.1 # Set default ruby

  # enable auto switching. set after default ruby
  source /usr/local/share/chruby/auto.sh
fi

# Neovim
if command -v nvim >/dev/null 2>&1; then
  alias vim="nvim"
  alias vi="nvim"
fi

# Yarn
if command -v yarn >/dev/null; then
  export PATH="$PATH:$(yarn global bin)"
fi

# Go
if hash go 2>/dev/null; then
  export GOPATH=$HOME
  export PATH=$PATH:$GOPATH/bin
fi

# direnv
if command -v direnv >/dev/null; then
  # Hook direnv into shell
  eval "$(direnv hook bash)" # must be after extensions (rvm, git-prompt, etc.)
fi

# Travis
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
command -v nvm >/dev/null 2>&1 && nvm use lts/carbon >/dev/null
